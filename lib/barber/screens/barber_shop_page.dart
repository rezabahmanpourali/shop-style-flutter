import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/View_comments/View_comments_screen.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/widgets/more_button.dart';
import 'package:shop_style/barber/widgets/time_work.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/widgets/barber_artists.dart';
import 'package:shop_style/common/widgets/scoring.dart';
import 'package:shop_style/common/widgets/service_categories.dart';
import 'package:shop_style/common/widgets/stack_widget_view.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/common/widgets/user_comment.dart';
import 'package:shop_style/reserve_page1/screens/service_selection_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BarberShopPage extends StatefulWidget {
  const BarberShopPage({super.key});

  @override
  State<BarberShopPage> createState() => _BarberShopPageState();
}

class _BarberShopPageState extends State<BarberShopPage> {
  @override
  void initState() {
    super.initState();

    // صدا زدن fetchBarber تنها در صورتی که داده‌ها بارگذاری نشده باشد
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final barberController =
          Provider.of<BarberController>(context, listen: false);
      if (barberController.barber.isEmpty) {
        barberController.fetchBarber();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 266,
                      child: Image.asset(
                        'assets/images/1.jpeg',
                      ),
                    ),
                    Positioned(
                      top: 14,
                      left: 22,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: AppColors.cardWhite,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 14,
                      right: 22,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: AppColors.cardWhite,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.bookmark,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 14,
                      right: 70,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: AppColors.cardWhite,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.shareNodes,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //خط پایین کار sizedbox رو در sliver انجام میده
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: getTitleNamePage(context),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 22, left: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'خدمات',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 15),
                      ServiceCategories(
                        onTabChange: (index) {},
                        tabs: const ['کوتاهی', 'مدل مو', 'اصلاح صورت'],
                        content: [
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index) {
                                return const StackWidgetView();
                              },
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.blue,
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: MoreButton(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const ViewCommentsScreen(),
                    // ));
                  },
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 32)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: Text(
                    'اعضای آرایشگاه',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: Consumer<BarberController>(
                  builder: (context, provider, child) {
                    return StateManageWidget(
                      status: provider.barberStatus,
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
                          height: 140,
                          child: CustomScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            slivers: [
                              SliverPadding(
                                padding: const EdgeInsets.only(right: 22),
                                sliver: SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      final barber = provider.barber[index];
                                      return BarberArtists(barberModel: barber);
                                    },
                                    childCount: provider.barber.length,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'دیدگاه ها',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star_border),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '4.5',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '(55)',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(
                        height: 1,
                        color: AppColors.dividerColor900,
                        indent: 22,
                        endIndent: 22,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 550,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: UserComment(),
                      );
                    },
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 22)),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ViewCommentsScreen(),
                    ));
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: AppColors.cardWhite,
                      ),
                      borderRadius: BorderRadius.circular(48),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'مشاهده همه',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 32)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'توضیحات',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        textAlign: TextAlign.right,
                        'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.black),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'خواندن همه',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 32)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'ساعت کاری',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 156,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return const TimeWork();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 32)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'موقعیت روی نقشه',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: 22),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: SizedBox(
                          height: 236,
                          width: double.infinity, // تعیین عرض به صورت خودکار
                          child: FlutterMap(
                            options: const MapOptions(
                              initialCenter: LatLng(34.571112, 50.808330),
                              initialZoom: 13,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                subdomains: const ['a', 'b', 'c'],
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: const LatLng(34.571112, 50.808330),
                                    child: Builder(
                                      builder: (context) => const Icon(
                                        Icons.location_pin,
                                        size: 40,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'آدرس آرایشگاه',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.black),
                      ),
                      Text(
                        'نمایش روی نقشه',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 40)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'آرایشگاه های نزدیک به این آرایشگاه',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 242,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, right: 22),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 16),
                          // child: CardItem(),
                          child: Text('data'),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 40)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'آرایشگاه های نزدیک شما',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 16)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 242,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, right: 22),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 16),
                          // child: CardItem(),
                          child: Text('data'),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 32)),
              const SliverToBoxAdapter(
                child: Divider(
                  color: AppColors.dividerColor100,
                  height: 1,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 7, bottom: 7, top: 7),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const ServiceSelectionScreen(),
                          ));
                        },
                        child: Container(
                          width: 179,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.bgBlack,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'رزرو نوبت',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '6 مدل مو',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSearchColor,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTitleNamePage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'نام کامل آرایشگاه',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 6),
          const Scoring(),
          const SizedBox(height: 6),
          Text(
            'فاصله حدود 5 کیلومتر . آدرس کامل آرایشگاه',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.textHeader),
          ),
          const SizedBox(height: 6),
          Text(
            'تا ساعت 21:00 باز است',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.textHeader),
          ),
          const SizedBox(height: 6),
          const Divider(
            height: 1,
            color: AppColors.dividerColor900,
            indent: 22,
            endIndent: 22,
          ),
        ],
      ),
    );
  }
}
