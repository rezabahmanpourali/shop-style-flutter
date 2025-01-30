import 'package:flutter/material.dart';

class TextRowPadding extends StatelessWidget {
  const TextRowPadding({
    super.key,
    required this.texts, // لیست متون
    required this.styles, // لیست استایل‌ها
    this.textAlign,
    this.topPadding,
  });

  final List<String> texts; // یک لیست از متون
  final List<TextStyle> styles; // یک لیست از استایل‌ها
  final TextAlign? textAlign;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    // بررسی کنیم که طول texts و styles برابر باشد
    if (texts.length != styles.length) {
      throw ArgumentError('texts and styles must have the same length');
    }

    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 0),
      child: Wrap(
        children: List.generate(texts.length, (index) {
          return Text(
            texts[index],
            textAlign: textAlign ?? TextAlign.start,
            style: styles[index], // استفاده از استایل خاص برای هر متن
            softWrap: true,
          );
        }),
      ),
    );
  }
}
