import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
      headers: {
        // HttpHeaders.authorizationHeader: 'Bearer $token',
        // HttpHeaders.accessControlAllowOriginHeader: '*',
      },
    );
    print('BLABL ${response.body}');
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List projects = data['result'];

      return projects.map((project) => Project.fromJson(project)).toList();
    } else {
      throw Exception('Failed to load projects');
    }
  }
}
