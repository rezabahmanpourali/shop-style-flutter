import 'package:flutter/material.dart';
import 'package:shop_style/View_comments/widgets/percentage_box_score.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/widgets/scoring.dart';
import 'package:shop_style/common/widgets/user_comment.dart';

class ViewCommentsScreen extends StatefulWidget {
  const ViewCommentsScreen({super.key});

  @override
  State<ViewCommentsScreen> createState() => _ViewCommentsScreenState();
}

class _ViewCommentsScreenState extends State<ViewCommentsScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 15),
            child: CustomScrollView(
              slivers: <Widget>[
                const HeaderScreen(),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'دیدگاه ها',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Scoring()
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height / 20),
                      Text(
                        'فیلتر  ',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(height: height / 60),
                      SizedBox(
                        height: height / 4.3,
                        child: const PercentageBoxScore(),
                      ),
                      Row(
                        children: [
                          Text(
                            '55 دیدگاه',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const Spacer(),
                          Text(
                            'مرتب سازی:',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: AppColors.textFilterScore),
                          ),
                          SizedBox(width: width / 40),
                          Container(
                            width: 110,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                width: 2,
                                color: AppColors.cardWhite,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'مرتب سازی',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Icon(Icons.keyboard_arrow_down_rounded),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height / 60),
                    ],
                  ),
                ),
                SliverList.builder(
                  itemBuilder: (context, index) {
                    return const UserComment();
                  },
                  itemCount: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
