import 'package:flutter/material.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReservePage3 extends StatefulWidget {
  const ReservePage3({
    super.key,
  });

  @override
  State<ReservePage3> createState() => _ReservePage3State();
}

class _ReservePage3State extends State<ReservePage3> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomScrollView(
              slivers: [
                const HeaderScreen(),
                SliverToBoxAdapter(
                  child: Text(
                    'انتخاب تاریخ و ساعت',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 22)),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColors.purpleOpacity,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset('assets/images/img14 2.png'),
                                const SizedBox(width: 5),
                                Text(
                                  'نام آرایشگر انتخاب شده',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: AppColors.black),
                                ),
                                const SizedBox(width: 5),
                                const Icon(Icons.keyboard_arrow_down_rounded),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 53,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColors.contanerBorder,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                            child: const FaIcon(FontAwesomeIcons.calendar)),
                      ),
                    ],
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 22)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 22, right: 22),
                    child: Text(
                      'دی ماه، 1403',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: SelectCirculTime(
                              isSelected: selectedIndex == index,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 25),
                  sliver: SliverList(
                    
                      delegate: SliverChildBuilderDelegate(
                    childCount: 6,
                    (context, index) {
                      return const SelectRectangleCard();
                    },
                  )),
                ),
                // const SliverToBoxAdapter(
                //   child: Column(
                //     children: [
                //       SelectRectangleCard(),
                //       SizedBox(height: 10),
                //       SelectRectangleCard(),
                //       SizedBox(height: 10),
                //       SelectRectangleCard(),
                //       SizedBox(height: 10),
                //       SelectRectangleCard(),
                //       SizedBox(height: 10),
                //       SelectRectangleCard(),
                //       SizedBox(height: 10),
                //       SelectRectangleCard(),
                //       SizedBox(height: 46),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectRectangleCard extends StatelessWidget {
  const SelectRectangleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20, right: 20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: AppColors.cardWhite,
          ),
          borderRadius: BorderRadius.circular(48),
        ),
        child: Row(
          children: [
            Text(
              '10:00 صبح',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class SelectCirculTime extends StatelessWidget {
  final bool isSelected; // پارامتر برای تعیین وضعیت انتخاب

  const SelectCirculTime({
    super.key,
    required this.isSelected, // مقداردهی وضعیت انتخاب
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.purple : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? AppColors.purple : AppColors.cardWhite,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              '1',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color:
                      isSelected ? AppColors.white2 : AppColors.categoryBlack),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'شنبه',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
