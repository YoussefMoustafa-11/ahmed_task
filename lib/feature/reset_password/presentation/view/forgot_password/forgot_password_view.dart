import 'package:ahmed_task/Core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/header_section.dart';
import 'widgets/icon_section.dart';
import 'widgets/title_section.dart';
import 'widgets/recovery_method_tabs.dart';
import 'widgets/email_input_group.dart';
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const HeaderSection(),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const IconSection(),
                      const SizedBox(height: 15),
                      const TitleSection(),
                      const SizedBox(height: 16),
                      RecoveryMethodTabs(
                        isEmailMethod: _isEmailMethod,
                        onMethodChanged: _onMethodChanged,
                      ),
                      const SizedBox(height: 15),
                      if (_isEmailMethod)
                        EmailInputGroup(controller: _emailController)
                      else
                        PhoneInputGroup(
                          phoneController: _phoneController,
                          selectedCountryCode: _selectedCountryCode,
                          onCountryCodeChanged: _onCountryCodeChanged,
                        ),
                      const SizedBox(height: 60),
                      ActionButtons(
                        isEmailMethod: _isEmailMethod,
                        onSendLink: () {
                          GoRouter.of(context).push(AppRoutes.verificationView);
                        },
                        onSendOTP: () {},
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
