import 'package:flutter/material.dart';
import 'package:shop_style/barber/widgets/barber_artist.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/reserve_page3/screens/reserve_page3.dart';

class ResevePage2 extends StatefulWidget {
  const ResevePage2({super.key});

  @override
  State<ResevePage2> createState() => _ResevePage2State();
}

class _ResevePage2State extends State<ResevePage2> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              const SliverPadding(
                padding: EdgeInsets.only(left: 22, right: 22, bottom: 0),
                sliver: SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColors.arayeshColor,
                  actions: [
                    Icon(Icons.close),
                    Spacer(),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22, bottom: 22),
                  child: Text(
                    'انتخاب آرایشگر',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 6,
                    (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: BarberSelectArtist(
                          // بررسی اینکه آیا این آیتم انتخاب شده است یا نه
                          borderColor: _selectedIndex == index
                              ? AppColors.purple // بنفش برای انتخاب شده
                              : AppColors.cardWhite, // سفید برای انتخاب نشده
                        ),
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // دو ستون
                    childAspectRatio: 1, // نسبت عرض به ارتفاع برای هر آیتم
                    crossAxisSpacing: 1.0, // فاصله افقی بین آیتم‌ها
                    mainAxisSpacing: 10.0, // فاصله عمودی بین آیتم‌ها
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

class BarberSelectArtist extends StatelessWidget {
  final Color borderColor;

  const BarberSelectArtist({
    super.key,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ReservePage3(),
            ));
          },
          child: Container(
            width: 172,
            height: 172,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: borderColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 38, right: 20), // فاصله 20 پیکسل از همه طرف
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: SizedBox(
                          height: 120,
                          width: 91,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                child: SizedBox(
                                  width: 64,
                                  height: 64,
                                  child: Image.asset('assets/images/img8.png'),
                                ),
                              ),
                              Positioned(
                                top: 58,
                                left: 19,
                                right: 1,
                                child: Container(
                                  width: 44,
                                  height: 19,
                                  decoration: const BoxDecoration(
                                    color: AppColors.white2,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(24),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('4.5'),
                                        Icon(Icons.star),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 0,
                                left: 20,
                                right: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'نام آرایشگر',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      'متخصص رنگ مو',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textHeader,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
