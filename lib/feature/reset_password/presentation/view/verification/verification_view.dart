import 'package:ahmed_task/Core/widgets/custom_button.dart';
import 'package:ahmed_task/feature/reset_password/presentation/view/forgot_password/widgets/header_section.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ahmed_task/feature/reset_password/presentation/view/verification/widgets/resend_section.dart';
import 'package:ahmed_task/feature/reset_password/presentation/view/verification/widgets/verification_content_section.dart';
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
                const HeaderSection(),
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
                            VerificationContentSection(),
                            SizedBox(height: 40),
                            PinCodeTextField(
                              appContext: context,
                              length: 4,
                              enableActiveFill: true,
                              controller: controller,
                              hintCharacter: '-',
                              hintStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF6B7280),
                              ),
                              keyboardType: TextInputType.number,
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF0F172A),
                              ),
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(8),
                                activeBorderWidth: 2,
                                inactiveBorderWidth: 1,
                                fieldHeight: 60,
                                fieldWidth: 50,

                                activeFillColor: Colors.white,
                                inactiveFillColor: Colors.white,
                                selectedFillColor: Colors.white,
                                activeColor: const Color(0xFF2B8CEE),
                                inactiveColor: const Color(0xFF94A3B8),
                                selectedColor: const Color(0xFF2B8CEE),
                              ),
                            ),
                            SizedBox(height: 24),
                           CustomButton(
      width: double.infinity,
      height: 56,
      onPressed: () {
        // Handle verify action
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
    )
      ,
                            SizedBox(height: 16),
                            ResendSection(
                              remainingSeconds: 30,
                              onResend: () {
                                // Handle resend action
                              },
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
