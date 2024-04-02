import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final ButtonStyle style = TextButton.styleFrom(
    //   foregroundColor: Theme.of(context).colorScheme.onPrimary,
    // );

    return AppBar(
      title: const Text('Rohith Reddy'),
      actions: [
        TextButton(
          // style: style,
          onPressed: () {},
          child: const Text('About'),
        ),
        TextButton(
          // style: style,
          onPressed: () {},
          child: const Text('About'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
