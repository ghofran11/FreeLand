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
      "salaryKey": FormControl<String>(validators: []),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(

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
                     ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 15.0.h,
                    ),
                  const  CustomText.bodyMedium("Warning: you must describe an offer in accurate details,set the price carefully, and do not forget to fill out all the official documents you have."),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    ReactiveForm(
                      formGroup: offerForm,
                      child: const CustomReactiveTextField(
                        formControlName: 'offerKey',
                        labelText: 'Write your offer description',
                        keyboardType: TextInputType.text,
                        icon: FaIcon(FontAwesomeIcons.penToSquare),
                      ),
                    ),
                    SizedBox(
                      height: 15.0.h,
                    ),
                    ReactiveForm(
                      formGroup: offerForm,
                      child: const CustomReactiveTextField(
                        formControlName: 'salaryKey',
                        labelText: 'What salary do you want?',
                        keyboardType: TextInputType.number,
                        icon:  FaIcon(Icons.monetization_on_outlined,size: 30,),
                      ),
                    ),
                    SizedBox(
                      height: 32.0.h,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const CustomText.bodyMedium(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
