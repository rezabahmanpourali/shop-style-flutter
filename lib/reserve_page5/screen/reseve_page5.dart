import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class ResevePage5 extends StatefulWidget {
  const ResevePage5({super.key});

  @override
  State<ResevePage5> createState() => _ResevePage5State();
}

class _ResevePage5State extends State<ResevePage5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset('assets/images/1.jpeg'),
                  ),
                  Positioned(
                    top: 14,
                    left: 22,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white2,
                        border: Border.all(
                          width: 1,
                          color: AppColors.cardWhite,
                        ),
                      ),
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ),
                  const Positioned(
                    bottom: 22,
                    right: 22,
                    child: Text(
                      'نام آرایشگاه',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 22, bottom: 22),
                child: Row(
                  children: [
                    Container(
                      width: 161,
                      height: 35,
                      decoration: BoxDecoration(
                        color: AppColors.purpleOpacity,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.table_chart_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            'نوبت شما رزرو شد',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 22, bottom: 28),
                child: Text(
                  'یکشنبه، 1 دی ماه، 1402، ساعت 10:30 صبح',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.categoryBlack,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ReserveManagment(
                icon: Icons.battery_0_bar,
                ontab: () {},
                title: 'افزودن به تقویم گوگل',
                subtitle: 'برای خود یک یادآور بگذارید',
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Divider(
                  height: 1,
                  color: AppColors.dividerColor900,
                  endIndent: 22,
                  indent: 74,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ReserveManagment(
                icon: Icons.share,
                ontab: () {},
                title: 'مسیریابی با نقشه',
                subtitle: 'آدرس آرایشگاه',
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Divider(
                  height: 1,
                  color: AppColors.dividerColor900,
                  endIndent: 22,
                  indent: 74,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ReserveManagment(
                icon: Icons.access_time_sharp,
                ontab: () {},
                title: 'مدیریت نوبت',
                subtitle:
                    'تا 24 ساعت میتوانید نوبت خود را تغییر داده یا آن را لغو کنید',
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16),
                child: Divider(
                  height: 1,
                  color: AppColors.dividerColor900,
                  endIndent: 22,
                  indent: 22,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 22, left: 22, right: 24, bottom: 22),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('مدل موی خامه ای'),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Icon(Icons.settings_input_component),
                            SizedBox(
                              width: 4,
                            ),
                            Text('40 دقیقه'),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('125,000 تومان'),
                      ],
                    ),
                    const Spacer(),
                    Image.asset('assets/images/images (2) 1.png'),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 22),
                child: Divider(
                  height: 1,
                  color: AppColors.dividerColor900,
                  endIndent: 22,
                  indent: 22,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Row(
                  children: [
                    Text(
                      'پیش پرداخت رزرو نوبت',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSearchColor,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '40,000 تومان',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSearchColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 22, right: 22, top: 16, bottom: 16),
                child: Row(
                  children: [
                    Text(
                      'مبلغ تخفیف',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.red,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '10,000 تومان',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 22, right: 22, bottom: 16),
                child: Row(
                  children: [
                    Text(
                      'جمع کل',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.categoryBlack,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '30,000 تومان',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.categoryBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 22, right: 22, bottom: 16),
                child: Row(
                  children: [
                    Text(
                      'پرداخت شده',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green3,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '30,000 تومان',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 22, right: 22, bottom: 44),
                child: Row(
                  children: [
                    Text(
                      'باقی مانده',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.yellow,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '95,000 تومان',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 22),
                child: Text(
                  'شناسه نوبت: f2ffc335',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyB9,
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

class ReserveManagment extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback ontab;
  const ReserveManagment({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.ontab,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22),
      child: GestureDetector(
        onTap: ontab,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.porpleLight,
                shape: BoxShape.circle,
              ),
              child: Icon(icon),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
