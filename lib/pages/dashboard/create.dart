
import 'package:flutter/material.dart';
import 'package:flying_school/pages/blog/mystories.dart';
import 'package:flying_school/pages/homepage/mytutorial.dart';

class CreateContent extends StatefulWidget {
  CreateContent({Key key}) : super(key: key);

  @override
  _CreateContentState createState() => _CreateContentState();
}

class _CreateContentState extends State<CreateContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.dehaze),
        title: Text(
          'Create New...',
          style: TextStyle(fontFamily: 'Righteous'),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context, 
                            MaterialPageRoute(builder: (context)=> MyStorie()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.note,
                              size: 50,
                              color: Colors.grey[600],
                            ),
                            Text(
                              'Blog',
                              style: TextStyle(
                                  fontSize: 18, fontFamily: 'Righteous'),
                            ),
                            Text(
                              'Create a Blog',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontFamily: 'Righteous'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 1,
                      color: Colors.pink[900],
                    ),
                    Container(
                      // padding: const EdgeInsets.all(20.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyTutorial()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.rate_review,
                              size: 50,
                              color: Colors.grey[600],
                            ),
                            Text(
                              'Tutorial',
                              style: TextStyle(
                                  fontSize: 18, fontFamily: 'Righteous'),
                            ),
                            Text(
                              'Add a tutorial',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontFamily: 'Righteous'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'The Content & Sharing tab in Enterprise Settings that allows you'
                  ' to create or add various tutorials and blogs to the user.',
                  style: TextStyle(
                      color: Colors.grey[600], fontFamily: 'Righteous'),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
