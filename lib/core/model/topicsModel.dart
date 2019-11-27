class Topics {
  final String topicName;
  final String id;
  final String content;
  final String iconText;
  final String description;

  Topics({this.topicName, this.id, this.content, this.iconText, this.description});

  Topics.fromMap(Map snapshot, String id)
      : id = id ?? '',
        topicName = snapshot['topicName'] ?? '',
        content = snapshot['content'] ?? '',
        iconText =snapshot['iconText']?? '',
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