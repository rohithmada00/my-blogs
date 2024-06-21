import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _onHover(context, true),
      onExit: (event) => _onHover(context, false),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // primary: Colors.grey.shade600, // Default background color
          // onPrimary: Colors.white, // Text and icon color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: const BorderSide(color: Colors.transparent),
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.blueGrey;
              } // Background color on hover
              return Colors.black87; // Default background color
            },
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            if (icon != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _onHover(BuildContext context, bool hovering) {
    // This function is used to handle hover events
    // In this case, it doesn't need to do anything
  }
}
