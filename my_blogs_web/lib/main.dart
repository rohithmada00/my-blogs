import 'package:flutter/material.dart';
import 'package:my_blogs_web/widgets/app_bar.dart';
// import 'package:my_blogs_web/widgets/default_footer.dart';

void main() async {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: const DefaultAppBar(),
        body: Container(
          color: Colors.black,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                // Desktop or larger screen
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Hello Universe...',
                              style: TextStyle(color: Colors.white)),
                          Text('I am Rohith...',
                              style: TextStyle(color: Colors.white)),
                          Text('species: Homo Sapiens',
                              style: TextStyle(color: Colors.white)),
                          Text('age: 24',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text('Image here',
                            style: TextStyle(color: Colors.white)),
                        // Replace with your profile image widget
                        // Image.asset('path_to_your_image.png'),
                      ),
                    ),
                  ],
                );
              } else {
                // Mobile or smaller screen
                return Column(
                  children: [
                    Column(
                      children: const [
                        Text('Hello Universe...',
                            style: TextStyle(color: Colors.white)),
                        Text('I am Rohith...',
                            style: TextStyle(color: Colors.white)),
                        Text('species: Homo Sapiens',
                            style: TextStyle(color: Colors.white)),
                        Text('age: 24', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Center(
                      child: Text('Image here',
                          style: TextStyle(color: Colors.white)),
                      // Replace with your profile image widget
                      // Image.asset('path_to_your_image.png'),
                    ),
                  ],
                );
              }
            },
          ),
        ), // bottomNavigationBar: DefaultFooter(),
      ),
    ),
  );
}
