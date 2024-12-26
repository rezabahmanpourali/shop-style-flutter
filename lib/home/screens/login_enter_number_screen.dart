import 'package:flutter/material.dart';
import 'package:shop_style/home/screens/login_enter_password_screen.dart';
import 'package:shop_style/home/widgets/newWidget/custom_textfield.dart';
import 'package:shop_style/home/widgets/newWidget/enums/textfield_type.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height / 6),
              const Text(
                textAlign: TextAlign.center,
                'ورود / ثبت نام',
                style: TextStyle(
                  color: Color(0xFF0D1619),
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: height / 4.5),
              const Text(
                'برای ثبت نام یا ورود شماره تلفن خود را وارد کنید',
                style: TextStyle(
                  color: Color(0xFF000080),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              CustomTextfield(
                height: height,
                width: width,
                hasSecurity: false,
                showPassword: false,
                lableField: '',
                type: TextfieldType.numberPhone,
              ),
              SizedBox(height: height / 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginEnterPasswordScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D1619),
                  minimumSize: Size(width / 3, height / 20),
                ),
                child: const Text(
                  'مرحله بعد',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
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
