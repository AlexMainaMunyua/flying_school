import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flying_school/core/model/topicsModel.dart';
import 'package:flying_school/core/view/CrudModel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'editorpage.dart';

class BlogPage extends StatefulWidget {
  BlogPage({Key key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
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
    return Scaffold(
      body: Container(
        child: _notesList.length == 0
            ? Center(
                child: Text(
                  "No Blog Added",
                  style: TextStyle(fontFamily: 'Righteous'),
                ),
              )
            : _getNotesList(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
      },
    );
  }
}

class BlogBuilder extends StatelessWidget {
  const BlogBuilder({Key key, this.blog}) : super(key: key);

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatedDate = DateFormat('d MMM').format(now);
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => BlogDetails(blog: blog)));
        print('tapped');
      },
      child: Container(
        padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  height: 100,
                  width: 120,
                  child: Image.network(
                    '${blog.blogImage}',
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
                                '${blog.authorName}.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.greenAccent[700]),
                              ),
                              Text(
                                formatedDate,
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
                            '${blog.blogTopicName}.',
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
                            '${blog.blogDescription}.',
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
  }
}

class BlogDetails extends StatefulWidget {
  BlogDetails({Key key, this.blog}) : super(key: key);

  final Blog blog;

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.blog.blogTopicName}'),
      ),
    );
  }
}
