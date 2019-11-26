class Topics {
  final String topicName;
  final String id;
  final String content;

  Topics({this.topicName, this.id, this.content});

  Topics.fromMap(Map snapshot, String id)
      : id = id ?? '',
        topicName = snapshot['topicName'] ?? '',
        content = snapshot['content'] ?? '';

  toJson() {
    return {
      'topicName': topicName,
      'content': content,
    };
  }
}