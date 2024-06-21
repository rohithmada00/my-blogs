class Project {
  final String title;
  final String description;
  final String sourceUrl;
  final String? demoUrl;
  final String paperUrl;
  final String? image;
  final List<String> techStack;

  Project({
    required this.title,
    required this.description,
    required this.sourceUrl,
    required this.paperUrl,
    this.demoUrl,
    required this.techStack,
    this.image,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'] as String,
      description: json['description'] as String,
      sourceUrl: json['sourceUrl'] as String,
      // demoUrl: json['demoUrl'] as String,
      paperUrl: json['paperUrl'] as String,
      // image: json['image'] as String,
      techStack: List<String>.from(json['techStack']),
    );
  }
}
