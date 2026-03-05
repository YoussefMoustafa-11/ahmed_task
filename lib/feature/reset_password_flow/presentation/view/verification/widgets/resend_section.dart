import 'package:flutter/material.dart';

class ResendSection extends StatelessWidget {
  final int remainingSeconds;
  final VoidCallback? onResend;

  const ResendSection({
    super.key,
    required this.remainingSeconds,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                'Didn\'t receive the code?',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF64748B),
                ),
              ),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: onResend,
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Resend Code',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: onResend == null
                      ? (const Color(0xFF94A3B8))
                      : const Color(0xFF2B8CEE),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: const Color(0xFFF1F5F9),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.schedule, size: 16, color: const Color(0xFF94A3B8)),
              const SizedBox(width: 8),
              Text(
                _formatTimer(remainingSeconds),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'monospace',
                  color: const Color(0xFF475569),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatTimer(int seconds) {
    final int minutes = seconds ~/ 60;
    final int secs = seconds % 60;
    final String minuteText = minutes.toString().padLeft(2, '0');
    final String secondText = secs.toString().padLeft(2, '0');
    return '$minuteText:$secondText';
  }
}
