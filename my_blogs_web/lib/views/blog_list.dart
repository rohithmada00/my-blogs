import 'package:flutter/material.dart';
import 'package:my_blogs_web/views/blog_post.dart';
import 'package:intl/intl.dart';
import '../services/sanity_service.dart';
import '../models/post.dart';

class BlogItem extends StatelessWidget {
  final Post post;
  const BlogItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            post.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            DateFormat.yMMMd().format(post.publishedAt.toLocal()),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );

    return ListTile(
      leading: null,
      title: Text(
        post.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      subtitle: Text(
        DateFormat.yMMMd().format(post.publishedAt.toLocal()),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.blueGrey,
        ),
      ),
      trailing: Text('Summary'),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => BlogDetailScreen(slug: post.slug)),
      ),
    );
  }
}

class BlogList extends StatelessWidget {
  final SanityService sanityService = SanityService();

  BlogList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: sanityService.fetchAllPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No projects found.'));
        } else {
          final posts = snapshot.data!;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              final post = posts[index];
              return BlogItem(
                post: post,
              );
            },
          );
        }
      },
    );
  }
}
