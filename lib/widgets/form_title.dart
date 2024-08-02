import 'package:bloc_test/config/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormTitle extends StatelessWidget {
  final String title;
  final Widget formWidget;
  final CrossAxisAlignment? crossAxisAlignment;
  const FormTitle(
      {required this.title,
      required this.formWidget,
      this.crossAxisAlignment,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.small.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5.h,
        ),
        formWidget
      ],
    );
  }
}
