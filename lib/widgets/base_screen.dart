import 'package:bloc_test/config/res/app_colors.dart';
import 'package:bloc_test/config/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BaseScreen extends StatelessWidget {
  final String? title;
  final Widget child;
  final Widget? bottomNavBar;
  final Widget? floatingActionButton;
  final bool hasLeading;
  final IconData? leadingIcon;
  final void Function()? leadingOnTap;

  const BaseScreen({
    this.title,
    required this.child,
    this.bottomNavBar,
    this.floatingActionButton,
    this.hasLeading = false,
    this.leadingOnTap,
    this.leadingIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Visibility(
          visible: hasLeading,
          child: Center(
            child: CircleAvatar(
              backgroundColor: AppColors.lightGreyColor,
              child: MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => leadingOnTap ?? context.pop(),
                  child: Icon(leadingIcon ?? Icons.chevron_left_rounded)),
            ),
          ),
        ),
        leadingWidth: 75.w,
        titleSpacing: 0,
        centerTitle: true,
        title: Visibility(
            visible: title != null,
            child: Text(
              '$title',
              style: AppTypography.title,
            )),
      ),
      backgroundColor: Colors.white,
      body: child,
      bottomNavigationBar: bottomNavBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
