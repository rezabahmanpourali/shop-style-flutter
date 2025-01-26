import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/widgets/custom_button.dart';
import 'package:shop_style/auth/widgets/custom_dropdown.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/widgets/text_padding.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class CompletionInformation extends StatefulWidget {
  const CompletionInformation({super.key});

  @override
  State<CompletionInformation> createState() => _CompletionInformationState();
}

class _CompletionInformationState extends State<CompletionInformation> {
  String? selectedValue = 'زرد';
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 15),
        child: Consumer<GlobalController>(
          builder: (context, globalController, child) {
            return Directionality(
              textDirection: globalController.language == 'fa' ||
                      globalController.language == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: CustomScrollView(
                slivers: <Widget>[
                  const HeaderScreen(),
                  SliverToBoxAdapter(
                    child: TextPadding(
                      text: AppLocalizations.of(context)!.welcome,
                      theme: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TextPadding(
                      text:
                          AppLocalizations.of(context)!.better_experience_info,
                      topPadding: height / 100,
                      theme:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.purpleOpacity,
                              ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: scanFace(height, width),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width / 2.6,
                          child: Divider(
                            thickness: 1,
                            height: height / 15,
                            color: AppColors.dividerColor900,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.orr,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.textHeader),
                        ),
                        SizedBox(
                          width: width / 2.6,
                          child: Divider(
                            thickness: 1,
                            height: height / 15,
                            color: AppColors.dividerColor900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TextPadding(
                      text: AppLocalizations.of(context)!.manual_entry_info,
                      theme: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TextPadding(
                      text: AppLocalizations.of(context)!.manual_entry_desc,
                      topPadding: height / 100,
                      theme: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: AppColors.textHeader),
                    ),
                  ),
                  //Face Shape DDM
                  SliverToBoxAdapter(
                    child: CustomDropdown(
                      items: [
                        if (globalController.language == 'fa' ||
                            globalController.language == 'ar') ...[
                          {
                            'first': AppLocalizations.of(context)!.round,
                            'second': AppLocalizations.of(context)!.roundd,
                          },
                          {
                            'first': AppLocalizations.of(context)!.square,
                            'second': AppLocalizations.of(context)!.squaree,
                          },
                          {
                            'first': AppLocalizations.of(context)!.heart,
                            'second': AppLocalizations.of(context)!.heartt,
                          },
                          {
                            'first': AppLocalizations.of(context)!.diamond,
                            'second': AppLocalizations.of(context)!.diamondd,
                          },
                          {
                            'first': AppLocalizations.of(context)!.triangle,
                            'second': AppLocalizations.of(context)!.trianglee,
                          },
                          {
                            'first': AppLocalizations.of(context)!.rectangle,
                            'second': AppLocalizations.of(context)!.rectanglee,
                          },
                        ],
                        if (globalController.language == 'en' ||
                            globalController.language == 'tr') ...[
                          {
                            'first': AppLocalizations.of(context)!.round,
                            'second': AppLocalizations.of(context)!.roundd_en,
                          },
                          {
                            'first': AppLocalizations.of(context)!.square,
                            'second': AppLocalizations.of(context)!.squaree_en,
                          },
                          {
                            'first': AppLocalizations.of(context)!.heart,
                            'second': AppLocalizations.of(context)!.heartt_en,
                          },
                          {
                            'first': AppLocalizations.of(context)!.diamond,
                            'second': AppLocalizations.of(context)!.diamondd_en,
                          },
                          {
                            'first': AppLocalizations.of(context)!.triangle,
                            'second':
                                AppLocalizations.of(context)!.trianglee_en,
                          },
                          {
                            'first': AppLocalizations.of(context)!.rectangle,
                            'second':
                                AppLocalizations.of(context)!.rectanglee_en,
                          },
                        ],
                      ],
                      lableField: AppLocalizations.of(context)!.face_form,
                      topPadding: height / 40,
                    ),
                  ),
                  //Hair Shape DDM
                  SliverToBoxAdapter(
                    child: CustomDropdown(
                      items: [
                        {
                          'first': AppLocalizations.of(context)!
                              .smooth_and_wave_free,
                          'second': AppLocalizations.of(context)!.smooth,
                        },
                        {
                          'first': AppLocalizations.of(context)!.large_waves,
                          'second': AppLocalizations.of(context)!.curly,
                        },
                        {
                          'first': AppLocalizations.of(context)!.small_curl,
                          'second': AppLocalizations.of(context)!.frizzy,
                        },
                        {
                          'first': AppLocalizations.of(context)!.slightly_wavy,
                          'second': AppLocalizations.of(context)!.wavy,
                        },
                        {
                          'first': AppLocalizations.of(context)!
                              .rough_and_coarse_texture,
                          'second': AppLocalizations.of(context)!.rough,
                        },
                      ],
                      lableField: AppLocalizations.of(context)!.hair_style,
                      topPadding: height / 40,
                    ),
                  ),
                  //Eye Color DDM
                  SliverToBoxAdapter(
                    child: CustomDropdown(
                      items: [
                        {
                          'first': AppLocalizations.of(context)!.dark_and_deep,
                          'second': AppLocalizations.of(context)!.black_eye,
                          'circleColor': AppColors.reserveContaner,
                        },
                        {
                          'first': AppLocalizations.of(context)!.warm_and_deep,
                          'second': AppLocalizations.of(context)!.brown_eye,
                          'circleColor': AppColors.brown,
                        },
                        {
                          'first': AppLocalizations.of(context)!.light_and_calm,
                          'second': AppLocalizations.of(context)!.blue_eye,
                          'circleColor': AppColors.blurshafaf,
                        },
                        {
                          'first':
                              AppLocalizations.of(context)!.attractive_and_rare,
                          'second': AppLocalizations.of(context)!.green_eye,
                          'circleColor': AppColors.greenD,
                        },
                        {
                          'first':
                              AppLocalizations.of(context)!.cold_and_mysterious,
                          'second': AppLocalizations.of(context)!.gray_eye,
                          'circleColor': AppColors.greyD,
                        },
                        {
                          'first':
                              AppLocalizations.of(context)!.yellow_and_shiny,
                          'second': AppLocalizations.of(context)!.amber_eye,
                          'circleColor': AppColors.yellowD,
                        },
                      ],
                      lableField: AppLocalizations.of(context)!.eye_color,
                      topPadding: height / 40,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomDropdown(
                      items: [
                        {
                          'first': AppLocalizations.of(context)!.round,
                          'second': AppLocalizations.of(context)!.roundd,
                        },
                        {
                          'first': AppLocalizations.of(context)!.square,
                          'second': AppLocalizations.of(context)!.squaree,
                        },
                        {
                          'first': AppLocalizations.of(context)!.heart,
                          'second': AppLocalizations.of(context)!.heartt,
                        },
                        {
                          'first': AppLocalizations.of(context)!.diamond,
                          'second': AppLocalizations.of(context)!.diamondd,
                        },
                        {
                          'first': AppLocalizations.of(context)!.triangle,
                          'second': AppLocalizations.of(context)!.trianglee,
                        },
                        {
                          'first': AppLocalizations.of(context)!.rectangle,
                          'second': AppLocalizations.of(context)!.rectanglee,
                        },
                      ],
                      lableField:
                          AppLocalizations.of(context)!.preferred_hair_model,
                      topPadding: height / 40,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomButton(
                      textButton: AppLocalizations.of(context)!.let_go,
                      topPadding: height / 20,
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ));
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MyApp(),
                          ),
                        );
                      },
                      child: TextPadding(
                        textAlign: TextAlign.center,
                        text: AppLocalizations.of(context)!.complete_later,
                        theme: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: height / 150),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget scanFace(double height, double width) {
    return Padding(
      padding: EdgeInsets.only(top: height / 40),
      child: Column(
        children: [
          Row(
            children: [
              TextPadding(
                text: AppLocalizations.of(context)!.scan_face,
                theme: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 16,
                    ),
              ),
              const Spacer(),
              Container(
                width: width / 5,
                height: height / 15,
                decoration: BoxDecoration(
                  color: AppColors.white2,
                  borderRadius: const BorderRadius.all(Radius.circular(360)),
                  border: Border.all(color: AppColors.purple, width: 3),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/teenyicons_face-id-solid.svg',
                  ),
                ),
              ),
              SizedBox(width: width / 20),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(),
            child: TextPadding(
              text: AppLocalizations.of(context)!.face_scan_info,
              theme: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppColors.textHeader,
                    fontSize: 12,
                  ),
            ),
          ),
          SizedBox(height: height / 100),
          TextPadding(
            text: AppLocalizations.of(context)!.face_scan_note,
            theme: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
