import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/widgets/reserve_servise.dart';

class ServiceSelectionScreen extends StatefulWidget {
  const ServiceSelectionScreen({super.key});

  @override
  State<ServiceSelectionScreen> createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              sliver: HeaderScreen(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: width / 15, right: width / 15),
                child: Text(
                  'انتخاب خدمات',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            SliverList.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 15),
                  child: const ReserveServise(type: TypeReserveServise.reserve),
                );
              },
            ),
            // SliverToBoxAdapter(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ResevePage2(),
            //       ));
            //     },
            //     child: Text('data'),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
