import 'package:flutter/material.dart';
import 'package:shop_style/View_comments/widgets/perecentage_score.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/model/comment_model.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/widgets/scoring.dart';
import 'package:shop_style/common/widgets/user_comment.dart';

class ViewCommentsScreen extends StatefulWidget {
  const ViewCommentsScreen({super.key, required this.barberShopModel});

  final BarberShopModel barberShopModel;

  @override
  State<ViewCommentsScreen> createState() => _ViewCommentsScreenState();
}

class _ViewCommentsScreenState extends State<ViewCommentsScreen> {
  String _sortOption = 'جدیدترین';
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    List<CommentModel> sortedComments =
        List.from(widget.barberShopModel.comments!);
    if (_sortOption == 'قدیمی ترین') {
      sortedComments.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } else {
      sortedComments.sort(
        (b, a) => a.createdAt.compareTo(b.createdAt),
      );
    }

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
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(),
                      ),
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
                            '${sortedComments.length} دیدگاه',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 20,
                                  color: AppColors.textSearchColor,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            'مرتب سازی:',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: AppColors.textSearchColor),
                          ),
                          SizedBox(width: width / 40),
                          PopupMenuButton<String>(
                            onSelected: (String value) {
                              setState(() {
                                _sortOption = value;
                              });
                            },
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem<String>(
                                  value: 'جدیدترین',
                                  child: Text(
                                    'جدیدترین',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          color: AppColors.black,
                                        ),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'قدیمی ترین',
                                  child: Text(
                                    'قدیمی ترین',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          color: AppColors.black,
                                        ),
                                  ),
                                ),
                              ];
                            },
                            offset: const Offset(0, 50), // تنظیم موقعیت منو
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: AppColors.cardWhite,
                                width: 1,
                              ),
                            ),

                            color: AppColors.white2, // پس‌زمینه منو
                            elevation: 5, // سایه منو

                            child: Container(
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
                                    _sortOption,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          color: AppColors.black,
                                          fontSize: 14,
                                        ),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
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
                    final comment = sortedComments[index];
                    return UserComment(
                      commentBarberShop: comment,
                    );
                  },
                  itemCount: sortedComments.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
