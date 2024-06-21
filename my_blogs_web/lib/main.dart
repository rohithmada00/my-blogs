import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_blogs_web/views/contact.dart';
import 'package:my_blogs_web/views/home.dart';
import 'package:my_blogs_web/views/projects.dart';
import 'package:my_blogs_web/widgets/app_bar.dart';
// import 'package:my_blogs_web/widgets/default_footer.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // TODO: Add theme
      routes: {
        '/': (context) => const Scaffold(
              appBar: DefaultAppBar(),
              body: Home(),
            ),
        'projects': (context) => const Scaffold(
              appBar: DefaultAppBar(),
              body: Projects(),
            ),
        'contact': (context) => const Scaffold(
              appBar: DefaultAppBar(),
              body: Contact(),
            ),
      },
    ),
  );
}
