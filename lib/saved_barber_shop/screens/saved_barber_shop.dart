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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22, bottom: 32),
                sliver: SliverToBoxAdapter(
                  child: Text('آرایشگاه های ذخیره شده'),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: SavedCardItems(),
                      );
                    },
                  ),
                ),
              ),

              const SliverPadding(
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

class SavedCardItems extends StatelessWidget {
  const SavedCardItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 214,
          height: 242,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: AppColors.cardWhite),
          ),
          child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                  child: Image.network(
                    // barberShopModel.images!.isNotEmpty
                    //     ? barberShopModel.images![0].url!
                    //     : 'assets/images/1.jpeg',
                    '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12, top: 8, left: 12),
                          child: Text('asdasdasd',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: 14,
                                  )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 12,
                            top: 5,
                            left: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.star),
                              Text(
                                '4.9',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Text('(55)'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12, left: 12),
                          child: Text(
                            'قم، پردیسان',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              right: 8, bottom: 12, left: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColors.cardWhite,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          height: 23,
                          width: 74,
                          child: Center(
                            child: Text('آرایشگاه',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      fontSize: 14,
                                      color: AppColors.black,
                                    )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
