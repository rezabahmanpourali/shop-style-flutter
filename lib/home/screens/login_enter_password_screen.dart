import 'package:flutter/material.dart';
import 'package:shop_style/home/screens/basic_information_screen.dart';

class LoginEnterPasswordScreen extends StatefulWidget {
  const LoginEnterPasswordScreen({super.key});

  @override
  State<LoginEnterPasswordScreen> createState() =>
      _LoginEnterPasswordScreenState();
}

class _LoginEnterPasswordScreenState extends State<LoginEnterPasswordScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

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
                'کد تایید را وارد کنید',
                style: TextStyle(
                  color: Color(0xFF0D1619),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: height / 100),
              const Text(
                'کد تایید برای شماره 09120000000 پیامک شد.',
                style: TextStyle(
                  color: Color(0xFF000080),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: height / 50),
              Container(
                height: height / 20,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE5E5E5), width: 2),
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.all(Radius.circular(360)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      oneNumberCode(
                          width, controller1, focusNode1, context, null),
                      oneNumberCode(
                          width, controller2, focusNode2, context, focusNode1),
                      oneNumberCode(
                          width, controller3, focusNode3, context, focusNode2),
                      oneNumberCode(
                          width, controller4, focusNode4, context, focusNode3),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height / 3.6),
              const Text(
                textAlign: TextAlign.center,
                'ارسال مجدد کد تایید تا 2:41 ثانیه دیگر',
                style: TextStyle(
                  color: Color(0xFF000080),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: height / 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BasicInformationScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D1619),
                  minimumSize: Size(width / 3, height / 20),
                ),
                child: const Text(
                  'ورود / ثبت نام',
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

Widget oneNumberCode(
  double width,
  TextEditingController controller,
  FocusNode focusNode,
  BuildContext context,
  FocusNode? previousFocusNode,
) {
  return SizedBox(
    width: width / 20,
    child: TextField(
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      controller: controller,
      maxLength: 1,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        counterText: ' ',
        border: InputBorder.none,
        hintText: '_',
        hintStyle: TextStyle(
          color: Color(0xFF000000),
          fontSize: 18,
        ),
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        } else if (value.isEmpty) {
          if (previousFocusNode != null) {
            FocusScope.of(context).requestFocus(previousFocusNode);
          }
        }
      },
    ),
  );
}
