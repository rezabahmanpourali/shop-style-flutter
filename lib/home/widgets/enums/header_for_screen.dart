import 'package:flutter/material.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        left: width / 15,
        right: width / 15,
        top: height / 20,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
    );
  }
}
