import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
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
    Provider.of<BarberShopController>(context, listen: false)
        .fetchBarberShops();
  }

  var controller = PageController(viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
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
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 19, right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.menu,
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'موقعیت شما',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: 'IRANYekanFn',
                                  color: AppColors.textHeader),
                            ),
                            Row(
                              children: [
                                Text(
                                  'پردیسان شهروند',
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down_rounded)
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.shopping_bag,
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 17,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'سلام!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '{نام کاربر}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
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
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 19,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'به تازگی مشاهده کردید',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
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
                                            builder: (context) =>
                                                Provider<BarberController>(
                                              create: (context) {
                                                locator
                                                    .get<BarberController>()
                                                    .fetchBarber();

                                                return locator
                                                    .get<BarberController>();
                                              },
                                              builder: (context, child) {
                                                return const BarberShopPage();
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      child:
                                          CardItem(barberShopModel: barbershop),
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
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'آرایشگاه برتر منطقه شما',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
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
                              right: 44,
                              child: SizedBox(
                                height: 242,
                                width: 358,
                                child: ListView.builder(
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
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'مدل مو های برتر  منطقه شما',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
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
                  child: SizedBox(
                    height: 242,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: ListView.builder(
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
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 38,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'دسته بندی خدمات',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
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

class BestCardItemParty extends StatelessWidget {
  const BestCardItemParty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132,
      height: 242,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: AppColors.cardWhite),
      ),
      child: Column(
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
              child: Image.asset(
                'assets/images/3.jpeg',
                fit: BoxFit.fill,
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
                  color: AppColors.white2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text('نام مدل مو'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star),
                          Text('4.4'),
                          Text('(55)'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text('نام آرایشگاه'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 74,
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          width: 1,
                          color: AppColors.cardWhite,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'مدل مو',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.categoryBlack,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItemParty extends StatelessWidget {
  const CardItemParty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132,
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
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/images1.jpg',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 50,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: AppColors.white2,
                        // .withValues(alpha: 100),
                        borderRadius: BorderRadius.all(
                          Radius.circular(27),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '22%',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.purpleOpacity,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                  color: AppColors.white2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text('نام مدل مو'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star),
                          Text('4.9'),
                          Text('(55)'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text('نام آرایشگاه'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                        children: [
                          Container(
                            width: 29,
                            height: 14,
                            decoration: const BoxDecoration(
                              color: AppColors.purpleOpacity,
                              borderRadius: BorderRadius.all(
                                Radius.circular(27),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '22%',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.cardWhiteTakhfif,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            '189,000',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            'تومان',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Row(
                        children: [
                          Text(
                            ' 139,000',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'تومان',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
