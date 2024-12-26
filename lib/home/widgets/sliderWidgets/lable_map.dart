import 'package:flutter/material.dart';

class LableMap extends StatelessWidget {
  const LableMap({super.key});

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
          width: width / 6,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '500 متر',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: width / 200),
              const Icon(
                Icons.mode_of_travel_sharp,
                size: 18,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
