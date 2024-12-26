import 'package:flutter/material.dart';
import 'package:shop_style/home/screens/completion_information.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/home/widgets/custom_button.dart';
import 'package:shop_style/home/widgets/custom_text.dart';
import 'package:shop_style/home/widgets/custom_textfield.dart';
import 'package:shop_style/home/widgets/enums/textfield_type.dart';

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
                child: CustomText(
                  text: 'تکمیل حساب کاربری',
                  topPadding: height / 10,
                  theme: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomText(
                  text:
                      'تقریبا تمام شد! ساخت حساب کاربری خود را برای شماره موبایل 09120000000 با وارد کردن اطلاعات زیر تکمیل کنید',
                  topPadding: height / 100,
                  theme: Theme.of(context).textTheme.bodySmall,
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
                child: Padding(
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
                          checkColor: const Color(0xFFFFFFFF),
                          activeColor: const Color(0xFF000080),
                          value: hasAcceptance,
                          onChanged: (value) {
                            setState(() {
                              hasAcceptance = !hasAcceptance;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: width / 40),
                      CustomText(
                        text: 'قبول ',
                        theme: Theme.of(context).textTheme.bodySmall,
                      ),
                      CustomText(
                        text: 'شرایط و قوانین',
                        theme: Theme.of(context).textTheme.displayLarge,
                      ),
                      CustomText(
                        text: ' استفاده از سرویس {نام برنامه}',
                        theme: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
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
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: CustomText(
                    textAlign: TextAlign.center,
                    text: 'بعدا تکمیل کنید',
                    theme: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
