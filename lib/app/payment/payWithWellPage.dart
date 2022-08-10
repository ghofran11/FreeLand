// class PayWithWellPage extends StatefulWidget {
//   @override
//   _PayWithWellPageState createState() => _PayWithWellPageState();
// }
//
// class _PayWithWellPageState extends State<PayWithWellPage> {
//   var _value = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: customAppBar(
//           context, AppLocalizations.of(context).translate('payment process')),
//       body: ListView(
//         padding: EdgeInsets.all(15),
//         children: [
//           Text(
//             AppLocalizations.of(context).translate('ayment method'),
//             style: boldStyle,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             AppLocalizations.of(context)
//                 .translate('please choose the appropriate payment method'),
//             style: lightStyle,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 5),
//             padding: EdgeInsets.all(5),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: ListTile(
//               title: Row(
//                 children: [
//                   Text(
//                     AppLocalizations.of(context).translate('wallet'),
//                     style: boldStyle.copyWith(color: Colors.grey[400]),
//                   ),
//                   Text(
//                     AppLocalizations.of(context)
//                         .translate('(available: 520.00 sr)'),
//                     style:
//                         lightStyle.copyWith(fontSize: 10, color: Colors.grey),
//                   ),
//                 ],
//               ),
//               leading: Radio(
//                 value: true,
//                 groupValue: true,
//                 activeColor: primaryColor,
//                 onChanged: null,
//               ),
//               trailing: BuildLocalImage("assets/svg/weeee.svg", height: 6),
//             ),
//           ),
//           SizedBox(height: 15),
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
//                 style: regStyle.copyWith(fontSize: 13),
//               ),
//             ],
//           ),
//           SizedBox(height: 50),
//           appButton(
//             buttonColor: primaryColor,
//             onTap: () => push(context, OrderDetilsPage()),
//             text: AppLocalizations.of(context).translate('confirm the payment'),
//           ),
//         ],
//       ),
//     );
//   }
// }
