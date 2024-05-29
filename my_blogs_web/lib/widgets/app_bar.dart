import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style = TextButton.styleFrom(
    //   foregroundColor: Theme.of(context).colorScheme.onPrimary,
    // );

    return AppBar(
      title: Text(
        'Rohith Reddy Mada',
        style: GoogleFonts.roboto(),
      ),
      actions: [
        TextButton(
          // style: style,
          onPressed: () {},
          child: const Text('Home'),
        ),
        TextButton(
          // style: style,
          onPressed: () {},
          child: const Text('Projects'),
        ),
        TextButton(
          // style: style,
          onPressed: () {},
          child: const Text('About'),
        ),
        TextButton(
          // style: style,
          onPressed: () {},
          child: const Text('Contact'),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.linkedin,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.github,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.instagram,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
