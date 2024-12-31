import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_style/common/configs/colors.dart';

class ChangeUserIngo extends StatefulWidget {
  const ChangeUserIngo({super.key});

  @override
  State<ChangeUserIngo> createState() => _ChangeUserIngoState();
}

class _ChangeUserIngoState extends State<ChangeUserIngo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(),
              SliverPadding(
                padding: const EdgeInsets.only(right: 22),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'اطلاعات حساب خود را تکمیل کنید',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22, left: 53, bottom: 32),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'برای تجربه بهتر در استفاده از سرویس {نام برنامه} اطلاعات زیر را بر اساس سلیقه خود وارد کنید.',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 32, right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'اسکن چهره',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Container(
                        width: 74,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: AppColors.purpleOpacity,
                          ),
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/Vector (2).svg',
                              width: 25,
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(right: 22, left: 132, bottom: 6),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'با اسکن کرده چهره خود با استفاده از دورین سلفی بهترین تجربه را از استفاده از سرویس ما خواهید داشت',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(right: 22, bottom: 18),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'نکته: تمامی اطلاعاتی که در این بخش وارد می کنید کاملا محفوظ است.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColors.dividerColor900,
                        height: 2,
                        indent: 22,
                        endIndent: 5,
                      ),
                    ),
                    Text(
                      'یا',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColors.dividerColor900,
                        height: 2,
                        indent: 5,
                        endIndent: 22,
                      ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 10, top: 18, right: 22),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'به صورت دستی وارد کنید',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 22, right: 22),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'اطلاعات مورد نیاز برای ارائه بهترین تجربه را به صورت دستی وارد کنید',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22, left: 22, bottom: 18),
                sliver: SliverToBoxAdapter(
                  child: TextBoxFace(
                    title: 'فرم چهره',
                    icons: Icons.keyboard_arrow_down_sharp,
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22, left: 22, bottom: 18),
                sliver: SliverToBoxAdapter(
                  child: TextBoxFace(
                    title: 'حالت مو',
                    icons: Icons.keyboard_arrow_down_sharp,
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22, left: 22, bottom: 18),
                sliver: SliverToBoxAdapter(
                  child: TextBoxFace(
                    title: 'رنگ چشم',
                    icons: Icons.keyboard_arrow_down_sharp,
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22, left: 22, bottom: 18),
                sliver: SliverToBoxAdapter(
                  child: TextBoxFace(
                    title: 'چه مدل مویی را میپسندید؟',
                    icons: Icons.keyboard_arrow_down_sharp,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                    top: 26, left: 22, right: 22, bottom: 36),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    height: 47,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(48),
                    ),
                    child: Center(
                      child: Text(
                        'ذخیره اطلاعات',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.white2),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextBoxFace extends StatelessWidget {
  final IconData icons;
  final String title;
  const TextBoxFace({
    super.key,
    required this.icons,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          height: 47,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(47),
            border: Border.all(width: 2, color: AppColors.cardWhite),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  icons,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
