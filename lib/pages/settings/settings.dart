import 'package:flutter/material.dart';

import 'personaldetailsform.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Settings',
        style: TextStyle(
          fontFamily: 'Righteous',
        ),
      )),
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
                    style: TextStyle(
                        fontFamily: 'Righteous',
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonalDetailsForm()));
                    },
                  )
                ],
              ),
            ),
            ListTile(
              leading: Text(
                "USERNAME",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "PASSWORD",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text("*********"),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "FIRST NAME",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "LAST NAME",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "ACCOUNT TYPE",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(
                "PERSONAL",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "PLAN TYPE",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(
                "FREE",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "EMAIL",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "PHONE NUMBER",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "GENDER",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "DATE OF BIRTH",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
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
