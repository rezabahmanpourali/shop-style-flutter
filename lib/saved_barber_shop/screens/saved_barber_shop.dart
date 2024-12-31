import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/home/widgets/widgets/card_item.dart';

class SavedBarberShop extends StatefulWidget {
  const SavedBarberShop({super.key});

  @override
  State<SavedBarberShop> createState() => _SavedBarberShopState();
}

class _SavedBarberShopState extends State<SavedBarberShop> {
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<BarberShopController>(context, listen: false)
  //       .fetchBarberShops();
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(),
              SliverPadding(
                padding: EdgeInsets.only(right: 22, bottom: 32),
                sliver: SliverToBoxAdapter(
                  child: Text('آرایشگاه های ذخیره شده'),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(right: 22),
                sliver: SliverToBoxAdapter(
                  child: Text('آرایشگاه های برتر'),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Consumer<BarberShopController>(
              //     builder: (context, provider, child) {
              //       return StateManageWidget(
              //         status: provider.barberShopState,
              //         loadingWidget: () {
              //           return const Center(
              //             child: CircularProgressIndicator(),
              //           );
              //         },
              //         errorWidgetBuilder: (message, statusCode) {
              //           return Center(
              //             child: Text(provider.errorMessage),
              //           );
              //         },
              //         completedWidgetBuilder: (value) {
              //           return SizedBox(
              //             height: 242,
              //             child: Padding(
              //               padding: const EdgeInsets.only(left: 6, right: 22),
              //               child: ListView.builder(
              //                 scrollDirection: Axis.horizontal,
              //                 itemCount: provider.barberShops.length,
              //                 itemBuilder: (context, index) {
              //                   final barbershop = provider.barberShops[index];
              //                   return Padding(
              //                     padding: const EdgeInsets.only(left: 16),
              //                     child: GestureDetector(
              //                       onTap: () {
              //                         Navigator.of(context).push(
              //                           MaterialPageRoute(
              //                             builder: (context) {
              //                               return ChangeNotifierProvider<
              //                                   BarberController>(
              //                                 create: (context) =>
              //                                     BarberController(),
              //                                 child:
              //                                     const BarberShopPage(), // صفحه مقصد
              //                               );
              //                             },
              //                           ),
              //                         );
              //                       },
              //                       child:
              //                           CardItem(barberShopModel: barbershop),
              //                     ),
              //                   );
              //                 },
              //               ),
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
              SliverPadding(
                padding: EdgeInsets.only(right: 22),
                sliver: SliverToBoxAdapter(
                  child: Text('آرایشگاه های منطقه شما'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
