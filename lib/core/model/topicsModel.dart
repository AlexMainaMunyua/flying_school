import 'package:flying_school/pages/homepage/myhomepage.dart';
import 'package:zefyr/zefyr.dart';

import 'package:json_annotation/json_annotation.dart';

// part 'topic.g.dart';

class SubTopic {
  final String subTopicName;
  final String subTopicContent;

  SubTopic({this.subTopicName, this.subTopicContent});

  factory SubTopic.fromMap(Map<dynamic, dynamic> snapshot) {
    return SubTopic(
        subTopicName: snapshot['subTopicName'],
        subTopicContent: snapshot['subTopicContent']);
  }

  toJson() =>
      {'subTopicName': subTopicName, 'subTopicContent': subTopicContent};
}

@JsonSerializable()
class Topics {
  final String topicName;
  final String id;
  final String content;
  final String iconText;
  final String description;
  final List<SubTopic> subtopic;
  final String mose;

  Topics(
      {this.topicName,
      this.mose,
      this.id,
      this.content,
      this.iconText,
      this.description,
      this.subtopic});

  factory Topics.fromMap(Map snapshot, String id) {
    //  print(snapshot['subtopic']);
    List<SubTopic> subTopics = [];
    if (snapshot['subtopic'] != null) {
      snapshot['subtopic'].forEach((content) {
        SubTopic trial = SubTopic.fromMap(content);
        //  print("hello");
        subTopics.add(trial);
      });
    } else {
      subTopics = null;
    }
    return Topics(
      id: snapshot['id'],
      mose: snapshot['mose'],
      topicName: snapshot['topicName'] ?? '',
      content: snapshot['content'] ?? '',
      iconText: snapshot['iconText'] ?? '',
      description: snapshot['description'] ?? '',
      subtopic: subTopics,
    );
  }
  toJson() => {
        'id': id,
        'topicName': topicName ?? '',
        'mose': mose ?? '',
        'content': content ?? '',
        'iconText': iconText ?? '',
        'description': description ?? '',
        'subtopic': subtopic,
      };
}

class Blog {
  final String authorName;
  final String blogTopicName;
  final String blogDescription;
  final String blogContent;
  final String blogImage;
  final String id;

  Blog(
      {this.id,
      this.authorName,
      this.blogTopicName,
      this.blogDescription,
      this.blogContent,
      this.blogImage});

  Blog.fromMap(Map snapshot, String id)
      : id = id ?? '',
        authorName = snapshot['authorName'] ?? '',
        blogTopicName = snapshot['blogTopicName'] ?? '',
        blogDescription = snapshot['blogDescription'] ?? '',
        blogContent = snapshot['blogContent'] ?? '',
        blogImage = snapshot['blogImage'] ?? '';

  toJson() {
    return {
      'authorName': authorName,
      'blogTopicName': blogTopicName,
      'blogDescription': blogDescription,
      'blogContent': blogContent,
      'blogImage': blogImage,
    };
  }
}

class Note {
  final String id;
  final String title;
  final String description;
  final NotusDocument document;

  Note({this.id, this.title, this.document, this.description});

  Note.fromMap(Map snapshot, String id)
      : id = id ?? '',
        title = snapshot['title'] ?? '',
        description = snapshot['description'] ?? '',
        document = snapshot['description'] ?? '';

  toJson() {
    return {
      'title': title,
      'description': description,
      'document': document,
    };
  }
}
