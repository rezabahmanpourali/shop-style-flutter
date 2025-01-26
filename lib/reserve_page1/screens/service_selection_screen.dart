// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_style/common/configs/colors.dart';
// import 'package:shop_style/common/configs/enums.dart';
// import 'package:shop_style/common/statemanagment/global_controller.dart';
// import 'package:shop_style/common/widgets/header_for_screen.dart';
// import 'package:shop_style/common/widgets/reserve_servise.dart';
// import 'package:shop_style/common/widgets/service_categories.dart';
// import 'package:shop_style/common/widgets/stack_widget_view.dart';
// import 'package:shop_style/reserve_page2/screens/reseve_page2.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

// class ServiceSelectionScreen extends StatefulWidget {
//   const ServiceSelectionScreen({super.key});

//   @override
//   State<ServiceSelectionScreen> createState() => _ServiceSelectionScreenState();
// }

// class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFFFF),
//       body: Consumer<GlobalController>(
//         builder: (context, globallController, child) {
//           return Directionality(
//             textDirection: globallController.language == 'fa' ||
//                     globallController.language == 'ar'
//                 ? TextDirection.rtl
//                 : TextDirection.ltr,
//             child: CustomScrollView(
//               slivers: [
//                 const SliverPadding(
//                   padding: EdgeInsets.symmetric(horizontal: 22),
//                   sliver: HeaderScreen(),
//                 ),
//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         left: width / 15, right: width / 15, bottom: 22),
//                     child: Text(
//                       AppLocalizations.of(context)!.select_services,
//                       style: Theme.of(context).textTheme.titleSmall,
//                     ),
//                   ),
//                 ),
//                 SliverPadding(
//                   padding: const EdgeInsets.only(right: 22, left: 22),
//                   sliver: SliverToBoxAdapter(
//                     child: ServiceCategories(
//                       onTabChange: (index) {},
//                       tabs: [
//                         AppLocalizations.of(context)!.hair_cut,
//                         AppLocalizations.of(context)!.hair_style,
//                         AppLocalizations.of(context)!.shaving,
//                       ],
//                       content: [
//                         SizedBox(
//                           height: 230,
//                           child: ListView.builder(
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: 2,
//                             itemBuilder: (BuildContext context, int index) {
//                               return const ReserveServise(
//                                   type: TypeReserveServise.reserve);
//                             },
//                           ),
//                         ),
//                         Container(
//                           width: 100,
//                           height: 100,
//                           color: Colors.blue,
//                         ),
//                         Container(
//                           width: 100,
//                           height: 100,
//                           color: Colors.green,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SliverToBoxAdapter(
//                   child: Divider(
//                     color: AppColors.dividerColor900,
//                     thickness: 4,
//                   ),
//                 ),
//                 SliverPadding(
//                   padding: const EdgeInsets.only(
//                     left: 22,
//                     right: 22,
//                   ),
//                   sliver: SliverToBoxAdapter(
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => ResevePage2(),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             width: 180,
//                             height: 60,
//                             decoration: BoxDecoration(
//                               color: AppColors.bgBlack,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 AppLocalizations.of(context)!.continueee,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge!
//                                     .copyWith(
//                                       color: AppColors.white2,
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         Column(
//                           children: [
//                             Text(
//                               '125,000 تومان',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .displayMedium!
//                                   .copyWith(
//                                     color: AppColors.black,
//                                     fontSize: 20,
//                                   ),
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   '1 خدمت',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .displaySmall!
//                                       .copyWith(
//                                         color: AppColors.textSearchColor,
//                                         fontSize: 14,
//                                       ),
//                                 ),
//                                 const SizedBox(
//                                   width: 17,
//                                 ),
//                                 Text(
//                                   '40 دقیقه',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .displaySmall!
//                                       .copyWith(
//                                         color: AppColors.textSearchColor,
//                                         fontSize: 14,
//                                       ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/widgets/reserve_servise.dart';
import 'package:shop_style/common/widgets/service_categories.dart';
import 'package:shop_style/common/widgets/stack_widget_view.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
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
      backgroundColor: AppColors.arayeshColor,
      body: Consumer<GlobalController>(
        builder: (context, globallController, child) {
          return Directionality(
            textDirection: globallController.language == 'fa' ||
                    globallController.language == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
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
                          AppLocalizations.of(context)!.select_services,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                    // SliverPadding(
                    //   padding: const EdgeInsets.only(right: 22, left: 22),
                    //   sliver: SliverToBoxAdapter(
                    //     child: ServiceCategories(
                    //       onTabChange: (index) {},
                    //       tabs: [
                    //         AppLocalizations.of(context)!.hair_cut,
                    //         AppLocalizations.of(context)!.hair_style,
                    //         AppLocalizations.of(context)!.shaving,
                    //       ],
                    //       content: [
                    //         SizedBox(
                    //           height: 230,
                    //           child: ListView.builder(
                    //             physics: const NeverScrollableScrollPhysics(),
                    //             itemCount: 2,
                    //             itemBuilder: (BuildContext context, int index) {
                    //               return const ReserveServise(
                    //                   type: TypeReserveServise.reserve);
                    //             },
                    //           ),
                    //         ),
                    //         Container(
                    //           width: 100,
                    //           height: 100,
                    //           color: Colors.blue,
                    //         ),
                    //         Container(
                    //           width: 100,
                    //           height: 100,
                    //           color: Colors.green,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SliverToBoxAdapter(
                      child: Selector<BarberShopController, BlocStatus>(
                        builder: (context, barberShopState, child) {
                          return StateManageWidget(
                            status: barberShopState,
                            loadingWidget: () {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: width * 0.05, top: height * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 15),
                                        width: width * 0.2,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.04,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 6,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  left: 5),
                                              width: width * 0.3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: Colors.grey[300],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            errorWidgetBuilder: (message, statusCode) {
                              return Center(
                                child: Text(message!),
                              );
                            },
                            completedWidgetBuilder: (value) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: 22, left: 22),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.services,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    const SizedBox(height: 15),
                                    ServiceCategories(
                                      onTabChange: (index) {},
                                      tabs: [
                                        AppLocalizations.of(context)!.hair_cut,
                                        AppLocalizations.of(context)!
                                            .hair_style,
                                        AppLocalizations.of(context)!.shaving,
                                      ],
                                      content: [
                                        Selector<BarberShopController,
                                            BlocStatus>(
                                          builder:
                                              (context, serviceState, child) {
                                            return StateManageWidget(
                                              status: serviceState,
                                              loadingWidget: () {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                              errorWidgetBuilder:
                                                  (message, statusCode) {
                                                return Center(
                                                  child: Text(
                                                    message.toString(),
                                                  ),
                                                );
                                              },
                                              completedWidgetBuilder: (value) {
                                                if (value.isEmpty) {
                                                  return Center(
                                                    child: Text(
                                                      'هیچ داده‌ای وجود ندارد',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge
                                                          ?.copyWith(
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 16,
                                                          ),
                                                    ),
                                                  );
                                                }
                                                return Column(
                                                  children: [
                                                    SizedBox(
                                                      height: value.isNotEmpty
                                                          ? null
                                                          : 250.0,
                                                      child: ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            value.length > 3
                                                                ? 3
                                                                : value.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          final service =
                                                              value[index];
                                                          return ServicesView(
                                                            shouldNavigate:
                                                                false,
                                                            serviceModel:
                                                                service,
                                                            isLastItem: (index ==
                                                                (value.length >
                                                                        3
                                                                    ? 2
                                                                    : value.length -
                                                                        1)),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          selector: (context, controller) =>
                                              controller.servicState,
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
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        selector: (context, controller) =>
                            controller.barberShopState,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: height * 0.01,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      const Divider(
                        color: AppColors.dividerColor900,
                        thickness: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
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
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
