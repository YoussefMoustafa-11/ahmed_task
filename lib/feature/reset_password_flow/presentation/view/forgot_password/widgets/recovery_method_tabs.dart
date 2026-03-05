import 'package:flutter/material.dart';

class RecoveryMethodTabs extends StatelessWidget {
  final bool isEmailMethod;
  final ValueChanged<bool> onMethodChanged;

  const RecoveryMethodTabs({
    super.key,
    required this.isEmailMethod,
    required this.onMethodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          
         
          Row(
            children: [ 
              // Email Tab
              Expanded(
                child: GestureDetector(
                  onTap: () => onMethodChanged(true),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Email',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isEmailMethod
                            ? const Color(0xFF2b8cee)
                            : Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              // Phone Tab
              Expanded(
                child: GestureDetector(
                  onTap: () => onMethodChanged(false),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Phone',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: !isEmailMethod
                            ? const Color(0xFF2b8cee)
                            : Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
