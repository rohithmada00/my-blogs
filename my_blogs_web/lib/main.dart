import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_blogs_web/views/about.dart';
import 'package:my_blogs_web/views/contact.dart';
import 'package:my_blogs_web/views/home.dart';
import 'package:my_blogs_web/views/projects.dart';
import 'package:my_blogs_web/widgets/app_bar.dart';
import 'package:responsive_framework/responsive_framework.dart';
// import 'package:my_blogs_web/widgets/default_footer.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 600, name: MOBILE),
          // const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 601, end: double.infinity, name: DESKTOP),
          // const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      routes: {
        '/': (context) => const Scaffold(
              appBar: DefaultAppBar(),
              body: Home(),
              // bottomNavigationBar: Text('HII'),
            ),
        'projects': (context) => const Scaffold(
              appBar: DefaultAppBar(),
              extendBodyBehindAppBar: true,
              body: Projects(),
            ),
        'contact': (context) => const Scaffold(
              appBar: DefaultAppBar(),
              // backgroundColor: Color(0xFFFFBB64),
              body: Contact(),
            ),
        'about': (context) => const Scaffold(
              appBar: DefaultAppBar(),
              extendBodyBehindAppBar: true,
              body: About(),
            ),
      },
    ),
  );
}
