import 'package:zefyr/zefyr.dart';

class Topics {
  final String topicName;
  final String id;
  final String content;
  final String iconText;
  final String description;

  Topics(
      {this.topicName, this.id, this.content, this.iconText, this.description});

  Topics.fromMap(Map snapshot, String id)
      : id = id ?? '',
        topicName = snapshot['topicName'] ?? '',
        content = snapshot['content'] ?? '',
        iconText = snapshot['iconText'] ?? '',
        description = snapshot['description'] ?? '';

  toJson() {
    return {
      'topicName': topicName,
      'content': content,
      'iconText': iconText,
      'description': description,
    };
  }
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
  final String title;
  final NotusDocument document;

  Note({this.title, this.document});

}