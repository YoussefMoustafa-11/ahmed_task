import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  
  final double? height;
  
  final VoidCallback? onPressed;
  
  final Color? backgroundColor;
  
  final double borderRadius;
  
  final String buttonText;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    required this.onPressed,
    this.backgroundColor,
    this.borderRadius = 12,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child:  Text(buttonText, style: AppTextStyle.buttonText),
      ),
    );
  }
}
