import 'package:flutter/material.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      // decoration: ,
    );
  }
}
