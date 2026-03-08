import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
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
    );
  }
}
