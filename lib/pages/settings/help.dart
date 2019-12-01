import 'package:flutter/material.dart';
import 'package:flying_school/pages/userDrawer.dart';

class Help extends StatefulWidget {
  const Help({Key key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Container(
          child: ListView(
        children: <Widget>[
          //////////////////////////////////////////////////////////////////////////////////////////
          //////////////////////////////////////////////////////////////////////////////////////////
          /// Getting Started
          Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Getting Started',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                endIndent: 100,
              ),
              ExpansionTile(
                title: Text(
                  'Setup and account and explore with us:',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Container(
                    child: Text(
                      'Select beats() blogs/slide',
                      style: TextStyle(
                          color: Colors.greenAccent.shade700,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
          Divider(
            color: Colors.black45,
          ),

          //////////////////////////////////////////////////////////////////////////////////////////
          //////////////////////////////////////////////////////////////////////////////////////////
          /// Filtering Content
          Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Search Content',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                endIndent: 100,
              ),
              ExpansionTile(
                title: Text(
                  'Handpick-Tutorials:',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Container(
                    child: Text('Select beats() blogs/slide'),
                  )
                ],
              ),
              Divider(
                endIndent: 100,
              ),
              ExpansionTile(
                title: Text(
                  'Handpick-Blog:',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Container(
                    child: Text('Select beats() blogs/slide'),
                  )
                ],
              )
            ],
          ),
          Divider(
            color: Colors.black45,
          ),
          //////////////////////////////////////////////////////////////////////////////////////////
          //////////////////////////////////////////////////////////////////////////////////////////
          /// Exploring User Profile
          Column(children: <Widget>[
            ListTile(
              title: Text(
                'Exploring Users Profiles',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
                endIndent: 100,
              ),
            ExpansionTile(
              title: Text(
                'User Profile:',
                style: TextStyle(
                    color: Colors.greenAccent.shade700,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Container(
                  child: Text('Select beats() blogs/slide'),
                ),
              ],
            )
          ]),
          Divider(
            color: Colors.black45,
          ),

          //////////////////////////////////////////////////////////////////////////////////////////
          //////////////////////////////////////////////////////////////////////////////////////////
          /// Our Features
          Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Our Feature',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                endIndent: 100,
              ),
              ExpansionTile(
                title: Text(
                  'Homepage:',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Container(
                    child: Text('Select beats() blogs/slide'),
                  )
                ],
              ),
              Divider(
                endIndent: 100,
              ),
              ExpansionTile(
                title: Text(
                  'Blog:',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Container(
                    child: Text('Select beats() blogs/slide'),
                  )
                ],
              ),
              Divider(
                endIndent: 100,
              ),
              ExpansionTile(
                title: Text(
                  'User Profile:',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Container(
                    child: Text('Select beats() blogs/slide'),
                  )
                ],
              ),
              Divider(
                endIndent: 100,
              ),
              ExpansionTile(
                title: Text(
                  'Create Blog:',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Container(
                    child: Text('Select beats() blogs/slide'),
                  )
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.black45,
          ),
          ///////////////////////////////////////////////////////////////////
          ////////////////////////////////////////////////////////////////////
          ///Settings
          Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Setting',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                endIndent: 100,
              ),
              ExpansionTile(
                title: Text(
                  'Homepage:',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Container(
                    child: Text('Select beats() blogs/slide'),
                  )
                ],
              ),
              Divider(
                endIndent: 100,
              ),
              ExpansionTile(
                title: Text(
                  'Blog:',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Container(
                    child: Text('Select beats() blogs/slide'),
                  )
                ],
              ),
              Divider(
                endIndent: 100,
              ),
              ExpansionTile(
                title: Text(
                  'User Profile:',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Container(
                    child: Text('Select beats() blogs/slide'),
                  )
                ],
              ),
              Divider(
                endIndent: 100,
              ),
              ExpansionTile(
                title: Text(
                  'Create Blog:',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Container(
                    child: Text('Select beats() blogs/slide'),
                  )
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}