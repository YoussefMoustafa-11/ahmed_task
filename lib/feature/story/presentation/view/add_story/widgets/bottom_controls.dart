import 'package:flutter/material.dart';

class BottomControls extends StatelessWidget {
  final VoidCallback? onGalleryPick;
  final VoidCallback? onCapture;
  final VoidCallback? onFlipCamera;

  const BottomControls({
    super.key,
    this.onGalleryPick,
    this.onCapture,
    this.onFlipCamera,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Gallery Picker
        _GalleryPicker(onTap: onGalleryPick),

        // Capture Button
        _CaptureButton(onTap: onCapture),

        // Camera Flip Button
        _CameraFlipButton(onTap: onFlipCamera),
      ],
    );
  }
}

class _GalleryPicker extends StatelessWidget {
  final VoidCallback? onTap;
  const _GalleryPicker({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8),
              ],
            ),
            child: const Icon(
              Icons.photo_library,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class _CaptureButton extends StatelessWidget {
  final VoidCallback? onTap;
  const _CaptureButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer border circle
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 4,
              ),
            ),
          ),

          // Capture Button
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Color(0xFFE2E8F0).withOpacity(0.5),
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CameraFlipButton extends StatelessWidget {
  final VoidCallback? onTap;
  const _CameraFlipButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.4),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Icon(Icons.cameraswitch, color: Color(0xFFF1F5F9), size: 24),
      ),
    );
  }
}
