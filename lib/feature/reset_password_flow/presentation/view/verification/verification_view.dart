import 'package:ahmed_task/Core/routing/app_routes.dart';
import 'package:ahmed_task/Core/widgets/custom_button.dart';
import 'package:ahmed_task/Core/widgets/back_header_button.dart';
import 'package:ahmed_task/feature/reset_password_flow/presentation/view/verification/widgets/custom_pin_code_text_field.dart';
import 'package:go_router/go_router.dart';

import 'package:ahmed_task/feature/reset_password_flow/presentation/view/verification/widgets/resend_section.dart';
import 'package:ahmed_task/Core/widgets/logo_with_text.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                const BackNavigationBar(),
                //
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 384),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // logo and text
                            LogoWithText(
                              title: 'Verification Code',
                              subTitle:
                                  'Enter the 4-digit code sent to your email',
                              dataIcon: Icons.mark_email_read_rounded,
                            ),
                            SizedBox(height: 40),
                            // pin code field
                            CustomPinCodeTextField(controller: controller),
                            SizedBox(height: 24),
                            CustomButton(
                              width: double.infinity,
                              height: 56,
                              onPressed: () {
                                GoRouter.of(
                                  context,
                                ).pushNamed(AppRoutes.createNewPasswordView);
                              },
                              backgroundColor: const Color(0xFF2B8CEE),
                              foregroundColor: Colors.white,
                              borderRadius: 16,
                              buttonText: 'Verify',
                              icon: Icons.verified_user_rounded,
                              iconSize: 22,
                              iconSpacing: 8,
                              elevation: 8,
                              shadowColor: const Color(0x402B8CEE),
                            ),
                            SizedBox(height: 16),
                            // review again
                            ResendSection(
                              remainingSeconds: 30,
                              onResend: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
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
