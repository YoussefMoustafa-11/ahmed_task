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
      firstChild: _SendLinkButton(onPressed: onSendLink),
      secondChild: _SendOTPButton(onPressed: onSendOTP),
      crossFadeState: isEmailMethod
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 300),
    );
  }
}

class _SendLinkButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SendLinkButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2b8cee),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        shadowColor: const Color(0xFF2b8cee).withOpacity(0.25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Send code via Email',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(width: 8),
          Icon(Icons.send, size: 18, color: Colors.white),
        ],
      ),
    );
  }
}

class _SendOTPButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SendOTPButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2b8cee),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        shadowColor: const Color(0xFF2b8cee).withOpacity(0.25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Send OTP',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(width: 8),
          Icon(Icons.sms, size: 18, color: Colors.white),
        ],
      ),
    );
  }
}
