import 'package:flutter/material.dart';
import 'widgets/logo_image.dart';
import 'widgets/main_title.dart';
import 'widgets/tag_line.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _fadeInController;
  late AnimationController _scaleController;

  late Animation<double> _fadeInAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    // Fade In Animation for the logo
    _fadeInController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeInAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeInController, curve: Curves.easeIn));
    // Scale Animation for the logo
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    // Start animations
    _fadeInController.forward();
    _scaleController.forward();

    // Navigate after animations complete
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        // Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _fadeInController.dispose();
    _scaleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Logo/Image
            LogoImage(
              fadeInAnimation: _fadeInAnimation,
              scaleAnimation: _scaleAnimation,
            ),
            const SizedBox(height: 50),
            // Animated Tagline
            Tagline(),
            const SizedBox(height: 40),
            // Animated Main Title
            MainTitle(),
          ],
        ),
      ),
    );
  }
}
