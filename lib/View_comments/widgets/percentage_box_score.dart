import 'package:flutter/material.dart';
import 'package:shop_style/View_comments/widgets/percentage_box.dart';
import 'package:shop_style/common/configs/colors.dart';

class PercentageBoxScore extends StatefulWidget {
  const PercentageBoxScore({super.key});

  @override
  State<PercentageBoxScore> createState() => _PercentageBoxScoreState();
}

class _PercentageBoxScoreState extends State<PercentageBoxScore> {
  int selectedIndex = -1;
  List<int> numberScore = [5, 4, 3, 2, 1];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final List<int> listScore = [55, 30, 16, 0, 1];
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: -width / 50,
              child: Checkbox(
                splashRadius: 5,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                checkColor: Colors.transparent,
                activeColor: AppColors.purple,
                value: selectedIndex == index,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value! ? index : -1;
                  });
                },
              ),
            ),
            Positioned(
              right: width / 15,
              child: Text(
                numberScore[index].toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            PercentageBox(
              selectedScores: listScore[index],
              scores: listScore,
            ),
            Positioned(
              left: 0,
              child: Text(
                listScore[index].toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        );
      },
    );
  }
}
