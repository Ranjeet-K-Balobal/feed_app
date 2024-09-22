class Post {
  final int id;
  final String title;
  final String content;

  Post({required this.id, required this.title, required this.content});

  factory Post.fromMap(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }
}
