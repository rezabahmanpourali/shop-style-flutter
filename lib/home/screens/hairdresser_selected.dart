import 'package:flutter/material.dart';
import 'package:shop_style/home/widgets/newWidget/enums/header_for_screen.dart';

class HairdresserSelection extends StatelessWidget {
  const HairdresserSelection({super.key});

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
            SliverToBoxAdapter(child: mainText(width)),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: 6,
                (context, index) {
                  return Container(
                    margin: EdgeInsets.all(width / 30),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: const Color(0xFFFFFFFF),
                      border: Border.all(width: 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mainText(double width) {
    return Padding(
      padding: EdgeInsets.only(left: width / 15, right: width / 15),
      child: const Text(
        'انتخاب خدمات',
        style: TextStyle(
          color: Color(0xFF0D1619),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
