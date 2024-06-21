import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      automaticallyImplyLeading: false,
      title: Text(
        'RR',
        style: GoogleFonts.notoSerif(
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),
        ),
      ),
      actions: [
        HoverText(
          text: 'Home',
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        HoverText(
          text: 'Projects',
          onTap: () {
            Navigator.pushNamed(context, 'projects');
          },
        ),
        HoverText(
          text: 'About',
          onTap: () {},
        ),
        HoverText(
          text: 'Contact',
          onTap: () {
            Navigator.pushNamed(context, 'contact');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
