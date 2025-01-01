import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class PriceInvoice extends StatelessWidget {
  const PriceInvoice({
    super.key,
    this.textAlign = TextAlign.start,
    this.advancePayment = '',
    this.discount = '',
    this.totalPrice = '',
    this.payable = '',
    this.remaining = '',
  });

  final TextAlign textAlign;
  final String advancePayment;
  final String discount;
  final String totalPrice;
  final String payable;
  final String remaining;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            advancePayment,
            textAlign: textAlign,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.textHeader),
          ),
          SizedBox(height: height / 90),
          Text(
            discount,
            textAlign: textAlign,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.red),
          ),
          SizedBox(height: height / 90),
          Text(
            totalPrice,
            textAlign: textAlign,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: height / 90),
          Text(
            payable,
            textAlign: textAlign,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.green3),
          ),
          SizedBox(height: height / 90),
          Text(
            remaining,
            textAlign: textAlign,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.yellow),
          ),
        ],
      ),
    );
  }
}
