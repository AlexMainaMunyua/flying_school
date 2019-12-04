import 'package:flutter/material.dart';

class NewStories extends StatefulWidget {
  NewStories({Key key}) : super(key: key);

  @override
  _NewStoriesState createState() => _NewStoriesState();
}

class _NewStoriesState extends State<NewStories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new Blog'),
        actions: <Widget>[
          FlatButton(
            child: Text('NEXT'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Editor()));
            },
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade200,
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.camera_alt),
              Icon(Icons.format_bold),
              Icon(Icons.format_italic),
              Icon(Icons.format_underlined),
              Icon(Icons.format_list_bulleted),
              Icon(Icons.format_list_numbered),
              Icon(Icons.format_align_center),
              Icon(Icons.format_align_justify),
              Icon(Icons.format_align_left),
              Icon(Icons.format_align_right),
              Icon(Icons.format_indent_increase),
            ],
          ),
        ),
      ),
      body: (Container(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Enter Title'),
              ),
              FlatButton(
                child: Text('Start creating beat here....'),
                onPressed: () {},
              )
            ],
          ),
        ),
      )),
    );
  }
}

class Editor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
