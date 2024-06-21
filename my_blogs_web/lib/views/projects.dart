import 'package:flutter/material.dart';
import 'package:my_blogs_web/widgets/project_card.dart';
import '../models/project.dart';
import '../services/sanity_service.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Project>>(
      future: SanityService().fetchProjects(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No projects found.'));
        } else {
          final projects = snapshot.data;
          print('==projects== : ${snapshot.data}');
          return ListView.builder(
            itemCount: projects?.length ?? 0,
            itemBuilder: (context, index) {
              return ProjectCard(project: projects![index]);
            },
          );
        }
      },
    );
  }
}
