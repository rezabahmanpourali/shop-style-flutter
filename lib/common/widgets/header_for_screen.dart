import 'package:flutter/material.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';

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
        Icon(Icons.close),
        Spacer(),
        Icon(Icons.arrow_forward),
      ],
    );
  }
}
