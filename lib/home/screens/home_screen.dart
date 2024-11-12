import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_style/home/widgets/shadow_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    'https://s3-alpha-sig.figma.com/img/59c4/6297/e729f3abd313fce5d432605569c3964d?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EcuOCgNNU3HvytT8ccsqBK3pqkndim6nxHRTmdK8AH6G8nzNqpNpkosfhOtzhqk2Ch~vh88C4HlWrvnoRrqdAaht77PXh7~yjrZcQIrkDxJmsTaOPRjQV1EFkZxL29VWVPWZnBi67oUO-KZWmSghwx2U267bezFB~LmSrt3YT4vHVgU~2WCD4mu7CjCWiJUuHjcqlv1Q5IasIeFqAeH~1X2dMXvGA5XpBjaihdC6hJ-phMQpp3vZ5fdJxRIGUAtjK7oPB0NBpqAf7CbroB1~QTWCdbW2r-xZI0kbGutnM77VvOv0KfbXoeVOKDnKeRWNP2ZFJl-uwN1hHal3VVgGgA__',
    'https://s3-alpha-sig.figma.com/img/59c4/6297/e729f3abd313fce5d432605569c3964d?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EcuOCgNNU3HvytT8ccsqBK3pqkndim6nxHRTmdK8AH6G8nzNqpNpkosfhOtzhqk2Ch~vh88C4HlWrvnoRrqdAaht77PXh7~yjrZcQIrkDxJmsTaOPRjQV1EFkZxL29VWVPWZnBi67oUO-KZWmSghwx2U267bezFB~LmSrt3YT4vHVgU~2WCD4mu7CjCWiJUuHjcqlv1Q5IasIeFqAeH~1X2dMXvGA5XpBjaihdC6hJ-phMQpp3vZ5fdJxRIGUAtjK7oPB0NBpqAf7CbroB1~QTWCdbW2r-xZI0kbGutnM77VvOv0KfbXoeVOKDnKeRWNP2ZFJl-uwN1hHal3VVgGgA__',
    'https://s3-alpha-sig.figma.com/img/59c4/6297/e729f3abd313fce5d432605569c3964d?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EcuOCgNNU3HvytT8ccsqBK3pqkndim6nxHRTmdK8AH6G8nzNqpNpkosfhOtzhqk2Ch~vh88C4HlWrvnoRrqdAaht77PXh7~yjrZcQIrkDxJmsTaOPRjQV1EFkZxL29VWVPWZnBi67oUO-KZWmSghwx2U267bezFB~LmSrt3YT4vHVgU~2WCD4mu7CjCWiJUuHjcqlv1Q5IasIeFqAeH~1X2dMXvGA5XpBjaihdC6hJ-phMQpp3vZ5fdJxRIGUAtjK7oPB0NBpqAf7CbroB1~QTWCdbW2r-xZI0kbGutnM77VvOv0KfbXoeVOKDnKeRWNP2ZFJl-uwN1hHal3VVgGgA__',
    'https://s3-alpha-sig.figma.com/img/59c4/6297/e729f3abd313fce5d432605569c3964d?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EcuOCgNNU3HvytT8ccsqBK3pqkndim6nxHRTmdK8AH6G8nzNqpNpkosfhOtzhqk2Ch~vh88C4HlWrvnoRrqdAaht77PXh7~yjrZcQIrkDxJmsTaOPRjQV1EFkZxL29VWVPWZnBi67oUO-KZWmSghwx2U267bezFB~LmSrt3YT4vHVgU~2WCD4mu7CjCWiJUuHjcqlv1Q5IasIeFqAeH~1X2dMXvGA5XpBjaihdC6hJ-phMQpp3vZ5fdJxRIGUAtjK7oPB0NBpqAf7CbroB1~QTWCdbW2r-xZI0kbGutnM77VvOv0KfbXoeVOKDnKeRWNP2ZFJl-uwN1hHal3VVgGgA__',
  ];
  int selectedIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: width * 0.45,
                        color: Colors.black,
                        child: PageView.builder(
                          onPageChanged: (value) {
                            selectedIndex = value;
                            setState(() {});
                          },
                          controller: pageController,
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(140),
                              ),
                              child: Container(
                                height: width * 0.45,
                                alignment: Alignment.topCenter,
                                width: width,
                                child: Image.network(
                                  images[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      left: width * 0.03,
                      top: 40,
                      child: const ShadowTextField(
                        hintText: 'جستجو از بین 100 برند',
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 10,
                      child: Column(
                        children: [
                          const Text(
                            'نام فروشگاه',
                            style: TextStyle(fontSize: 48),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            width: 300,
                            height: 1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                    onTap: () {}, child: const Text('زنانه')),
                                InkWell(
                                    onTap: () {}, child: const Text('مرانه')),
                                InkWell(
                                    onTap: () {},
                                    child: const Text('بچه گانه')),
                                InkWell(
                                    onTap: () {}, child: const Text('اکسسوری')),
                                InkWell(
                                    onTap: () {}, child: const Text('برندها')),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 32,
                      right: width * 0.1,
                      child: const Row(
                        children: [
                          Text('وارد شوید'),
                          SizedBox(width: 10),
                          Icon(Icons.shopping_basket),
                        ],
                      ),
                    ),
                    Positioned(
                      right: width * 0.05,
                      bottom: height * 0.05,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: images.length,
                              itemBuilder: (BuildContext context, int index) {
                                return circleItems(
                                  isSelected: (selectedIndex == index),
                                  onTap: () {
                                    selectedIndex = index;
                                    setState(() {});
                                    pageController.animateToPage(selectedIndex,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeInOutCubic);
                                  },
                                );
                              },
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (selectedIndex > 0) {
                                    selectedIndex--;
                                    setState(() {});
                                    pageController.animateToPage(selectedIndex,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeInOutCubic);
                                  }
                                },
                                icon: const Icon(
                                  Icons.navigate_before,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (selectedIndex < images.length - 1) {
                                    selectedIndex++;
                                    setState(() {});
                                    pageController.animateToPage(selectedIndex,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeInOutCubic);
                                  }
                                },
                                icon: const Icon(
                                  Icons.navigate_next_outlined,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget circleItems({required Function() onTap, required bool isSelected}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        height: 15,
        width: 15,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.56)),
            color: (isSelected) ? const Color(0xff524F54) : Colors.transparent,
            shape: BoxShape.circle),
      ),
    );
  }
}
