import 'package:flutter/material.dart';
import 'package:shop_style/auth/widgets/header_for_screen.dart';
import 'package:shop_style/reserve_page1/widgets/child_tabbar_view.dart';
import 'package:shop_style/reserve_page2/screens/reseve_page2.dart';
import 'package:shop_style/reserve_page3/screens/reserve_page3.dart';

class ServiceSelectionScreen extends StatefulWidget {
  const ServiceSelectionScreen({super.key});

  @override
  State<ServiceSelectionScreen> createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: HeaderScreen()),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: width / 15, right: width / 15),
                child: const Text(
                  'انتخاب خدمات',
                  style: TextStyle(
                    color: Color(0xFF0D1619),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ChildTabBarView(index: index);
              },
            ),
            SliverToBoxAdapter(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResevePage2(),
                    ));
                  },
                  child: Text('data')),
            )
          ],
        ),
      ),
    );
  }
}
