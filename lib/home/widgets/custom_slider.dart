import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
    required this.customWid,
    required this.images,
    required this.heightPic,
    required this.lable,
    required this.child,
  });

  final double customWid;
  final List<String> images;

  final double heightPic;

  final Widget? lable;
  final Widget child;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
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
        width: width / widget.customWid,
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
                    height: height / widget.heightPic,
                    width: width,
                    child: Image.asset(
                      widget.images[index],
                      fit: BoxFit.cover,
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
