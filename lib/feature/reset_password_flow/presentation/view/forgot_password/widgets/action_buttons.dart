import 'package:ahmed_task/Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final bool isEmailMethod;
  final VoidCallback onSendLink;
  final VoidCallback onSendOTP;

  const ActionButtons({
    super.key,
    required this.isEmailMethod,
    required this.onSendLink,
    required this.onSendOTP,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: CustomButton(
        height: 50,
        onPressed: onSendLink,
        buttonText: 'Send code via Email',
        icon: Icons.send,
        backgroundColor: const Color(0xFF2b8cee),
        foregroundColor: Colors.white,
        borderRadius: 16,
        elevation: 8,
        shadowColor: const Color(0xFF2b8cee).withOpacity(0.25),
        iconSize: 18,
        iconSpacing: 8,
      ),
      secondChild: CustomButton(
        height: 50,

        onPressed: onSendOTP,
        buttonText: 'Send OTP',
        icon: Icons.sms,
        backgroundColor: const Color(0xFF2b8cee),
        foregroundColor: Colors.white,
        borderRadius: 16,
        elevation: 8,
        shadowColor: const Color(0xFF2b8cee).withOpacity(0.25),
        iconSize: 18,
        iconSpacing: 8,
      ),
      crossFadeState: isEmailMethod
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 300),
    );
  }
}
