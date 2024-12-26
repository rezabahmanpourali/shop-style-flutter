import 'package:flutter/material.dart';
import 'package:shop_style/home/screens/hairdresser_selected.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/home/widgets/newWidget/custom_dropdown.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 15),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height / 20),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.close),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'خوش آمدید!',
                  style: TextStyle(
                    color: Color(0xFF0D1619),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: height / 100),
                const Text(
                  'برای تجربه بهتر در استفاده از سرویس {نام برنامه} اطلاعات زیر را بر اساس سلیقه خود وارد کنید.',
                  style: TextStyle(
                    color: Color(0xFF000080),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: height / 40),
                Row(
                  children: [
                    const Text(
                      'اسکن چهره',
                      style: TextStyle(
                        color: Color(0xFF0D1619),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: width / 5,
                      height: height / 20,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(360)),
                        border: Border.all(
                            color: const Color(0xFF000080), width: 3),
                      ),
                      child: const Icon(Icons.face),
                    ),
                    SizedBox(width: width / 20),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 3.5),
                  child: const Text(
                    'با اسکن کرده چهره خود با استفاده از دورین سلفی بهترین تجربه را از استفاده از سرویس ما خواهید داشت',
                    style: TextStyle(color: Color(0xFF757575), fontSize: 14),
                  ),
                ),
                SizedBox(height: height / 100),
                const Text(
                  'نکته: تمامی اطلاعاتی که در این بخش وارد می کنید کاملا محفوظ است.',
                  style: TextStyle(color: Color(0xFFE1E100), fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width / 2.6,
                      child: Divider(thickness: 1, height: height / 15),
                    ),
                    const Text(
                      '   یا   ',
                      style: TextStyle(color: Color(0xFF757575), fontSize: 14),
                    ),
                    SizedBox(
                      width: width / 2.6,
                      child: Divider(thickness: 1, height: height / 15),
                    ),
                  ],
                ),
                const Text(
                  'به صورت دستی وارد کنید',
                  style: TextStyle(
                    color: Color(0xFF0D1619),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: height / 100),
                const Text(
                  'اطلاعات مورد نیاز برای ارائه بهترین تجربه را به صورت دستی وارد کنید',
                  style: TextStyle(color: Color(0xFF757575), fontSize: 14),
                ),
                SizedBox(height: height / 40),
                const CustomDropdown(lableField: 'فرم چهره'),
                SizedBox(height: height / 40),
                const CustomDropdown(lableField: 'حالت مو'),
                SizedBox(height: height / 40),
                const CustomDropdown(lableField: 'رنگ چشم'),
                SizedBox(height: height / 40),
                const CustomDropdown(lableField: 'چه مدل مویی را میپسندید؟'),
                SizedBox(height: height / 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HairdresserSelection(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: Size(width / 3, height / 20),
                  ),
                  child: Text(
                    'بزن بریم!',
                    style: Theme.of(context).textTheme.titleMedium
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
      ),
    );
  }
}
