import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flying_school/core/model/topicsModel.dart';
import 'package:flying_school/core/view/CrudModel.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate<Topics> {
  List<Topics> topics;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final providerTopics = Provider.of<CRUDModel>(context);
    return StreamBuilder(
      // stream: Firestore.instance.collection('Topics').snapshots(),
      stream: providerTopics.fetchTopicsAsStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');

        final results = snapshot.data.documents.where((DocumentSnapshot a) =>
            a.data['topicName'].toLowerCase().toString().contains(query));

        return ListView(
            children: results
                .map<Widget>((a) => Card(
                    child: ListTile(
                        onTap: () {
                          // TopicDetails(topic: results);
                          close(context, results);
                        },
                        leading: Icon(
                          Icons.book,
                          color: Colors.pink[800],
                        ),
                        title: Text(
                          a.data['topicName'].toString(),
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ))))
                .toList());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('Topics').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');

        final results = snapshot.data.documents.where((DocumentSnapshot a) =>
            a.data['topicName'].toLowerCase().toString().contains(query));

        return ListView(
            children: results
                .map<Widget>((a) => Column(
                                  children:<Widget>[ ListTile(
                          onTap: () {
                            close(context, results);
                          },
                          leading: Icon(
                            Icons.book,
                            color: Colors.pink[800],
                          ),
                          title: Text(
                            a.data['topicName'].toString(),
                            style: TextStyle(fontSize: 16),
                          )),
                          Divider(),
                                  ]))
                .toList());
      },
    );
  }
}
