import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/constants/app_colors.dart';
import 'package:pro/widgets/circularprogress_indicator.dart';
import 'package:pro/widgets/icon_widget.dart';
import 'package:pro/widgets/sizedbox_widget.dart';
import 'package:pro/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.onClick,
      required this.text,
      this.borderRadius = 5,
      this.width = 100,
      this.height = 45,
      this.isInProgress = false,
      this.isDark = false,
      this.isTransparentColor = false,
      this.showShadow = false,
      this.isBorder = false,
      this.textStyle,
      this.fontSize = 14,
      this.fontWeight,
      this.textColor = AppColors.textGrey,
      this.borderColor,
      this.backgroundColor = AppColors.lightVioletColor,
      this.showIcon = false,
      this.isSuffixIcon = false,
      this.isPrefixIcon = false,
      this.iconName,
      this.iconColor,
      this.iconHeight,
      this.rightPaddingToIcon,
      this.distanceBetweenIconAndText});

  final Function onClick;
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double borderRadius;
  final bool isInProgress;
  final bool isDark;
  final bool isTransparentColor;
  final bool showShadow;
  final bool isBorder;
  final TextStyle? textStyle;
  final bool showIcon;
  final bool isSuffixIcon;
  final String? iconName;
  final Color? iconColor;
  final double? iconHeight;
  final bool? isPrefixIcon;
  final double? rightPaddingToIcon;
  final double? distanceBetweenIconAndText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(
        borderRadius,
      )),
      onTap: () {
        if (!isInProgress) {
          onClick();
        }
      },
      child: Container(
        height: height.h,
        width: width.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          color: isDark
              ? Theme.of(context).primaryColor
              : isTransparentColor
                  ? Colors.transparent
                  : backgroundColor ?? AppColors.whiteColor,
          border: isBorder
              ? Border.all(
                  color: borderColor ?? Theme.of(context).primaryColor,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: showShadow
                  ? Theme.of(context).shadowColor
                  : Colors.transparent,
              blurRadius: 20.r,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: isInProgress
            ? CircularProgressIndicatorWidget(
                context: context,
                size: 20,
                color: isDark
                    ? AppColors.whiteColor
                    : textColor ?? Theme.of(context).primaryColor,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isPrefixIcon == true
                      ? Padding(
                          padding: EdgeInsets.only(right: 8.0.w),
                          child: IconWidget(
                            data: iconName ?? "",
                            color: iconColor,
                            height: iconHeight ?? 18.h,
                          ),
                        )
                      : const SizedBoxWidget(
                          height: 1,
                          width: 1,
                        ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                    child: TextWidget(
                      text: text,
                      textAlign: TextAlign.center,
                      color: isDark
                          ? AppColors.whiteColor
                          : textColor ?? Theme.of(context).primaryColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                  SizedBoxWidget(
                    width: distanceBetweenIconAndText ?? 2.w,
                  ),
                  isSuffixIcon == true
                      ? Padding(
                          padding: EdgeInsets.only(
                              right: rightPaddingToIcon ?? 0.0.w),
                          child: IconWidget(
                            data: iconName ?? "",
                            color: iconColor,
                            height: iconHeight ?? 18.h,
                          ),
                        )
                      : const SizedBoxWidget(
                          height: 1,
                          width: 1,
                        ),
                ],
              ),
      ),
    );
  }
}
