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
    return;
  }
}