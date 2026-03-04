import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;

  final double? height;

  final VoidCallback? onPressed;

  final Color? backgroundColor;

  final Color? foregroundColor;

  final double borderRadius;

  final String buttonText;

  final IconData? icon;

  final double? iconSize;

  final double? iconSpacing;

  final double elevation;

  final Color? shadowColor;

  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = 12,
    required this.buttonText,
    this.icon,
    this.iconSize,
    this.iconSpacing = 8,
    this.elevation = 0,
    this.shadowColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: elevation,
          shadowColor: shadowColor,
        ),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(buttonText, style: textStyle ?? AppTextStyle.buttonText),
                  SizedBox(width: iconSpacing),
                  Icon(icon, size: iconSize),
                ],
              )
            : Text(buttonText, style: textStyle ?? AppTextStyle.buttonText),
      ),
    );
  }
}
