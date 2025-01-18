import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/model/barber_model.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/barber_artists.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/reserve_page3/screens/reserve_page3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class ResevePage2 extends StatefulWidget {
  const ResevePage2({super.key});

  @override
  State<ResevePage2> createState() => _ResevePage2State();
}

class _ResevePage2State extends State<ResevePage2> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
      body: Consumer<GlobalController>(
        builder: (context, globallController, child) {
          return Directionality(
            textDirection: globallController.language == 'fa' ||
                    globallController.language == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: CustomScrollView(
                  slivers: [
                    const HeaderScreen(),
                    SliverToBoxAdapter(
                      child: Text(
                        AppLocalizations.of(context)!.select_barber,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SliverPadding(
                      padding: EdgeInsets.only(top: 22),
                    ),
                    Selector<BarberController, BlocStatus>(
                      builder: (context, barberState, child) {
                        return StateManageWidget(
                          status: barberState,
                          loadingWidget: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorWidgetBuilder: (message, statusCode) {
                            return Center(
                              child: Text(message.toString()),
                            );
                          },
                          completedWidgetBuilder: (value) {
                            return SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                childCount: value.length + 1,
                                (context, index) {
                                  if (index == 0) {
                                    return BarberSelectArtist(
                                      isSpecial: true, // نشان دادن گزینه ویژه
                                      barberModel:
                                          BarberModel(), // مدل خالی برای گزینه ویژه
                                      borderColor: _selectedIndex == index
                                          ? AppColors.purple
                                          : AppColors.cardWhite,
                                    );
                                  } else {
                                    // در غیر این صورت، آرایشگرهای واقعی را نمایش می‌دهیم
                                    int realBarberIndex =
                                        index - 1; // برای جبران ایندکس 0
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedIndex = index;
                                        });
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => ReservePage3(
                                              barberModel:
                                                  value[realBarberIndex]),
                                        ));
                                      },
                                      child: BarberSelectArtist(
                                        isSpecial: false,
                                        barberModel: value[realBarberIndex],
                                        borderColor: _selectedIndex == index
                                            ? AppColors.purple
                                            : AppColors.cardWhite,
                                      ),
                                    );
                                  }
                                },
                              ),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.82,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                              ),
                            );
                          },
                        );
                      },
                      selector: (context, controller) =>
                          controller.barberStatus,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BarberSelectArtist extends StatelessWidget {
  final BarberModel barberModel;
  final Color borderColor;
  final bool isSpecial;

  const BarberSelectArtist({
    super.key,
    required this.borderColor,
    required this.isSpecial,
    required this.barberModel,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ReservePage3(
                  barberModel: barberModel,
                ),
              ));
            },
            child: Container(
              width: width * 0.45,
              height: height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 2,
                  color: borderColor,
                ),
              ),
              child: isSpecial
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 22),
                          child: SvgPicture.asset(
                              'assets/images/fluent_people-community-20-regular.svg'),
                        ),
                        Text(
                          AppLocalizations.of(context)!.any_barber,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0, top: 5),
                          child: Text(
                            textAlign: TextAlign.center,
                            AppLocalizations.of(context)!
                                .with_this_option_random_barber,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontSize: 10,
                                ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.18,
                          width: width * 0.25,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 0,
                                child: SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: ClipOval(
                                    child: barberModel.images != null &&
                                            barberModel.images!.isNotEmpty
                                        ? Image.network(
                                            barberModel.images![0].url ??
                                                'assets/images/img8.png',
                                            fit: BoxFit.cover,
                                            width: 75,
                                            height: 75,
                                          )
                                        : Image.asset(
                                            'assets/images/img8.png',
                                            fit: BoxFit.cover,
                                            width: 75,
                                            height: 75,
                                          ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 60,
                                left: 10,
                                child: Container(
                                  width: 82,
                                  height: 19,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: AppColors.cardWhite,
                                    ),
                                    color: AppColors.white2,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(24)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '4.5',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                              fontSize: 12,
                                            ),
                                      ),
                                      const Icon(Icons.star, size: 11),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        width: 2,
                                        height: 2,
                                        decoration: const BoxDecoration(
                                          color: AppColors.textSearchColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.yearss,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                              fontSize: 10,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 82,
                                left: 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      barberModel.barberName!,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            fontSize: 14,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'متخصص رنگ مو',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                            fontSize: 10,
                                            color: AppColors.textHeader,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                    Text(
                                      '125,000 تومان',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                            fontSize: 16,
                                            color: AppColors.textHeader,
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
        ],
      ),
    );
  }
}
