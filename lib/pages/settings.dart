import 'package:flutter/material.dart';

import 'personaldetailsform.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Container(
        child: ListView(
          children: <Widget>[
            //////////////////////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////////////////
            Container(
              height: 80,
              color: Colors.grey.shade300,
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'PERSONAL DETAILS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(context, 
                      MaterialPageRoute (builder: (context)=> PersonalDetailsForm()));
                    },
                  )
                ],
              ),
            ),
            ListTile(
              leading: Text("USERNAME"),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text("PASSWORD"),
              trailing: Text("*********"),
            ),
            Divider(),
            ListTile(
              leading: Text("FIRST NAME"),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text("LAST NAME"),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text("ACCOUNT TYPE"),
              trailing: Text("PERSONAL"),
            ),
            Divider(),
            ListTile(
              leading: Text("PLAN TYPE"),
              trailing: Text("FREE"),
            ),
            Divider(),
            ListTile(
              leading: Text("EMAIL"),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text("PHONE NUMBER"),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text("GENDER"),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text("DATE OF BIRTH"),
              trailing: Text(""),
            ),
            /////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            Container(
              height: 80,
              color: Colors.grey.shade300,
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'PERSONAL DETAILS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  // IconButton(icon: Icon(Icons.edit), onPressed: (){},)
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'DeActivate Your Account',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Deactivating your account will disable your profile and remove your created beats',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  child: Text(
                    'DeActivate Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.greenAccent.shade700),
                  ),
                  onPressed: () {},
                ))
          ],
        ),
      ),
    );
  }
}
