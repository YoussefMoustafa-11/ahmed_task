import 'package:ahmed_task/Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class QuickShareBar extends StatelessWidget {
  const QuickShareBar({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF2b8cee);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 16,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // User Profile Section
          Expanded(
            child: Row(
              spacing: 12,
              children: [
                // User Avatar with Status Badge
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    // Profile Picture
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: primaryColor, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuA6ZaU8mdL1h1q4dM6h4wF_i6JYb6hw4sTofK13MkPrwwD52R2aUzzKghTodcUStZS3eb3zt0R5OEQtb9C51KaNXNT8G24_wFMMtx4pIJEV1N4tkf1g3wPaRu9WZtRkMNAJzOSJPVyXUyzf9q0TLtYqm_LjI2kFNFE2RzYv6tLCCrLf6vhEm2ITGps6XVGK7vG-4pu_roLrGXZwe4IBRzvECOIRBPlma9zDnlBkN-DBNdGfeTXT7_sahC_THPJ-TRg_R8qOXmhmLW4',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Status Badge (Add icon)
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                        border: Border.all(color: Color(0xFF0f172a), width: 2),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                // User Info
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Story',
                        style: TextStyle(
                          color: Color(0xFFF1F5F9),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Close Friends',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Share Button
          CustomButton(
            onPressed: () {
              // TODO: Share story
            },
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            borderRadius: 24,
            buttonText: 'Share',
            icon: Icons.send,
            iconSize: 14,
            iconSpacing: 8,
            height: 36,
            elevation: 4,
            shadowColor: primaryColor.withOpacity(0.4),
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
