import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_blogs_web/widgets/custom_elevated_button.dart';

import '../widgets/changing_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 24.0,
                color: Colors.blueGrey,
                icon: const Icon(
                  FontAwesomeIcons.linkedinIn,
                ),
                onPressed: () {},
              ),
              const IconButton(
                iconSize: 24.0,
                onPressed: null,
                icon: Icon(
                  FontAwesomeIcons.github,
                ),
              ),
              const IconButton(
                iconSize: 24.0,
                onPressed: null,
                icon: Icon(
                  FontAwesomeIcons.twitter,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi, I\'m Rohith',
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Graduate Student',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w200,
                    color: Colors.blueGrey,
                  )),
              const ChangingTextWidget(
                texts: [
                  '23',
                  'Machine Learning',
                  'Data Science',
                  'Mobile App Development',
                  'Software Development',
                  'Computer Science',
                ],
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(
                  text: 'MY WORKS',
                  icon: FontAwesomeIcons.code,
                  onPressed: () {
                    Navigator.pushNamed(context, 'projects');
                  })
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/rohith_intro_small.jpg'),
          ),
        ),
      ],
    );
  }
}
