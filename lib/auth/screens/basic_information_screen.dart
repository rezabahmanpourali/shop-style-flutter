import 'package:flutter/material.dart';
import 'package:shop_style/auth/screens/completion_information.dart';
import 'package:shop_style/auth/widgets/custom_button.dart';
import 'package:shop_style/auth/widgets/custom_textfield.dart';
import 'package:shop_style/auth/widgets/text_padding.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums/textfield_type.dart';
import 'package:shop_style/main.dart';

class BasicInformationScreen extends StatefulWidget {
  const BasicInformationScreen({super.key});

  @override
  State<BasicInformationScreen> createState() => _BasicInformationScreenState();
}

class _BasicInformationScreenState extends State<BasicInformationScreen> {
  bool hasAcceptance = false;
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
                  text: 'تکمیل حساب کاربری',
                  topPadding: height / 10,
                  theme: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SliverToBoxAdapter(
                child: TextPadding(
                  text:
                      'تقریبا تمام شد! ساخت حساب کاربری خود را برای شماره موبایل 09120000000 با وارد کردن اطلاعات زیر تکمیل کنید',
                  topPadding: height / 100,
                  theme: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTextfield(
                  topPadding: height / 50,
                  lableField: 'نام و نام خانوادگی *',
                  type: TextfieldType.none,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTextfield(
                  topPadding: height / 50,
                  lableField: 'رمز عبور *',
                  type: TextfieldType.security,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTextfield(
                  topPadding: height / 50,
                  lableField: 'تکرار رمز عبور *',
                  type: TextfieldType.security,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTextfield(
                  topPadding: height / 50,
                  lableField: 'ایمیل (اختیاری)',
                  type: TextfieldType.none,
                ),
              ),
              SliverToBoxAdapter(
                child: acceptance(height, width, context),
              ),
              SliverToBoxAdapter(
                child: CustomButton(
                  topPadding: height / 5.5,
                  textButton: 'ثبت نام',
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CompletionInformation(),
                      ),
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
                    text: 'بعدا تکمیل کنید',
                    theme: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.black),
                  ),
                ),
              ),
            ],
          ),
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
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Checkbox(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              checkColor: AppColors.white2,
              activeColor: AppColors.purple,
              value: hasAcceptance,
              onChanged: (value) {
                setState(() {
                  hasAcceptance = !hasAcceptance;
                });
              },
            ),
          ),
          SizedBox(width: width / 40),
          TextPadding(
            text: 'قبول ',
            theme: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.black),
          ),
          TextPadding(
            text: 'شرایط و قوانین',
            theme: Theme.of(context).textTheme.bodyMedium,
          ),
          TextPadding(
            text: ' استفاده از سرویس {نام برنامه}',
            theme: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
