import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class ShowMoreText extends StatefulWidget {
  const ShowMoreText({super.key});

  @override
  _ShowMoreTextState createState() => _ShowMoreTextState();
}

class _ShowMoreTextState extends State<ShowMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 22, left: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  ' این خط اول متن است که نمایش داده می‌شود.\n'
                  'این خط دوم متن است که نمایش داده می‌شود.\n'
                  'این خط سوم متن است که نمایش داده می‌شود.',
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  maxLines: _isExpanded ? null : 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ],
            ),
          ),
          if (!_isExpanded)
            TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.greyTextButton,
                  ),
                  Text(
                    'مشاهده بیشتر',
                    style: TextStyle(
                      color: AppColors.greyTextButton,
                    ),
                  ),
                ],
              ),
            ),

          // بقیه متن (مخفی) که با دکمه باز می‌شود
          if (_isExpanded)
            const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'این خط چهارم متن است  با کلیک نمایان می‌شود.\n'
                    'این خط پنجم متن است که و با کلیک نمایان می‌شود.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),

          // دکمه مشاهده کمتر که وقتی متن باز شد، ظاهر می‌شود
          if (_isExpanded)
            TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded; // جمع کردن متن
                });
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.greyTextButton,
                  ),
                  Text(
                    'مشاهده بیشتر',
                    style: TextStyle(
                      color: AppColors.greyTextButton,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
