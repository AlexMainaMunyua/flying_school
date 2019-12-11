import 'package:flutter/material.dart';
import 'package:flying_school/pages/dashboard/create.dart';

import '../home.dart';


class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

   final _pageOption = [
    HomePage(),
    CreateContent(),
    HomePage(),
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[_cIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink[900],
        currentIndex: _cIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.create, color: Colors.white),
              title: new Text(
                'Create',
                style: TextStyle(color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account, color: Colors.white),
              title: new Text(
                'Accounts',
                style: TextStyle(color: Colors.white),
              ))
        ],
        onTap: (index) {
          _incrementTab(index);
        },
      ),
    );
  }
}
