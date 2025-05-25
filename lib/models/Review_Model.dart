class Review {
  final String name;
  final String date;
  final String content;
  final int stars;

  Review(
      {required this.name,
      required this.date,
      required this.content,
      required this.stars});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      name: json['name'],
      date: json['date'],
      content: json['review'],
      stars: json['stars'],
    );
  }
}
