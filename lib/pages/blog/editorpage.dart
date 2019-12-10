import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flying_school/core/view/CrudModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:zefyr/zefyr.dart';
import 'package:flying_school/core/model/topicsModel.dart';
import 'package:flutter/services.dart';

class EditorPage extends StatefulWidget {
  final Function add;
  final Function update;
  final int noteIndex;
  final Note note;

  EditorPage({this.add, this.update, this.noteIndex, this.note});

  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  ZefyrController _editorController;

  TextEditingController _titleController;
  TextEditingController _descriptionController;

  /// Zefyr editor like any other input field requires a focus node.
  FocusNode _focusNode;

  NotusDocument _document;

  @override
  void initState() {
    super.initState();

    _document = _loadDocument();
    _titleController = _loadTitle();
    _descriptionController = _loadDescription();
    _editorController = ZefyrController(_document);
    _focusNode = FocusNode();
  }

  NotusDocument _loadDocument() {
    // If in edit mode then load the provided document
    return widget.note != null ? widget.note.document : NotusDocument();
  }

  TextEditingController _loadTitle() {
    // If in edit mode then load the provided title
    return widget.note != null
        ? TextEditingController(text: widget.note.title)
        : TextEditingController();
  }

  TextEditingController _loadDescription() {
    //if in edit mode the load the provided description:
    return widget.note != null
        ? TextEditingController(text: widget.note.description)
        : TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var noteProvider = Provider.of<NoteCRUDModel>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    // To make the editor height responsive
    double editorHeight = screenHeight * 0.65;

    final editor = ZefyrField(
      height: editorHeight, // set the editor's height
      controller: _editorController,
      focusNode: _focusNode,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      physics: ClampingScrollPhysics(),
    );

    final titleField = TextField(
      controller: _titleController,
      decoration: InputDecoration(
        hintText: 'Enter Blog Title Here...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
    final descriptionField = TextField(
      controller: _descriptionController,
      decoration: InputDecoration(
        hintText: 'Enter Blog Description Here...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );

    final form = Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            titleField,
            SizedBox(
              height: 10,
            ),
            descriptionField,
            SizedBox(
              height: 10,
            ),
            editor
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create New Blog",
          style: TextStyle(fontFamily: 'Righteous', color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            color: Colors.white,
            onPressed: () {
              final NotusDocument doc = _editorController.document;

              final String title = _titleController.text;

              final String description = _descriptionController.text;

              final Note note =
                  Note(title: title, description: description, document: doc);

              final contents = jsonEncode(note);

              // var db = FirebaseDatabase.instance;
              noteProvider.addNote(Note(title: title,description: description, document: doc));

            /*   if (widget.noteIndex == null && widget.note == null) {
                db.reference().child('Note').push().set(contents).then((_) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Saved'),
                  ));                 
                }                
                );
                widget.add(note);
              } else {
                widget.update(widget.noteIndex, note);
              } */
              Navigator.of(context).pop();
            },
            // onPressed: () => _saveDocument(context),
          ),
          IconButton(
            icon: Icon(Icons.clear_all),
            color: Colors.white,
            onPressed: () => _clearDocument(context),
          ),
        ],
      ),
      body: ZefyrScaffold(child: form),
    );
  }

  void _saveDocument(BuildContext context) async {
    final NotusDocument doc = _editorController.document;

    final String title = _titleController.text;

    final String description = _descriptionController.text;

    final Note note =
        Note(title: title, description: description, document: doc);

    final contents = jsonEncode(note);

    var db = FirebaseDatabase.instance;

    if (widget.noteIndex == null && widget.note == null) {
      db.reference().child('Note').push().set(contents).then((_) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Saved'),
        ));
      });
    } else {
      widget.update(widget.noteIndex, note);
    }

    /*    var url = 'https://loan-app-6d0b2.firebaseio.com/Note.json';

    var httpClient = Client();
    var response = await httpClient.post(url, body: contents);

    print('response' + response.body); */

    /*  // Check if we need to add new or edit old one
    if (widget.noteIndex == null && widget.note == null) {
       await noteProvider
        .addNote(Note(title: title, description: description, document: doc));
      // widget.add(note);
    } else {
      widget.update(widget.noteIndex, note);
    } */

    Navigator.pop(context);
  }

  void _clearDocument(BuildContext context) async {
    bool confirmed = await _getConfirmationDialog(context);
    if (confirmed) {
      _editorController.replaceText(
          0, _editorController.document.length - 1, '');
    }
  }

  Future<bool> _getConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm?'),
          content: Row(
            children: <Widget>[
              Expanded(
                child: Text('Are you sure you want to clear the contents?'),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
