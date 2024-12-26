//change icon show password

import 'package:flutter/material.dart';
import 'package:shop_style/home/screens/completion_information.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/home/widgets/newWidget/custom_textfield.dart';
import 'package:shop_style/home/widgets/newWidget/enums/textfield_type.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height / 10),
              const Text(
                'تکمیل حساب کاربری',
                style: TextStyle(
                  color: Color(0xFF0D1619),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: height / 100),
              const Text(
                'تقریبا تمام شد! ساخت حساب کاربری خود را برای شماره موبایل 09120000000 با وارد کردن اطلاعات زیر تکمیل کنید',
                style: TextStyle(
                  color: Color(0xFF000080),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: height / 50),
              CustomTextfield(
                height: height,
                width: width,
                hasSecurity: false,
                showPassword: true,
                lableField: 'نام و نام خانوادگی *',
                type: TextfieldType.none,
              ),
              SizedBox(height: height / 50),
              CustomTextfield(
                height: height,
                width: width,
                hasSecurity: true,
                showPassword: true,
                lableField: 'رمز عبور *',
                type: TextfieldType.security,
              ),
              SizedBox(height: height / 50),
              CustomTextfield(
                height: height,
                width: width,
                hasSecurity: true,
                showPassword: true,
                lableField: 'تکرار رمز عبور *',
                type: TextfieldType.security,
              ),
              SizedBox(height: height / 50),
              CustomTextfield(
                height: height,
                width: width,
                hasSecurity: false,
                showPassword: true,
                lableField: 'ایمیل (اختیاری)',
                type: TextfieldType.none,
              ),
              SizedBox(height: height / 30),
              Row(
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
                  const Text(
                    'قبول ',
                    style: TextStyle(fontSize: 13, color: Color(0xFF0D1619)),
                  ),
                  const Text(
                    'شرایط و قوانین',
                    style: TextStyle(fontSize: 13, color: Color(0xFF000080)),
                  ),
                  const Text(
                    ' استفاده از سرویس {نام برنامه}',
                    style: TextStyle(fontSize: 13, color: Color(0xFF0D1619)),
                  ),
                ],
              ),
              SizedBox(height: height / 5.5),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CompletionInformation(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D1619),
                  minimumSize: Size(width / 3, height / 20),
                ),
                child: const Text(
                  'ثبت نام',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: height / 40),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: const Text(
                  'بعدا تکمیل کنید',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF000000), fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
