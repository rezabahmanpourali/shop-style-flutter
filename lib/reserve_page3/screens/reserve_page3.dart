import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

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
          child: CustomScrollView(
            slivers: [
              const SliverPadding(
                padding: EdgeInsets.only(left: 22, right: 22, bottom: 0),
                sliver: SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColors.arayeshColor,
                  actions: [
                    Icon(Icons.close),
                    Spacer(),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22, bottom: 22),
                  child: Text(
                    'انتخاب تاریخ و ساعت',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 22, right: 22, bottom: 22),
                  child: Row(
                    children: [
                      Container(
                        width: 175,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColors.purpleOpacity,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset('assets/images/img14 2.png'),
                            const Text(
                              'نام آرایشگر انتخاب شده',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_down_rounded),
                          ],
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
                        child: const Icon(Icons.abc),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 22, right: 22),
                  child: Text(
                    'دی ماه، 1403',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 22, left: 12),
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
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 25,
                ),
              ),
              const SliverToBoxAdapter(
                  child: Column(
                children: [
                  SelectRectangleCard(),
                  SizedBox(height: 10),
                  SelectRectangleCard(),
                  SizedBox(height: 10),
                  SelectRectangleCard(),
                  SizedBox(height: 10),
                  SelectRectangleCard(),
                  SizedBox(height: 10),
                  SelectRectangleCard(),
                  SizedBox(height: 10),
                  SelectRectangleCard(),
                  SizedBox(height: 46),
                ],
              )),
            ],
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
        child: const Row(
          children: [
            Text(
              '10:00 صبح',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
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
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.white2 : AppColors.categoryBlack,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'شنبه',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
