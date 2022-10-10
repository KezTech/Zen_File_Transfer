import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zen_file_transfer/views/widescreen_home.dart';
import 'package:unicons/unicons.dart';
import 'controllers/intents.dart';
import 'views/history.dart';
import 'views/mobile_home.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 241, 243, 246),
      appBar: AppBar(

        backgroundColor: const Color.fromARGB(56, 218, 153, 61),
        centerTitle: true,
        title: const Text(
          'Zen File Transfer',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      // drawer: Shortcuts(
      //   shortcuts: {
      //     LogicalKeySet(LogicalKeyboardKey.backspace): GoBackIntent()
      //   },
      //   child: Actions(
      //     actions: {
      //       GoBackIntent: CallbackAction<GoBackIntent>(onInvoke: (intent) {
      //         if (scaffoldKey.currentState!.isDrawerOpen) {
      //           scaffoldKey.currentState!.openEndDrawer();
      //         }
      //         return null;
      //       })
      //     },
      //     child: Drawer(
      //       backgroundColor: const Color.fromARGB(255, 214, 229, 245),
      //       child: ListView(
      //         children: [
      //           const SizedBox(
      //             height: 50,
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(0.0),
      //             child: Column(
      //               children: [
      //                 Image.asset(
      //                   'assets/images/icon.png',
      //                   width: 70,
      //                   height: 70,
      //                 ),
      //                 const Text('Z.F.T')
      //               ],
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(20.0),
      //           ),
      //           ListTile(
      //             leading: const Icon(UniconsSolid.history),
      //             title: const Text('Received-history'),
      //             onTap: () {
      //               Navigator.of(context)
      //                   .push(MaterialPageRoute(builder: (context) {
      //                 return const HistoryPage();
      //               }));
      //             },
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: Center(
        child: size.width > 720 ? const WidescreenHome() : const MobileHome(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 168, 220, 255),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,

        items: const [

          BottomNavigationBarItem(
            //I want to navigate to a new page Library();
            icon: Icon(
              Icons.send,
              color: const Color.fromARGB(255, 224, 157, 62),
            ),
            label: 'Transfer',
          ),
          // BottomNavigationBarItem(
          //     //I want to navigate to a new page Store();
          //     icon: Icon(
          //       Icons.chat_outlined,
          //       color: const Color.fromARGB(255, 224, 157, 62),
          //     ),
          //     label: 'Chat'),
          BottomNavigationBarItem(
            //I want to navigate to a new page Profile();
            icon: Icon(
              Icons.history,
              color: const Color.fromARGB(255, 224, 157, 62),
            ),
            label: 'History',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.pushNamed(context, "/history");
              break;
            // case 1:
            //   Navigator.pushNamed(context, "/Message");
            //   break;
          }
        },
      ),
    );
  }
}
