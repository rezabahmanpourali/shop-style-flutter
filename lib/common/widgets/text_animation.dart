import 'package:flutter/material.dart';

class AnimatedTextFromTop extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;

  const AnimatedTextFromTop({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(seconds: 1),
  });

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedTextFromTopState createState() => _AnimatedTextFromTopState();
}

class _AnimatedTextFromTopState extends State<AnimatedTextFromTop> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // ایجاد کنترلر انیمیشن
    _controller = AnimationController(
      duration: widget.duration, // مدت زمان انیمیشن از پارامتر ویجت
      vsync: this,
    )..forward(); // شروع انیمیشن پس از ساخت ویجت

    // انیمیشن حرکت از بالا به پایین
    _animation = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: widget.style ?? Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 32),
      ),
    );
  }
}
