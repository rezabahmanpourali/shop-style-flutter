import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/screens/basic_information_screen.dart';
import 'package:shop_style/auth/widgets/OTPWidget.dart';
import 'package:shop_style/auth/widgets/custom_button.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/common/widgets/text_padding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_style/auth/statemanagment/auth_controller.dart';
import 'package:shop_style/main.dart';
import 'package:toastification/toastification.dart';
import 'dart:async'; // اضافه کردن این برای تایمر

bool isErrorToastShown = false;
bool isNavigationDone = false;

class LoginEnterPasswordScreen extends StatefulWidget {
  const LoginEnterPasswordScreen({super.key});

  @override
  State<LoginEnterPasswordScreen> createState() =>
      _LoginEnterPasswordScreenState();
}

class _LoginEnterPasswordScreenState extends State<LoginEnterPasswordScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();

  @override
  void initState() {
    super.initState();
    final authController = Provider.of<AuthController>(context, listen: false);
    authController.startOtpTimer(); // شروع تایمر بلافاصله پس از ورود به صفحه
  }

  @override
  void dispose() {
    final authController = Provider.of<AuthController>(context, listen: false);
    authController.cancelOtpTimer(); // متوقف کردن تایمر هنگام خروج از صفحه
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final authController = Provider.of<AuthController>(context, listen: true);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 15),
        child: Consumer<GlobalController>(
          builder: (context, globalController, child) {
            return Directionality(
              textDirection: globalController.language == 'fa' ||
                      globalController.language == 'ar'
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextPadding(
                          text: AppLocalizations.of(context)!
                              .enter_verification_code,
                          topPadding: height / 10,
                          theme: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 24,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextPadding(
                            text: authController.phoneSaved,
                            topPadding: height / 100,
                            theme: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: AppColors.tankBlue3,
                                  fontSize: 12,
                                ),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        TextPadding(
                          text: AppLocalizations.of(context)!
                              .verification_code_sent,
                          topPadding: height / 100,
                          theme: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: AppColors.tankBlue3,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: height * 0.04,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: OTPWidget(
                        controllers: [
                          controller1,
                          controller2,
                          controller3,
                          controller4,
                          controller5,
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: height * 0.28,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // نمایش زمان باقی‌مانده
                        Text(
                          "زمان باقی‌مانده: ${authController.timeRemaining}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // اگر تایمر صفر شد، دکمه را نمایش بده
                        if (authController.timeRemaining == 0 &&
                            authController.canRequestOtpAgain) ...[
                          ElevatedButton(
                            onPressed: () {
                              authController
                                  .requestOtpAgain(); // درخواست دوباره OTP
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              iconColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // گوشه‌های گرد
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 20), // فضای داخلی دکمه
                              shadowColor: Colors.blueAccent, // رنگ سایه
                              elevation: 5, // ارتفاع سایه
                            ),
                            child: const Text(
                              "ارسال دوباره OTP",
                              style: TextStyle(
                                fontSize: 16, // اندازه متن
                                fontWeight: FontWeight.bold, // ضخامت متن
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  // SliverToBoxAdapter(
                  //   child: Consumer<AuthController>(
                  //     builder: (context, authController, child) {
                  //       return StateManageWidget(
                  //         status: authController.phoneVerificationState,
                  //         initialWidget: () {
                  //           return CustomButton(
                  //             textButton:
                  //                 AppLocalizations.of(context)!.next_step,
                  //             topPadding: height / 30,
                  //             onClick: () {
                  //               final otp = controller1.text +
                  //                   controller2.text +
                  //                   controller3.text +
                  //                   controller4.text +
                  //                   controller5.text;
                  //               final phone = authController.phoneSaved;

                  //               if (otp.isEmpty) {
                  //                 showToast(
                  //                   context,
                  //                   '',
                  //                   'لطفا OTP را وارد کنید',
                  //                   ToastificationType.error,
                  //                 );
                  //               } else if (otp.length == 5) {
                  //                 authController.verifyPhoneNumber(
                  //                   phone: phone,
                  //                   otp: otp,
                  //                 );
                  //               } else {
                  //                 showToast(
                  //                   context,
                  //                   '',
                  //                   'OTP نامعتبر است',
                  //                   ToastificationType.error,
                  //                 );
                  //               }
                  //             },
                  //           );
                  //         },
                  //         loadingWidget: () {
                  //           return const Padding(
                  //             padding: EdgeInsets.only(top: 20.0),
                  //             child: SpinKitCircle(
                  //               color: AppColors.tankBlueButton,
                  //               size: 50.0,
                  //             ),
                  //           );
                  //         },
                  //         errorWidgetBuilder: (message, statusCode) {
                  //           // بررسی وضعیت خطا برای شماره تکراری
                  //           if (statusCode == 400 && !isErrorToastShown) {
                  //             WidgetsBinding.instance.addPostFrameCallback((_) {
                  //               showToast(
                  //                 context,
                  //                 '',
                  //                 'کد اشتباه است',
                  //                 ToastificationType.error,
                  //               );

                  //               setState(() {
                  //                 isErrorToastShown = true;
                  //               });
                  //             });
                  //           }

                  //           return CustomButton(
                  //             textButton:
                  //                 AppLocalizations.of(context)!.next_step,
                  //             topPadding: height / 30,
                  //             onClick: () {
                  //               final otp = controller1.text +
                  //                   controller2.text +
                  //                   controller3.text +
                  //                   controller4.text +
                  //                   controller5.text;
                  //               final phone = authController.phoneSaved;

                  //               if (otp.isEmpty) {
                  //                 showToast(
                  //                   context,
                  //                   '',
                  //                   'OTP را وارد کنید',
                  //                   ToastificationType.error,
                  //                 );
                  //               } else if (otp.length == 5) {
                  //                 authController.verifyPhoneNumber(
                  //                   phone: phone,
                  //                   otp: otp,
                  //                 );
                  //               } else {
                  //                 showToast(
                  //                   context,
                  //                   '',
                  //                   'OTP نامعتبر است',
                  //                   ToastificationType.error,
                  //                 );
                  //               }
                  //             },
                  //           );
                  //         },
                  //         completedWidgetBuilder: (value) {
                  //           if (authController.phoneVerificationState
                  //               is BlocStatusCompleted) {
                  //             WidgetsBinding.instance.addPostFrameCallback((_) {
                  //               Future.delayed(const Duration(seconds: 1), () {
                  //                 // بررسی اگر پیام "User already logged in" باشد
                  //                 if (authController.phoneVerificationResponse
                  //                         ?.data['message'] ==
                  //                     'User already logged in') {
                  //                   // هدایت به صفحه MyApp
                  //                   Navigator.of(context).pushAndRemoveUntil(
                  //                     MaterialPageRoute(
                  //                       builder: (context) =>
                  //                           MyApp(), // صفحه مورد نظر خود را اینجا وارد کنید
                  //                     ),
                  //                     (Route<dynamic> route) => false,
                  //                   );
                  //                 } else {
                  //                   // هدایت به صفحه بعد در صورت موفقیت
                  //                   Navigator.of(context).pushAndRemoveUntil(
                  //                     PageRouteBuilder(
                  //                       pageBuilder: (context, animation,
                  //                           secondaryAnimation) {
                  //                         return const BasicInformationScreen();
                  //                       },
                  //                       transitionsBuilder: (context, animation,
                  //                           secondaryAnimation, child) {
                  //                         const begin = Offset(1.0, 0.0);
                  //                         const end = Offset.zero;
                  //                         const curve = Curves.easeInOut;

                  //                         var tween = Tween(
                  //                                 begin: begin, end: end)
                  //                             .chain(CurveTween(curve: curve));
                  //                         var offsetAnimation =
                  //                             animation.drive(tween);

                  //                         return SlideTransition(
                  //                           position: offsetAnimation,
                  //                           child: child,
                  //                         );
                  //                       },
                  //                     ),
                  //                     (Route<dynamic> route) => false,
                  //                   );
                  //                 }
                  //               });
                  //             });
                  //           }

                  //           return const Center(
                  //             child: Text(''),
                  //           );
                  //         },
                  //       );
                  //     },
                  //   ),
                  // ),

                  SliverToBoxAdapter(
                    child: Selector<AuthController, BlocStatus>(
                      selector: (context, authController) =>
                          authController.phoneVerificationState,
                      builder: (context, phoneVerificationState, child) {
                        return StateManageWidget(
                          status: phoneVerificationState,
                          initialWidget: () {
                            return CustomButton(
                              textButton:
                                  AppLocalizations.of(context)!.next_step,
                              topPadding: height / 30,
                              onClick: () {
                                final otp = controller1.text +
                                    controller2.text +
                                    controller3.text +
                                    controller4.text +
                                    controller5.text;
                                final phone = authController.phoneSaved;

                                if (otp.isEmpty) {
                                  showToast(
                                    context,
                                    '',
                                    'لطفا OTP را وارد کنید',
                                    ToastificationType.error,
                                  );
                                } else if (otp.length == 5) {
                                  authController.verifyPhoneNumber(
                                    phone: phone,
                                    otp: otp,
                                  );
                                } else {
                                  showToast(
                                    context,
                                    '',
                                    'OTP نامعتبر است',
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
                            if (statusCode == 400 && !isErrorToastShown) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                showToast(
                                  context,
                                  '',
                                  'کد اشتباه است',
                                  ToastificationType.error,
                                );

                                setState(() {
                                  isErrorToastShown = true;
                                });
                              });
                            }

                            return CustomButton(
                              textButton:
                                  AppLocalizations.of(context)!.next_step,
                              topPadding: height / 30,
                              onClick: () {
                                final otp = controller1.text +
                                    controller2.text +
                                    controller3.text +
                                    controller4.text +
                                    controller5.text;
                                final phone = authController.phoneSaved;

                                if (otp.isEmpty) {
                                  showToast(
                                    context,
                                    '',
                                    'OTP را وارد کنید',
                                    ToastificationType.error,
                                  );
                                } else if (otp.length == 5) {
                                  authController.verifyPhoneNumber(
                                    phone: phone,
                                    otp: otp,
                                  );
                                } else {
                                  showToast(
                                    context,
                                    '',
                                    'OTP نامعتبر است',
                                    ToastificationType.error,
                                  );
                                }
                              },
                            );
                          },
                          completedWidgetBuilder: (value) {
                            if (phoneVerificationState is BlocStatusCompleted) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  // بررسی اگر پیام "User already logged in" باشد
                                  if (authController.phoneVerificationResponse
                                          ?.json['message'] ==
                                      'User already logged in') {
                                    // هدایت به صفحه MyApp
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => MyApp(),
                                      ),
                                      (Route<dynamic> route) => false,
                                    );
                                  } else {
                                    // هدایت به صفحه بعد در صورت موفقیت
                                    Navigator.of(context).pushAndRemoveUntil(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return const BasicInformationScreen();
                                        },
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = Offset(1.0, 0.0);
                                          const end = Offset.zero;
                                          const curve = Curves.easeInOut;

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
                                      (Route<dynamic> route) => false,
                                    );
                                  }
                                });
                              });
                            }

                            return const Center(
                              child: Text(''),
                            );
                          },
                        );
                      },
                    ),
                  )
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
