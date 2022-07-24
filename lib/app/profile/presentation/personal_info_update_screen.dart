import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PersonalInfoUpdate extends StatefulWidget {
  PersonalInfoUpdate({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: PersonalInfoUpdate(),
    );
  }

  static const routePath = 'personal_info_update';
  static const routeName = 'personal_info_update';

  @override
  State<PersonalInfoUpdate> createState() => _PersonalInfoUpdateState();
}

class _PersonalInfoUpdateState extends State<PersonalInfoUpdate> {
  FormGroup formGroup = FormGroup({
    "name": FormControl<String>(),
    "bio": FormControl<String>(),
    "categories_search": FormControl<String>(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(horizontalAppPadding.r),
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.bodyMedium("Save",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ],
          ),
          onPressed: () {},
        ),
      ),
      appBar: AppBar(
        title: CustomText.titleLarge("Edit personal info"),
      ),
      body: SafeArea(
        child: ReactiveForm(
          formGroup: formGroup,
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                vertical: verticalAppPadding.h,
                horizontal: horizontalAppPadding.w),
            children: [
              const CustomReactiveTextField(
                maxLines: 1,
                labelText: "User Name",
                formControlName: "name",
                icon: FaIcon(FontAwesomeIcons.user),
              ),
              SizedBox(height: 12.0.h),
              const CustomReactiveTextField(
                maxLines: null,
                labelText: "Bio",
                formControlName: "bio",
                icon: FaIcon(FontAwesomeIcons.list),
              ),
              SizedBox(height: 12.0.h),
              Wrap(
                  spacing: 4.0.w,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ...List.generate(
                        _labels.length,
                        (index) => Chip(
                              label: CustomText.bodySmall(
                                _labels[index],
                              ),
                              deleteIcon: Icon(Icons.clear),
                              onDeleted: () {
                                setState(() {
                                  _labels.removeAt(index);
                                });
                              },
                            )),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: borderRadiusCircular,
                          border: Border.all(
                              width: 2.0,
                              color: Theme.of(context).primaryColor)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 8.0),
                          const CustomText.bodySmall(
                            "Add Category",
                          ),
                          SizedBox(
                            width: 50.0.w,
                            height: 34.0,
                            child: ReactiveDropdownSearch<String, String>(
                              formControlName: "categories_search",
                              items: _labels2,
                              onBeforeChange: (prev, next) async {
                                if (next != null) {
                                  _labels.add(next);
                                  setState(() {});
                                }
                                return true;
                              },
                              dropDownButton: FaIcon(
                                FontAwesomeIcons.plus,
                                size: 18.0,
                                color: Theme.of(context).primaryColor,
                              ),
                              dropdownBuilder: (context, item) {
                                return const SizedBox();
                              },
                              showSelectedItems: false,
                              showFavoriteItems: false,
                              showSearchBox: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: borderRadiusCircular,
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _labels = ["DEsign", "Front", "Back end"];
  List<String> _labels2 = ["DEsign2", "Front2", "Back end2"];
}
