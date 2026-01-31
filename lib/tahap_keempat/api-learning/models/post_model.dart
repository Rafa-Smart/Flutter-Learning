class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  // disni kta baut factory constructor dari json ke bentuk objek post

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      title: json['title'] ?? "",
      body: json['body'] ?? "",
    );
  }

  // disni kita buat fungsi untuk mengubah objek post ke json
  // jadi nanti ini tuh fungisnya akna nempel di objek post atau chain method

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "userId": this.userId,
      "title": this.title,
      "body": this.body,
    };
  }

  // nah dinsi ktia ana membuat sebuah fungsi chain yang fungisnya ketika ining update
  // jadi disni buat paramnya itu nullabble semua dan kalo ga di masukain maka
  // kita masukin aja yang udah ada

  Post copyWith({int? id, int? userId, String? title, String? body}) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
