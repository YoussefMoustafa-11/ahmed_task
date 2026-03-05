import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';

/// Password requirements checklist widget
class PasswordRequirements extends StatelessWidget {
  final bool hasMinCharacters;
  final bool hasSpecialCharacter;

  const PasswordRequirements({
    super.key,
    this.hasMinCharacters = false,
    this.hasSpecialCharacter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          _RequirementItem(
            text: 'At least 8 characters',
            isMet: hasMinCharacters,
          ),
          const SizedBox(height: 8),
          _RequirementItem(
            text: 'One special character',
            isMet: hasSpecialCharacter,
          ),
        ],
      ),
    );
  }
}

/// Individual password requirement item
class _RequirementItem extends StatelessWidget {
  final String text;
  final bool isMet;

  const _RequirementItem({required this.text, required this.isMet});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isMet ? Icons.check_circle : Icons.radio_button_unchecked,
          size: 14,
          color: isMet ? Colors.green : AppColors.greyText,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppTextStyle.labelMedium.copyWith(
            fontSize: 12,
            color: AppColors.greyText,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
