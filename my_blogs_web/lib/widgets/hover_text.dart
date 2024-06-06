import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  const HoverText({
    super.key,
    required this.text,
    required this.onTap,
    this.isActive = true,
  });

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  // bool _isActive = false;
  bool _isHovered = false;

  void _toggleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  // void _toggleActive() {
  //   setState(() {
  //     _isActive = !_isActive;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => _toggleHover(true),
        onExit: (_) => _toggleHover(false),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: _isHovered ? const Color(0xFF333333) : Colors.black,
            fontWeight: _isHovered ? FontWeight.w500 : FontWeight.normal,
            fontSize: _isHovered ? 15 : 14,
            decoration:
                _isHovered ? TextDecoration.lineThrough : TextDecoration.none,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Text(widget.text),
          ),
        ),
      ),
    );
  }
}
