class Articles {
  final String id;
  final String title;
  final String imageUrl;
  final String newsSite;
  final String publishedAt;
  final String summary;
  final String url;

  Articles(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.newsSite,
      required this.publishedAt,
      required this.url,
      required this.summary});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      imageUrl: json['image_url'] ?? '',
      newsSite: json['news_site'] ?? '',
      publishedAt: json['published_at'] ?? '',
      summary: json['summary'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
