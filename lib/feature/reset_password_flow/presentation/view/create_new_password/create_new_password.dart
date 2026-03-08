import 'package:ahmed_task/Core/widgets/logo_with_text.dart';
import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'widgets/password_form_section.dart';
import 'widgets/password_requirements.dart';

import 'widgets/reset_password_footer.dart';

/// Create New Password Screen
///
/// This screen allows users to reset their password by entering a new password
/// and confirming it. It includes password strength requirements guidance
/// and validation feedback.
class CreateNewPasswordView extends StatefulWidget {
  const CreateNewPasswordView({super.key});

  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordView> {
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  bool _hasMinCharacters = false;
  bool _hasSpecialCharacter = false;

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    // Listen to password changes for validation
    _newPasswordController.addListener(_validatePassword);
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  /// Validate password against requirements
  void _validatePassword() {
    final password = _newPasswordController.text;

    setState(() {
      _hasMinCharacters = password.length >= 8;
      _hasSpecialCharacter = _hasSpecialCharacterInPassword(password);
    });
  }

  /// Check if password contains special character
  bool _hasSpecialCharacterInPassword(String password) {
    final specialCharacterRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return specialCharacterRegex.hasMatch(password);
  }

  /// Handle reset password action
  void _handleResetPassword() {
    // Validate form fields
    if (_newPasswordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      _showErrorSnackBar('Please fill in all fields');
      return;
    }
    // Check if passwords match
    if (_newPasswordController.text != _confirmPasswordController.text) {
      _showErrorSnackBar('Passwords do not match');
      return;
    }
    // Check if password meets requirements
    if (!_hasMinCharacters || !_hasSpecialCharacter) {
      _showErrorSnackBar('Password does not meet all requirements');
      return;
    }

    // TODO: Call API to reset password
    _showSuccessSnackBar('Password reset successfully');
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.darkText,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Header Section
              const LogoWithText(
                subtitleTextAlign: TextAlign.left,
                title: 'Create New Password',
                subTitle: 'Please enter a new password for your account.',
              ),
              const SizedBox(height: 40),

              // Form Section
              PasswordFormSection(
                newPasswordController: _newPasswordController,
                confirmPasswordController: _confirmPasswordController,
              ),
              const SizedBox(height: 24),

              // Password Requirements
              PasswordRequirements(
                hasMinCharacters: _hasMinCharacters,
                hasSpecialCharacter: _hasSpecialCharacter,
              ),
              const SizedBox(height: 40),

              // Footer Section with Button and Support Link
              ResetPasswordFooter(onResetPressed: _handleResetPassword),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
