import 'package:flutter/material.dart';

class HeaderSlider extends StatelessWidget {
  const HeaderSlider({
    super.key,
    required this.title,
    required this.textColor,
  });

  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width / 40,
        vertical: height / 100,
      ),
      child: Row(
        children: [
          Text(
            title,
            style:  TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
          ),
          SizedBox(width: width / 60),
          const Spacer(),
          const SizedBox(
            child: Row(
              children: [
                Text(
                  'مشاهده همه',
                  style: TextStyle(fontSize: 15, color: Color(0xFF4E4E4E)),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF4E4E4E),
                  size: 15,
                ),
              ],
            ),
          ),
          SizedBox(width: width / 60),
        ],
      ),
    );
  }
}
