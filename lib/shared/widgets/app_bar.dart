import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onTapLeading;
  final List<Widget>? actions;
  final String? title;
  final bool implementBackButton;
  final Color? backgroundColor;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double? fontSize;
  final double elevation;
  final bool centerTitle;
  const CustomAppBar(
      {super.key,
      this.onTapLeading,
      this.actions,
      this.title,
      this.elevation = 1,
      this.backgroundColor,
      this.centerTitle = true,
      this.implementBackButton = true,
      this.leading,
      this.bottom,
      this.fontSize})
      : preferredSize = const Size.fromHeight(56);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      toolbarHeight: 56,
      leadingWidth: 44,
      elevation: elevation,
      actions: actions,
      // shadowColor: AppColors.shadowColor,
      // foregroundColor: AppColors.shadowColor,
      bottom: bottom,
      leading: leading ??
          (!implementBackButton
              ? const SizedBox.shrink()
              : IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: onTapLeading ?? () => Navigator.of(context).maybePop(),
                )),
      centerTitle: centerTitle,
      title: title == null
          ? const SizedBox.shrink()
          : Text(
              title!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize ?? 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
