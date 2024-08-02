import 'package:bloc_test/config/themes/text_theme.dart';
import 'package:bloc_test/utils/extensions/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTypeInfoContainer extends StatelessWidget {
  final String label;
  final String value;
  final String color;
  const ProductTypeInfoContainer({
    required this.label,
    required this.value,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.r,
      width: 85.r,
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 20.h),
      decoration: BoxDecoration(
          color: Color(color.toHexString()),
          borderRadius: BorderRadius.circular(25.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: AppTypography.title.copyWith(color: Colors.white),
          ),
          Text(
            label,
            maxLines: 1,
            style: AppTypography.small
                .copyWith(overflow: TextOverflow.ellipsis, color: Colors.white),
          ),
        ],
      ),
    );
  }
}