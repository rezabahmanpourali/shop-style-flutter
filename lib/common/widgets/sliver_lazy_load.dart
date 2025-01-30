import 'package:flutter/material.dart';

class SliverLazyLoadWidget extends StatefulWidget {
  const SliverLazyLoadWidget(
      {super.key,
      required this.apiLazyLoad,
      required this.itemBuilder,
      required this.itemCount,
      required this.skeletonWidget,
      required this.onLoadMore,
      this.shouldShowLoading = true,
      this.scrollController,
      this.noItemFoundWidget});

  final Future Function() apiLazyLoad;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final Widget skeletonWidget;
  final VoidCallback onLoadMore;
  final bool shouldShowLoading;
  final ScrollController? scrollController;
  final Widget? noItemFoundWidget;

  @override
  State<SliverLazyLoadWidget> createState() => _SliverLazyLoadWidgetState();
}

class _SliverLazyLoadWidgetState extends State<SliverLazyLoadWidget> {
  bool isEmpty = false;
  bool loading = false;

  @override
  void initState() {
    widget.scrollController?.addListener(controllerListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(controllerListener);
    super.dispose();
  }

  void controllerListener() async {
    if (widget.scrollController != null &&
        widget.scrollController!.position.pixels >=
            widget.scrollController!.position.maxScrollExtent &&
        !loading &&
        !isEmpty &&
        widget.shouldShowLoading) {
      setState(() {
        loading = true;
      });

      final result = await widget.apiLazyLoad();

      if (result == null || (result is List && result.isEmpty)) {
        setState(() {
          isEmpty = false; // TODO: bug lazyload
        });
      } else {
        widget.onLoadMore();
      }

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.noItemFoundWidget != null && widget.itemCount == 0) {
      return SliverToBoxAdapter(child: widget.noItemFoundWidget!);
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index < widget.itemCount) {
            return widget.itemBuilder(context, index);
          } else if (!isEmpty && widget.shouldShowLoading && loading) {
            return AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutQuart,
                child: widget.skeletonWidget);
          } else {
            return null;
          }
        },
        childCount: widget.itemCount + (loading ? 1 : 0),
      ),
    );
  }
}
