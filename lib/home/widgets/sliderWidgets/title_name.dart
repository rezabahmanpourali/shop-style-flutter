import 'package:flutter/material.dart';


class TitleName extends StatelessWidget {
  const TitleName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'نام مدل مو',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
