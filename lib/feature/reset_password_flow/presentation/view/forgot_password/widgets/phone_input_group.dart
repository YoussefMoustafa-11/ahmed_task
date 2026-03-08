import 'package:ahmed_task/Core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PhoneInputGroup extends StatelessWidget {
  final TextEditingController phoneController;
  final String selectedCountryCode;
  final ValueChanged<String> onCountryCodeChanged;

  const PhoneInputGroup({
    super.key,
    required this.phoneController,
    required this.selectedCountryCode,
    required this.onCountryCodeChanged,
  });

  @override
  Widget build(BuildContext context) {
    const countryCodes = [
      ('+20', '🇪🇬'),
      ('+44', '🇬🇧'),
      ('+91', '🇮🇳'),
      ('+61', '🇦🇺'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 4),
          child: Text(
            'Phone Number',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF475569),
            ),
          ),
        ),
        Row(
          children: [
            // Country Code Dropdown
            SizedBox(
              width: 115,
              child: DropdownButtonFormField<String>(
                initialValue: selectedCountryCode,
                onChanged: (value) {
                  if (value != null) {
                    onCountryCodeChanged(value);
                  }
                },
                //-------->NOTE: Generate dropdown items from countryCodes list
                items: countryCodes
                    .map(
                      (country) => DropdownMenuItem<String>(
                        value: country.$1,
                        child: Text('${country.$2} ${country.$1}'),
                      ),
                    )
                    .toList(),

                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: const Color(0xFFe2e8f0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: const Color(0xFFe2e8f0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Color(0xFF2b8cee),
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 10,
                  ),
                ),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomTextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                hintText: '10123456789',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
