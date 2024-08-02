import 'package:bloc_test/config/res/app_colors.dart';
import 'package:bloc_test/config/themes/text_theme.dart';
import 'package:bloc_test/utils/helpers/string_helper.dart';
import 'package:bloc_test/widgets/column_labelled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:bloc_test/utils/extensions/date_time.dart';

class BatchContainer extends StatelessWidget {
  final String? productName;
  final String? quantity;
  final DateTime? productionDate;

  const BatchContainer({
    super.key,
    required this.productName,
    required this.quantity,
    required this.productionDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGreyColor,
          ),
          borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                child: Icon(HeroIcons.archive_box),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringHelper.getBatchNo(productName, productionDate),
                    style: AppTypography.headingTwo
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    productionDate?.toStringFormat() ?? '',
                    style: AppTypography.small,
                  ),
                ],
              )
            ],
          ),
          ColumnLabelledText(
            label: 'Quantity',
            value: quantity ?? '0',
            crossAxisAlignment: CrossAxisAlignment.end,
          ),
        ],
      ),
    );
  }
}
