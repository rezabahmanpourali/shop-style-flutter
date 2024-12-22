// import 'package:flutter/material.dart';

// class CategoryRow extends StatefulWidget {
//   const CategoryRow({
//     super.key,
//     required this.width,
//     required this.height,
//   });

//   final double width;
//   final double height;

//   @override
//   State<CategoryRow> createState() => _CategoryRowState();
// }

// class _CategoryRowState extends State<CategoryRow> {
//   int widthCatSelected = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.width / 3.5,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: widget.width / 40),
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: 4,
//           itemBuilder: (BuildContext context, int index) {
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   widthCatSelected = index;
//                 });
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   SizedBox(
//                     height: widget.height / 10,
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: widget.width / 28),
//                           width: widget.width / 6,
//                           height: widget.width / 6,
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Color(0xFFD7F0E1),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: widget.width / 28),
//                           width: widget.width / 7,
//                           height: widget.width / 7,
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Color(0xFFF2FFF8),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: widget.height / 60,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(200),
//                             child: Image.network(
//                               'https://s3-alpha-sig.figma.com/img/add0/6a12/2cb84b448790f17d8dc6f1d453b833a5?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=p3PcDEsGFwhto6-Y9zYkbmTX00~YaHNv1RBDcKx9hsB94g8oqdn2lsgG02rNeZM4GsOTjjvlmS7YtlbiLIs8rNCwwiGBTQ4mFV1hHv79fCzFeDXkFHjaaP9RDYM46KOKFCRwUq0ORl~cONVaGRScUj~SSkMao4V0Iv2Vjjd8u4xRtlI~dwceCd0Lzxr0VMgJ1lejj1Sz~nZpkkaGST1rRvKAt10KIkzh4p2~qawqEsefUYx6SNbPfjSsTbP2y7kLNHYCPJXxH3elbMTfLM5PSD6rtGWrHHvyFlfgkU1XWM255HGVO-0Yrh1xTTQSDfT~5uJSoOZDUckuJds794ESSA__',
//                               width: widthCatSelected == index
//                                   ? widget.width / 5.5
//                                   : widget.width / 7,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Text('زنانه'),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
