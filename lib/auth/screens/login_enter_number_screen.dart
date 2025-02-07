import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/screens/login_enter_password_screen.dart';
import 'package:shop_style/auth/statemanagment/auth_controller.dart';
import 'package:shop_style/auth/widgets/custom_button.dart';
import 'package:shop_style/auth/widgets/custom_textfield.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/common/widgets/text_padding.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toastification/toastification.dart';

class LoginEnterNumberPhoneScreen extends StatefulWidget {
  const LoginEnterNumberPhoneScreen({super.key});

  @override
  State<LoginEnterNumberPhoneScreen> createState() =>
      _LoginEnterNumberPhoneScreenState();
}

class _LoginEnterNumberPhoneScreenState
    extends State<LoginEnterNumberPhoneScreen> {
  final TextEditingController phoneController = TextEditingController();
  bool _navigated = false;

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
                  SliverToBoxAdapter(
                    child: TextPadding(
                      text: AppLocalizations.of(context)!.login_register,
                      textAlign: TextAlign.center,
                      topPadding: height / 6,
                      theme: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TextPadding(
                      text: AppLocalizations.of(context)!
                          .enter_phone_for_signup_or_login,
                      topPadding: height / 4,
                      theme: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.tankBlue3,
                          ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomTextfield(
                      inputType: TextInputType.phone,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                      controller: phoneController,
                      hintText:
                          AppLocalizations.of(context)!.enter_mobile_number,
                      type: TextfieldType.numberPhone,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Consumer<AuthController>(
                      builder: (context, authController, child) {
                        return StateManageWidget(
                            status: authController
                                .phoneUserState, // وضعیت شماره تلفن
                            initialWidget: () {
                              return CustomButton(
                                textButton:
                                    AppLocalizations.of(context)!.next_step,
                                topPadding: height / 25,
                                onClick: () {
                                  final phone = phoneController.text;

                                  if (phone.isEmpty) {
                                    showToast(
                                      context,
                                      '',
                                      AppLocalizations.of(context)!
                                          .please_enter_your_phone_number,
                                      ToastificationType.error,
                                    );
                                  } else if (phone.length == 11) {
                                    // فقط در صورتی که وضعیت خطا نباشد، شماره ارسال می‌شود
                                    if (authController.phoneUserState
                                            is BlocStatusInitial ||
                                        authController.phoneUserState
                                            is BlocStatusError) {
                                      authController.sendPhoneNumber(
                                          phone: phone);
                                    }
                                  } else {
                                    showToast(
                                      context,
                                      '',
                                      AppLocalizations.of(context)!
                                          .invalid_phone_number,
                                      ToastificationType.error,
                                    );
                                  }
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
                              // بررسی وضعیت خطا برای شماره تکراری
                              if (statusCode == 400) {
                                // این قسمت پیغام خطا را فقط در صورتی که شماره تکراری باشد نمایش می‌دهد
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  showToast(
                                    context,
                                    '',
                                    AppLocalizations.of(context)!
                                        .phone_number_exists_error,
                                    ToastificationType.error,
                                  );
                                });
                              }

                              // ریست کردن وضعیت شماره موبایل پس از خطا
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                authController.resetPhoneUserState();
                              });

                              // بازگرداندن دکمه برای وارد کردن مجدد شماره
                              return CustomButton(
                                textButton:
                                    AppLocalizations.of(context)!.next_step,
                                topPadding: height / 25,
                                onClick: () {
                                  final phone = phoneController.text;

                                  if (phone.isEmpty) {
                                    showToast(
                                      context,
                                      '',
                                      AppLocalizations.of(context)!
                                          .please_enter_your_phone_number,
                                      ToastificationType.error,
                                    );
                                  } else if (phone.length == 11) {
                                    // ارسال شماره موبایل مجدد
                                    authController.sendPhoneNumber(
                                        phone: phone);
                                  } else {
                                    showToast(
                                      context,
                                      '',
                                      AppLocalizations.of(context)!
                                          .invalid_phone_number,
                                      ToastificationType.error,
                                    );
                                  }
                                },
                              );
                            },
                            completedWidgetBuilder: (value) {
                              // بررسی وضعیت موفقیت‌آمیز
                              if (!_navigated) {
                                _navigated = true;
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  showToast(
                                    context,
                                    '',
                                    AppLocalizations.of(context)!
                                        .phone_number_sent_successfully,
                                    ToastificationType.success,
                                  );

                                  Navigator.of(context).pushAndRemoveUntil(
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return const LoginEnterPasswordScreen();
                                      },
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(
                                            1.0, 0.0); // شروع انیمیشن از راست
                                        const end = Offset
                                            .zero; // پایان انیمیشن در وسط صفحه
                                        const curve =
                                            Curves.easeInOut; // نوع انیمیشن

                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                        var offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ),
                                    (Route<dynamic> route) =>
                                        false, // این خط باعث می‌شود که تمام صفحات قبلی حذف شوند
                                  );
                                });
                              }

                              return const Center(
                                child: Text(
                                  '',
                                  style: TextStyle(fontSize: 16),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
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
      icon: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: icon,
      ),
      context: context,
      type: type,
      title: Text(
        title,
        textDirection: textDirection,
      ),
      description: Padding(
        padding: const EdgeInsets.only(top: 0),
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
