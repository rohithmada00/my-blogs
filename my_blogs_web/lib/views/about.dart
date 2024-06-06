import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/changing_text.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
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
                onPressed: () { },
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
        const Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, I\'m Rohith',
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Graduate Student',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w200,
                    color: Colors.blueGrey,
                  )),
              ChangingTextWidget(
                texts: [
                  '23',
                  'Machine Learning',
                  'Data Science',
                  'Mobile App Development',
                  'Software Development',
                  'Computer Science',
                ],
              ),
              SizedBox(height: 24),
              Text('My Works')
            ],
          ),
        ),
        const Expanded(
          flex: 2,
          child: Center(
            // color: Colors.blue,
            child: Text('Image here'),
            // Image.asset('path_to_your_image.png'),
          ),
        ),
      ],
    );
  }
}
