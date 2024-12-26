import 'package:flutter/material.dart';

class BottomLableScore extends StatelessWidget {
  const BottomLableScore({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '(2140)',
          style: TextStyle(fontSize: 10, color: Color(0xFF565656)),
        ),
        SizedBox(width: width / 200),
        const Icon(
          Icons.star,
          size: 10,
          color: Color(0xFFF9C025),
        ),
        const Text(
          '4.9',
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(width: width / 200),
      ],
    );
  }
}
