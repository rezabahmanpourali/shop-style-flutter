// import 'package:flutter/material.dart';
// import 'package:shop_style/barber_shop_list/screens/widgets/barber_shop_list.dart';
// import 'package:shop_style/common/configs/colors.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class BarberShopListPage extends StatefulWidget {
//   const BarberShopListPage({super.key});

//   @override
//   State<BarberShopListPage> createState() => _BarberShopListPageState();
// }

// class _BarberShopListPageState extends State<BarberShopListPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white2,
//       body: SafeArea(
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: CustomScrollView(
//             slivers: [
//               SliverAppBar(
//                 surfaceTintColor: AppColors.white2,
//                 pinned: true,
//                 title: Row(
//                   children: [
//                     const Icon(Icons.arrow_back),
//                     const SizedBox(width: 5),
//                     Text(
//                       'آرایشگاه ها',
//                       style: Theme.of(context).textTheme.titleSmall,
//                     ),
//                   ],
//                 ),
//               ),
//               const SliverToBoxAdapter(
//                 child: Divider(
//                   endIndent: 22,
//                   indent: 22,
//                   color: AppColors.dividerColor900,
//                 ),
//               ),
//               SliverPadding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 22,
//                   vertical: 10,
//                 ),
//                 sliver: SliverToBoxAdapter(
//                   child: getSearchBox(context),
//                 ),
//               ),
//               SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   childCount: 10,
//                   (context, index) {
//                     return const BarberShopList(barberShopListState: ,);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getSearchBox(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 59,
//       decoration: BoxDecoration(
//         border: Border.all(
//           width: 1,
//           color: AppColors.cardWhite,
//         ),
//         borderRadius: BorderRadius.circular(47),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(right: 15),
//         child: Row(
//           children: [
//             const FaIcon(
//               FontAwesomeIcons.search,
//               size: 20,
//             ),
//             const SizedBox(
//               width: 7,
//             ),
//             Text(
//               'جستجوی نام آرایشگاه',
//               style: Theme.of(context).textTheme.displayMedium,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
