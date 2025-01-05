import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/widgets/best_cart_item_party.dart';
import 'package:shop_style/common/widgets/card_item_party.dart';
import 'package:shop_style/common/widgets/category_item.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/home/statemanagment/home_controller.dart';
import 'package:shop_style/home/widgets/show_model_location.dart';
import 'package:shop_style/home/widgets/widgets/card_item.dart';
import 'package:shop_style/locator.dart';

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
      Provider.of<BarberShopController>(context, listen: false)
          .fetchBarberShops();
      Provider.of<HomeController>(context, listen: false).fetchHair();
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
                  child: Consumer<BarberShopController>(
                    builder: (context, controller, child) {
                      return StateManageWidget(
                        status: controller.barberShopState,
                        loadingWidget: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorWidgetBuilder: (message, statusCode) {
                          return Center(
                            child: Text(controller.errorMessage),
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
                                itemCount: controller.barberShops.length,
                                itemBuilder: (context, index) {
                                  final barberShop =
                                      controller.barberShops[index];
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
                                      child: CardItem(barberShop),
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
                              child: Consumer<HomeController>(
                                builder: (context, controller, child) {
                                  return StateManageWidget(
                                    status: controller.hairStatus,
                                    loadingWidget: () {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                    errorWidgetBuilder: (message, statusCode) {
                                      return Center(
                                        child: Text(controller.errorMessage),
                                      );
                                    },
                                    completedWidgetBuilder: (value) {
                                      return SizedBox(
                                        height: 242,
                                        width: 358,
                                        child: ListView.builder(
                                          padding:
                                              const EdgeInsets.only(right: 44),
                                          itemCount: controller.hairs.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            final hairs =
                                                controller.hairs[index];
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16),
                                              child: CardItemParty(hairs),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
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
                          style: Theme.of(context).textTheme.bodyLarge!,
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
                  child: Consumer<HomeController>(
                    builder: (context, controller, child) {
                      return StateManageWidget(
                        status: controller.hairStatus,
                        loadingWidget: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorWidgetBuilder: (message, statusCode) {
                          return Center(
                            child: Text(controller.errorMessage),
                          );
                        },
                        completedWidgetBuilder: (value) {
                          return SizedBox(
                            height: 242,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(right: 22),
                              itemCount: controller.hairs.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final hairs = controller.hairs[index];
                                return Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: BestCardItemParty(
                                    hairModel: hairs,
                                  ),
                                );
                              },
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
                          'دسته بندی خدمات',
                          style: Theme.of(context).textTheme.bodyLarge!,
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
                        height: MediaQuery.of(context).size.height *
                            0.1, // تنظیم ارتفاع به نسبت ارتفاع صفحه,
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
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 5),
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
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true, // برای کنترل ارتفاع باتم شیت
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (BuildContext context) {
                  return ShowModelLocation(
                    onSelectOption: (p0) {},
                  );
                },
              );
            },
            child: Column(
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
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
