import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_blogs_web/widgets/hover_text.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style = TextButton.styleFrom(
    //   foregroundColor: Theme.of(context).colorScheme.onPrimary,
    // );

    return AppBar(
      title: Text(
        'Rohith Reddy',
        style: GoogleFonts.caveat(
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        HoverText(
          text: 'Home',
          onTap: () {},
        ),
        HoverText(
          text: 'Projects',
          onTap: () {},
        ),
        HoverText(
          text: 'About',
          onTap: () {},
        ),
        HoverText(
          text: 'Contact',
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
