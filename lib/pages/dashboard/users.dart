import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  Users({Key key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: Icon(Icons.dehaze),
        title: Text(
          'Users',
          style: TextStyle(fontFamily: 'Righteous'),
        ),
      ),
    );
  }
}