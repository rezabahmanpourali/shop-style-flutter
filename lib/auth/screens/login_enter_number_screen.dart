import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/screens/login_enter_password_screen.dart';
import 'package:shop_style/auth/widgets/custom_button.dart';
import 'package:shop_style/auth/widgets/custom_textfield.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/text_padding.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class LoginEnterNumberPhoneScreen extends StatelessWidget {
  const LoginEnterNumberPhoneScreen({super.key});

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
                      hintText:
                          AppLocalizations.of(context)!.enter_mobile_number,
                      type: TextfieldType.numberPhone,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomButton(
                      textButton: AppLocalizations.of(context)!.next_step,
                      topPadding: height / 25,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const LoginEnterPasswordScreen(),
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
