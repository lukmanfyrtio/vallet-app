import 'package:flutter/material.dart';
import 'package:valet_apps/account.dart';
import 'package:valet_apps/home_content.dart';
import 'package:valet_apps/transaction.dart';

import 'account.dart';
import 'home_content.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItemIndex = 0;
  final List pages=[
    HomeContent(),
    Transaction(),
    Account()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          buildNavBarItem(Icons.home_outlined, 0),
          buildNavBarItem(Icons.local_parking_outlined, 1),
          buildNavBarItem(Icons.account_box_outlined, 2),
        ],
      ),
      body:pages[_selectedItemIndex]
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 60,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Colors.blue),
                ),
                gradient: LinearGradient(colors: [
                  Colors.blue.withOpacity(0.3),
                  Colors.blue.withOpacity(0.015)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : BoxDecoration(),
        width: MediaQuery.of(context).size.width / 3,
        child: Icon(
          icon,
          color: index == _selectedItemIndex ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
