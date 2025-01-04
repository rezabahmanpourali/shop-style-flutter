import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/widgets/best_cart_item_party.dart';
import 'package:shop_style/common/widgets/card_item_party.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/home/widgets/widgets/card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _onRefresh() async {
    Provider.of<BarberShopController>(context, listen: false)
        .fetchBarberShops();
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      Provider.of<BarberShopController>(context, listen: false)
          .fetchBarberShops();
    });
  }

  var controller = PageController(viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: Center(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 5,
                  ),
                ),
                SliverToBoxAdapter(
                  child: getAppbar(context),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 17,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Text(
                      'سلام! {نام کاربر}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 22,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'به تازگی مشاهده کردید',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 19,
                  ),
                ),
                //آیتم های کارد
                SliverToBoxAdapter(
                  child: Consumer<BarberShopController>(
                    builder: (context, provider, child) {
                      return StateManageWidget(
                        status: provider.barberShopState,
                        loadingWidget: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorWidgetBuilder: (message, statusCode) {
                          return Center(
                            child: Text(provider.errorMessage),
                          );
                        },
                        completedWidgetBuilder: (value) {
                          return SizedBox(
                            height: 242,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 6, right: 22),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: provider.barberShops.length,
                                itemBuilder: (context, index) {
                                  final barbershop =
                                      provider.barberShops[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    // child: GestureDetector(
                                    //   onTap: () {
                                    //     // Navigator.of(context).push(
                                    //     //   MaterialPageRoute(
                                    //     //     builder: (context) =>
                                    //     //         Provider<BarberController>(
                                    //     //       create: (context) {
                                    //     //         locator
                                    //     //             .get<BarberController>()
                                    //     //             .fetchBarber();

                                    //     //         return locator
                                    //     //             .get<BarberController>();
                                    //     //       },
                                    //     //       builder: (context, child) {
                                    //     //         return const BarberShopPage();
                                    //     //       },
                                    //     //     ),
                                    //     //   ),
                                    //     // );
                                    //   },
                                    //   child:
                                    //       CardItem(barberShopModel: barbershop),
                                    // ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return ChangeNotifierProvider<
                                                  BarberController>(
                                                create: (context) =>
                                                    BarberController(),
                                                child:
                                                    const BarberShopPage(), // صفحه مقصد
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: CardItem(barbershop),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 38,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'آرایشگاه برتر منطقه شما',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 18,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 242,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 22),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BarberShopPage(),
                                  ),
                                );
                              },
                              // child: const CardItem(),
                              child: const Text('data'),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 53,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 328,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 328,
                                decoration: const BoxDecoration(
                                  color: AppColors.white2,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.purpleOpacity,
                                      // .withValues(
                                      //   alpha: 0.68,
                                      // ),
                                      offset: Offset(0, 0), // افست سایه
                                      blurRadius: 25.0, // میزان پخش سایه
                                      spreadRadius: 0.0, // میزان گسترش سایه
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 16,
                              right: 44,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset('assets/images/percentage.jpg'),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  const Text(
                                    'کله پارتی!',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.purpleOpacity,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 62,
                              left: 2,
                              right: 0,
                              child: SizedBox(
                                height: 242,
                                width: 358,
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(right: 44),
                                  itemCount: 6,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return const Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: CardItemParty(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 38,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'مدل مو های برتر  منطقه شما',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 19,
                  ),
                ),
                SliverToBoxAdapter(
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
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 38,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'دسته بندی خدمات',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 19,
                  ),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return SizedBox(
                        height:
                            height * 0.1, // تنظیم ارتفاع به نسبت ارتفاع صفحه,
                        child: CategoryItem(
                          onChange: () {
                            print('category');
                          },
                        ),
                      );
                    },
                    childCount: 3,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.1,
                    mainAxisSpacing: 2,
                    childAspectRatio: width / (height / 5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getAppbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'موقعیت شما',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Row(
                children: [
                  Text(
                    'پردیسان شهروند',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded)
                ],
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final VoidCallback onChange;
  const CategoryItem({
    super.key,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChange,
      child: Column(
        children: [
          Container(
            width: 168,
            height: 75,
            decoration: BoxDecoration(
              color: AppColors.dividerColor100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 7, right: 8),
                  child: const Text(
                    'اصلاح موی سر',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  child: Image.asset('assets/images/Subtract.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
