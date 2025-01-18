import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/widgets/reserve_servise.dart';
import 'package:shop_style/common/widgets/service_categories.dart';
import 'package:shop_style/common/widgets/stack_widget_view.dart';
import 'package:shop_style/reserve_page2/screens/reseve_page2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class ServiceSelectionScreen extends StatefulWidget {
  const ServiceSelectionScreen({super.key});

  @override
  State<ServiceSelectionScreen> createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Consumer<GlobalController>(
        builder: (context, globallController, child) {
          return Directionality(
            textDirection: globallController.language == 'fa' ||
                    globallController.language == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: CustomScrollView(
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
                      AppLocalizations.of(context)!.select_services,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(right: 22, left: 22),
                  sliver: SliverToBoxAdapter(
                    child: ServiceCategories(
                      onTabChange: (index) {},
                      tabs: [
                        AppLocalizations.of(context)!.hair_cut,
                        AppLocalizations.of(context)!.hair_style,
                        AppLocalizations.of(context)!.shaving,
                      ],
                      content: [
                        SizedBox(
                          height: 230,
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
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.41,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Divider(
                    color: AppColors.dividerColor900,
                    thickness: 4,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 22,
                    right: 22,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ResevePage2(),
                              ),
                            );
                          },
                          child: Container(
                            width: 180,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.bgBlack,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.continueee,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: AppColors.white2,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              '125,000 تومان',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: AppColors.black,
                                    fontSize: 20,
                                  ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '1 خدمت',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        color: AppColors.textSearchColor,
                                        fontSize: 14,
                                      ),
                                ),
                                const SizedBox(
                                  width: 17,
                                ),
                                Text(
                                  '40 دقیقه',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        color: AppColors.textSearchColor,
                                        fontSize: 14,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
