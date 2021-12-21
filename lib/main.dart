// @dart=2.14
import 'package:userpermission/page/filter_local_list_page.dart';
import 'package:userpermission/page/filter_network_list_page.dart';
import 'package:userpermission/page/dasboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userpermission/page/login.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences= await SharedPreferences.getInstance();
  var username = preferences.getString('username');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: username== null ? MyApp() : TempMyApp(), ));
}

class MyApp extends StatelessWidget {
  static final String title = 'Permission App';

  @override
  Widget build(BuildContext context) => MaterialApp(

    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: LoginPage(),
  );
}

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   int index = 0;
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     bottomNavigationBar: buildBottomBar(),
//     body: buildPages(),
//   );
//
//   Widget buildBottomBar() {
//     final style = TextStyle(color: Colors.white);
//
//     return BottomNavigationBar(
//       backgroundColor: Theme.of(context).primaryColor,
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.white70,
//       currentIndex: index,
//       items: [
//         BottomNavigationBarItem(
//           icon: Text('Filter List', style: style),
//           title: Text('Local'),
//         ),
//         BottomNavigationBarItem(
//           icon: Text('Filter List', style: style),
//           title: Text('Network'),
//         ),
//       ],
//       onTap: (int index) => setState(() => this.index = index),
//     );
//   }
//
//   Widget buildPages() {
//     switch (index) {
//       case 0:
//         return FilterLocalListPage();
//       case 1:
//         return FilterNetworkListPage();
//       default:
//         return Container();
//     }
//   }
// }