// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class LazyLoadWidget extends StatefulWidget {
//   const LazyLoadWidget({
//     super.key,
//     required this.apiLazyLoad,
//     required this.children,
//     required this.skeletonWidget,
//     required this.onLoadMore,
//     this.shouldShowLoading = true,
//     this.scrollController,
//   });

//   final Future Function() apiLazyLoad;
//   final List<Widget> children;
//   final Widget skeletonWidget;
//   final VoidCallback onLoadMore;
//   final bool shouldShowLoading;
//   final ScrollController? scrollController;

//   @override
//   State<LazyLoadWidget> createState() => _LazyLoadWidgetState();
// }

// class _LazyLoadWidgetState extends State<LazyLoadWidget> {
//   bool isEmpty = false;
//   bool loading = false;
//   late ScrollController controllerCtrl;

//   @override
//   void initState() {
//     controllerCtrl = widget.scrollController ?? ScrollController();
//     controllerCtrl.addListener(controllerListener);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controllerCtrl.removeListener(controllerListener);
//     if (widget.scrollController == null) {
//       controllerCtrl.dispose();
//     }
//     super.dispose();
//   }

//   void controllerListener() async {
//     if (controllerCtrl.position.pixels >=
//             controllerCtrl.position.maxScrollExtent &&
//         !loading &&
//         !isEmpty &&
//         widget.shouldShowLoading) {
//       setState(() {
//         loading = true;
//       });

//       final result = await widget.apiLazyLoad();

//       if (result == null || (result is List && result.isEmpty)) {
//         setState(() {
//           isEmpty = false; // TODO: bug lazyload
//         });
//       } else {
//         widget.onLoadMore();
//       }

//       if (widget.children.isEmpty) {
//         setState(() {
//           isEmpty = false; // TODO: bug lazyload
//         });
//       }

//       setState(() {
//         loading = false;
//       });
//     }
//   }

//   @override

//   Widget build(BuildContext context) {
//     return CustomScrollView(
//         controller: ScrollController(),
//         shrinkWrap: true,
//         slivers: [
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 ...widget.children,
//                 if (!isEmpty && widget.shouldShowLoading)
//                   AnimatedSize(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeInOutQuart,
//                     child: loading ? widget.skeletonWidget : Container(),
//                   ),
//               ],
//             ),
//           ),
//         ]);
//   }
// }
//ScrollPositionWithSingleContext#0394a(offset: 0.0, range: null..null, viewport: null, ScrollableState, ClampingScrollPhysics, IdleScrollActivity#5afd2, ScrollDirection.idle)
//ScrollPositionWithSingleContext#aa043(offset: 0.0, range: null..null, viewport: null, ScrollableState, ClampingScrollPhysics, IdleScrollActivity#2084b, ScrollDirection.idle)
//Todo: old LazyLoad

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// class LazyLoadWidget extends StatefulWidget {
//   const LazyLoadWidget({
//     super.key,
//     required this.apiLazyLoad,
//     required this.children,
//     required this.skeletonWidget,
//     required this.onLoadMore,
//     this.shouldShowLoading = true,
//   });
//
//   final Future Function() apiLazyLoad;
//   final List<Widget> children;
//   final Widget skeletonWidget;
//   final VoidCallback onLoadMore;
//   final bool shouldShowLoading;
//
//   @override
//   State<LazyLoadWidget> createState() => _LazyLoadWidgetState();
// }
//
// class _LazyLoadWidgetState extends State<LazyLoadWidget> {
//   bool isEmpty = false;
//   bool loading = false;
//   final ScrollController controllerCtrl = ScrollController();
//
//   @override
//   void initState() {
//     controllerCtrl.addListener(controllerListener);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     controllerCtrl.removeListener(controllerListener);
//     controllerCtrl.dispose();
//     super.dispose();
//   }
//
//   void controllerListener() async {
//     if (controllerCtrl.position.pixels ==
//         controllerCtrl.position.maxScrollExtent &&
//         !loading &&
//         !isEmpty &&
//         widget.shouldShowLoading) {
//       setState(() {
//         loading = true;
//       });
//
//       await widget.apiLazyLoad();
//
//       widget.onLoadMore();
//
//       if (widget.children.isEmpty) {
//         setState(() {
//           isEmpty = true;
//         });
//       }
//
//       setState(() {
//         loading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const AlwaysScrollableScrollPhysics()
//           .applyTo(const ClampingScrollPhysics()),
//       controller: controllerCtrl,
//       child: Column(
//         children: [
//           ...widget.children,
//           if (!isEmpty && widget.shouldShowLoading)
//             AnimatedSize(
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeInOutQuart,
//               child: loading ? widget.skeletonWidget : Container(),
//             ),
//         ],
//       ),
//     );
//   }
// }
//

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class LazyLoadWidget extends StatefulWidget {
//   const LazyLoadWidget({
//     super.key,
//     required this.apiLazyLoad,
//     required this.children,
//     required this.skeletonWidget,
//     required this.listLength,
//     this.shouldShowLoading = true,
//   });

//   final Future Function() apiLazyLoad;
//   final List<Widget> children;
//   final Widget skeletonWidget;
//   final int listLength;
//   final bool shouldShowLoading;
//   @override
//   State<LazyLoadWidget> createState() => _LazyLoadWidgetState();
// }

// class _LazyLoadWidgetState extends State<LazyLoadWidget> {
//   int currentItemLength = 0;
//   bool isEmpty = false;
//   bool loading = false;
//   final ScrollController controllerCtrl = ScrollController();

//   @override
//   void initState() {
//     controllerCtrl.addListener(controllerListener);
//     currentItemLength = widget.children.length;
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controllerCtrl.removeListener(controllerListener);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const AlwaysScrollableScrollPhysics()
//           .applyTo(const ClampingScrollPhysics()),
//       controller: controllerCtrl,
//       child: Column(
//         children: [
//           ...widget.children,
//           if (!isEmpty && widget.shouldShowLoading) ...{widget.skeletonWidget}
//         ],
//       ),
//     );
//   }

//   // void controllerListener() async {
//   //   if (controllerCtrl.position.pixels ==
//   //           controllerCtrl.position.maxScrollExtent &&
//   //       !loading &&
//   //       !isEmpty &&
//   //       widget.shouldShowLoading) {
//   //     loading = true;
//   //     currentItemLength = widget.children.length;
//   //     await widget.apiLazyLoad();
//   //     if (widget.listLength == widget.children.length) {
//   //       isEmpty = true;
//   //     }
//   //     loading = false;
//   //   }
//   // }
// }















import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class LazyLoadWidget extends StatefulWidget {
  const LazyLoadWidget({
    super.key,
    required this.apiLazyLoad,
    required this.children,
    required this.skeletonWidget,
    required this.onLoadMore,
    this.shouldShowLoading = true,
    this.scrollController,
  });

  final Future<void> Function() apiLazyLoad; // باید یک Future<void> برگرداند
  final List<Widget> children;
  final Widget skeletonWidget;
  final VoidCallback onLoadMore; // به جای Future<void> از VoidCallback استفاده کنید
  final bool shouldShowLoading;
  final ScrollController? scrollController;

  @override
  State<LazyLoadWidget> createState() => _LazyLoadWidgetState();
}

class _LazyLoadWidgetState extends State<LazyLoadWidget> {
  bool isEmpty = false;
  bool loading = false;
  late ScrollController controllerCtrl;

  @override
  void initState() {
    controllerCtrl = widget.scrollController ?? ScrollController();
    controllerCtrl.addListener(controllerListener);
    super.initState();
  }

  @override
  void dispose() {
    controllerCtrl.removeListener(controllerListener);
    if (widget.scrollController == null) {
      controllerCtrl.dispose();
    }
    super.dispose();
  }

  void controllerListener() async {
    // بررسی زمانی که اسکرول به انتهای صفحه می‌رسد و باید بارگذاری جدید انجام شود
    if (controllerCtrl.position.pixels >= controllerCtrl.position.maxScrollExtent &&
        !loading &&
        !isEmpty &&
        widget.shouldShowLoading) {
      setState(() {
        loading = true;
      });

      await widget.apiLazyLoad(); // بارگذاری داده‌ها

      setState(() {
        loading = false;
      });

      widget.onLoadMore(); // فراخوانی تابع onLoadMore

      // اگر داده‌ها خالی بودند، نشان دهیم
      if (widget.children.isEmpty) {
        setState(() {
          isEmpty = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controllerCtrl,
      shrinkWrap: true,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ...widget.children,
              if (loading && widget.shouldShowLoading)
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutQuart,
                  child: widget.skeletonWidget, // نمایش بارگذاری اسکلتی
                ),
            ],
          ),
        ),
      ],
    );
  }
}
