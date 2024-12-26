import 'package:flutter/material.dart';

class DiscountFirstBuy extends StatelessWidget {
  const DiscountFirstBuy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Row(
        children: [
          Icon(Icons.shop),
          Text('تخفیف اولین رزرو'),
        ],
      ),
    );
  }
}
