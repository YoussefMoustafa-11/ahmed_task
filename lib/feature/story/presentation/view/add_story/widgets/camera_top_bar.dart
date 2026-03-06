import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CameraTopBar extends StatelessWidget {
  const CameraTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Close Button
          _IconButton(
            icon: Icons.close,
            onPressed: () => Navigator.pop(context),
          ),

          // Tools Bar (Flash, Mood, Text, Brush)
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ToolButton(icon: Icons.flash_on, onPressed: () {}),
                    _ToolButton(icon: Icons.emoji_emotions, onPressed: () {}),
                    _ToolButton(icon: Icons.text_fields, onPressed: () {}),
                    _ToolButton(icon: Icons.brush, onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),

          // Settings Button
          _IconButton(icon: Icons.settings, onPressed: () {}),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _IconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.2),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Icon(icon, color: Color(0xFFF1F5F9), size: 20),
          ),
        ),
      ),
    );
  }
}

class _ToolButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ToolButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Icon(icon, color: Color(0xFFF1F5F9), size: 18),
      ),
    );
  }
}
