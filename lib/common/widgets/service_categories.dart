import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class ServiceCategories extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> content;
  final Function(int index) onTabChange;
  const ServiceCategories({
    super.key,
    required this.tabs,
    required this.content,
    required this.onTabChange,
  });

  @override
  State<ServiceCategories> createState() => _ServiceCategoriesState();
}

class _ServiceCategoriesState extends State<ServiceCategories> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...List.generate(
              widget.tabs.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColors.tankBlue2
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        widget.tabs[index],
                        style: TextStyle(
                          color: currentIndex == index
                              ? AppColors.tankBlue3
                              : AppColors.tankBlue3,
                          fontSize: currentIndex == index ? 16 : 16,
                          fontWeight: currentIndex == index
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: widget.content[currentIndex],
        ),
      ],
    );
  }
}
