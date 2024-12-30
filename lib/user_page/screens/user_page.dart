import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsets.only(left: 22, right: 22, bottom: 32),
              sliver: SliverAppBar(
                backgroundColor: AppColors.white2,
                actions: [
                  Icon(Icons.settings),
                  Spacer(),
                  Icon(Icons.access_alarm_outlined),
                  SizedBox(width: 20),
                  Icon(Icons.notifications),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, bottom: 11),
                child: Row(
                  children: [
                    Image.asset('assets/images/Ellipse 54.png'),
                    const SizedBox(
                      width: 13,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('نام کاربری'),
                        Text('09120000000'),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.edit_rounded,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                height: 1,
                color: AppColors.dividerColor900,
                indent: 22,
                endIndent: 22,
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 16, left: 22, right: 22, bottom: 16),
                child: Row(
                  children: [
                    Text('رزرو های من'),
                    Spacer(),
                    Text('مشاهده همه'),
                    Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ReservedCards(),
                    const SizedBox(
                      width: 24,
                    ),
                    verticalDivider(),
                    const SizedBox(
                      width: 24,
                    ),
                    const ReservedCards(),
                    const SizedBox(
                      width: 24,
                    ),
                    verticalDivider(),
                    const SizedBox(
                      width: 24,
                    ),
                    const ReservedCards(),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  //item1
                  UserAccountItem(
                    onChange: () {},
                    title: 'فروشگاه های ذخیره شده',
                    iconRight: Icons.arrow_forward_ios_rounded,
                    iconLeft: Icons.save,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    endIndent: 22,
                    indent: 43,
                    color: AppColors.dividerColor900,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  //item2
                  UserAccountItem(
                    onChange: () {},
                    title: 'مدل های ذخیره شده',
                    iconRight: Icons.arrow_forward_ios_rounded,
                    iconLeft: Icons.save,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    endIndent: 22,
                    indent: 43,
                    color: AppColors.dividerColor900,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //item3
                  UserAccountItem(
                    onChange: () {},
                    title: 'تاریخچه رزرو ها',
                    iconRight: Icons.arrow_forward_ios_rounded,
                    iconLeft: Icons.timer_rounded,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    endIndent: 22,
                    indent: 43,
                    color: AppColors.dividerColor900,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //item4
                  UserAccountItem(
                    onChange: () {},
                    title: 'دیدگاه های شما',
                    iconRight: Icons.arrow_forward_ios_rounded,
                    iconLeft: Icons.comment,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    endIndent: 22,
                    indent: 43,
                    color: AppColors.dividerColor900,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //item5
                  UserAccountItem(
                    onChange: () {},
                    title: 'بازدید های اخیر',
                    iconRight: Icons.arrow_forward_ios_rounded,
                    iconLeft: Icons.remove_red_eye_sharp,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    endIndent: 22,
                    indent: 43,
                    color: AppColors.dividerColor900,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //item5
                  UserAccountItem(
                    onChange: () {},
                    title: 'اطلاعات حساب کاربری',
                    iconRight: Icons.arrow_forward_ios_rounded,
                    iconLeft: Icons.person,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    thickness: 4,
                    color: AppColors.dividerColor900,
                  ),
                  //item6
                  const SizedBox(
                    height: 16,
                  ),
                  UserAccountItem(
                    onChange: () {},
                    title: 'لیست آرایشگاه ها',
                    iconRight: Icons.arrow_forward_ios_rounded,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    endIndent: 22,
                    indent: 19,
                    color: AppColors.dividerColor900,
                  ),
                  //item7
                  const SizedBox(
                    height: 16,
                  ),
                  UserAccountItem(
                    onChange: () {},
                    title: 'ثبت آرایشگاه',
                    iconRight: Icons.arrow_forward_ios_rounded,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    thickness: 4,
                    color: AppColors.dividerColor900,
                  ),
                  //item8
                  const SizedBox(
                    height: 16,
                  ),
                  UserAccountItem(
                    onChange: () {},
                    title: 'پشتیبانی',
                    iconRight: Icons.arrow_forward_ios_rounded,
                    iconLeft: Icons.person_pin,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    indent: 43,
                    endIndent: 22,
                    color: AppColors.dividerColor900,
                  ),
                  //item9
                  const SizedBox(
                    height: 16,
                  ),
                  UserAccountItem(
                    onChange: () {},
                    title: 'درباره ما',
                    iconRight: Icons.arrow_forward_ios_rounded,
                    iconLeft: Icons.stadium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    indent: 43,
                    endIndent: 22,
                    color: AppColors.dividerColor900,
                  ),
                  //item10
                  const SizedBox(
                    height: 16,
                  ),
                  UserAccountItem(
                    onChange: () {},
                    title: 'خروج از حساب کاربری',
                    iconRight: Icons.arrow_forward_ios_rounded,
                    iconLeft: Icons.login,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    thickness: 4,
                    color: AppColors.dividerColor900,
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 22, top: 24, bottom: 24),
                child: Text('نسخه برنامه: 1.1'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container verticalDivider() {
    return Container(
      width: 1, // عرض خط عمودی
      height: 68, // ارتفاع خط عمودی به اندازه آیتم‌ها
      color: AppColors.dividerColor900, // رنگ خط عمودی
    );
  }
}

class UserAccountItem extends StatelessWidget {
  final IconData? iconRight;
  final IconData? iconLeft;
  final String title;
  final VoidCallback onChange;

  const UserAccountItem({
    super.key,
    this.iconRight,
    this.iconLeft,
    required this.title,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 19),
      child: GestureDetector(
        onTap: onChange,
        child: Row(
          children: [
            if (iconLeft != null) Icon(iconLeft), // آیکون چپ
            const SizedBox(
              width: 4,
            ),
            Text(title),
            const Spacer(),
            if (iconRight != null) Icon(iconRight), // آیکون راست
          ],
        ),
      ),
    );
  }
}

class ReservedCards extends StatelessWidget {
  const ReservedCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/calendar-check.png'),
        const SizedBox(
          height: 6,
        ),
        const Text('انجام شده'),
      ],
    );
  }
}
