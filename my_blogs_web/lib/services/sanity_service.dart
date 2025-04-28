import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_blogs_web/models/post.dart';
import 'package:my_blogs_web/models/project.dart';

class SanityService {
  final String projectId = dotenv.env['SANITY_PROJECT_ID']!;
  final String dataset = dotenv.env['SANITY_DATASET']!;
  final String token = dotenv.env['SANITY_TOKEN']!;

  Future<List<Project>> fetchProjects() async {
    final uri = Uri(
        scheme: 'https',
        host: '$projectId.api.sanity.io',
        path: '/v1/data/query/$dataset',
        queryParameters: {'query': '*[_type=="project"]'});

    final response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List projects = data['result'];

      return projects.map((project) => Project.fromJson(project)).toList();
    } else {
      throw Exception('Failed to load projects');
    }
  }

  Future<List<Post>> fetchAllPosts() async {
    final uri = Uri(
      scheme: 'https',
      host: '$projectId.api.sanity.io',
      path: '/v2022-03-07/data/query/$dataset',
      queryParameters: {
        'query':
            '*[_type == "post"] | order(publishedAt desc) { _id, title, slug, publishedAt, "mainImageUrl": mainImage.asset->url }'
      },
    );

    final response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      final List<dynamic> results = json.decode(response.body)['result'];
      return results.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  Future<Post> fetchPostBySlug(String slug) async {
    final query = '''
    *[_type == "post" && slug.current == "$slug"][0]{
      _id,
      title,
      slug,
      publishedAt,
      "mainImageUrl": mainImage.asset->url,
      "authorName": author->name,
      "categories": categories[]->title,
      body[]{
        ..., 
        asset->{
          _id,
          url
        }
      }
    }''';

    final uri = Uri(
      scheme: 'https',
      host: '$projectId.api.sanity.io',
      path: '/v2022-03-07/data/query/$dataset',
      queryParameters: {'query': query},
    );

    final response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body)['result']);
    } else {
      throw Exception('Failed to fetch post details');
    }
  }
}
