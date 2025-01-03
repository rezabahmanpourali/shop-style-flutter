import 'package:flutter/material.dart';
import 'package:shop_style/auth/widgets/custom_button.dart';
import 'package:shop_style/auth/widgets/custom_dropdown.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/widgets/text_padding.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/main.dart';

class CompletionInformation extends StatefulWidget {
  const CompletionInformation({super.key});

  @override
  State<CompletionInformation> createState() => _CompletionInformationState();
}

class _CompletionInformationState extends State<CompletionInformation> {
  String? selectedValue = 'زرد';
  int selected = 0;

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
              const HeaderScreen(),
              SliverToBoxAdapter(
                child: TextPadding(
                  text: 'خوش آمدید!',
                  theme: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SliverToBoxAdapter(
                child: TextPadding(
                  text:
                      'برای تجربه بهتر در استفاده از سرویس {نام برنامه} اطلاعات زیر را بر اساس سلیقه خود وارد کنید.',
                  topPadding: height / 100,
                  theme: Theme.of(context).textTheme.bodyMedium,
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
                      '   یا   ',
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
                  text: 'به صورت دستی وارد کنید',
                  theme: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SliverToBoxAdapter(
                child: TextPadding(
                  text:
                      'اطلاعات مورد نیاز برای ارائه بهترین تجربه را به صورت دستی وارد کنید',
                  topPadding: height / 100,
                  theme: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.textHeader),
                ),
              ),
              SliverToBoxAdapter(
                child: CustomDropdown(
                  lableField: 'فرم چهره',
                  topPadding: height / 40,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomDropdown(
                  lableField: 'حالت مو',
                  topPadding: height / 40,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomDropdown(
                  lableField: 'رنگ چشم',
                  topPadding: height / 40,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomDropdown(
                  lableField: 'چه مدل مویی را میپسندید؟',
                  topPadding: height / 40,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomButton(
                  textButton: 'بزن بریم!',
                  topPadding: height / 20,
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ));
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
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: height / 40),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget scanFace(double height, double width) {
    return Padding(
      padding: EdgeInsets.only(top: height / 40),
      child: Column(
        children: [
          Row(
            children: [
              TextPadding(
                text: 'اسکن چهره',
                theme: Theme.of(context).textTheme.labelMedium,
              ),
              const Spacer(),
              Container(
                width: width / 5,
                height: height / 20,
                decoration: BoxDecoration(
                  color: AppColors.white2,
                  borderRadius: const BorderRadius.all(Radius.circular(360)),
                  border: Border.all(color: AppColors.purple, width: 3),
                ),
                child: const Icon(Icons.face),
              ),
              SizedBox(width: width / 20),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 3.5),
            child: TextPadding(
              text:
                  'با اسکن کرده چهره خود با استفاده از دورین سلفی بهترین تجربه را از استفاده از سرویس ما خواهید داشت',
              theme: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.textHeader),
            ),
          ),
          SizedBox(height: height / 100),
          TextPadding(
            text:
                'نکته: تمامی اطلاعاتی که در این بخش وارد می کنید کاملا محفوظ است.',
            theme: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
