import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String? hintText;
  final String? label;
  final IconData? prefixIcon;
  final int? maxLines;
  const CustomTextField({
    super.key,
    required this.controller,
    this.isPassword = false,
    this.hintText,
    this.prefixIcon,
    this.label,
    this.maxLines,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.label?.toUpperCase() ?? '',
                  style: AppTextStyle.labelMedium.copyWith(
                    color: const Color.fromARGB(255, 85, 99, 117),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: widget.maxLines ?? 1,
          controller: widget.controller,
          keyboardType: widget.isPassword
              ? TextInputType.text
              : TextInputType.emailAddress,
          style: AppTextStyle.inputText,
          obscureText: widget.isPassword && !isPasswordVisible,
          decoration: InputDecoration(
            hintText: widget.hintText ?? "",
            hintStyle: AppTextStyle.inputHint,
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: AppColors.greyText)
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.greyText,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  )
                : null,
            filled: true,
            fillColor: AppColors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}
