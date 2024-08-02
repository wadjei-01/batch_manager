import 'package:bloc_test/config/app_constants.dart';
import 'package:bloc_test/config/res/app_colors.dart';
import 'package:bloc_test/config/themes/text_theme.dart';
import 'package:bloc_test/src/core/cubits/batch/batch_cubit.dart';
import 'package:bloc_test/src/core/cubits/batch/batch_state.dart';
import 'package:bloc_test/src/core/model/batch_model.dart';
import 'package:bloc_test/utils/extensions/date_time.dart';
import 'package:bloc_test/utils/helpers/form_validator.dart';
import 'package:bloc_test/widgets/base_screen.dart';
import 'package:bloc_test/widgets/batch_container.dart';
import 'package:bloc_test/widgets/form_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CreateScreen extends HookWidget with FormValidator {
  CreateScreen({super.key});
  static const id = '/create';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final product = useState<String?>(null);
    final productionDate = useState<DateTime?>(null);
    final quantityController = useTextEditingController();
    final quantityText = useState<String?>(null);
    final isQuantityEmpty = useState<bool>(true);

    quantityController.addListener(() {
      if (quantityController.text.isEmpty) {
        isQuantityEmpty.value = true;
        return;
      }
      quantityText.value = quantityController.text;
      isQuantityEmpty.value = false;
    });

    final isProductionDateNull = productionDate.value == null;
    final isProductNull = product.value == null;

    final areValuesFilled =
        !isProductNull && !isProductionDateNull && !isQuantityEmpty.value;

    final isCreatingBatch = useState<bool>(false);

    return BaseScreen(
      title: 'Create',
      hasLeading: true,
      bottomNavBar: BlocListener<BatchCubit, BatchState>(
        listener: (context, state) {
          isCreatingBatch.value = state is BatchStateCreating;
          if (state is BatchStateCreateSuccess) {
            context.pop();
            context.read<BatchCubit>().fetchBatchList();
          }
        },
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              enableFeedback: !isProductionDateNull,
              disabledBackgroundColor: AppColors.lightGreyColor,
              backgroundColor: isProductionDateNull
                  ? AppColors.lightGreyColor
                  : AppColors.primaryColor),
          onPressed:
              (isProductNull && isProductionDateNull) || isCreatingBatch.value
                  ? () {}
                  : () {
                      // if (formKey.currentState!.validate()) return;
                      final batchItem = BatchModel(
                          productName: product.value!,
                          productionDate: productionDate.value!,
                          quantity: int.parse(quantityText.value!));

                      debugPrint('Batch item:>> $batchItem');

                      context.read<BatchCubit>().createBatchItem(batchItem);
                    },
          child: isCreatingBatch.value
              ? const Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ))
              : Text(
                  'Submit',
                  style: AppTypography.bodyOne.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
        ).marginSymmetric(horizontal: 20.w, vertical: 10.h),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.h,
            ),
          ),
          SliverFillRemaining(
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FormTitle(
                            title: 'Product name',
                            formWidget: DropdownButtonFormField<String>(
                              iconEnabledColor: AppColors.lightGreyColor,
                              elevation: 1,
                              hint: Row(
                                children: [
                                  Text(
                                    'Product',
                                    style: AppTypography.bodyTwo
                                        .copyWith(color: AppColors.greyColor),
                                  ),
                                  if (product.value == null)
                                    const Icon(
                                        Icons.keyboard_arrow_down_rounded)
                                ],
                              ),
                              items: productMap.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                product.value = value;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          width: 70.w,
                          child: FormTitle(
                            title: 'Quantity',
                            crossAxisAlignment: CrossAxisAlignment.center,
                            formWidget: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: quantityController,
                              validator: (text) {
                                final validatorValue = quantityValidator(text);
                                if (validatorValue != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(validatorValue)),
                                  );
                                  return '';
                                }
                                return null;
                              },
                              decoration:
                                  const InputDecoration(hintText: 'Qty'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    FormTitle(
                      title: 'Production Date',
                      formWidget: GestureDetector(
                        onTap: () async {
                          productionDate.value = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 60)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 366)),
                          );
                        },
                        child: Container(
                          height: 50.h,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              color: AppColors.lightGreyColor,
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Text(
                            productionDate.value?.toStringFormat() ??
                                'Production Date',
                            style: AppTypography.bodyTwo.copyWith(
                                fontWeight: isProductionDateNull
                                    ? null
                                    : FontWeight.w600,
                                color: isProductionDateNull
                                    ? AppColors.greyColor
                                    : AppColors.darkerGreyColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    FormTitle(
                      title: 'Expiry Date',
                      formWidget: Container(
                        height: 50.h,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: AppColors.lightGreyColor,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Text(
                          productionDate.value
                                  ?.add(const Duration(days: 365))
                                  .toStringFormat() ??
                              'Expiry Date',
                          style: AppTypography.bodyTwo.copyWith(
                              fontWeight:
                                  isProductionDateNull ? null : FontWeight.w600,
                              color: isProductionDateNull
                                  ? AppColors.greyColor
                                  : AppColors.darkerGreyColor),
                        ),
                      ),
                    ),
                    const Spacer(),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 450),
                      firstChild: BatchContainer(
                        productName: product.value ,
                        quantity: quantityText.value,
                        productionDate: productionDate.value,
                      ),
                      secondChild: const SizedBox.shrink(),
                      crossFadeState: areValuesFilled
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    )
                  ],
                )),
          )
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}
