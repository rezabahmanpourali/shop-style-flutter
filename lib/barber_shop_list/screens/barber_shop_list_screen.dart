// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_style/barber/model/barber_shop_model.dart';
// import 'package:shop_style/barber/screens/barber_shop_page.dart';
// import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
// import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
// import 'package:shop_style/barber_shop_list/screens/widgets/search_bar_widgets.dart';
// import 'package:shop_style/common/configs/colors.dart';
// import 'package:shop_style/barber_shop_list/screens/widgets/barber_shop_list.dart';
// import 'package:shop_style/common/widgets/sliver_lazy_load.dart';
// import 'package:shop_style/locator.dart';

// class BarberShopListPage extends StatefulWidget {
//   const BarberShopListPage({super.key});

//   @override
//   State<BarberShopListPage> createState() => _BarberShopListPageState();
// }

// class _BarberShopListPageState extends State<BarberShopListPage> {
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() =>
//         // ignore: use_build_context_synchronously
//         Provider.of<BarberShopController>(context, listen: false)
//             .fetchBarberShops());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white2,
//       body: SafeArea(
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: Consumer<BarberShopController>(
//               builder: (context, controller, child) {
//             return CustomScrollView(
//               slivers: [
//                 SliverAppBar(
//                   surfaceTintColor: AppColors.white2,
//                   pinned: false,
//                   automaticallyImplyLeading: false,
//                   title: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: const Icon(Icons.arrow_back),
//                       ),
//                       const SizedBox(width: 5),
//                       Text(
//                         'آرایشگاه ها',
//                         style: Theme.of(context).textTheme.titleSmall,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SliverToBoxAdapter(
//                   child: Divider(
//                     endIndent: 22,
//                     indent: 22,
//                     color: AppColors.dividerColor900,
//                   ),
//                 ),
//                 SliverPadding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 22,
//                     vertical: 10,
//                   ),
//                   sliver: SliverToBoxAdapter(
//                     child: SearchBarWidget(
//                       onChanged: (value) {
//                         controller.filterBarberShops(value); // اعمال فیلتر
//                       },
//                       onSubmitted: (value) {
//                         controller.filterBarberShops(value); // اعمال فیلتر
//                       },
//                     ),
//                   ),
//                 ),
//                 SliverLazyLoadWidget(
//                   apiLazyLoad: () async {
//                     // بارگذاری داده‌های بیشتر
//                     await controller.fetchBarberShops(); // متد بارگذاری داده‌ها
//                   },
//                   itemCount:
//                       controller.filteredBarberShops.length, // تعداد آیتم‌ها
//                   itemBuilder: (context, index) {
//                     final shop = controller.filteredBarberShops[index];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           PageRouteBuilder(
//                             pageBuilder:
//                                 (context, animation, secondaryAnimation) {
//                               return MultiProvider(
//                                 providers: [
//                                   ChangeNotifierProvider.value(
//                                     value: locator.get<BarberController>(),
//                                   ),
//                                   ChangeNotifierProvider.value(
//                                     value: locator.get<BarberShopController>(),
//                                   ),
//                                 ],
//                                 child: BarberShopPage(
//                                   barberShopModel: shop,
//                                   barberShopId: shop.id ?? 0,
//                                 ),
//                               );
//                             },
//                             transitionsBuilder: (context, animation,
//                                 secondaryAnimation, child) {
//                               const begin = Offset(1.0, 0.0);
//                               const end = Offset.zero;
//                               const curve = Curves.easeInOut;

//                               var tween = Tween(begin: begin, end: end)
//                                   .chain(CurveTween(curve: curve));
//                               var offsetAnimation = animation.drive(tween);

//                               return SlideTransition(
//                                   position: offsetAnimation, child: child);
//                             },
//                           ),
//                         );
//                       },
//                       child: SearchCaedItem(shop: shop), // ساخت هر آیتم
//                     );
//                   },
//                   skeletonWidget: const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                   onLoadMore: () async {
//                     // بارگذاری داده‌های بیشتر وقتی به انتها رسید
//                     await controller
//                         .fetchBarberShops(); // فراخوانی برای بارگذاری بیشتر
//                   },
//                   shouldShowLoading: true, // لودینگ برای بارگذاری بیشتر
//                   scrollController: ScrollController(), // کنترلر اسکرول
//                   noItemFoundWidget: const Center(
//                     child: Text('چیزی پیدا نشد!'), // در صورت نداشتن داده
//                   ),
//                 )
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

// class SearchCaedItem extends StatelessWidget {
//   const SearchCaedItem({
//     super.key,
//     required this.shop,
//   });

//   final BarberShopModel shop;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Divider(
//           color: AppColors.dividerColor900,
//           height: 1,
//         ),
//         Padding(
//           padding:
//               const EdgeInsets.only(left: 22, right: 22, top: 16, bottom: 16),
//           child: Row(
//             children: [
//               ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.network(
//                     shop.images != null && shop.images!.isNotEmpty
//                         ? shop.images![0].url!
//                         : 'https://modirwp.com/wp-content/uploads/2019/12/wordpress-http-error.png',
//                     fit: BoxFit.cover,
//                     width: 66,
//                     height: 66,
//                   )),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Text(
//                   shop.barberShopName ?? 'نام آرایشگاه',
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//               ),
//               const Icon(
//                 Icons.chevron_right,
//                 size: 20,
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/barber_shop_list/screens/widgets/search_bar_widgets.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/barber_shop_list/screens/widgets/barber_shop_list.dart';
import 'package:shop_style/common/widgets/sliver_lazy_load.dart';
import 'package:shop_style/locator.dart';

class BarberShopListPage extends StatefulWidget {
  const BarberShopListPage({super.key});

  @override
  State<BarberShopListPage> createState() => _BarberShopListPageState();
}

class _BarberShopListPageState extends State<BarberShopListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        // ignore: use_build_context_synchronously
        Provider.of<BarberShopController>(context, listen: false)
            .fetchBarberShops());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Consumer<BarberShopController>(
              builder: (context, controller, child) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  surfaceTintColor: AppColors.white2,
                  pinned: false,
                  automaticallyImplyLeading: false,
                  title: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'آرایشگاه ها',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Divider(
                    endIndent: 22,
                    indent: 22,
                    color: AppColors.dividerColor900,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 10,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: SearchBarWidget(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.filterBarberShops(value); // اعمال فیلتر
                        } else {
                          controller
                              .resetFilter(); // بازگشت به لیست کامل بدون فیلتر
                        }
                      },
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          controller.filterBarberShops(value); // اعمال فیلتر
                        } else {
                          controller
                              .resetFilter(); // بازگشت به لیست کامل بدون فیلتر
                        }
                      },
                    ),
                  ),
                ),
                SliverLazyLoadWidget(
                  apiLazyLoad: () async {
                    // بارگذاری داده‌های بیشتر
                    await controller.fetchBarberShops(); // متد بارگذاری داده‌ها
                  },
                  itemCount:
                      controller.filteredBarberShops.length, // تعداد آیتم‌ها
                  itemBuilder: (context, index) {
                    final shop = controller.filteredBarberShops[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return MultiProvider(
                                providers: [
                                  ChangeNotifierProvider.value(
                                    value: locator.get<BarberController>(),
                                  ),
                                  ChangeNotifierProvider.value(
                                    value: locator.get<BarberShopController>(),
                                  ),
                                ],
                                child: BarberShopPage(
                                  barberShopModel: shop,
                                  barberShopId: shop.id ?? 0,
                                ),
                              );
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                  position: offsetAnimation, child: child);
                            },
                          ),
                        );
                      },
                      child: SearchCaedItem(shop: shop), // ساخت هر آیتم
                    );
                  },
                  skeletonWidget: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  onLoadMore: () async {
                    // بارگذاری داده‌های بیشتر وقتی به انتها رسید
                    await controller
                        .fetchBarberShops(); // فراخوانی برای بارگذاری بیشتر
                  },
                  shouldShowLoading: true, // لودینگ برای بارگذاری بیشتر
                  scrollController: ScrollController(), // کنترلر اسکرول
                  noItemFoundWidget: const Center(
                    child: Text('چیزی پیدا نشد!'), // در صورت نداشتن داده
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

class SearchCaedItem extends StatelessWidget {
  const SearchCaedItem({
    super.key,
    required this.shop,
  });

  final BarberShopModel shop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: AppColors.dividerColor900,
          height: 1,
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 22, right: 22, top: 16, bottom: 16),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    shop.images != null && shop.images!.isNotEmpty
                        ? shop.images![0].url!
                        : 'https://modirwp.com/wp-content/uploads/2019/12/wordpress-http-error.png',
                    fit: BoxFit.cover,
                    width: 66,
                    height: 66,
                  )),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  shop.barberShopName ?? 'نام آرایشگاه',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Icon(
                Icons.chevron_right,
                size: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
