import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flying_school/core/model/topicsModel.dart';
import 'package:flying_school/core/view/CrudModel.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Topics> topics = List<Topics>();

  @override
  Widget build(BuildContext context) {
    final topicProvider = Provider.of<CRUDModel>(context);
    // final topicProviders = topicProvider.fetchTopicsAsStream();
    return StreamBuilder<QuerySnapshot>(
      stream: topicProvider.fetchTopicsAsStream(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          topics = snapshot.data.documents
              .map((doc) => Topics.fromMap(doc.data, doc.documentID))
              .toList();
          return ListView.builder(
            itemCount: topics.length,
            itemBuilder: (context, index) =>
                TopicBuilder(topics: topics[index]),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.pink),
          );
        }
      },
    );
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

class TopicBuilder extends StatelessWidget {
  final Topics topics;

  TopicBuilder({@required this.topics});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => SubTopicBuilder(topics: topics)));
      },
      child: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.all(2),
            child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.pink.shade900,
                child: Text(
                  '${topics.iconText}',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              title: Container(
                child: Text(
                  '${topics.topicName}.',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              subtitle: Container(
                child: Text(
                  '${topics.description}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SubTopicBuilder(
                                topics: topics,
                              )));
                },
              ),
            )),
        Divider()
      ]),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////\\
///////////////////////////////////////////////////////////////////////////////////
class SubTopicBuilder extends StatelessWidget {
  const SubTopicBuilder({Key key, this.topics}) : super(key: key);
  final Topics topics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${topics.topicName}',
          style: TextStyle(fontFamily: 'Righteous'),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[]..addAll(textSection(topics)),
        ),
        // child: child,
      ),
    );
  }

  List<Widget> textSection(Topics topics) {
    return topics.subtopic
        .map((sub) => TextSection(
              subTopicName: sub.subTopicName,
              subTopicContent: sub.subTopicContent,
            ))
        .toList();
  }
}

class TextSection extends StatelessWidget {
  final String subTopicName;
  final String subTopicContent;

  const TextSection({Key key, this.subTopicName, this.subTopicContent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContextSection(
                      subTopcContent: subTopicContent, subTopcName: subTopicName
                    )));
      },
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(subTopicName),
          )
        ],
      ),
    );
  }
}

class ContextSection extends StatefulWidget {
  final subTopcContent;
  final subTopcName;

  const ContextSection({
    Key key,
    this.subTopcContent, this.subTopcName,
  }) : super(key: key);

  @override
  _ContextSectionState createState() => _ContextSectionState();
}

class _ContextSectionState extends State<ContextSection> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.subTopcName}'),
      ),
      body: Container(
        color: Colors.white,
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: <Widget>[
            WebView(
              initialUrl: '${widget.subTopcContent}',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController controller) {
                _controller.complete(controller);
              },
            )
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////
