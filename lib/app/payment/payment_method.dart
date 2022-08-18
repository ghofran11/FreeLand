import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/constant/src/url.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
import 'package:myfatoorah_flutter/utils/MFCountry.dart';
import 'package:myfatoorah_flutter/utils/MFEnvironment.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({this.amount = '200'});
  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: PaymentScreen(),
    );
  }

  static const routePath = 'PaymentScreen';
  static const routeName = 'PaymentScreen';
  String? amount;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<PaymentMethods>? paymentMethods = null;
  int selectedPaymentMethodIndex = 0;
  String? amount = '300';

  int sel = 0;

  @override
  void initState() {
    super.initState();
    MFSDK.init(
        AppUri.M_API_KEY_TEST, MFCountry.SAUDI_ARABIA, MFEnvironment.LIVE);
    MFSDK.setUpAppBar(backgroundColor: AppColors.primary);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      initiatePayment(initPaymentResponse);
    });
  }

  /*
    Initiate Payment
   */
  void initiatePayment(Function func) {
    var request = new MFInitiatePaymentRequest(
        double.parse(widget.amount!), MFCurrencyISO.SAUDI_ARABIA_SAR);

    MFSDK.initiatePayment(request, MFAPILanguage.AR, func);
  }

  void initPaymentResponse(MFResult<MFInitiatePaymentResponse> result) {
    paymentMethods = [];
    print(result.response?.paymentMethods);
    if (result.isSuccess()) {
      result.response!.paymentMethods!.asMap().forEach((key, e) {
        if (['md', 'ap', 'vm', 'stc'].contains(e.paymentMethodCode))
          paymentMethods!.add(e);
      });
    } else {
      print(result.error!.toJson());
    }
    setState(() {});
  }

  /*
    Execute Regular Payment
   */
  void executeRegularPayment(
      int paymentMethodId, Function func, BuildContext _context) {
    var request =  MFExecutePaymentRequest(
        paymentMethodId, double.parse(widget.amount!));
    MFSDK.executePayment(_context, request, MFAPILanguage.EN,
        onPaymentResponse: func);
  }

  void paymentResponse(String invoiceId, MFResult<dynamic> result) {
    if (result.isSuccess() ||
        (kDebugMode && result.error?.message == 'DECLINED')) {
      setState(() {
        print(invoiceId);
        print(result.response?.toJson());
        // _response = result.response.toJson().toString();
        //
        // bloc!.add(ChargeWallet((b) => b
        //   ..amount = double.tryParse(widget.amount!)
        //   ..invoiceId = invoiceId));
        // customBottomSheetMore(
        //   context,
        //   backBtn: false,
        //   btnText: AppLocalizations.of(context).translate('Ok'),
        //   exit: false,
        //   onTap: () {
        //     Navigator.pop(context, true);
        //   },
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: 20,
        //       ),
        //       BuildLocalImage("assets/svg/check.svg"),
        //       SizedBox(
        //         height: 15,
        //       ),
        //       Text(
        //         AppLocalizations.of(context)
        //             .translate('the charging process was successful'),
        //         style: boldStyle,
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //     ],
        //   ),
        // );
      });
    } else {
      setState(() {
        print(invoiceId);
        print(result.status);
        print(result.error!.toJson());
        // _response = result.error.message;
        showTost(result.error!.message!);
      });
    }
  }

  void showTost(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: AppColors.primary,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void pay(BuildContext _context) {
    if (selectedPaymentMethodIndex == -1) {
      showTost("Please select payment method first");
    } else {
      print(selectedPaymentMethodIndex);
      executeRegularPayment(
          paymentMethods![selectedPaymentMethodIndex].paymentMethodId!,
          paymentResponse,
          _context);
    }
  }

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText.titleLarge('Payment Method'),
        ),
        body: Builder(
          builder: (
            context,
          ) {
            if (paymentMethods == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Stack(
              children: [
                ListView(
                  padding: EdgeInsets.all(15),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(' please choose the appropriate payment method'),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: List.generate(
                        paymentMethods!.length,
                        (index) {
                          var item = paymentMethods![index];
                          if (item.isDirectPayment! ||
                              (isAppleAndAndroid(item))) return Container();
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              leading: Transform.scale(
                                scale: 1.2,
                                child: Radio(
                                  value: true,
                                  groupValue: index == sel ? true : false,
                                  onChanged: (dynamic v) {
                                    setState(() {
                                      sel = index;
                                    });
                                  },
                                ),
                              ),
                              title: Container(
                                child: Text(
                                  item.paymentMethodEn!,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    "Total Amount will be :",
                                  ),
                                  Expanded(
                                    child: Text(
                                      item.totalAmount.toString(),
                                    ),
                                  ),
                                  item.isDirectPayment!
                                      ? Expanded(
                                          child: Text(
                                            "use stored card",
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                              trailing: Image(
                                image: NetworkImage(item.imageUrl!),
                                width: 40,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        selectedPaymentMethodIndex = sel;
                        pay(context);
                      },
                      child: CustomText.bodyMedium('Continue to Pay',
                          style: TextStyle(color: AppColors.white)),
                    )

                    // SizedBox(height: 10),
                    // ExpansionTile(
                    //   title: Text('log'),
                    //   initiallyExpanded: false,
                    //   children: [
                    //     RichText(
                    //         text: TextSpan(
                    //             text: _response, style: TextStyle(fontSize: 9)))
                    //   ],
                    // )
                  ],
                ),
              ],
            );
          },
        ));
  }

  bool isAppleAndAndroid(PaymentMethods item) {
    return Platform.isAndroid &&
        item.paymentMethodEn!.toLowerCase().contains('apple');
  }
}
