import 'package:flutter/material.dart';
import '../../../../../Core/themes/app_text_style.dart';
import '../../../../../Core/themes/app_color.dart';

class EditProfileFormField extends StatelessWidget {
  final String label;
  final String placeholder;
  final String initialValue;
  final TextInputType keyboardType;
  final int maxLines;
  final ValueChanged<String> onChanged;

  const EditProfileFormField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.initialValue,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            label.toUpperCase(),
            style: AppTextStyle.labelMedium.copyWith(
              color: const Color.fromARGB(255, 85, 99, 117),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: TextEditingController(text: initialValue),
            onChanged: onChanged,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: AppTextStyle.bodyMedium.copyWith(
                color: const Color(0xFFCBD5E1),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
            style: AppTextStyle.bodyMedium.copyWith(color: AppColors.darkText),
          ),
        ),
      ],
    );
  }
}
