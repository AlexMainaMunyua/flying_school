import 'package:flutter/material.dart';
import 'package:flying_school/core/model/topicsModel.dart';
import 'package:flying_school/pages/topicDetail.dart';

class TopicBuilder extends StatelessWidget {
  final Topics topic;

  TopicBuilder({@required this.topic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, 
          MaterialPageRoute(builder: (_)=> TopicDetails(topic: topic)));
          print('Tapped');
      },
      child: Padding(
        padding: EdgeInsets.all(2),
        child: ListTile(
          title: Container(child: Text('${topic.topicName}'),),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
      
    );
  }
}