import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/widgets/scoring.dart';

class MyCommentPage extends StatefulWidget {
  const MyCommentPage({super.key});

  @override
  State<MyCommentPage> createState() => _MyCommentPageState();
}

class _MyCommentPageState extends State<MyCommentPage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white2,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 15),
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(),
                SliverToBoxAdapter(
                  child: Text(
                    'دیدگاه های من',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: height / 80)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 6,
                    (context, index) {
                      return getComments(height);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getComments(height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: height / 100),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 66,
                height: 66,
                child: Image.asset(
                  'assets/images/uuacu.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'نام آرایشگاه',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: height / 200),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 16,
                      color: AppColors.textHeader,
                    ),
                    Text(
                      'یکشنبه 1 دی ماه 1403',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                SizedBox(height: height / 200),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 16,
                      color: AppColors.textHeader,
                    ),
                    Text(
                      'یکشنبه 1 دی ماه 1403',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.more_vert,
              color: AppColors.textSearchColor,
            ),
          ],
        ),
        SizedBox(height: height / 100),
        const Scoring(hasShowvotesVotes: false),
        SizedBox(height: height / 100),
        Text(
          'متن کامل کامنت',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: height / 100),
        const Divider(
          indent: 22,
          endIndent: 22,
          color: AppColors.dividerColor900,
        ),
      ],
    );
  }
}
