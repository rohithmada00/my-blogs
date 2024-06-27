import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;
  final String subtitle;
  const Heading({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
