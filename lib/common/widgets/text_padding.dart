import 'package:flutter/material.dart';

class TextPadding extends StatelessWidget {
  const TextPadding({
    super.key,
    required this.text,
    this.theme,
    this.textAlign,
    this.topPadding,
  });

  final String text;
  final TextStyle? theme;
  final TextAlign? textAlign;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 0),
      child: Text(
        textAlign: textAlign ?? TextAlign.start,
        text,
        style: theme ?? const TextStyle(),
        softWrap: true,
      ),
    );
  }
}
