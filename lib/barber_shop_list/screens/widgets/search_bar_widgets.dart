import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/barber_shop_list/screens/widgets/barber_shop_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SearchBarWidget extends StatefulWidget {
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const SearchBarWidget({super.key, this.onChanged, this.onSubmitted});

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 59,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.cardWhite,
        ),
        borderRadius: BorderRadius.circular(47),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.search,
              size: 20,
            ),
            const SizedBox(width: 7),
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.search,
                controller: _searchController,
                onChanged: widget.onChanged,
                onSubmitted: widget.onSubmitted,
                decoration: InputDecoration(
                  hintText: 'جستجوی نام آرایشگاه',
                  hintStyle: Theme.of(context).textTheme.displayMedium,
                  border: InputBorder.none, // حذف خط زیرین پیش‌فرض
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // آزاد کردن کنترلر هنگام خارج شدن از صفحه
    _searchController.dispose();
    super.dispose();
  }
}
