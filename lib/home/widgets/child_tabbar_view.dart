import 'package:flutter/material.dart';

class ChildTabBarView extends StatefulWidget {
  const ChildTabBarView({super.key, required this.index});
  final int index;

  @override
  State<ChildTabBarView> createState() => _ChildTabBarViewState();
}

class _ChildTabBarViewState extends State<ChildTabBarView> {
  bool hasReserved = true;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        left: width / 15,
        right: width / 15,
        top: height / 40,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'مدل موی خامه ای',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: height / 400),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        color: Color(0xFF757676),
                        size: 20,
                      ),
                      SizedBox(width: width / 60),
                      const Text(
                        '40 دقیقه',
                        style: TextStyle(
                          color: Color(0xFF757676),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height / 400),
                  const Text(
                    '125,000 تومان',
                    style: TextStyle(
                      color: Color(0xFF757676),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              hasReserved
                  ? reserved(hasReserved)
                  : notReserved(height, width, hasReserved),
            ],
          ),
          SizedBox(height: height / 60),
          const Divider(),
        ],
      ),
    );
  }

  Widget reserved(hasReserved) {
    return IconButton(
      onPressed: () {
        getClick();
      },
      icon: const Icon(
        Icons.check_circle,
        color: Color(0xFF000080),
        size: 50,
      ),
    );
  }

  Widget notReserved(height, width, hasReserved) {
    return Container(
      height: height / 20,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E5E5), width: 2),
        color: const Color(0xFFFFFFFF),
        borderRadius: const BorderRadius.all(Radius.circular(360)),
      ),
      child: ElevatedButton(
        onPressed: () {
          getClick();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFFFFF),
          minimumSize: Size(width / 3, height / 20),
          elevation: 0,
        ),
        child: const Text(
          'رزرو نوبت',
          style: TextStyle(
            color: Color(0xFF0D1619),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  void getClick() {
    setState(() {
      hasReserved = !hasReserved;
    });
  }
}
