import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class MyCommentPage extends StatefulWidget {
  const MyCommentPage({super.key});

  @override
  State<MyCommentPage> createState() => _MyCommentPageState();
}

class _MyCommentPageState extends State<MyCommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22, bottom: 22),
                sliver: SliverToBoxAdapter(
                  child: Text('دیدگاه های من'),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return getComments();
                  },
                  childCount: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getComments() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 22, left: 22),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 66,
                    height: 66,
                    child: Image.asset('assets/images/uuacu.jpg'),
                  ),
                  const Row(
                    children: [
                      Text('5'),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  ),
                  const Text('متن کامل کامنت'),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('نام آرایشگاه'),
                  Row(
                    children: [
                      Icon(Icons.abc),
                      Text('یکشنبه 1 دی ماه 1403'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.abc),
                      Text('یکشنبه 1 دی ماه 1403'),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.abc),
            ],
          ),
        ),
        const Divider(
          indent: 22,
          endIndent: 22,
          color: AppColors.dividerColor900,
        ),
      ],
    );
  }
}
