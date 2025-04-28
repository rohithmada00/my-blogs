import 'package:flutter/material.dart';
import '../services/sanity_service.dart';
import '../models/post.dart';

class BlogDetailScreen extends StatelessWidget {
  final String slug;
  final SanityService sanityService = SanityService();

  BlogDetailScreen({required this.slug});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Detail")),
      body: FutureBuilder<Post>(
        future: sanityService.fetchPostBySlug(slug),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          final post = snapshot.data!;
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.title,
                    style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: 10),
                Text("By ${post.authorName} • ${post.publishedAt.toLocal()}"),
                SizedBox(height: 20),
                if (post.mainImageUrl.isNotEmpty)
                  Image.network(post.mainImageUrl),
                SizedBox(height: 20),
                ...post.body!.map((block) {
                  if (block['_type'] == 'block') {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text(
                        block['children'].map((c) => c['text']).join(),
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  } else if (block['_type'] == 'image') {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Image.network(block['asset']['url']),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
