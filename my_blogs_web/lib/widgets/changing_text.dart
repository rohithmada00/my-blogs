import 'dart:async';
import 'package:flutter/material.dart';

class ChangingTextWidget extends StatefulWidget {
  final List<String> texts;
  final Duration duration;

  const ChangingTextWidget(
      {super.key,
      required this.texts,
      this.duration = const Duration(seconds: 2)});

  @override
  State<ChangingTextWidget> createState() => _ChangingTextWidgetState();
}

class _ChangingTextWidgetState extends State<ChangingTextWidget> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.texts.length;
        if (_currentIndex == widget.texts.length - 1) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.texts[_currentIndex],
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black38,
        fontWeight: FontWeight.w200,
      ),
    );
  }
}
