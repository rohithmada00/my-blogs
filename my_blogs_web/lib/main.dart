import 'package:flutter/material.dart';
import 'package:my_blogs_web/views/about.dart';
import 'package:my_blogs_web/widgets/app_bar.dart';
// import 'package:my_blogs_web/widgets/default_footer.dart';

void main() async {
  runApp(
    const MaterialApp(
      home: Scaffold(
        appBar: DefaultAppBar(),
        body: About(),
        // bottomNavigationBar: DefaultFooter(),
      ),
    ),
  );
}
