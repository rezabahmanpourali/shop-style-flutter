import 'package:flutter/material.dart';
import 'package:shop_style/auth/screens/basic_information_screen.dart';
import 'package:shop_style/auth/widgets/OTPWidget.dart';
import 'package:shop_style/auth/widgets/custom_button.dart';
import 'package:shop_style/common/widgets/text_padding.dart';

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
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: TextPadding(
                  text: 'کد تایید را وارد کنید',
                  topPadding: height / 10,
                  theme: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SliverToBoxAdapter(
                child: TextPadding(
                  text: 'کد تایید برای شماره 09120000000 پیامک شد.',
                  topPadding: height / 100,
                  theme: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SliverToBoxAdapter(
                child: OTPWidget(topPadding: height / 50),
              ),
              SliverToBoxAdapter(
                child: TextPadding(
                  text: 'ارسال مجدد کد تایید تا 2:41 ثانیه دیگر',
                  textAlign: TextAlign.center,
                  topPadding: height / 3.6,
                  theme: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomButton(
                  textButton: 'ورود / ثبت نام',
                  topPadding: height / 30,
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BasicInformationScreen(),
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
