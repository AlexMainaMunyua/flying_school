import 'package:flutter/material.dart';
import 'package:flying_school/core/model/topicsModel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class TopicDetails extends StatefulWidget {
  final Topics topic;

  TopicDetails({@required this.topic});

  @override
  _TopicDetailsState createState() => _TopicDetailsState();
}

class _TopicDetailsState extends State<TopicDetails> {
Completer<WebViewController> _controller = Completer<WebViewController>();
 final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.topic.topicName}'),
      ),
      body: Container(
        color: Colors.white,
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: <Widget>[
            WebView(
              initialUrl: '${widget.topic.content}',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController controller){
                _controller.complete(controller);
              },
            )
          ],

        ),
      ),
      
    );
  }
}