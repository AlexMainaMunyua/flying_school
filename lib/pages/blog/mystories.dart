import 'package:flutter/material.dart';
import 'package:flying_school/core/model/topicsModel.dart';
import 'package:flying_school/pages/blog/newstories.dart';

class MyStorie extends StatefulWidget {
  MyStorie({Key key}) : super(key: key);

  @override
  _MyStorieState createState() => _MyStorieState();
}

class _MyStorieState extends State<MyStorie> {
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
      appBar: AppBar(
        title: Text(
          'MyNotes',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: _notesList.length == 0
            ? Center(
                child: Text("Tap on + button to add new notes"),
              )
            : _getNotesList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => EditorPage(add: _add)),
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
        return ListTile(
          leading: Icon(Icons.note),
          title: Text(
            _notesList[index].title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            _notesList[index].document.toPlainText(),
            maxLines: 1,
          ),
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
        );
      },
    );
  }
}
