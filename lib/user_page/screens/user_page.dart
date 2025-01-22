import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber_shop_list/screens/barber_shop_list_screen.dart';
import 'package:shop_style/change_user_info_page/screens/change_user_ingo.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/edit_user_info/screen/user_info_page.dart';
import 'package:shop_style/locator.dart';
import 'package:shop_style/my_comment_page/screens/my_comment_page.dart';
import 'package:shop_style/recently_viewed_page/screens/recently_viewed_page.dart';
import 'package:shop_style/saved_barber_shop/screens/saved_barber_shop.dart';
import 'package:shop_style/saved_model_page/screens/saved_models_page.dart';
import 'package:shop_style/view_reserved_page/screens/view_reserved_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String selectedLanguage = 'فارسی';
  String selectedFlag = 'assets/images/twemoji_flag-iran.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Consumer<GlobalController>(
          builder: (context, globalController, child) {
            return Directionality(
              textDirection: globalController.language == 'fa' ||
                      globalController.language == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(left: 22, right: 22, bottom: 32),
                    sliver: SliverAppBar(
                      automaticallyImplyLeading: false,
                      elevation: 0,
                      backgroundColor: AppColors.white2,
                      actions: [
                        const Spacer(),
                        Consumer<GlobalController>(
                          builder: (context, globalController, child) {
                            return PopupMenuButton<String>(
                              onSelected: (value) {
                                if (value != null) {
                                  globalController
                                      .changeLanguage(value); // تغییر زبان
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem<String>(
                                  value: 'fa',
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/twemoji_flag-iran.svg',
                                            width: 24,
                                            height: 24, // اندازه پرچم
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'فارسی',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge!
                                                .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: AppColors.dividerColor900,
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'en',
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/emojione-v1_flag-for-united-kingdom.svg',
                                            width: 24,
                                            height: 24,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'English',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge!
                                                .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: AppColors.dividerColor900,
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'ar',
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/emojione-v1_flag-for-saudi-arabia.svg',
                                            width: 24,
                                            height: 24,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'العربية',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge!
                                                .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: AppColors.dividerColor900,
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'tr',
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/twemoji_flag-for-flag-turkey.svg',
                                        width: 24,
                                        height: 24,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Türkish',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    globalController.language == 'fa'
                                        ? 'assets/images/twemoji_flag-iran.svg'
                                        : globalController.language == 'en'
                                            ? 'assets/images/emojione-v1_flag-for-united-kingdom.svg'
                                            : globalController.language == 'ar'
                                                ? 'assets/images/emojione-v1_flag-for-saudi-arabia.svg'
                                                : 'assets/images/twemoji_flag-for-flag-turkey.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    globalController.language == 'fa'
                                        ? 'فارسی'
                                        : globalController.language == 'en'
                                            ? 'English'
                                            : globalController.language == 'ar'
                                                ? 'العربية'
                                                : 'Türkish',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const FaIcon(FontAwesomeIcons.headset),
                        const SizedBox(width: 20),
                        const FaIcon(FontAwesomeIcons.bell),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 22, right: 22, bottom: 11),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const UserInfoPage(),
                                ),
                              );
                            },
                            child: const SizedBox(
                              width: 30,
                              height: 30,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.pen,
                                  size: 18,
                                ),
                              ),
                            ),
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
                  //شاید دوباره از کامنت دربیاد
                  // SliverToBoxAdapter(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //         top: 16, left: 22, right: 22, bottom: 16),
                  //     child: Row(
                  //       children: [
                  //         Text(
                  //           AppLocalizations.of(context)!.my_reservations,
                  //           style: Theme.of(context).textTheme.titleSmall,
                  //         ),
                  //         const Spacer(),
                  //         Text(
                  //           AppLocalizations.of(context)!.view_all,
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .bodyMedium
                  //               ?.copyWith(color: AppColors.textHeader),
                  //         ),
                  //         const SizedBox(
                  //           width: 5,
                  //         ),
                  //         SvgPicture.asset(
                  //           'assets/images/Vector (1).svg',
                  //           height: 8,
                  //           width: 4,
                  //           // ignore: deprecated_member_use
                  //           color: AppColors.arrowIcon,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SliverToBoxAdapter(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(right: 22, left: 22),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         const ReservedCards(),
                  //         const SizedBox(width: 24),
                  //         verticalDivider(),
                  //         const SizedBox(width: 24),
                  //         const ReservedCards(),
                  //         const SizedBox(width: 24),
                  //         verticalDivider(),
                  //         const SizedBox(width: 24),
                  //         const ReservedCards(),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SliverToBoxAdapter(
                  //   child: SizedBox(
                  //     height: 40,
                  //   ),
                  // ),
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
                          title: AppLocalizations.of(context)!.saved_stores,
                          iconRight: globalController.language == 'fa' ||
                                  globalController.language == 'ar'
                              ? SvgPicture.asset(
                                  'assets/images/Vector (1).svg',
                                  height: 8,
                                  width: 4,
                                  color: AppColors.reserveContaner,
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 8,
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
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => const SavedModelsPage(),
                            // ));
                          },
                          title: AppLocalizations.of(context)!.saved_models,
                          iconRight: globalController.language == 'fa' ||
                                  globalController.language == 'ar'
                              ? SvgPicture.asset(
                                  'assets/images/Vector (1).svg',
                                  height: 8,
                                  width: 4,
                                  color: AppColors.reserveContaner,
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 8,
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
                          title:
                              AppLocalizations.of(context)!.reservation_history,
                          iconRight: globalController.language == 'fa' ||
                                  globalController.language == 'ar'
                              ? SvgPicture.asset(
                                  'assets/images/Vector (1).svg',
                                  height: 8,
                                  width: 4,
                                  color: AppColors.reserveContaner,
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 8,
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
                          title: AppLocalizations.of(context)!.your_reviews,
                          iconRight: globalController.language == 'fa' ||
                                  globalController.language == 'ar'
                              ? SvgPicture.asset(
                                  'assets/images/Vector (1).svg',
                                  height: 8,
                                  width: 4,
                                  color: AppColors.reserveContaner,
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 8,
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
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => const RecentlyViewedPage(),
                            //   ),
                            // );
                          },
                          title: AppLocalizations.of(context)!.recent_visits,
                          iconRight: globalController.language == 'fa' ||
                                  globalController.language == 'ar'
                              ? SvgPicture.asset(
                                  'assets/images/Vector (1).svg',
                                  height: 8,
                                  width: 4,
                                  color: AppColors.reserveContaner,
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 8,
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
                          title: AppLocalizations.of(context)!.account_info,
                          iconRight: globalController.language == 'fa' ||
                                  globalController.language == 'ar'
                              ? SvgPicture.asset(
                                  'assets/images/Vector (1).svg',
                                  height: 8,
                                  width: 4,
                                  color: AppColors.reserveContaner,
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 8,
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
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => const BarberShopListPage(),
                            // ));
                          },
                          title: AppLocalizations.of(context)!.salon_listtt,
                          iconRight: globalController.language == 'fa' ||
                                  globalController.language == 'ar'
                              ? SvgPicture.asset(
                                  'assets/images/Vector (1).svg',
                                  height: 8,
                                  width: 4,
                                  color: AppColors.reserveContaner,
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 8,
                                  color: AppColors.reserveContaner,
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
                          title: AppLocalizations.of(context)!.register_salon,
                          iconRight: globalController.language == 'fa' ||
                                  globalController.language == 'ar'
                              ? SvgPicture.asset(
                                  'assets/images/Vector (1).svg',
                                  height: 8,
                                  width: 4,
                                  color: AppColors.reserveContaner,
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 8,
                                  color: AppColors.reserveContaner,
                                ),
                        ),

                        const Divider(
                          thickness: 4,
                          color: AppColors.dividerColor900,
                        ),
                        //item8

                        UserAccountItem(
                          onChange: () {},
                          title: AppLocalizations.of(context)!.support,
                          iconRight: globalController.language == 'fa' ||
                                  globalController.language == 'ar'
                              ? SvgPicture.asset(
                                  'assets/images/Vector (1).svg',
                                  height: 8,
                                  width: 4,
                                  color: AppColors.reserveContaner,
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 8,
                                  color: AppColors.reserveContaner,
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
                          title: AppLocalizations.of(context)!.about_us,
                          iconRight: globalController.language == 'fa' ||
                                  globalController.language == 'ar'
                              ? SvgPicture.asset(
                                  'assets/images/Vector (1).svg',
                                  height: 8,
                                  width: 4,
                                  color: AppColors.reserveContaner,
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 8,
                                  color: AppColors.reserveContaner,
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
                          title: AppLocalizations.of(context)!.logout,
                          iconRight: globalController.language == 'fa' ||
                                  globalController.language == 'ar'
                              ? SvgPicture.asset(
                                  'assets/images/Vector (1).svg',
                                  height: 8,
                                  width: 4,
                                  color: AppColors.reserveContaner,
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 8,
                                  color: AppColors.reserveContaner,
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
                      padding: const EdgeInsets.only(
                          right: 22, top: 24, bottom: 24, left: 22),
                      child: Text(
                        AppLocalizations.of(context)!.app_version,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.textHeader),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container verticalDivider() {
    return Container(
      width: 1,
      height: 68,
      color: AppColors.dividerColor900,
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
