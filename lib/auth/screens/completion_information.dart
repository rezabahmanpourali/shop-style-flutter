import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/statemanagment/auth_controller.dart';
import 'package:shop_style/auth/widgets/custom_button.dart';
import 'package:shop_style/auth/widgets/custom_dropdown.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/common/widgets/text_padding.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toastification/toastification.dart'; // فایل لوکالیزیشن

class CompletionInformation extends StatefulWidget {
  const CompletionInformation({super.key});

  @override
  State<CompletionInformation> createState() => _CompletionInformationState();
}

class _CompletionInformationState extends State<CompletionInformation> {
  // String? selectedValue = 'زرد';
  // int selected = 0;
  // String selectedItem = ''; // متغیر برای ذخیره مقدار انتخابی
  String selectedFaceForm = ''; // فرم صورت
  String selectedHairForm = ''; // مدل مو
  String selectedEyeColor = ''; // رنگ چشم
  String selectedHairLike = ''; // مدل موی دلخواه
  bool _navigated = false;

  // تابع برای دریافت مقدار انتخابی
  // void handleItemSelected(String selectedValue) {
  //   setState(() {
  //     selectedItem = selectedValue; // مقدار انتخابی را ذخیره می‌کنیم
  //   });
  // }

  // برای فرم صورت
  void handleFaceFormSelected(String selectedValue) {
    setState(() {
      selectedFaceForm = selectedValue;
    });
  }

// برای مدل مو
  void handleHairFormSelected(String selectedValue) {
    setState(() {
      selectedHairForm = selectedValue;
    });
  }

// برای رنگ چشم
  void handleEyeColorSelected(String selectedValue) {
    setState(() {
      selectedEyeColor = selectedValue;
    });
  }

// برای مدل موی دلخواه
  void handleHairLikeSelected(String selectedValue) {
    setState(() {
      selectedHairLike = selectedValue;
    });
  }

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
                    child: Wrap(
                      alignment: WrapAlignment.start, // شروع از ابتدا
                      spacing: 4.0, // فاصله افقی بین آیتم‌ها
                      children: [
                        TextPadding(
                          text: AppLocalizations.of(context)!.forr,
                          topPadding: height / 100,
                          theme: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: AppColors.black,
                              ),
                        ),
                        TextPadding(
                          text: AppLocalizations.of(context)!.better_experience,
                          topPadding: height / 100,
                          theme: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: AppColors.tankBlue3,
                              ),
                        ),
                        TextPadding(
                          text: AppLocalizations.of(context)!
                              .in_using_the_service,
                          topPadding: height / 100,
                          theme: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: AppColors.black,
                              ),
                        ),
                        TextPadding(
                          text: AppLocalizations.of(context)!.app_name,
                          topPadding: height / 100,
                          theme: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: AppColors.tankBlue3,
                              ),
                        ),
                        TextPadding(
                          text: AppLocalizations.of(context)!.enter_information,
                          topPadding: height / 100,
                          theme: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: AppColors.black,
                              ),
                        ),
                      ],
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
                      onChanged: handleFaceFormSelected,
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
                      onChanged: handleHairFormSelected,
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
                      onChanged: handleEyeColorSelected,
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
                      onChanged: handleHairLikeSelected,
                      items: [
                        {
                          'first': AppLocalizations.of(context)!.volume_texture,
                          'second': AppLocalizations.of(context)!.layered,
                        },
                        {
                          'first':
                              AppLocalizations.of(context)!.natural_beautiful,
                          'second': AppLocalizations.of(context)!.long_wavy,
                        },
                        {
                          'first':
                              AppLocalizations.of(context)!.modern_attractive,
                          'second': AppLocalizations.of(context)!.short_chic,
                        },
                        {
                          'first': AppLocalizations.of(context)!.chic_shiny,
                          'second': AppLocalizations.of(context)!.classic_bob,
                        },
                        {
                          'first':
                              AppLocalizations.of(context)!.traditional_complex,
                          'second': AppLocalizations.of(context)!.textures,
                        },
                        {
                          'first': AppLocalizations.of(context)!.sharp_youthful,
                          'second': AppLocalizations.of(context)!.mohawk_spikes,
                        },
                        {
                          'first':
                              AppLocalizations.of(context)!.short_appealing,
                          'second': AppLocalizations.of(context)!.pixie,
                        },
                      ],
                      lableField:
                          AppLocalizations.of(context)!.preferred_hair_model,
                      topPadding: height / 40,
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Selector<AuthController, BlocStatus>(
                      selector: (context, authController) =>
                          authController.facePropertyState,
                      builder: (context, userInfoState, child) {
                        return StateManageWidget(
                          status: userInfoState,
                          initialWidget: () {
                            return CustomButton(
                              textButton: AppLocalizations.of(context)!.let_go,
                              topPadding: height / 25,
                              onClick: () {
                                // بررسی مقادیر پر نشده
                                if (selectedFaceForm.isEmpty ||
                                    selectedHairForm.isEmpty ||
                                    selectedEyeColor.isEmpty ||
                                    selectedHairLike.isEmpty) {
                                  // نمایش توست در صورتی که مقادیری پر نشده باشند
                                  showToast(
                                    context,
                                    '',
                                    AppLocalizations.of(context)!
                                        .enter_information,
                                    ToastificationType.error,
                                  );
                                  return;
                                }

                                // اگر همه فیلدها پر بودند، اطلاعات را ارسال می‌کنیم
                                context.read<AuthController>().sendFaceProperty(
                                      faceForm: selectedFaceForm,
                                      hairForm: selectedHairForm,
                                      ryeColor: selectedEyeColor,
                                      likeHair: selectedHairLike,
                                    );
                              },
                            );
                          },
                          loadingWidget: () {
                            return const Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: SpinKitCircle(
                                color: AppColors.tankBlueButton,
                                size: 50.0,
                              ),
                            );
                          },
                          errorWidgetBuilder: (message, statusCode) {
                            return const Center(
                              child: Text(
                                'مشکلی پیش آمده',
                              ),
                            );
                          },
                          completedWidgetBuilder: (value) {
                            // بررسی وضعیت موفقیت‌آمیز
                            if (!_navigated) {
                              _navigated = true;
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                // نمایش توست برای موفقیت‌آمیز بودن عملیات
                                showToast(
                                  context,
                                  '',
                                  AppLocalizations.of(context)!
                                      .information_is_secure,
                                  ToastificationType.success,
                                );

                                // هدایت به صفحه جدید بعد از نمایش توست
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MyApp(), // صفحه اصلی
                                  ),
                                );
                              });
                            }

                            return const Center(
                              child: Text(
                                '',
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                          },
                        );
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
    return Consumer<GlobalController>(
      builder: (context, globalController, child) {
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(360)),
                      border: Border.all(color: AppColors.tankBlue1, width: 3),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/teenyicons_face-id-solid.svg',
                        color: AppColors.tankBlue1,
                      ),
                    ),
                  ),
                  SizedBox(width: width / 20),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: globalController.language == 'en' ||
                          globalController.language == 'tr'
                      ? 150
                      : 0,
                  left: globalController.language == 'en' ||
                          globalController.language == 'tr'
                      ? 0
                      : 150,
                ),
                child: TextPadding(
                  text: AppLocalizations.of(context)!.face_scan_info,
                  theme: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: AppColors.textHeader,
                        fontSize: 12,
                      ),
                ),
              ),
              SizedBox(height: height / 100),
              Row(
                children: [
                  TextPadding(
                    text: AppLocalizations.of(context)!.note,
                    theme: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Expanded(
                    child: TextPadding(
                      text: AppLocalizations.of(context)!.information_is_secure,
                      theme:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.black,
                              ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void showToast(BuildContext context, String title, String description,
      ToastificationType type) {
    final String currentLanguage = context.read<GlobalController>().language;

    // تعیین جهت متن (LTR یا RTL)
    TextDirection textDirection =
        (currentLanguage == 'en' || currentLanguage == 'tr')
            ? TextDirection.ltr
            : TextDirection.rtl;

    // تعیین آیکون و رنگ‌ها برای موفقیت یا خطا
    Icon icon = type == ToastificationType.error
        ? const Icon(
            Icons.close,
            color: AppColors.toastRed,
            size: 40,
            weight: 25,
          )
        : const Icon(
            Icons.check,
            color: AppColors.toastLineGreen,
            size: 40,
            grade: 5,
          );

    Color backgroundColor = type == ToastificationType.success
        ? AppColors.toastGreen
        : type == ToastificationType.info
            ? Colors.blue
            : type == ToastificationType.warning
                ? Colors.orange
                : AppColors.toastBottonRed;

    Color textColor = type == ToastificationType.success
        ? AppColors.toastLineGreen
        : AppColors.toastRed;

    // نمایش Toast
    toastification.show(
      closeOnClick: false,
      closeButtonShowType: CloseButtonShowType.none,
      icon: icon,
      context: context,
      type: type,
      title: Text(
        title,
        textDirection: textDirection,
      ),
      description: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          description,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
          textDirection: textDirection,
        ),
      ),
      primaryColor: Colors.white,
      autoCloseDuration: const Duration(seconds: 3),
      progressBarTheme: ProgressIndicatorThemeData(
        color: type == ToastificationType.success
            ? AppColors.toastLineGreen
            : type == ToastificationType.info
                ? Colors.blue
                : type == ToastificationType.warning
                    ? Colors.orange
                    : AppColors.toastRed,
        linearTrackColor: Colors.transparent,
      ),
      showProgressBar: true,
      direction: textDirection,
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
    );
  }
}
