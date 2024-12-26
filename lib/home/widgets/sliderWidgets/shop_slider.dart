import 'package:flutter/material.dart';

class ShopSlider extends StatefulWidget {
  const ShopSlider({
    super.key,
    required this.countShowChild,
    required this.images,
    required this.lable,
    required this.child,
  });

  final double countShowChild;
  final List<String> images;

  final Widget? lable;
  final Widget child;

  @override
  State<ShopSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<ShopSlider> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListView.builder(
      itemCount: widget.images.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return childListView(width, height, index);
      },
    );
  }

  Padding childListView(double width, double height, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width / widget.countShowChild,
        decoration: BoxDecoration(
          color: const Color(0xFFFDFDFD),
          border: Border.all(width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: SizedBox(
                    height: height / 12,
                    width: width,
                    child: Image.asset(
                      widget.images[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                widget.lable ?? const Text('')
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
