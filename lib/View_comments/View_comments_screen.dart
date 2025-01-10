import 'package:flutter/material.dart';
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
                
                // SliverList.builder(
                //   itemBuilder: (context, index) {
                //     return const UserComment();
                //   },
                //   itemCount: 6,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
