import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CameraTopBar extends StatelessWidget {
  final bool isFlashOn;
  final VoidCallback? onFlashToggle;
  final bool hasCapturedImage;
  final VoidCallback? onClearImage;

  const CameraTopBar({
    super.key,
    this.isFlashOn = false,
    this.onFlashToggle,
    this.hasCapturedImage = false,
    this.onClearImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Close / Clear Button
          _IconButton(
            icon: hasCapturedImage ? Icons.arrow_back : Icons.close,
            onPressed: () {
              if (hasCapturedImage) {
                onClearImage?.call();
              } else {
                Navigator.pop(context);
              }
            },
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
                    _ToolButton(
                      icon: isFlashOn ? Icons.flash_on : Icons.flash_off,
                      isActive: isFlashOn,
                      onPressed: () => onFlashToggle?.call(),
                    ),
                    _ToolButton(
                      icon: Icons.emoji_emotions,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Stickers coming soon'),
                            duration: Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                    ),
                    _ToolButton(
                      icon: Icons.text_fields,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Text overlay coming soon'),
                            duration: Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                    ),
                    _ToolButton(
                      icon: Icons.brush,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Drawing tool coming soon'),
                            duration: Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Settings Button
          _IconButton(
            icon: Icons.settings,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.grey[900],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (sheetContext) => SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.hd, color: Colors.white),
                        title: const Text(
                          'Quality: High',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () => Navigator.pop(sheetContext),
                      ),
                      ListTile(
                        leading: const Icon(Icons.timer, color: Colors.white),
                        title: const Text(
                          'Timer: Off',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () => Navigator.pop(sheetContext),
                      ),
                      ListTile(
                        leading: const Icon(Icons.grid_on, color: Colors.white),
                        title: const Text(
                          'Grid: Off',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () => Navigator.pop(sheetContext),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
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
  final bool isActive;

  const _ToolButton({
    required this.icon,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.white.withOpacity(0.2) : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.amber : Color(0xFFF1F5F9),
          size: 18,
        ),
      ),
    );
  }
}
