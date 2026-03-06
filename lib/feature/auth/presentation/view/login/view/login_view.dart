import 'package:ahmed_task/Core/routing/app_routes.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/themes/app_text_style.dart';
import 'package:ahmed_task/Core/widgets/custom_button.dart';
import 'package:ahmed_task/Core/widgets/custom_text_field.dart';
import 'package:ahmed_task/Core/widgets/or_divider.dart';
import 'package:ahmed_task/feature/auth/presentation/view/login/widgets/password_field.dart';
import 'package:ahmed_task/Core/widgets/sign_up_link.dart';
import 'package:ahmed_task/Core/widgets/heading.dart';
import 'package:ahmed_task/Core/widgets/social_login_buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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

        title: const Text('Login', style: AppTextStyle.heading2),
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
                title: 'Welcome Back',
                subtitle: 'Enter your details to access your account',
              ),
              const SizedBox(height: 48),
              const Text('Email Address', style: AppTextStyle.labelMedium),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _emailController,
                hintText: "Enter your email address",
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 24),
              const PasswordField(),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _passwordController,
                isPassword: true,
                hintText: '•' * 8,
                prefixIcon: Icons.lock_outline,
              ),
              const SizedBox(height: 32),
              CustomButton(
                height: 48,
                width: double.infinity,
                onPressed: () {
                  // TODO: Implement sign in logic
                  GoRouter.of(context).pushNamed(AppRoutes.homeView);
                },
                buttonText: "Sign In",
                backgroundColor: AppColors.primary,
              ),
              const SizedBox(height: 32),
              const OrDivider(),
              const SizedBox(height: 24),
              const SocialLoginButtons(),
              const SizedBox(height: 32),
              SignUpLink(
                text: "Don't have an account? ",
                linkText: "Create Account",
                onTap: () {
                  GoRouter.of(context).pushNamed(AppRoutes.registerView);
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
