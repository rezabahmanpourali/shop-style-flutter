import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class ComponentInformation extends StatelessWidget {
  const ComponentInformation({
    super.key,
    required this.context,
    required this.icon,
    required this.text,
    this.hasImportant = false,
  });

  final BuildContext context;
  final Icon icon;
  final String text;
  final bool hasImportant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 7),
        Expanded(
          child: Text(
            text,
            style: hasImportant
                ? Theme.of(context).textTheme.bodySmall
                : Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.textHeader),
          ),
        ),
      ],
    );
  }
}
