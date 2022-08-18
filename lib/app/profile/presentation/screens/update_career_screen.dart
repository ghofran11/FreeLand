import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formGroup = FormGroup({
  "addCareer": FormControl<String>(),
});

class CareerUpdateScreen extends StatefulWidget {
  const CareerUpdateScreen({
    Key? key,
  }) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const CareerUpdateScreen(),
    );
  }

  static const routePath = 'career_update_screen';
  static const routeName = 'career_update_screen';

  @override
  State<CareerUpdateScreen> createState() => _CareerUpdateScreenState();
}

class _CareerUpdateScreenState extends State<CareerUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    int _itemCount = 3;
    return Scaffold(
      appBar: AppBar(
        title: const CustomText.headlineSmall("Update Careers"),
      ),
      body: SafeArea(
        child: Padding(
            padding: screenPadding,
            child: ReactiveForm(
              formGroup: formGroup,
              child: Column(
                children: [
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
                        // Container(
                        //   decoration: BoxDecoration(
                        //       borderRadius: borderRadiusCircular,
                        //       border: Border.all(
                        //           width: 2.0,
                        //           color: Theme.of(context).primaryColor)),
                        //   child: Row(
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: [
                        //       SizedBox(width: 8.0),
                        //       SizedBox(
                        //         width: 50.0.w,
                        //         child: SizedBox(
                        //           width: 80.0.w,
                        //           height: 34.0,
                        //           child:
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ]),
                  CustomReactiveTextField(
                      maxLines: null,
                      formControlName: "addCareer",
                      suffix: FaIcon(Icons.add),
                      onSubmitted: () {
                        setState(() {
                          _labels.add(
                              formGroup.control("addCareer").value as String);
                        });
                      }),
                ],
              ),
            )),
      ),
    );
  }
}

List<String> _labels = [
  "DEsign",
  "Front",
  "Back end",
  "lll",
  "uohblm;;",
  "jjjjjjjjjjjj"
];
