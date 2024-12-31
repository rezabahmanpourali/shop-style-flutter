import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/widgets/best_cart_item_party.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/home/widgets/widgets/card_item.dart';

class RecentlyViewedPage extends StatefulWidget {
  const RecentlyViewedPage({super.key});

  @override
  State<RecentlyViewedPage> createState() => _RecentlyViewedPageState();
}

class _RecentlyViewedPageState extends State<RecentlyViewedPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      Provider.of<BarberShopController>(context, listen: false)
          .fetchBarberShops();
    });
  }

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
              const SliverPadding(
                padding: EdgeInsets.only(bottom: 32, right: 22),
                sliver: SliverToBoxAdapter(
                  child: Text('بازدید های اخیر'),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(bottom: 22, right: 22),
                sliver: SliverToBoxAdapter(
                  child: Text('آرایشگاه ها'),
                ),
              ),
              // Consumer<BarberShopController>(
              //   builder: (context, provider, child) {
              //     return StateManageWidget(
              //       status: provider.barberShopState,
              //       loadingWidget: () {
              //         return const SliverToBoxAdapter(
              //           child: Center(
              //             child: CircularProgressIndicator(),
              //           ),
              //         );
              //       },
              //       errorWidgetBuilder: (message, statusCode) {
              //         return SliverToBoxAdapter(
              //           child: Center(
              //             child: Text(provider.errorMessage),
              //           ),
              //         );
              //       },
              //       completedWidgetBuilder: (value) {
              //         return SliverList(
              //           delegate: SliverChildBuilderDelegate(
              //             (context, index) {
              //               final barbershop = provider.barberShops[index];
              //               return Padding(
              //                   padding: const EdgeInsets.only(left: 16),
              //                   child: CardItem(barbershop));
              //             },
              //             childCount: provider.barberShops.length,
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),
              const SliverPadding(
                padding: EdgeInsets.only(bottom: 22, right: 22),
                sliver: SliverToBoxAdapter(
                  child: Text('مدل ها'),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 32),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 242,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(right: 22),
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: BestCardItemParty(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
