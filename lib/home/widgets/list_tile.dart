import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap; // اضافه کردن متد برای عملکرد کلیک

  const CustomListTile({
    super.key,
    required this.text,
    required this.onTap, // اضافه کردن پارامتر برای عملکرد کلیک
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.dividerColor900,
                  width: 0,
                ),
                top: BorderSide(
                  color: AppColors.dividerColor900,
                  width: 2,
                ),
              ),
            ),
            padding: const EdgeInsets.only(
              bottom: 16,
              top: 16,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 22),
              child: Row(
                children: [
                  const Icon(Icons.keyboard_arrow_down),
                  const Spacer(),
                  Text(
                    text,
                    style:
                        const TextStyle(fontSize: 11, color: AppColors.bgBlack),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:shop_style/common/configs/colors.dart';

// class CustomListTile extends StatelessWidget {
//   final String text;
//   final VoidCallback onTap; // اضافه کردن متد برای عملکرد کلیک

//   const CustomListTile({
//     super.key,
//     required this.text,
//     required this.onTap, // اضافه کردن پارامتر برای عملکرد کلیک
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InkWell(
//           onTap: onTap,
//           child: Padding(
//             padding: const EdgeInsets.only(right: 20, left: 22),
//             child: Row(
//               children: [
//                 const Icon(Icons.keyboard_arrow_down),
//                 const Spacer(),
//                 Text(
//                   text,
//                   style:
//                       const TextStyle(fontSize: 11, color: AppColors.bgBlack),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         const Divider(
//           color: AppColors.dividerColor900,
//           thickness: 2,
//           indent: 22,
//           endIndent: 22,
//         ),
//       ],
//     );
//   }
// }

