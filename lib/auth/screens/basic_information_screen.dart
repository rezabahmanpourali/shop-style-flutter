import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/screens/completion_information.dart';
import 'package:shop_style/auth/widgets/custom_button.dart';
import 'package:shop_style/auth/widgets/custom_textbox.dart';
import 'package:shop_style/auth/widgets/custom_textfield.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/common/widgets/text_padding.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/widgets/text_row_padding.dart';
import 'package:shop_style/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن
import 'package:shop_style/auth/statemanagment/auth_controller.dart'; // کنترلر وضعیت
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toastification/toastification.dart';

class BasicInformationScreen extends StatefulWidget {
  const BasicInformationScreen({super.key});

  @override
  State<BasicInformationScreen> createState() => _BasicInformationScreenState();
}

class _BasicInformationScreenState extends State<BasicInformationScreen> {
  bool hasAcceptance = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  bool isPageOpened = false;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    String phoneSaved =
        context.read<AuthController>().phoneSaved; // شماره موبایل ذخیره‌شده
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
                physics: const NeverScrollableScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: TextPadding(
                      text: AppLocalizations.of(context)!.complete_account,
                      topPadding: height / 10,
                      theme: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TextRowPadding(
                      texts: [
                        AppLocalizations.of(context)!.almost_done,
                        phoneSaved
                      ],
                      styles: [
                        TextStyle(
                          color: AppColors.black,
                          fontSize: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .fontSize,
                          fontWeight: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .fontWeight,
                        ),
                        TextStyle(
                          color: AppColors.tankBlue3,
                          fontSize: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .fontSize,
                          fontWeight: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .fontWeight,
                        ),
                      ],
                      topPadding: 10.0,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomTextfield(
                      controller: nameController,
                      topPadding: height / 50,
                      lableField: AppLocalizations.of(context)!.full_namee,
                      type: TextfieldType.none,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomTextfield(
                      controller: passwordController,
                      topPadding: height / 50,
                      lableField: AppLocalizations.of(context)!.passwordd,
                      type: TextfieldType.security,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomTextfield(
                      controller: repeatPasswordController,
                      topPadding: height / 50,
                      lableField: AppLocalizations.of(context)!.repeat_password,
                      type: TextfieldType.security,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomTextfield(
                      topPadding: height / 50,
                      lableField: AppLocalizations.of(context)!.email_optional,
                      type: TextfieldType.none,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: acceptance(height, width, context),
                  ),
                  SliverToBoxAdapter(
                    child: Selector<AuthController, BlocStatus>(
                      selector: (context, authController) =>
                          authController.registerState,
                      builder: (context, registerStatus, child) {
                        return StateManageWidget(
                          status: registerStatus,
                          initialWidget: () {
                            return CustomButton(
                              topPadding: height / 5.5,
                              textButton: AppLocalizations.of(context)!.sign_up,
                              onClick: () {
                                // بررسی مقادیر خالی
                                final name = nameController.text;
                                final lastName = lastNameController.text;
                                final password = passwordController.text;
                                final repeatPassword =
                                    repeatPasswordController.text;

                                if (!hasAcceptance) {
                                  showToast(
                                    context,
                                    '',
                                    AppLocalizations.of(context)!
                                        .please_accept_terms_and_conditions,
                                    ToastificationType.error,
                                  );
                                  return;
                                }

                                if (name.isEmpty ||
                                    password.isEmpty ||
                                    repeatPassword.isEmpty) {
                                  // نمایش توست اگر هرکدام از فیلدها خالی باشند
                                  showToast(
                                    context,
                                    '',
                                    AppLocalizations.of(context)!.complete,
                                    ToastificationType.error,
                                  );
                                  return;
                                }

                                // بررسی طول پسورد
                                if (password.length < 8) {
                                  showToast(
                                    context,
                                    AppLocalizations.of(context)!
                                        .password_length_error,
                                    '',
                                    ToastificationType.error,
                                  );
                                  return;
                                }

                                // بررسی اینکه پسورد شامل حداقل یک حرف کوچک و یک حرف بزرگ باشد
                                if (!RegExp(r'(?=.*[a-z])(?=.*[A-Z])')
                                    .hasMatch(password)) {
                                  showToast(
                                    context,
                                    '',
                                    AppLocalizations.of(context)!
                                        .password_case_error,
                                    ToastificationType.error,
                                  );
                                  return;
                                }

                                // تطابق پسوردها را بررسی می‌کنیم
                                if (password != repeatPassword) {
                                  // نمایش توست در صورتی که پسوردها مطابقت ندارند
                                  showToast(
                                    context,
                                    '',
                                    AppLocalizations.of(context)!
                                        .passwords_do_not_match,
                                    ToastificationType.error,
                                  );
                                  return;
                                }

                                // درخواست ثبت‌نام کاربر
                                context.read<AuthController>().registerUser(
                                      name: name,
                                      lastn: lastName,
                                      password: password,
                                      faceForm: 'test',
                                      hairForm: 'test',
                                      likeHair: 'test',
                                      ryeColor: 'test',
                                    );

                                showToast(
                                  context,
                                  '',
                                  AppLocalizations.of(context)!
                                      .information_successfully_registered,
                                  ToastificationType.success,
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
                            return Center(
                              child: Text(message!),
                            );
                          },
                          completedWidgetBuilder: (value) {
                            if (!isPageOpened) {
                              isPageOpened = true;
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                print(
                                    "Response message: ${value?.json['message']}"); // Debug message
                                if (value?.json['message'] ==
                                    'User already logged in') {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => MyApp()),
                                    (Route<dynamic> route) => false,
                                  );
                                } else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return const CompletionInformation();
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextPadding(
                            textAlign: TextAlign.center,
                            text: AppLocalizations.of(context)!.complete_later,
                            theme: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
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

  Widget acceptance(double height, double width, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height / 30),
      child: Row(
        children: [
          Container(
              width: width / 20,
              height: width / 20,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: CustomCheckbox(
                value: hasAcceptance,
                onChanged: (value) {
                  setState(() {
                    hasAcceptance = value!;
                  });
                },
              )),
          SizedBox(width: width / 40),
          Row(
            children: [
              TextPadding(
                text: AppLocalizations.of(context)!.accept,
                theme: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.bgBlack,
                    ),
              ),
              TextPadding(
                text: AppLocalizations.of(context)!.terms_conditions,
                theme: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.tankBlue3,
                    ),
              ),
              TextPadding(
                text: AppLocalizations.of(context)!.use_of_service,
                theme: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.bgBlack,
                    ),
              ),
            ],
          ),
        ],
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
            size: 30,
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
      title: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Text(
          title,
          textDirection: textDirection,
        ),
      ),
      description: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Text(
          description,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
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
