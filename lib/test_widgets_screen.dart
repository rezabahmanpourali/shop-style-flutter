import 'package:flutter/material.dart';
import 'package:shop_style/test_widgets/modern_toast.dart';

class TestWidgetsScreen extends StatefulWidget {
  const TestWidgetsScreen({super.key});

  @override
  State<TestWidgetsScreen> createState() => _TestWidgetsScreenState();
}

class _TestWidgetsScreenState extends State<TestWidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast Example'),
      ),
      body: Center(
        child: ModernToast(),
      ),
    );
  }
}
