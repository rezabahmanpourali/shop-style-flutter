import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BarberShopListPage extends StatefulWidget {
  const BarberShopListPage({super.key});

  @override
  State<BarberShopListPage> createState() => _BarberShopListPageState();
}

class _BarberShopListPageState extends State<BarberShopListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  'آرایشگاه ها',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SliverToBoxAdapter(
                child: Divider(
                  endIndent: 22,
                  indent: 22,
                  color: AppColors.dividerColor900,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                    left: 29, right: 15, top: 16, bottom: 10),
                sliver: SliverToBoxAdapter(
                  child: getSearchBox(context),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) {
                    return const BarberShopList();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSearchBox(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 59,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.cardWhite,
        ),
        borderRadius: BorderRadius.circular(47),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.search,
              size: 20,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              'جستجوی نام آرایشگاه',
              style: Theme.of(context).textTheme.displayMedium,
            )
          ],
        ),
      ),
    );
  }
}

class BarberShopList extends StatelessWidget {
  const BarberShopList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: AppColors.dividerColor900,
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 22, right: 22, top: 16, bottom: 16),
          child: Row(
            children: [
              Container(
                width: 66,
                height: 66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/images/uuacu.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                'نام آرایشگاه',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/images/Vector (1).svg',
                height: 10,
                width: 5,
                color: AppColors.reserveContaner,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
