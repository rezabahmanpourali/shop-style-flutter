import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/home/widgets/banner.dart';
import 'package:shop_style/home/widgets/category_item.dart';
import 'package:shop_style/home/widgets/list_tile.dart';
import 'package:shop_style/home/widgets/show_more_text.dart';
import 'package:shop_style/home/widgets/widgets/sections/kale_party.dart';
import 'package:shop_style/home/widgets/widgets/sections/map_in_priducts.dart';
import 'package:shop_style/home/widgets/widgets/sections/map_in_top.dart';
import 'package:shop_style/home/widgets/widgets/sections/terends_week.dart';
import 'package:shop_style/home/widgets/widgets/sections/top_hairstyles.dart';
import 'package:shop_style/home/widgets/widgets/sections/top_products.dart';
import 'package:shop_style/home/widgets/widgets/sections/top_shop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = PageController(viewportFraction: 0.7);
  int _selectedIndex = 2; // متغیر برای ذخیره آیتم انتخاب‌شده

  final List<Widget> _pages = [
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  // تابع برای تغییر صفحه در هنگام تغییر انتخاب در باتم نویگیشن
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<double> itemWidth = [94, 127, 136];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
      body: SafeArea(
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
                        Icons.shopping_bag,
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            'موقعیت شما',
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'IRANYekanFn',
                                color: AppColors.textHeader),
                          ),
                          Text(
                            'پردیسان شهروند',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.menu,
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
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22, right: 22),
                      child: Container(
                        width: 358,
                        height: height * 0.06,
                        decoration: const BoxDecoration(
                          color: AppColors.searchBoxColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(47),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'جستوجو مدل یا ارایشگاه',
                                style: TextStyle(
                                  color: AppColors.searchBoxEvents,
                                  fontSize: 12,
                                ),
                              ),
                              Icon(
                                Icons.search,
                                color: AppColors.searchBoxColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 21,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'دسته بندی خدمات',
                        style: TextStyle(
                          color: AppColors.black,
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
                  height: 12,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 7, right: 22),
                  child: SizedBox(
                    height: 43,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemWidth.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: CategoryItem(
                            width: itemWidth[index],
                            isSelected: _selectedIndex == index,
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              BannerWidget(
                controller: controller,
                itemCount: 3,
              ),
              const SliverToBoxAdapter(
                child: TopHairstyles(),
              ),
              const SliverToBoxAdapter(
                child: TopShop(),
              ),
              const SliverToBoxAdapter(
                child: KaleParty(),
              ),
              const SliverToBoxAdapter(child: MapInShop()),
              const SliverToBoxAdapter(child: TopProducts()),
              const SliverToBoxAdapter(child: MapInProducts()),
              const SliverToBoxAdapter(child: TerendWeek()),
              const SliverToBoxAdapter(
                child: Divider(
                  color: AppColors.dividerColor900,
                  thickness: 2,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
              const SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      size: 10,
                    ),
                    Text(
                      'بازگشت به بالا',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.bgBlack,
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              //call button
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 27),
                  child: Row(
                    children: [
                      Container(
                        width: 49,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            width: 1,
                            color: AppColors.bgBlack,
                          ),
                        ),
                        child: const Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'تماس',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.bgBlack,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(right: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'پشتیبانی 24 ساعته',
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.greyTextFooter,
                              ),
                            ),
                            Text(
                              'تماس با پشتیبانی',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.bgBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.headset_mic_outlined),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              //download button
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 27),
                  child: Row(
                    children: [
                      Container(
                        width: 49,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.bgBlack,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'دانلود',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.whiteTextFooter,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(right: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'دانلود اپلیکیشن',
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.greyTextFooter,
                              ),
                            ),
                            Text(
                              'نام وبسایت',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.bgBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.greyContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //list Tile 1
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomListTile(
                  text: 'خدمات مشتریان',
                  onTap: () {},
                ),
              ),
              //list Tile 2
              SliverToBoxAdapter(
                child: CustomListTile(
                  text: 'راهنمای ثبت آرایشگاه',
                  onTap: () {},
                ),
              ),
              //list Tile 3
              SliverToBoxAdapter(
                child: CustomListTile(
                  text: 'راهنمای رزرو نوبت از آرایشگاه',
                  onTap: () {},
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: AppColors.dividerColor900,
                        width: 2,
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 22, right: 22, top: 20),
                    child: Row(
                      children: [
                        Icon(Icons.textsms_sharp),
                        Icon(Icons.textsms_sharp),
                        Icon(Icons.textsms_sharp),
                        Spacer(),
                        Text(
                          '!همراه ما باشید',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.bgBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 28,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '!از جدیدترین تخفیف ها باخبر بشید',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.bgBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 22, right: 22, top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 49,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: AppColors.greyButton500,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'ثبت',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.whiteTextFooter,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(right: 7, left: 30),
                        alignment: Alignment.centerRight,
                        width: 275,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: AppColors.greyCategory,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: const Text('ایمیل شما'),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Divider(
                  color: AppColors.dividerColor100,
                  thickness: 2,
                  endIndent: 22,
                  indent: 22,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22, top: 15, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('چرا {نام وبسایت} بهترین انتخابه؟'),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: ShowMoreText(),
              ),
              const SliverToBoxAdapter(
                child: Divider(
                  color: AppColors.dividerColor900,
                  thickness: 2,
                  endIndent: 22,
                  indent: 22,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              const SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle_outline),
                    Text('WebSite Name 2024'),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 2.0,
            color: AppColors.dividerColor900,
          ),
          BottomNavigationBar(
            backgroundColor: AppColors.navigationColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'حساب کاربری',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo_outlined),
                label: 'رزرو شده ها',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                label: 'جستجو آرایشگاه',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'خانه',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
