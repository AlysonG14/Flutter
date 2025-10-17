import 'package:app_navbar/screen1.dart';
import 'package:app_navbar/screen2.dart';
import 'package:app_navbar/screen3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavBar(

      ),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int myIndex = 0; // variable that show the position of screen wished!
  
  void changeIndex(int index){ // the function that changes the index/screen

    setState(() {
      myIndex = index;
    });
  }

  List<Widget> screens = [ // list of type Widget(that is anything component or screen)
                           // screens is the name of list, but can be what'else
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens.elementAt(myIndex),
        bottomNavigationBar: 
        BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: "Screen 01", icon: Icon(Icons.ac_unit)),
          BottomNavigationBarItem(label: "Screen 02", icon: Icon(Icons.ac_unit)),
          BottomNavigationBarItem(label: "Screen 03", icon: Icon(Icons.ac_unit))
        ], 
        currentIndex: myIndex,
        onTap: changeIndex,
        ),
      )
    );
  }
}