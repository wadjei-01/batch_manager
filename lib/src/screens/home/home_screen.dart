import 'package:bloc_test/config/app_constants.dart';
import 'package:bloc_test/src/core/cubits/batch/batch_cubit.dart';
import 'package:bloc_test/src/core/cubits/batch/batch_state.dart';
import 'package:bloc_test/config/themes/text_theme.dart';
import 'package:bloc_test/src/screens/create/create_screen.dart';
import 'package:bloc_test/widgets/base_screen.dart';
import 'package:bloc_test/widgets/batch_container.dart';
import 'package:bloc_test/widgets/product_type_info_container.dart';
import 'package:bloc_test/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:bloc_test/config/res/app_colors.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});
  static const id = '/';

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<BatchCubit>().fetchBatchList();
    });
    return BaseScreen(
      title: 'Home',
      floatingActionButton: GestureDetector(
        onTap: () {
          context.push(CreateScreen.id);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20.r)),
          child: IntrinsicWidth(
            child: Row(
              children: [
                Text(
                  'Create',
                  style: AppTypography.headingTwo.copyWith(color: Colors.white),
                ),
                Icon(
                  HeroIcons.plus,
                  color: Colors.white,
                  size: 20.r,
                )
              ],
            ),
          ),
        ),
      ),
      child: BlocBuilder<BatchCubit, BatchState>(builder: (context, state) {
        final isBatchListLoading = state is BatchStateLoading;
        final hasBatchLoaded = state is BatchStateSuccess;
        final isBatchListError = state is BatchStateFailure;
        return RefreshIndicator(
          onRefresh: () async {
            await context.read<BatchCubit>().fetchBatchList();
          },
          child: CustomScrollView(
            slivers: [
              const CustomSearchBar(),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // TODO:
                  children: productList
                      .map((product) => ProductTypeInfoContainer(
                            label: product['label']!,
                            value: product['value']!,
                            color: product['color']!,
                          ))
                      .toList(),
                ).marginSymmetric(horizontal: 20.w, vertical: 10.h),
              ),
              SliverVisibility(
                visible: !isBatchListError,
                replacementSliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        EvaIcons.alert_circle,
                        size: 100.r,
                      ),
                      Text('error')
                    ],
                  ),
                ),
                sliver: SliverVisibility(
                  visible: !isBatchListLoading,
                  replacementSliver: const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  sliver: hasBatchLoaded && state.batchList.isNotEmpty
                      ? SliverList.builder(
                          itemCount: state.batchList.length,
                          itemBuilder: (context, index) {
                            final batchItem = state.batchList[index];

                            return BatchContainer(
                              productName: batchItem.productName,
                              quantity: batchItem.quantity.toString(),
                              productionDate: batchItem.productionDate,
                            );
                          },
                        )
                      :
                      // TODO:
                      const SliverFillRemaining(
                          child: Column(
                            children: [Icon(EvaIcons.alert_circle)],
                          ),
                        ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
