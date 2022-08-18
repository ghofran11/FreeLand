import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/home/infrastructure/models/user.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:freeland/core/user/provider/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rxdart/rxdart.dart';

final form = FormGroup(
  {
    'search': FormControl<String>(),
  },
);

class SearchUsersScreen extends StatefulWidget {
  final List<UserDto> users; //from home screen extra
  const SearchUsersScreen({Key? key, required this.users}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: SearchUsersScreen(
        users: state.extra as List<UserDto>,

      ),
    );
  }

  static const routePath = 'search_users_screen';
  static const routeName = 'search_users_screen';

  @override
  State<SearchUsersScreen> createState() => _SearchUsersScreenState();
}

class _SearchUsersScreenState extends State<SearchUsersScreen> {
  List<UserDto> matchUsers = [];

  @override
  void initState() {
    (form.valueChanges)
        .debounceTime(const Duration(seconds: 1))
        .listen((event) {
      setState(() {
        matchUsers = widget.users
            .where((element) =>
                element.fullName.contains(form.control('search').value))
            .toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReactiveForm(
        formGroup: form,
        child: ListView(
          padding: screenPadding,
          physics:const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 25.0.h,),
            Row(
              children: [
                const SizedBox(
                  height: 12,
                ),
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primary,
                    )),
                const CustomText.titleLarge(
                  'Search Screen',
                  style: const TextStyle(),
                ),
              ],
            ),
            SizedBox(height: 25.0.h,),
            CustomReactiveTextField(
              formControlName: 'search',
              labelText: 'Search',
              keyboardType: TextInputType.text,
              suffixIcon: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 18.0.r),
            ),
            SizedBox(height: 15.0.h,),
            ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                  onTap: () {},
                  leading: GestureDetector(
                    onTap: () async {
                      // Display the image in large form.
                    },
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(
                              Radius.circular(50))),
                      child:  const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            'https://media.istockphoto.com/photos/happy-male-executive-in-office-picture-id1208414307?k=20&m=1208414307&s=612x612&w=0&h=6_K-g8mu8VMCh0TX3F4q3VORaFK_7tJD3PzubGHwdZs='
                              )),
                    ),
                  ),
                  title:  Builder(
                    builder: (context) {
                      if(matchUsers[index].id==context.read<UserProvider>().user!.id) {
                        return const Text(
                        'me',
                        style: TextStyle(fontSize: 15),
                      );
                      }
                       return CustomText.bodySmall(
                        matchUsers[index].fullName,
                        style: const TextStyle(
                          color: AppColors.grey2,
                        ),
                      );
                    }
                  ),
                  subtitle:  Builder(
                    builder: (context) {
                      if(matchUsers[index].bio!=null){
                        return CustomText.bodySmall(
                          matchUsers[index].bio!,
                          style: const TextStyle(
                            color: AppColors.grey2,
                          ),
                        );
                      }
                       return const CustomText.bodySmall(
                       '',
                        style: TextStyle(
                          color: AppColors.grey2,
                        ),
                      );

                    }
                  ),
                  ),
              itemCount:matchUsers.length,
            )
          ],
        ),
      ),
    );
  }
}
