import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flying_school/core/model/topicsModel.dart';
import 'package:flying_school/core/services/service.dart';

import '../../locator.dart';

class CRUDModel extends ChangeNotifier {
  TopicApi _api = locator<TopicApi>();

  List<Topics> topics;

  Future<List<Topics>> fetchTopics() async {
    var results = await _api.getDataCollection();
   
     topics = results.documents
        .map((doc) => Topics.fromMap(doc.data, doc.documentID))
        .toList(); 
    return topics;
  }

  Stream<QuerySnapshot> fetchTopicsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Topics> getTopicsById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Topics.fromMap(doc.data, doc.documentID);
  }

  Future removeTopics(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateTopics(Topics data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addTopics(Topics data) async {
    var result = await _api.addDocument(data.toJson());
    return result;
  }
}
//////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// class CRUDSubTopicModel extends ChangeNotifier {
//   SubTopicAPI _api = locator<SubTopicAPI>();

//   List<SubTopic> subtopics;

//   Future<List<SubTopic>> fetchsubTopic() async {
//     var results = await _api.getDataCollection();
//     subtopics = results.documents
//         .map((doc) => SubTopic.fromMap(doc.data, doc.documentID))
//         .toList();
//     return subtopics;
//   }

//   Stream<QuerySnapshot> fetchSubTopicAsStream() {
//     return _api.streamDataCollection();
//   }

//   Future<SubTopic> getSubTopicById(String id) async {
//     var doc = await _api.getDocumentById(id);
//     return SubTopic.fromMap(doc.data, doc.documentID);
//   }

//   Future removeSubTopic(String id) async {
//     await _api.removeDocument(id);
//     return;
//   }

//   Future updateSubTopic(Topics data, String id) async {
//     await _api.updateDocument(data.toJson(), id);
//     return;
//   }

//   Future addSubTopic(Topics data) async {
//     var result = await _api.addDocument(data.toJson());
//     return result;
//   }
// }


////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

class BlogCRUDModel extends ChangeNotifier {
  BlogApi _api = locator<BlogApi>();

  List<Blog> blogs;

  Future<List<Blog>> fetchBlogs() async {
    var results = await _api.getDataCollection();
    blogs = results.documents
        .map((doc) => Blog.fromMap(doc.data, doc.documentID))
        .toList();
    return blogs;
  }

  Stream<QuerySnapshot> fetchBlogAsStream() {
    return _api.streamDataCollection();
  }

  Future<Blog> getBlogById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Blog.fromMap(doc.data, doc.documentID);
  }

  Future removeBlog(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateBlog(Blog data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addBlod(Blog data) async {
    var result = await _api.addDocument(data.toJson());
    return result;
  }
}

///////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
///
class NoteCRUDModel extends ChangeNotifier {
  NoteApi _api = locator<NoteApi>();

  List<Note> notes;

  Future<List<Note>> fetchNotes() async {
    var results = await _api.getDataCollection();
    notes = results.documents
        .map((doc) => Note.fromMap(doc.data, doc.documentID))
        .toList();
    return notes;
  }

  Stream<QuerySnapshot> fetchNoteAsStream() {
    return _api.streamDataCollection();
  }

  Future<Note> getNoteById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Note.fromMap(doc.data, doc.documentID);
  }

  Future removeNote(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateNote(Note data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addNote(Note data) async {
    var result = await _api.addDocument(data.toJson());
    return result;
  }
}
