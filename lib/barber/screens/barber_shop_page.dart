import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class BarberShopPage extends StatefulWidget {
  const BarberShopPage({super.key});

  @override
  State<BarberShopPage> createState() => _BarberShopPageState();
}

class _BarberShopPageState extends State<BarberShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back),
                    Spacer(),
                    Text(
                      'نام آرایشگاه',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.menu),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 23,
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 166,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 7,
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/poster1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 26,
                    top: 72,
                    child: Container(
                      width: 88,
                      height: 88,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.arayeshColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset('assets/images/arayeshgar2.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text('4.1'),
                    Spacer(),
                    Text(
                      'نام آرایشگاه',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Icon(Icons.home_outlined),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //item 1
                    Container(
                      height: 31,
                      decoration: BoxDecoration(
                        color: AppColors.white2,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'جایزه اولین رزرو',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.text_snippet),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //item 2
                    Container(
                      height: 31,
                      decoration: BoxDecoration(
                        color: AppColors.white2,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تخفیف اصلاح بعدی',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.cabin),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '(باز است)',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: AppColors.green1,
                      ),
                    ),
                    Text(
                      'ساعت کاری: همه روزه از 10:00 تا 19:00',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 6,
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('کیلومتر'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '3.5',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.green1),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      ':فاصله با شما',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                    ),
                    Icon(Icons.location_on_outlined),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
