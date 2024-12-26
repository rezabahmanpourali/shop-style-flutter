import 'package:flutter/material.dart';

class LableScore extends StatelessWidget {
  const LableScore({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Positioned(
      top: height / 8.6,
      right: width / 200,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 200),
        child: Container(
          height: height / 30,
          width: width / 5,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '(2140)',
                style: TextStyle(fontSize: 13, color: Color(0xFF565656)),
              ),
              SizedBox(width: width / 200),
              const Text(
                '4.9',
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
              SizedBox(width: width / 200),
              const Icon(Icons.star, size: 20, color: Color(0xFFF9C025)),
            ],
          ),
        ),
      ),
    );
  }
}
