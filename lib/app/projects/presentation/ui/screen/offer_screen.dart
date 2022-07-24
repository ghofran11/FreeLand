import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/config/theme/src/colors.dart';
import '../../../../../common/config/theme/src/styles.dart';
import '../../../../../common/widgets/text.dart';
import '../../../../../common/widgets/text_field.dart';

class OfferScreen extends StatefulWidget {
  OfferScreen({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: OfferScreen(),
    );
  }

  static const routePath = 'offer_screen';
  static const routeName = 'offer_screen';

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  final offerForm = FormGroup(
    {
      "offerKey": FormControl<String>(validators: []),
    },
  );
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
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
                  'Offer UI/UX Designer ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
              ],
            ),
            SizedBox(
              height: 20.0.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReactiveForm(
                          formGroup: offerForm,
                          child: const CustomReactiveTextField(
                            formControlName: 'offerKey',
                            labelText: 'Write your offer',
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        const CustomText.titleMedium(
                          'Rang Salary',
                          style: TextStyle(color: AppColors.primary),
                        ),
                        RangeSlider(
                          values: _currentRangeValues,
                          max: 100,
                          divisions: 5,
                          labels: RangeLabels(
                            _currentRangeValues.start.round().toString(),
                            _currentRangeValues.end.round().toString(),
                          ),
                          onChanged: (RangeValues values) {
                            setState(() {
                              _currentRangeValues = values;
                            });
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const CustomText.bodyMedium(
                            'SUBMISSION',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
