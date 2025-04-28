class Post {
  final String id;
  final String title;
  final String slug;
  final String? authorName;
  final List<String>? categories;
  final String mainImageUrl;
  final DateTime publishedAt;
  final List<dynamic>? body; // rich text content

  Post({
    required this.id,
    required this.title,
    required this.slug,
    required this.authorName,
    required this.categories,
    required this.mainImageUrl,
    required this.publishedAt,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['_id'],
        title: json['title'],
        slug: json['slug']['current'],
        authorName: json['authorName'],
        categories: List<String>.from(json['categories'] ?? []),
        mainImageUrl: json['mainImageUrl'] ?? '',
        publishedAt: DateTime.parse(json['publishedAt']),
        body: json['body'],
      );
}
