// class PayProccesPage extends StatefulWidget {
//   @override
//   _PayProccesPageState createState() => _PayProccesPageState();
// }
//
// class _PayProccesPageState extends State<PayProccesPage> {
//   var _value = false;
//   var _value2 = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: customAppBar(
//           context, AppLocalizations.of(context).translate('payment process')),
//       body: ListView(
//         padding: EdgeInsets.all(15),
//         children: [
//           Text(AppLocalizations.of(context).translate('edit card'),
//               style: boldStyle),
//           Text(
//             AppLocalizations.of(context).translate('you can edit credit card'),
//             style: regStyle.copyWith(color: greyColor),
//           ),
//           SizedBox(height: 8),
//           Text(
//             AppLocalizations.of(context).translate('card number'),
//             style: regStyle.copyWith(color: primaryColor),
//           ),
//           cardNumberField(
//             hint: '5258 - 9632 - 4289 - 6327',
//           ),
//           SizedBox(height: 8),
//           Row(
//             children: [
//               Text(
//                 AppLocalizations.of(context).translate('expire date'),
//                 style: regStyle.copyWith(color: primaryColor),
//               ),
//               SizedBox(width: sizeAware.width * 0.3),
//               Text(
//                 AppLocalizations.of(context).translate('pin code'),
//                 style: regStyle.copyWith(color: primaryColor),
//               ),
//               Text(
//                 '(CVV)',
//                 style: mediumStyle.copyWith(color: greyColor),
//               )
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: sizeAware.width * 0.45,
//                 child: customTextField(
//                   isSvg: true,
//                   readOnly: false,
//                   isSuffixIcon: false,
//                   hint: r"DD\YY",
//                 ),
//               ),
//               Container(
//                 width: sizeAware.width * 0.45,
//                 child: customTextField(
//                   isSvg: true,
//                   readOnly: false,
//                   isSuffixIcon: false,
//                   hint: "CVV",
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 8),
//           Text(
//             AppLocalizations.of(context)
//                 .translate('name of the owner of the card'),
//             style: regStyle.copyWith(color: primaryColor),
//           ),
//           customTextField(
//             isSvg: true,
//             readOnly: false,
//             isSuffixIcon: false,
//             hint: AppLocalizations.of(context).translate('mohamed nabhan'),
//           ),
//           Row(
//             children: [
//               customCheckBox(
//                   value: _value,
//                   onTab: () {
//                     setState(() {
//                       _value = !_value;
//                     });
//                   }),
//               SizedBox(width: 4),
//               Text(
//                 AppLocalizations.of(context).translate(
//                     'save the card data for use in another purchase.'),
//                 style: regStyle.copyWith(fontSize: 10),
//               ),
//             ],
//           ),
//           SizedBox(height: 5),
//           Text(
//             AppLocalizations.of(context).translate('recipient details'),
//             style: boldStyle,
//           ),
//           SizedBox(height: 5),
//           Text(
//             AppLocalizations.of(context)
//                 .translate('please enter recipient details'),
//             style: lightStyle.copyWith(color: Colors.grey),
//           ),
//           SizedBox(height: 10),
//           Text(
//             AppLocalizations.of(context).translate('recipient name'),
//             style: regStyle.copyWith(color: primaryColor),
//           ),
//           customTextField(
//             isSvg: true,
//             readOnly: false,
//             isSuffixIcon: false,
//             hint: AppLocalizations.of(context).translate('recipient name'),
//           ),
//           SizedBox(height: 5),
//           Text(
//             AppLocalizations.of(context).translate('phone number'),
//             style: regStyle.copyWith(color: primaryColor),
//           ),
//           customTextField(
//             isSvg: true,
//             readOnly: false,
//             isSuffixIcon: false,
//             hint: AppLocalizations.of(context).translate('phone number'),
//           ),
//           SizedBox(height: 5),
//           Text(
//             AppLocalizations.of(context).translate('address details'),
//             style: regStyle.copyWith(color: primaryColor),
//           ),
//           customTextField(
//             isSvg: true,
//             readOnly: false,
//             isSuffixIcon: false,
//             hint: AppLocalizations.of(context)
//                 .translate('country - city - region - famous place '),
//           ),
//           SizedBox(height: 5),
//           Row(
//             children: [
//               customCheckBox(
//                   value: _value2,
//                   onTab: () {
//                     setState(() {
//                       _value2 = !_value2;
//                     });
//                   }),
//               SizedBox(width: 4),
//               Text(
//                 AppLocalizations.of(context).translate(
//                     'save the card data for use in another purchase.'),
//                 style: regStyle.copyWith(fontSize: 13),
//               ),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: appButton(
//               buttonColor: primaryColor,
//               onTap: () => push(context, OrderDetilsPage()),
//               text: AppLocalizations.of(context).translate('confirm'),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
