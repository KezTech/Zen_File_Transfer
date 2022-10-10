// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:zen_file_transfer/app.dart';
// // import 'Chat';
// // import 'history';
//
// class NavBar extends StatefulWidget {
//   const NavBar({Key? key}) : super(key: key);
//
//   @override
//   State<NavBar> createState() => _NavBarState();
// }
//
// class _NavBarState extends State<NavBar> {
//   int _selectedIndex = 0;
//   final List<Widget> _children = [
//     App(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     void onTabTapped(int index) {
//       setState(() {});
//     }
//
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.green[100],
//           items: const [
//             BottomNavigationBarItem(
//               //I want to navigate to a new page Library();
//               icon: Icon(Icons.send),
//               label: 'Transfer',
//             ),
//             BottomNavigationBarItem(
//               //I want to navigate to a new page Store();
//               icon: Icon(Icons.chat_outlined),
//               label: 'Chat',
//             ),
//             BottomNavigationBarItem(
//               //I want to navigate to a new page Profile();
//               icon: Icon(Icons.history),
//               label: 'History',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           onTap: (int index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           }),
//     );
//   }
// }
