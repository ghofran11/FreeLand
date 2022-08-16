import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/home/infrastructure/models/user.dart';
import 'package:freeland/common/widgets/text_field.dart';
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
      body: Column(
        children: [
          //ToDo: wrap with  REactive form

          CustomReactiveTextField(
            formControlName: 'search',
            labelText: 'Search',
            keyboardType: TextInputType.text,
            readOnly: true,
            suffixIcon: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 18.0.r),
          ),
          //ToDo:
          ListView.builder(
            itemBuilder: (context, index) => Card(),
            itemCount: matchUsers.length,
          )
        ],
      ),
    );
  }
}
