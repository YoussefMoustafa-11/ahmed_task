import 'package:ahmed_task/Core/routing/app_routes.dart';
import 'package:ahmed_task/Core/widgets/back_header_button.dart';
import 'package:ahmed_task/Core/widgets/custom_text_field.dart';
import 'package:ahmed_task/Core/widgets/logo_with_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/recovery_method_tabs.dart';

import 'widgets/phone_input_group.dart';
import 'widgets/action_buttons.dart';
import 'widgets/back_to_login_link.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  bool _isEmailMethod = false;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  String _selectedCountryCode = '+20';

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onMethodChanged(bool isEmail) {
    setState(() {
      _isEmailMethod = isEmail;
    });
  }

  void _onCountryCodeChanged(String code) {
    setState(() {
      _selectedCountryCode = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const BackNavigationBar(),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      LogoWithText(
                        title: 'Forgot Password',
                        subTitle:
                            'Select which contact details should we use to reset your password',
                        dataIcon: Icons.lock_reset,
                      ),
                      const SizedBox(height: 40),
                      //review again
                      RecoveryMethodTabs(
                        isEmailMethod: _isEmailMethod,
                        onMethodChanged: _onMethodChanged,
                      ),
                      const SizedBox(height: 15),
                      if (_isEmailMethod)
                        CustomTextField(
                          controller: _emailController,
                          label: 'Email Address',
                          hintText: 'name@example.com',
                          prefixIcon: Icons.mail,
                        )
                      else
                        PhoneInputGroup(
                          phoneController: _phoneController,
                          selectedCountryCode: _selectedCountryCode,
                          onCountryCodeChanged: _onCountryCodeChanged,
                        ),
                      const SizedBox(height: 60),
                      //review again                   
                      ActionButtons(
                        isEmailMethod: _isEmailMethod,
                        onSendLink: () {
                          GoRouter.of(context).push(AppRoutes.verificationView);
                        },
                        onSendOTP: () {
                          GoRouter.of(context).push(AppRoutes.verificationView);
                        },
                      ),
                      const SizedBox(height: 30),
                      BackToLoginLink(onTap: () => Navigator.pop(context)),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
