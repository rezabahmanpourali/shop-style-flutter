// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
// import 'package:shop_style/common/configs/colors.dart';
// import 'package:shop_style/common/widgets/best_cart_item_party.dart';
// import 'package:shop_style/common/widgets/header_for_screen.dart';
// import 'package:shop_style/common/widgets/text_padding.dart';

// class RecentlyViewedPage extends StatefulWidget {
//   const RecentlyViewedPage({super.key});

//   @override
//   State<RecentlyViewedPage> createState() => _RecentlyViewedPageState();
// }

// class _RecentlyViewedPageState extends State<RecentlyViewedPage> {
//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(const Duration(seconds: 2), () {
//       // ignore: use_build_context_synchronously
//       Provider.of<BarberShopController>(context, listen: false)
//           .fetchBarberShops();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white2,
//       body: SafeArea(
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 22),
//             child: CustomScrollView(
//               slivers: [
//                 const HeaderScreen(),
//                 SliverToBoxAdapter(
//                   child: Text(
//                     'بازدید های اخیر',
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: TextPadding(
//                     topPadding: 22,
//                     text: 'آرایشگاه ها',
//                     theme: Theme.of(context).textTheme.labelMedium,
//                   ),
//                 ),
//                 // Consumer<BarberShopController>(
//                 //   builder: (context, provider, child) {
//                 //     return StateManageWidget(
//                 //       status: provider.barberShopState,
//                 //       loadingWidget: () {
//                 //         return const SliverToBoxAdapter(
//                 //           child: Center(
//                 //             child: CircularProgressIndicator(),
//                 //           ),
//                 //         );
//                 //       },
//                 //       errorWidgetBuilder: (message, statusCode) {
//                 //         return SliverToBoxAdapter(
//                 //           child: Center(
//                 //             child: Text(provider.errorMessage),
//                 //           ),
//                 //         );
//                 //       },
//                 //       completedWidgetBuilder: (value) {
//                 //         return SliverList(
//                 //           delegate: SliverChildBuilderDelegate(
//                 //             (context, index) {
//                 //               final barbershop = provider.barberShops[index];
//                 //               return Padding(
//                 //                   padding: const EdgeInsets.only(left: 16),
//                 //                   child: CardItem(barbershop));
//                 //             },
//                 //             childCount: provider.barberShops.length,
//                 //           ),
//                 //         );
//                 //       },
//                 //     );
//                 //   },
//                 // ),
//                 SliverToBoxAdapter(
//                   child: TextPadding(
//                     topPadding: 22,
//                     text: 'مدل ها',
//                     theme: Theme.of(context).textTheme.labelMedium,
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 32),
//                     child: SizedBox(
//                       height: 242,
//                       child: ListView.builder(
//                         itemCount: 6,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           return const Padding(
//                             padding: EdgeInsets.only(left: 16),
//                             child: BestCardItemParty(),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
