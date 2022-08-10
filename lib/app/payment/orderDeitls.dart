// import 'package:flutter/material.dart';
// import 'package:mustawdaat/core/app_localizations.dart';
// import 'package:mustawdaat/core/style/baseColors.dart';
// import 'package:mustawdaat/injection.dart';
// import 'package:mustawdaat/ui/common_widgets/CustomBottomSheet.dart';
// import 'package:mustawdaat/ui/common_widgets/app_button.dart';
// import 'package:mustawdaat/ui/common_widgets/customAppBar.dart';
// import 'package:mustawdaat/ui/common_widgets/local_image.dart';
//
// class OrderDetilsPage extends StatefulWidget {
//   @override
//   _OrderDetilsPageState createState() => _OrderDetilsPageState();
// }
//
// class _OrderDetilsPageState extends State<OrderDetilsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF9F9F9),
//       appBar: customAppBar(
//           context, AppLocalizations.of(context).translate('order details')),
//       body: ListView(
//         padding: EdgeInsets.all(15),
//         children: [
//           Text(AppLocalizations.of(context).translate('order details'),
//               style: boldStyle),
//           SizedBox(height: 5),
//           Text(
//             AppLocalizations.of(context).translate('ordered products details'),
//             style: regStyle.copyWith(color: greyColor),
//           ),
//           SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(color: Colors.grey[200]!),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 3,
//                         child: Text(
//                           AppLocalizations.of(context)
//                               .translate('product name'),
//                           style: boldStyle,
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Text(
//                           AppLocalizations.of(context).translate('quantity'),
//                           textAlign: TextAlign.center,
//                           style: boldStyle,
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Text(
//                           AppLocalizations.of(context).translate('price'),
//                           textAlign: TextAlign.center,
//                           style: boldStyle,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Column(
//                   children: List.generate(
//                     prod.length,
//                     (index) {
//                       var item = prod[index];
//                       return Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//                         decoration: BoxDecoration(
//                           border: Border(
//                             bottom: BorderSide(color: Colors.grey[200]!),
//                           ),
//                         ),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               flex: 3,
//                               child: Text(
//                                 item.name!,
//                                 style: regStyle.copyWith(fontSize: 13),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Text(
//                                 "${item.numm}",
//                                 textAlign: TextAlign.center,
//                                 style: regStyle,
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Text(
//                                 "${item.price}" + appCurrency,
//                                 textAlign: TextAlign.center,
//                                 style: lightStyle.copyWith(color: Colors.grey),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(color: Colors.grey[200]!),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         AppLocalizations.of(context).translate('shipping fee'),
//                         style: regStyle.copyWith(fontSize: 13),
//                       ),
//                       Text(
//                         "10" + appCurrency,
//                         textAlign: TextAlign.center,
//                         style: regStyle.copyWith(color: Colors.grey[200]),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(color: Colors.grey[200]!),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         AppLocalizations.of(context)
//                             .translate('discount coupon'),
//                         style: regStyle.copyWith(fontSize: 13),
//                       ),
//                       Text(
//                         "- 10" + appCurrency,
//                         textAlign: TextAlign.center,
//                         style: regStyle.copyWith(color: Colors.grey[200]),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(color: Colors.grey[200]!),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         AppLocalizations.of(context).translate('shipping fee'),
//                         style: regStyle.copyWith(fontSize: 13),
//                       ),
//                       Text(
//                         "10" + appCurrency,
//                         textAlign: TextAlign.center,
//                         style: regStyle.copyWith(color: Colors.grey[200]),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(color: Colors.grey[200]!),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         AppLocalizations.of(context)
//                             .translate('additional tax'),
//                         style: regStyle.copyWith(fontSize: 13),
//                       ),
//                       Text(
//                         "10" + appCurrency,
//                         textAlign: TextAlign.center,
//                         style: regStyle.copyWith(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//                   decoration: BoxDecoration(),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         AppLocalizations.of(context).translate('total'),
//                         style: regStyle.copyWith(
//                           fontSize: 13,
//                           color: primaryColor,
//                         ),
//                       ),
//                       Text(
//                         "10" + appCurrency,
//                         textAlign: TextAlign.center,
//                         style: regStyle,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 15),
//           Text(
//               AppLocalizations.of(context).translate('payment methods details'),
//               style: boldStyle),
//           SizedBox(height: 5),
//           Text(
//             AppLocalizations.of(context).translate('payment methods details'),
//             style: regStyle.copyWith(color: greyColor),
//           ),
//           SizedBox(height: 8),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "6327 - •••• - •••• - ••••",
//                   style: lightStyle.copyWith(color: Colors.grey, fontSize: 15),
//                 ),
//                 BuildLocalImage("assets/svg/visaa.svg")
//               ],
//             ),
//           ),
//           SizedBox(height: 15),
//           Text(AppLocalizations.of(context).translate('recipient details'),
//               style: boldStyle),
//           SizedBox(height: 5),
//           Text(
//             AppLocalizations.of(context).translate('recipient details'),
//             style: regStyle.copyWith(color: greyColor),
//           ),
//           SizedBox(height: 8),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//             ),
//             child: Text(
//               "محمد خالد نبهان، 5629595998 ،السعودية - جدة",
//               maxLines: 1,
//               style: lightStyle.copyWith(color: Colors.grey, fontSize: 15),
//             ),
//           ),
//           SizedBox(height: 15),
//           appButton(
//             buttonColor: primaryColor,
//             onTap: () {
//               // customBottomSheetMore(
//               //   context,
//               //   backBtn: true,
//               //   btnText: "تأكيد",
//               //   exit: false,
//               //   title: "هل تأكد عملية الدفع؟",
//               //   child: Column(
//               //     children: [
//               //       Text(
//               //         "يرجى التأكيد في حالة الارادة في الاستمرار",
//               //         style: lightStyle.copyWith(color: Colors.grey),
//               //       ),
//               //       Text(
//               //         "بعملية الدفع وشراء المنتج",
//               //         style: lightStyle.copyWith(color: Colors.grey),
//               //       ),
//               //       SizedBox(height: 10),
//               //       BuildLocalImage("assets/svg/Layer 2.svg"),
//               //       SizedBox(height: 10),
//               //     ],
//               //   ),
//               // );
//               customBottomSheetMore(
//                 context,
//                 btnText: AppLocalizations.of(context).translate('wallet page'),
//                 exit: false,
//                 goHome: true,
//                 onTap: () {
//                   Navigator.pop(context);
//                   prossesButtonSheet(
//                     context,
//                     btnText:
//                         AppLocalizations.of(context).translate('try again'),
//                     error: true,
//                     onTap: () {},
//                     title: AppLocalizations.of(context)
//                         .translate('purchase failed'),
//                     line1: AppLocalizations.of(context).translate(
//                         'please check the balance or data entered for the card'),
//                     line2: AppLocalizations.of(context)
//                         .translate('your credit card.'),
//                   );
//                 },
//                 // title: "هل تأكد عملية الدفع؟",
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       "assets/image/llogo.png",
//                       fit: BoxFit.fill,
//                     ),
//                     Text(
//                       AppLocalizations.of(context)
//                           .translate('thank you for using the warehouse app'),
//                       style: boldStyle.copyWith(color: primaryColor),
//                     ),
//                     Text(
//                       AppLocalizations.of(context).translate(
//                           'in warehouses, we provide you with the precious'),
//                       style: lightStyle.copyWith(color: Colors.grey),
//                     ),
//                     SizedBox(height: 10),
//                     BuildLocalImage("assets/svg/check.svg"),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Text(
//                       AppLocalizations.of(context)
//                           .translate('the charging process was successful'),
//                       style: boldStyle,
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       AppLocalizations.of(context).translate(
//                           'the products have been purchased successfully now'),
//                       textAlign: TextAlign.center,
//                       style: regStyle.copyWith(color: Colors.grey),
//                     ),
//                     Text(
//                       AppLocalizations.of(context).translate(
//                           'track your order status through the My Orders page'),
//                       textAlign: TextAlign.center,
//                       style: regStyle.copyWith(color: Colors.grey),
//                     )
//                   ],
//                 ),
//               );
//             },
//             text: AppLocalizations.of(context).translate('confirm'),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// List<Products> prod = [
//   Products(
//     name: ".في هذه المكان يمكن وضع العنوان",
//     numm: 5,
//     price: 100.0,
//   ),
//   Products(
//     name: ".في هذه المكان يمكن وضع العنوان",
//     numm: 2,
//     price: 120.0,
//   ),
//   Products(
//     name: ".في هذه المكان يمكن وضع العنوان",
//     numm: 3,
//     price: 800.0,
//   ),
// ];
//
// class Products {
//   String? name;
//   int? numm;
//   double? price;
//   Products({this.name, this.numm, this.price});
// }
