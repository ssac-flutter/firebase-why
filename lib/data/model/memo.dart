class Memo {
  final String uid;
  final String title;
  final String body;

  Memo({
    required this.uid,
    required this.title,
    required this.body,
  });

  Memo.fromJson(Map<String, dynamic> json)
      : this(
          uid: json['uid']! as String,
          title: json['title']! as String,
          body: json['body']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'title': title,
      'body': body,
    };
  }
}
