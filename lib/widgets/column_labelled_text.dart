import 'package:bloc_test/config/res/app_colors.dart';
import 'package:bloc_test/config/themes/text_theme.dart';
import 'package:flutter/material.dart';

class ColumnLabelledText extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? labelTextStyle;
  final TextStyle? valueTextStyle;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  const ColumnLabelledText({
    required this.label,
    required this.value,
    this.labelTextStyle,
    this.valueTextStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: AppTypography.small.copyWith(color: AppColors.greyColor),
        ),
        Text(
          value,
          style: AppTypography.headingOne.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}