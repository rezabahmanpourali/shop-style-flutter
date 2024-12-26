import 'package:flutter/material.dart';


class DiscountPercentage extends StatelessWidget {
  const DiscountPercentage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Container(
          width: width / 15,
          height: height / 50,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(27))),
          child: const Center(
            child: Text(
              '% 22',
              style: TextStyle(fontSize: 9, color: Colors.white),
            ),
          ),
        ),
        SizedBox(width: width / 60),
        const Text(
          '1,549,000 تومان',
          style: TextStyle(
              fontSize: 11,
              color: Color(0xFF565656),
              decoration: TextDecoration.lineThrough),
        ),
      ],
    );
  }
}
