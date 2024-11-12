import 'package:flutter/material.dart';
import 'package:shop_style/home/widgets/gradient_border.dart';

class ShadowTextField extends StatelessWidget {
  const ShadowTextField(
      {super.key,
      this.height = 40,
      this.width = 300,
      this.hintText = 'Search...'});
  final double height;
  final double width;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(
        strokeWidth: 2.0,
        borderRadius: const Radius.circular(100),
        gradient: const LinearGradient(
          colors: [
            Color(0xff00000000),
            Color(0xff66666666),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: width - 50,
              height: height,
              child: TextField(
                scrollPadding: const EdgeInsets.only(bottom: 10),
                cursorHeight: 16,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffbac756D70),
                ),
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffbac756D70),
                  ),
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.search,
              color: Color(0xffbac756D70),
            ),
          ],
        ),
      ),
    );
  }
}
