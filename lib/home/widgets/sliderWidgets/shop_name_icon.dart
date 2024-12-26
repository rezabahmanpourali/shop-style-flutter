import 'package:flutter/material.dart';

class ShopNameIcon extends StatelessWidget {
  const ShopNameIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        const Icon(
          Icons.store_mall_directory_outlined,
          size: 20,
        ),
        SizedBox(width: width / 100),
        const Text(
          'آرایشگاه: نام آرایشگاه',
          style: TextStyle(fontSize: 13, color: Color(0xFF565656)),
        ),
      ],
    );
  }
}
