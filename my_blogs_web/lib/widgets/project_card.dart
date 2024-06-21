import 'package:flutter/material.dart';
import 'package:my_blogs_web/models/project.dart';
import 'package:my_blogs_web/widgets/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            project.description,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomElevatedButton(
                text: 'Source',
                onPressed: () async {
                  await launchUrl(Uri.parse(project.sourceUrl));
                },
              ),
              const SizedBox(width: 16.0),
              CustomElevatedButton(
                text: 'Details',
                onPressed: () async {
                  await launchUrl(
                      Uri.parse(project.demoUrl ?? project.paperUrl));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
