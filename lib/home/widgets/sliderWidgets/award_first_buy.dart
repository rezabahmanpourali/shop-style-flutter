import 'package:flutter/material.dart';

class AwardFirstBuy extends StatelessWidget {
  const AwardFirstBuy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Row(
        children: [
          Icon(Icons.shop),
          Text('جایزه اولین خرید'),
        ],
      ),
    );
  }
}
