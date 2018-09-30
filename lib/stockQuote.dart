class Post {
  final Map title;
  final Map body;

  Post({this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['Meta Data'],
      body: json['Time Series (Daily)'],
    );
  }


}


