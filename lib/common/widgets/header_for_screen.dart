import 'package:flutter/material.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      actions: [
        Icon(Icons.close),
        Spacer(),
        Icon(Icons.arrow_forward),
      ],
    );
  }
}
