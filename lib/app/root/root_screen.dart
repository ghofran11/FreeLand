// import 'package:flutter/material.dart';
//
// class RootScreen extends StatelessWidget {
//   const RootScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: BottomNavyBar(
//       selectedIndex: _selectedIndex,
//       showElevation: true, // use this to remove appBar's elevation
//       onItemSelected: (index) => setState(() {
//         _selectedIndex = index;
//         _pageController.animateToPage(index,
//             duration: Duration(milliseconds: 300), curve: Curves.ease);
//       }),
//       items: [
//         BottomNavyBarItem(
//           icon: Icon(Icons.apps),
//           title: Text('Home'),
//           activeColor: Colors.red,
//         ),
//         BottomNavyBarItem(
//             icon: Icon(Icons.people),
//             title: Text('Users'),
//             activeColor: Colors.purpleAccent),
//         BottomNavyBarItem(
//             icon: Icon(Icons.message),
//             title: Text('Messages'),
//             activeColor: Colors.pink),
//         BottomNavyBarItem(
//             icon: Icon(Icons.settings),
//             title: Text('Settings'),
//             activeColor: Colors.blue),
//       ],
//     ));
//   }
// }
