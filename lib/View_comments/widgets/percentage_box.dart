import 'package:flutter/material.dart';

class PercentageBox extends StatelessWidget {
  const PercentageBox({
    super.key,
    required this.scores,
    required this.selectedScores,
  });

  final List<double> scores;
  final double selectedScores;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // فرمول ریاضی برای محاسبه درصد//
    final double sum =
        scores[0] + scores[1] + scores[2] + scores[3] + scores[4];
    final double trySum = sum == 0 ? 1 : sum;
    final double percentage = selectedScores * 100 / trySum;
    final double percetageWid =
        (width / 1.44) - (percentage * (width / 1.44) / 100);
    // فرمول ریاضی برای محاسبه درصد//

    return Container(
      margin: EdgeInsets.only(
        top: height / 50,
        bottom: height / 50,
        right: width / 10,
        left: width / 15,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(365)),
        color: Color(0xFFE5E5E5),
      ),
      height: height / 200,
      child: Padding(
        padding: EdgeInsets.only(right: percetageWid),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(365)),
            color: Color(0xFF0D1619),
          ),
          height: height / 200,
        ),
      ),
    );
  }
}
