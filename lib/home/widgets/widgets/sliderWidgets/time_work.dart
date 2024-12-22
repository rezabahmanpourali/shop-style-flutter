import 'package:flutter/material.dart';

class TimeWork extends StatelessWidget {
  const TimeWork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'ساعت کاری: همه روزه از 10:00 تا 19:00',
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}
