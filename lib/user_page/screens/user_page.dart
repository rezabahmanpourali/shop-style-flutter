import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_style/barber_shop_list/screens/barber_shop_list_screen.dart';
import 'package:shop_style/change_user_info_page/screens/change_user_ingo.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_style/my_comment_page/screens/my_comment_page.dart';
import 'package:shop_style/recently_viewed_page/screens/recently_viewed_page.dart';
import 'package:shop_style/saved_barber_shop/screens/saved_barber_shop.dart';
import 'package:shop_style/saved_model_page/screens/saved_models_page.dart';
import 'package:shop_style/view_reserved_page/screens/view_reserved_page.dart';

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
            SliverPadding(
              padding: const EdgeInsets.only(left: 22, right: 22, bottom: 32),
              sliver: SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: AppColors.white2,
                actions: [
                  SvgPicture.asset('assets/images/settings.svg'),
                  const Spacer(),
                  const FaIcon(FontAwesomeIcons.headset),
                  const SizedBox(width: 20),
                  const FaIcon(FontAwesomeIcons.bell),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'نام کاربری',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          '09120000000',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.textHeader),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const FaIcon(
                      FontAwesomeIcons.pen,
                      size: 18,
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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 22, right: 22, bottom: 16),
                child: Row(
                  children: [
                    Text(
                      'رزرو های من',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Spacer(),
                    Text(
                      'مشاهده همه',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.textHeader),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      'assets/images/Vector (1).svg',
                      height: 8,
                      width: 4,
                      // ignore: deprecated_member_use
                      color: AppColors.arrowIcon,
                    ),
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
                    const SizedBox(width: 24),
                    verticalDivider(),
                    const SizedBox(width: 24),
                    const ReservedCards(),
                    const SizedBox(width: 24),
                    verticalDivider(),
                    const SizedBox(width: 24),
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
                    onChange: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SavedBarberShop(),
                      ));
                    },
                    title: 'فروشگاه های ذخیره شده',
                    iconRight: SvgPicture.asset(
                      'assets/images/Vector (1).svg',
                      height: 8,
                      width: 4,
                      // ignore: deprecated_member_use
                      color: AppColors.reserveContaner,
                    ),
                    iconLeft: const FaIcon(
                      FontAwesomeIcons.bookmark,
                      size: 20,
                    ),
                  ),

                  const Divider(
                    endIndent: 22,
                    indent: 43,
                    color: AppColors.dividerColor900,
                  ),

                  //item2
                  UserAccountItem(
                    onChange: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SavedModelsPage(),
                      ));
                    },
                    title: 'مدل های ذخیره شده',
                    iconRight: SvgPicture.asset(
                      'assets/images/Vector (1).svg',
                      height: 8,
                      width: 4,
                      // ignore: deprecated_member_use
                      color: AppColors.reserveContaner,
                    ),
                    iconLeft: const FaIcon(
                      FontAwesomeIcons.bookmark,
                      size: 20,
                    ),
                  ),

                  const Divider(
                    endIndent: 22,
                    indent: 43,
                    color: AppColors.dividerColor900,
                  ),

                  //item3
                  UserAccountItem(
                    onChange: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ViewReservedPage(),
                      ));
                    },
                    title: 'تاریخچه رزرو ها',
                    iconRight: SvgPicture.asset(
                      'assets/images/Vector (1).svg',
                      height: 8,
                      width: 4,
                      // ignore: deprecated_member_use
                      color: AppColors.reserveContaner,
                    ),
                    iconLeft: const FaIcon(
                      FontAwesomeIcons.history,
                      size: 20,
                    ),
                  ),

                  const Divider(
                    endIndent: 22,
                    indent: 43,
                    color: AppColors.dividerColor900,
                  ),

                  //item4
                  UserAccountItem(
                    onChange: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MyCommentPage(),
                        ),
                      );
                    },
                    title: 'دیدگاه های شما',
                    iconRight: SvgPicture.asset(
                      'assets/images/Vector (1).svg',
                      height: 8,
                      width: 4,
                      // ignore: deprecated_member_use
                      color: AppColors.reserveContaner,
                    ),
                    iconLeft: const FaIcon(
                      FontAwesomeIcons.commentLines,
                      size: 20,
                    ),
                  ),

                  const Divider(
                    endIndent: 22,
                    indent: 43,
                    color: AppColors.dividerColor900,
                  ),

                  //item5
                  UserAccountItem(
                    onChange: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RecentlyViewedPage(),
                        ),
                      );
                    },
                    title: 'بازدید های اخیر',
                    iconRight: SvgPicture.asset(
                      'assets/images/Vector (1).svg',
                      height: 8,
                      width: 4,
                      // ignore: deprecated_member_use
                      color: AppColors.reserveContaner,
                    ),
                    iconLeft: const FaIcon(
                      FontAwesomeIcons.eye,
                      size: 20,
                    ),
                  ),

                  const Divider(
                    endIndent: 22,
                    indent: 43,
                    color: AppColors.dividerColor900,
                  ),

                  //item5
                  UserAccountItem(
                    onChange: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChangeUserIngo(),
                      ));
                    },
                    title: 'اطلاعات حساب کاربری',
                    iconRight: SvgPicture.asset(
                      'assets/images/Vector (1).svg',
                      height: 8,
                      width: 4,
                      // ignore: deprecated_member_use
                      color: AppColors.reserveContaner,
                    ),
                    iconLeft: const FaIcon(
                      FontAwesomeIcons.user,
                      size: 20,
                    ),
                  ),

                  const Divider(
                    thickness: 4,
                    color: AppColors.dividerColor900,
                  ),
                  //item6

                  UserAccountItem(
                    onChange: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BarberShopListPage(),
                      ));
                    },
                    title: 'لیست آرایشگاه ها',
                    iconRight: SvgPicture.asset(
                      'assets/images/Vector (1).svg',
                      height: 8,
                      width: 4,
                      // ignore: deprecated_member_use
                      color: AppColors.arrowIconBig,
                    ),
                  ),

                  const Divider(
                    endIndent: 22,
                    indent: 19,
                    color: AppColors.dividerColor900,
                  ),
                  //item7

                  UserAccountItem(
                    onChange: () {},
                    title: 'ثبت آرایشگاه',
                    iconRight: SvgPicture.asset(
                      'assets/images/Vector (1).svg',
                      height: 8,
                      width: 4,
                      // ignore: deprecated_member_use
                      color: AppColors.arrowIconBig,
                    ),
                  ),

                  const Divider(
                    thickness: 4,
                    color: AppColors.dividerColor900,
                  ),
                  //item8

                  UserAccountItem(
                    onChange: () {},
                    title: 'پشتیبانی',
                    iconRight: SvgPicture.asset(
                      'assets/images/Vector (1).svg',
                      height: 8,
                      width: 4,
                      // ignore: deprecated_member_use
                      color: AppColors.arrowIconBig,
                    ),
                    iconLeft: SvgPicture.asset(
                      'assets/images/fluent_person-support-28-regular.svg',
                      height: 20,
                      width: 20,
                      // ignore: deprecated_member_use
                      color: AppColors.reserveContaner,
                    ),
                  ),

                  const Divider(
                    indent: 43,
                    endIndent: 22,
                    color: AppColors.dividerColor900,
                  ),
                  //item9

                  UserAccountItem(
                    onChange: () {},
                    title: 'درباره ما',
                    iconRight: SvgPicture.asset(
                      'assets/images/Vector (1).svg',
                      height: 8,
                      width: 4,
                      // ignore: deprecated_member_use
                      color: AppColors.arrowIconBig,
                    ),
                    iconLeft: SvgPicture.asset(
                      'assets/images/mdi_about-variant.svg',
                      height: 20,
                      width: 20,
                      // ignore: deprecated_member_use
                      color: AppColors.reserveContaner,
                    ),
                  ),

                  const Divider(
                    indent: 43,
                    endIndent: 22,
                    color: AppColors.dividerColor900,
                  ),
                  //item10

                  UserAccountItem(
                    onChange: () {},
                    title: 'خروج از حساب کاربری',
                    iconRight: SvgPicture.asset(
                      'assets/images/Vector (1).svg',
                      height: 8,
                      width: 4,
                      // ignore: deprecated_member_use
                      color: AppColors.arrowIconBig,
                    ),
                    iconLeft: SvgPicture.asset(
                      'assets/images/material-symbols-light_exit-to-app-rounded.svg',
                      height: 20,
                      width: 20,
                      // ignore: deprecated_member_use
                      color: AppColors.reserveContaner,
                    ),
                  ),

                  const Divider(
                    thickness: 4,
                    color: AppColors.dividerColor900,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 22, top: 24, bottom: 24),
                child: Text(
                  'نسخه برنامه: 1.1',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.textHeader),
                ),
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
  final Widget? iconRight;
  final Widget? iconLeft;
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
    return GestureDetector(
      onTap: onChange,
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 22, right: 19, bottom: 16, top: 16),
          child: Row(
            children: [
              if (iconLeft != null) iconLeft!, // ویجت آیکون چپ
              const SizedBox(
                width: 4,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.black),
              ),
              const Spacer(),
              if (iconRight != null) iconRight!, // ویجت آیکون راست
            ],
          ),
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
        Text(
          'انجام شده',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
