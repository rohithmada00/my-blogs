import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/changing_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: ResponsiveBreakpoints.of(context).isDesktop
            ? _buildDesktopLayout(context)
            : _buildMobileLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(32.0),
          child: Image.asset(
            'assets/images/rohith_intro_small.jpg',
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIconButton(
              FontAwesomeIcons.linkedinIn,
              'https://www.linkedin.com/in/rohith-reddy-mada-b9b292174/',
              const Color(0xFF0a66c2),
            ),
            _buildIconButton(
              FontAwesomeIcons.github,
              'https://github.com/rohithmada00',
              const Color(0xFF24292e),
            ),
            _buildIconButton(
              FontAwesomeIcons.twitter,
              'https://x.com/rohithmada00',
              const Color(0xFF1DA1F2),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Hi, I\'m Rohith',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Graduate Student',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w200,
            color: Colors.blueGrey,
          ),
        ),
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
          },
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Center(
      child: IntrinsicHeight(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIconButton(
                      FontAwesomeIcons.linkedinIn,
                      'https://www.linkedin.com/in/rohith-reddy-mada-b9b292174/',
                      const Color(0xFF0a66c2),
                    ),
                    _buildIconButton(
                      FontAwesomeIcons.github,
                      'https://github.com/rohithmada00',
                      const Color(0xFF24292e),
                    ),
                    _buildIconButton(
                      FontAwesomeIcons.twitter,
                      'https://x.com/rohithmada00',
                      const Color(0xFF1DA1F2),
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
                    const Text(
                      'Graduate Student',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.blueGrey,
                      ),
                    ),
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
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.0),
                  child: Image.asset(
                    'assets/images/rohith_intro_small.jpg',
                    width: 120,
                    height: 320,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String url, Color color) {
    return IconButton(
      iconSize: 24.0,
      color: color,
      icon: Icon(icon, semanticLabel: 'IconButton'),
      onPressed: () => launchUrl(Uri.parse(url)),
    );
  }
}
