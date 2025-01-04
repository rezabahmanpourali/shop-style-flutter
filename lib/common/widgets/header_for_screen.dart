import 'package:flutter/material.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      actions: [
        // Icon(Icons.close),
        // const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
