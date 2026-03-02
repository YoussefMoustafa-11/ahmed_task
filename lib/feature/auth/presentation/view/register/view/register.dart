import 'package:ahmed_task/Core/routing/app_routes.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:ahmed_task/Core/widgets/custom_button.dart';
import 'package:ahmed_task/Core/widgets/custom_text_field.dart';
import 'package:ahmed_task/feature/auth/presentation/view/register/widgets/terms_and_privacy_text.dart';
import 'package:ahmed_task/feature/auth/presentation/view/widgets/or_divider.dart';
import 'package:ahmed_task/feature/auth/presentation/view/widgets/heading.dart';
import 'package:ahmed_task/feature/auth/presentation/view/widgets/sign_up_link.dart';
import 'package:ahmed_task/feature/auth/presentation/view/widgets/social_login_buttons.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF000000)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Register', style: AppTextStyle.heading2),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Heading(
                title: 'Create Account',
                subtitle: 'Join our community of creators today',
              ),
              const SizedBox(height: 48),
              const Text('Full Name', style: AppTextStyle.labelMedium),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _emailController,
                hintText: "Enter your full name",
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 8),
              const Text('Email Address', style: AppTextStyle.labelMedium),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _emailController,
                hintText: "Enter your email address",
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 24),
              const Text('Password', style: AppTextStyle.labelMedium),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _passwordController,
                isPassword: true,
                hintText: "..........",
                prefixIcon: Icons.lock_outline,
              ),
              const SizedBox(height: 16),
              TermsAndPrivacyText(
                onTermsTap: () {
                  // TODO: Handle terms tap
                },
                onPrivacyTap: () {
                  // TODO: Handle privacy tap
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                height: 48,
                width: double.infinity,
                onPressed: () {
                  // TODO: Implement sign up logic
                },
                buttonText: "Sign Up",
                backgroundColor: AppColors.primary,
              ),
              const SizedBox(height: 32),
              const OrDivider(),
              const SizedBox(height: 24),
              const SocialLoginButtons(),
              const SizedBox(height: 32),
              SignUpLink(
                text: "Already have an account? ",
                linkText: "Login",
                onTap: () {
                  GoRouter.of(context).pushNamed(AppRoutes.logInView);
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
