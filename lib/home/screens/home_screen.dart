import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_style/barber/model/barber_model.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/widgets/best_cart_item_party.dart';
import 'package:shop_style/common/widgets/card_item_party.dart';
import 'package:shop_style/common/widgets/category_item.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/home/statemanagment/home_controller.dart';
import 'package:shop_style/home/widgets/barber_shop_list_widgets.dart';
import 'package:shop_style/home/widgets/show_model_location.dart';
import 'package:shop_style/home/widgets/widgets/card_item.dart';
import 'package:shop_style/locator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _onRefresh() async {
    Provider.of<BarberShopController>(context, listen: false)
        .fetchBarberShops();
    Provider.of<BarberShopController>(context, listen: false)
        .fetchTopBarberShops();
    Provider.of<HomeController>(context, listen: false).fetchHair();
    Provider.of<HomeController>(context, listen: false).fetchCategory();
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        // ignore: use_build_context_synchronously
        Provider.of<BarberShopController>(context, listen: false)
            .fetchBarberShops();
        // ignore: use_build_context_synchronously
        Provider.of<BarberShopController>(context, listen: false)
            .fetchTopBarberShops();
        // ignore: use_build_context_synchronously
        Provider.of<HomeController>(context, listen: false).fetchHair();
        // ignore: use_build_context_synchronously
        Provider.of<HomeController>(context, listen: false).fetchCategory();
      },
    );
  }

  var controller = PageController(viewportFraction: 0.7);
  BarberShopController barberShopController =
      locator.get<BarberShopController>();
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
                  child: Selector<BarberShopController, BlocStatus>(
                    builder: (context, barberShopPage, child) {
                      if (barberShopPage is BlocStatusLoading) {
                        return const Padding(
                          padding: EdgeInsets.only(right: 22),
                          child: SizedBox(),
                        );
                      } else {
                        return getAppbar(context);
                      }
                    },
                    selector: (context, controller) =>
                        controller.barberShopState,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 17,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'سلام! {نام کاربر}',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 22,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Selector<BarberShopController, BlocStatus>(
                    builder: (context, value, child) {
                      return BarberShopListWidget(
                        title: 'به تازگی مشاهده کردید',
                        barberShopListState:
                            barberShopController.barberShopState,
                        barbreShopData: barberShopController.barberShops,
                      );
                    },
                    selector: (p0, p1) => p1.barberShopState,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 38,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Selector<BarberShopController, BlocStatus>(
                    builder: (context, value, child) {
                      return BarberShopListWidget(
                        title: 'آرایشگاه برتر منطقه شما',
                        barberShopListState:
                            barberShopController.topBarberShopState,
                        barbreShopData: barberShopController.topBarberShops,
                      );
                    },
                    selector: (p0, p1) => p1.barberShopState,
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
                                  Text(
                                    'کله پارتی!',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
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
                              child: Selector<HomeController, BlocStatus>(
                                selector: (context, controller) =>
                                    controller.hairStatus,
                                builder: (context, hairStatus, child) {
                                  final controller =
                                      Provider.of<HomeController>(context);
                                  return StateManageWidget(
                                    status: hairStatus,
                                    loadingWidget: () {
                                      return SizedBox(
                                        height: 242,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                              width: width * 0.6,
                                              child: SmallShimer(
                                                  height: height, width: width),
                                            );
                                          },
                                        ),
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
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 16,
                              ),
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
                  child: Selector<HomeController, BlocStatus>(
                    builder: (context, hairStatus, child) {
                      final controller = Provider.of<HomeController>(context);
                      return StateManageWidget(
                        status: hairStatus,
                        loadingWidget: () {
                          return SizedBox(
                            height: 242,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width: width * 0.6,
                                  child:
                                      SmallShimer(height: height, width: width),
                                );
                              },
                            ),
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
                    selector: (context, controller) => controller.hairStatus,
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
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 16,
                              ),
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
                      return Selector<HomeController, BlocStatus>(
                        selector: (context, controller) =>
                            controller.categoryStatus,
                        builder: (context, categoryStatus, child) {
                          final controller =
                              Provider.of<HomeController>(context);

                          return StateManageWidget(
                            status: categoryStatus,
                            loadingWidget: () {
                              return SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  padding: EdgeInsets.only(bottom: 10),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      width: width * 0.5,
                                      child: CategoryShimer(
                                          height: height, width: width),
                                    );
                                  },
                                ),
                              );
                            },
                            errorWidgetBuilder: (message, statusCode) {
                              return Center(
                                child: Text(controller.errorMessage),
                              );
                            },
                            completedWidgetBuilder: (value) {
                              final categories = controller.categories[index];

                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: CategoryItem(
                                  categoryModel: categories,
                                  onChange: () {
                                    print('category');
                                  },
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    childCount:
                        context.watch<HomeController>().categories.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.1,
                    mainAxisSpacing: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 5),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.01,
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
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 15, color: AppColors.textHeader),
                      Text(
                        'موقعیت شما',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 130,
                      height: 20,
                      color: AppColors.arayeshColor,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'پردیسان، بلوار شهروند',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color: AppColors.black,
                                  ),
                            ),
                            const Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class TitleSmallShimmer extends StatelessWidget {
  const TitleSmallShimmer({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: width * 0.4,
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class TitleShimmer extends StatelessWidget {
  const TitleShimmer({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: width * 0.6,
              height: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: width * 0.3,
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class BigShimer extends StatelessWidget {
  const BigShimer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: SizedBox(
          height: height * 0.48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: width * 0.5,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: width * 0.3,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: width * 0.45,
                      height: 11,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 160,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey[300],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 50,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallShimer extends StatelessWidget {
  const SmallShimer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: SizedBox(
          height: height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: width * 0.4,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: width * 0.2,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryShimer extends StatelessWidget {
  const CategoryShimer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Container(
          height: height * 0.1,
        ),
      ),
    );
  }
}
