import 'package:flutter/material.dart';

class LogoWithText extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData? dataIcon;

  final TextAlign? subtitleTextAlign;
  const LogoWithText({
    super.key,
    required this.title,
    required this.subTitle,
    this.dataIcon,
    this.subtitleTextAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo Section
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              dataIcon != null
                  ? Container(
                      width: 132,
                      height: 132,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B8CEE).withOpacity(0.10),
                        shape: BoxShape.circle,
                      ),
                    )
                  : const SizedBox.shrink(),
              dataIcon != null
                  ? Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            blurRadius: 22,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Icon(dataIcon, size: 52, color: Color(0xFF2B8CEE)),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        // Text Section
        Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.4,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              subTitle,
              textAlign: subtitleTextAlign,
              style: TextStyle(
                fontSize: 16,
                height: 1.45,
                color: const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
