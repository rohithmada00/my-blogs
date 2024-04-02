import 'package:flutter/material.dart';

class DefaultFooter extends StatelessWidget {
  const DefaultFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          color: Colors.blueGrey[900],
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                '©2024 My Portfolio Web App',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 8),
              InkWell(
                child: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 14),
                ),
                onTap: () => {},
              ),
              const SizedBox(height: 4),
              InkWell(
                child: const Text(
                  'Terms of Service',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                onTap: () => {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
