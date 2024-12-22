import 'package:flutter/material.dart';

class HairdresserLable extends StatelessWidget {
  const HairdresserLable({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    return SizedBox(
      height: height / 15,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: width / 28),
            width: width / (size - 1),
            height: width / (size - 1),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFFFFFF),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width / 28),
            width: width / size,
            height: width / size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 64, 122, 91),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(
                'assets/images/arayeshgar2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
