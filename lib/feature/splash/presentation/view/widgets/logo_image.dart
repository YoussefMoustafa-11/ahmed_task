import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
    required this.fadeInAnimation,
    required this.scaleAnimation,
  });
  final Animation<double> fadeInAnimation;
  final Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeInAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: const Color(0xFF2B8CEE),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2B8CEE).withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 15),
                spreadRadius: 5,
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset('assets/images/logo.svg', fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
