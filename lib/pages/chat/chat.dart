class Chat {
  final String name;
  final String message;
  final String imageUrl;

  Chat(this.name, this.message, this.imageUrl);

  factory Chat.fromMap(Map map) {
    return Chat(
      map['name'],
      map['message'],
      map['imageUrl'],
    );
  }
}
