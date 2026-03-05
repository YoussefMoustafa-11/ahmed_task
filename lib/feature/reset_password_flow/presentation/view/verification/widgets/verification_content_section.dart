import 'package:flutter/material.dart';

class VerificationContentSection extends StatelessWidget {
  const VerificationContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 132,
                height: 132,
                decoration: BoxDecoration(
                  color: const Color(
                    0xFF2B8CEE,
                  ).withOpacity(isDark ? 0.20 : 0.10),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDark ? 0.25 : 0.10),
                      blurRadius: 22,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.mark_email_read_rounded,
                  size: 52,
                  color: Color(0xFF2B8CEE),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              'Verification Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.4,
                color: isDark
                    ? const Color(0xFFF1F5F9)
                    : const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Enter the 4-digit code sent to your email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.45,
                  color: isDark
                      ? const Color(0xFF94A3B8)
                      : const Color(0xFF64748B),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
