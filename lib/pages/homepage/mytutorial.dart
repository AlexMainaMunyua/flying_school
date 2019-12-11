
import 'package:flutter/material.dart';
import 'package:flying_school/core/model/topicsModel.dart';
import 'package:flying_school/pages/blog/editorpage.dart';
import 'package:flying_school/pages/homepage/tutorialeditorpage.dart';


class MyTutorial extends StatefulWidget {
  MyTutorial({Key key}) : super(key: key);

  @override
  _MyTutorialState createState() => _MyTutorialState();
}

class _MyTutorialState extends State<MyTutorial> {
  List<Note> _notesList = List();

  void _add(Note note) {
    setState(() {
      // Insert new notes at the start
      _notesList.insert(0, note);
    });
  }

  void _update(int index, Note updatedNote) {
    setState(() {
      _notesList.removeAt(index);
      _notesList.insert(index, updatedNote);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final noteProvider = Provider.of<NoteCRUDModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tutorials',
          style: TextStyle(color: Colors.white, fontFamily: 'Righteous'),
        ),
      ),
     
     body: Container(
        child: _notesList.length == 0
            ? Center(
                child: Text(
                  "Add New Tutorial",
                  style: TextStyle(fontFamily: 'Righteous'),
                ),
              )
            : _getNotesList(),
      ), 
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[900],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => TutorialEditorPage(add: _add)),
          );
        },
        tooltip: 'Add New Notes',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _getNotesList() {
    return ListView.builder(
      itemCount: _notesList.length,
      itemBuilder: (BuildContext context, int index) {


        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => EditorPage(
                  update: _update,
                  noteIndex: index,
                  note: _notesList[index],
                ),
              ),
            );
          },
          
    /*   onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => BlogDetails(blog: blog)));
        print('tapped');
      }, */
      child: Container(
        padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  height: 100,
                  width: 120,
                  child: Image.asset(
                    'images/logo.jpg',
                    fit: BoxFit.fill,
                  )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Alex Maina',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.greenAccent[700]),
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.greenAccent[700]),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            _notesList[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            _notesList[index].description.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey),
                          ))
                    ],
                  )),
                ),
              )
            ],
          ),
          Divider(
            color: Colors.black45,
          ),
        ]),
      ),
    );
        // return Container(
          // child: Text( _notesList[index].document.toPlainText(),),
        // );

      /*   return Container(
                  padding: const EdgeInsets.all(12.0),
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'alex maina',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.greenAccent[700]),
                              ),
                              Text('',
                              
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.greenAccent[700]),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text( _notesList[index].title
                            ,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            _notesList[index].description.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey),
                          ))
                    ],
                  )),
                ); */

     /*    return ListTile(
          leading: Image.asset('images/logo.jpg'),
          title: Text(
            _notesList[index].title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          subtitle: Container(
              child: Column(
            children: <Widget>[
              Text(_notesList[index].description.toString()),
              Text(
                _notesList[index].document.toPlainText(),
                maxLines: 1,
              ),
            ],
          )),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => EditorPage(
                  update: _update,
                  noteIndex: index,
                  note: _notesList[index],
                ),
              ),
            );
          },
        ); */
      },
    );
  }
}
