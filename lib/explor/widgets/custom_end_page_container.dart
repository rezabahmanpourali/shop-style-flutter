import 'package:flutter/material.dart';

class CustomEndPageContainer extends StatelessWidget {
  final double width;
  final double heigh;
  final String title;
  final Color color;
  final Border? border;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin;

  final Function(String) onChange;
  const CustomEndPageContainer({
    super.key,
    required this.width,
    required this.heigh,
    required this.title,
    required this.color,
    required this.onChange,
    this.margin,
    this.border,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
        border: border,
      ),
      child: Center(
        child: Text(
          title,
          style: textStyle ?? Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
