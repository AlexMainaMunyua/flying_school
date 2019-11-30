import 'package:flutter/material.dart';
import 'package:flying_school/core/model/topicsModel.dart';
import 'package:flying_school/core/view/CrudModel.dart';
import 'package:flying_school/pages/topicBuilder.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({this.isLoading});
  final bool isLoading;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List<Topics> topics;
      @override
      Widget build(BuildContext context) {
        final topicProvider =Provider.of<CRUDModel>(context);
          return StreamBuilder<QuerySnapshot>(
            stream: topicProvider.fetchTopicsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasData){
                topics =snapshot.data.documents
                .map((doc)=> Topics.fromMap(doc.data,doc.documentID))
                .toList();
                return ListView.builder(
                  itemCount: topics.length,
                  itemBuilder: (context, index)=>
                  TopicBuilder(topic: topics[index]),
                );
              }else{
                return Center(child: const CircularProgressIndicator(),);
              }
            },       
         );
      }
}

            
            