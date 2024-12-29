import 'package:flutter/material.dart';
import 'package:shop_style/auth/screens/login_enter_password_screen.dart';
import 'package:shop_style/auth/widgets/custom_button.dart';
import 'package:shop_style/auth/widgets/custom_textfield.dart';
import 'package:shop_style/auth/widgets/text_padding.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums/textfield_type.dart';

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
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: TextPadding(
                  text: 'ورود / ثبت نام',
                  textAlign: TextAlign.center,
                  topPadding: height / 6,
                  theme: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SliverToBoxAdapter(
                child: TextPadding(
                  text: 'برای ثبت نام یا ورود شماره تلفن خود را وارد کنید',
                  topPadding: height / 4,
                  theme: Theme.of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ),
              const SliverToBoxAdapter(
                child: CustomTextfield(
                  hintText: 'شماره موبایل خود را وارد کنید',
                  type: TextfieldType.numberPhone,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomButton(
                  textButton: 'مرحله بعد',
                  topPadding: height / 30,
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginEnterPasswordScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
