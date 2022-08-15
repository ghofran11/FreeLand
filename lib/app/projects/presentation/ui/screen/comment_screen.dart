import 'package:bot_toast/bot_toast.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_bloc.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_event.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_state.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/constant/src/strings.dart';
import 'package:freeland/common/widgets/loading_progress.dart';
import 'package:freeland/core/user/provider/user_provider.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/config/theme/src/styles.dart';
import '../../../../../common/widgets/text.dart';

class CommentScreen extends StatefulWidget {
  CommentScreen({Key? key, required this.projectId}) : super(key: key);
  final String projectId;

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: CommentScreen(
        projectId: state.extra as String,
      ),
    );
  }

  static const routePath = 'comment_screen';
  static const routeName = 'comment_screen';

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController commentController = TextEditingController();

  List filedata = [
    // {
    //   'name': 'Adeleye Ayodeji',
    //   'pic': 'https://picsum.photos/300/30',
    //   'message': 'I love to code'
    // },
    // {
    //   'name': 'Biggi Man',
    //   'pic': 'https://picsum.photos/300/30',
    //   'message': 'Very cool'
    // },
    // {
    //   'name': 'Biggi Man',
    //   'pic': 'https://picsum.photos/300/30',
    //   'message': 'Very cool'
    // },
    // {
    //   'name': 'Biggi Man',
    //   'pic': 'https://picsum.photos/300/30',
    //   'message': 'Very cool'
    // },
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primary,
            )),
        title: const Text(" Comments"),
      ),
      body: BlocProvider(
        create: (context) => getIt<ProjectBloc>()
          ..add(FetchAllComments(projectId: widget.projectId)),
        child: Builder(
          builder: (context) {
            return SafeArea(
              child: CommentBox(
                userImage:
                    "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
                child: BlocConsumer<ProjectBloc, ProjectState>(
                  listener: (context, state) {
                    if (state.commentSubmission.isFail()) {
                      BotToast.showText(
                          text: state.commentSubmission.error ??
                              AppStrings.defaultErrorMsg);
                    }
                    if (state.commentSubmission.isSuccess()) {
                      setState(() {
                        var value = {
                          'name': context.read<UserProvider>().user?.fullName,
                          'pic': context.read<UserProvider>().user?.imagePath,
                          'message': commentController.text,
                        };
                        filedata.insert(0, value);
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state.fetchAllComment.isFail()) {
                      return const Text(AppStrings.defaultErrorMsg);
                    }
                    if (state.fetchAllComment.isSuccess()) {
                      context.read<ProjectBloc>().comments.forEach((element) {
                        filedata.add({
                          'name': element.senderName,
                          'pic':
                              'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                          'message': element.text,
                        });
                      });
                      return commentChild(filedata);
                    }
                    return const LoadingProgress();
                  },
                ),
                labelText: 'Write a comment...',
                withBorder: false,
                errorText: 'Comment cannot be blank',
                sendButtonMethod: () {
                  if (formKey.currentState!.validate()) {
                  context.read<ProjectBloc>().add(CommentSubmission(
                        projectId: widget.projectId, msg: commentController.text));

                    commentController.clear();
                    FocusScope.of(context).unfocus();
                  } else {
                    print("Not validated");
                  }
                },
                formKey: formKey,
                commentController: commentController,
                backgroundColor: const Color(0xfffffFFF),
                textColor: Colors.black,
                sendWidget: const Icon(Icons.send_sharp,
                    size: 30, color: AppColors.primary),
              ),
            );
          }
        ),
      ),
    );
  }
  Widget commentChild(data) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: Column(
              children: [
                ListTile(
                  leading: GestureDetector(
                    onTap: () async {
                      // Display the image in large form.
                      print("Comment Clicked");
                    },
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                    ),
                  ),
                  title: Text(
                    data[i]['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(data[i]['message']),
                ),
                const Divider(color: AppColors.grey2),
              ],
            ),
          ),
      ],
    );
  }

}
