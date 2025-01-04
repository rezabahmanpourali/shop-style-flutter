import 'package:flutter/material.dart';
import 'package:shop_style/barber/model/barber_model.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/widgets/barber_artists.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomScrollView(
              slivers: [
                const HeaderScreen(),
                SliverToBoxAdapter(
                  child: Text(
                    'انتخاب آرایشگر',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 22)),
                SliverGrid(
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
                          borderColor: _selectedIndex == index
                              ? AppColors.purple
                              : AppColors.cardWhite,
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
              ],
            ),
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
              builder: (context) => const ReservePage3(),
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
              // child: BarberArtists(
              //   barberModel: ,
              // ),
              child: Text('data'),
            ),
          ),
        ),
      ],
    );
  }
}
