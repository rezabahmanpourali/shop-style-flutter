import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/screens/basic_information_screen.dart';
import 'package:shop_style/auth/widgets/OTPWidget.dart';
import 'package:shop_style/auth/widgets/custom_button.dart';
import 'package:shop_style/auth/widgets/new_otp_screen.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/text_padding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class LoginEnterPasswordScreen extends StatefulWidget {
  const LoginEnterPasswordScreen({super.key});

  @override
  State<LoginEnterPasswordScreen> createState() =>
      _LoginEnterPasswordScreenState();
}

class _LoginEnterPasswordScreenState extends State<LoginEnterPasswordScreen> {
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
                        TextPadding(
                          text: AppLocalizations.of(context)!
                              .verification_code_sent,
                          topPadding: height / 100,
                          theme: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(top: 22),
                    sliver: SliverToBoxAdapter(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: NewOtpScreen(),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TextPadding(
                      text:
                          AppLocalizations.of(context)!.resend_code_in_seconds,
                      textAlign: TextAlign.center,
                      topPadding: height / 3.6,
                      theme:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.purple,
                              ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomButton(
                      textButton: AppLocalizations.of(context)!.login_register,
                      topPadding: height / 30,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const BasicInformationScreen(),
                          ),
                        );
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
}
