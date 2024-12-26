import 'package:flutter/material.dart';

class NumberMoney extends StatelessWidget {
  const NumberMoney({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '140,000 تومان',
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    );
  }
}
