import 'package:flutter/material.dart';
import 'package:flying_school/core/model/topicsModel.dart';


import 'topicDetail.dart';

class TopicBuilder extends StatelessWidget {
  final Topics topic;
  bool isLoading = true;

  TopicBuilder({@required this.topic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => TopicDetails(topic: topic)));
        print('Tapped');
      },
      child: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.all(2),
            child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.pink.shade900,
                child: Text(
                  '${topic.iconText}',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              title: Container(
                child: Text(
                  '${topic.topicName}.',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              subtitle: Container(
                child: Text(
                  '${topic.description}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => TopicDetails(
                                topic: topic,
                              )));
                },
              ),
            )),
        Divider()
      ]),
    );
  }
}
