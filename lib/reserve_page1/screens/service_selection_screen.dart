import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/widgets/reserve_servise.dart';
import 'package:shop_style/common/widgets/service_categories.dart';

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
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  sliver: HeaderScreen(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width / 15, right: width / 15, bottom: 22),
                    child: Text(
                      'انتخاب خدمات',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(right: 22, left: 22),
                  sliver: SliverToBoxAdapter(
                    child: ServiceCategories(
                      onTabChange: (index) {},
                      tabs: const ['کوتاهی', 'مدل مو', 'اصلاح صورت'],
                      content: [
                        SizedBox(
                          height: 1000,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return const ReserveServise(
                                  type: TypeReserveServise.reserve);
                            },
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
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
            Positioned(
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 2,
                      color: AppColors.textHeader,
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 7, horizontal: width / 60),
                  child: SizedBox(
                    height: 60,
                    width: width,
                    child: Row(
                      children: [
                        Container(
                          width: 179,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.bgBlack,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'پرداخت و رزرو نوبت',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: AppColors.white2),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '30,000 تومان',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: AppColors.textSearchColor),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
