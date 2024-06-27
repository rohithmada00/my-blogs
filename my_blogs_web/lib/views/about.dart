import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.1,
          horizontal: MediaQuery.of(context).size.width / 7),
      child: ResponsiveBreakpoints.of(context).isMobile
          ? _buildMobileLayout()
          : _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          'More about me ..',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImage(),
            const SizedBox(height: 16.0),
            _buildRichText(),
          ],
        ),
        const SizedBox(height: 16.0),
        _buildTechStack(),
        const SizedBox(height: 32.0),
        _buildQuote(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          'More about me ..',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImage(),
            const SizedBox(width: 16.0),
            Expanded(child: _buildRichText()),
          ],
        ),
        const SizedBox(height: 16.0),
        _buildTechStack(),
        const SizedBox(height: 32.0),
        _buildQuote(),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'assets/images/rohith_about.jpg',
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRichText() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 15),
        children: [
          const TextSpan(text: 'Hi, I\'m Rohith. I am a graduate student at '),
          TextSpan(
            text: 'University of Maryland Baltimore County. ',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(Uri.parse('https://umbc.edu/'));
              },
          ),
          const TextSpan(
              text:
                  'I am a major in computer science with interest in Machine Learning and its applications in Internet Consumer Business. '),
          const TextSpan(text: '\n'),
          const TextSpan(text: '\n Before all of that, I did an undergrad at '),
          TextSpan(
            text: 'Malaviya National Institute of Technology, Jaipur',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(Uri.parse('https://www.mnit.ac.in/'));
              },
          ),
          const TextSpan(text: '. Following my graduation, I joined '),
          const TextSpan(text: 'Tata Digital,'),
          const TextSpan(
            text:
                'where I initially interned and later worked full-time as a Flutter developer. This role provided me with hands-on experience in developing cross-platform mobile applications and working within a dynamic, fast-paced team environment. While I enjoyed my time at Tata Digital, I realised that my true passion lies in exploring the potential of AI and machine learning to drive business innovations and efficiencies.',
          ),
          const TextSpan(
              text:
                  '\n\n This led me to pursue graduate studies, where I am delving deeper into machine learning on Natural Language and Vision. I am particularly interested in how machine learning can enhance user experiences, optimize business processes, and unlock new market opportunities.'),
          const TextSpan(
              text:
                  '\n \n If you are interested in hiring me or would like to discuss potential collaborations, please feel free to reach out to me at'),
          const TextSpan(text: ' rohithmada00@gmail.com'),
          const TextSpan(
              text:
                  '.I am always open to new opportunities and conversations that can contribute to mutual growth and innovation.')
        ],
      ),
    );
  }

  Widget _buildTechStack() {
    return Column(
      children: [
        const Text(
          'What I use',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Table(
          children: const [
            TableRow(decoration: BoxDecoration(), children: [
              Text(
                'Mobile Technologies',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: <Widget>[
                  Chip(label: Text('Android')),
                  Chip(label: Text('Kotlin')),
                  Chip(label: Text('Flutter')),
                ],
              ),
            ]),
            TableRow(children: [
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 8.0,
              ),
            ]),
            TableRow(children: [
              Text(
                'Web / Design Technologies',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: <Widget>[
                  Chip(label: Text('HTML 5')),
                  Chip(label: Text('CSS 3')),
                  Chip(label: Text('JavaScript')),
                  Chip(label: Text('Typescript')),
                  Chip(label: Text('React JS')),
                  Chip(label: Text('Next.js')),
                  Chip(label: Text('Node JS')),
                  Chip(label: Text('Git')),
                  Chip(label: Text('AWS')),
                  Chip(label: Text('Django')),
                  Chip(label: Text('Docker')),
                  Chip(label: Text('Kubernetes')),
                  Chip(label: Text('SQL')),
                  Chip(label: Text('Sanity CMS')),
                  Chip(label: Text('Firebase')),
                  Chip(label: Text('Figma')),
                ],
              ),
            ]),
            TableRow(children: [
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 8.0,
              ),
            ]),
            TableRow(children: [
              Text(
                'ML / Data Science Technologies',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: <Widget>[
                  Chip(label: Text('Pytorch')),
                  Chip(label: Text('TensorFlow')),
                  Chip(label: Text('Scikit-learn')),
                  Chip(label: Text('Google Colab')),
                  Chip(label: Text('Jupyter Notebook')),
                  Chip(label: Text('Huggingface')),
                  Chip(label: Text('Transformers')),
                  Chip(label: Text('Apache Spark')),
                  Chip(label: Text('NLTK')),
                  Chip(label: Text('Numpy')),
                  Chip(label: Text('Open CV')),
                  Chip(label: Text('Matplotlib')),
                  Chip(label: Text('Pandas')),
                  Chip(label: Text('R Studio')),
                ],
              ),
            ])
          ],
        ),
      ],
    );
  }

  Widget _buildQuote() {
    return const Column(
      children: [
        Text(
          '"Live as if you were to die tomorrow. Learn as if you were to live forever."',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            '- Mahatma Gandhi',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
