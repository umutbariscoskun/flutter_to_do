class ToDoCard {
  late final String id;
  late final String title;
  late final String content;
  late final String imageUrl;

  ToDoCard(this.id, this.title, this.content, this.imageUrl);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['content'] = content;
    map['imageUrl'] = imageUrl;

    return map;
  }

  ToDoCard.fromJson(Map<String, dynamic> map) {
    id = map[''];
    title = map[''];

    content = map[''];

    imageUrl = map[''];
  }
}
