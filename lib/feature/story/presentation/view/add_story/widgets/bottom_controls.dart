import 'package:flutter/material.dart';

class BottomControls extends StatelessWidget {
  const BottomControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Gallery Picker
        _GalleryPicker(),

        // Capture Button
        _CaptureButton(),

        // Camera Flip Button
        _CameraFlipButton(),
      ],
    );
  }
}

class _GalleryPicker extends StatelessWidget {
  const _GalleryPicker();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Open gallery picker
      },
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCjDdBm4oravlOxRBsnsZO_CEIsGvb2DDUKsJfBv5xgMHF0eSaucZrvrACi5cEb3AzE9HmiYryoiqZ0z4cs5TbV0-hdUWyQOts26KuNcoeqWkS2K8cPVFH48JGePBYpc1WuvRaaZ2k_GDazTha-IsNNI9ZkcC8DlE333JEFNfXXtlgVFEFxsxdWiIbNdLMhEG6DXYw_nTYit_Tcvjj7SVckwGI9f3Uny7kqVH92MLBMSjaAwJ7PyqCOI9PXxDigD1EyvFlW3qQ4Xw8',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CaptureButton extends StatefulWidget {
  const _CaptureButton();

  @override
  State<_CaptureButton> createState() => _CaptureButtonState();
}

class _CaptureButtonState extends State<_CaptureButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Capture image/video
      },
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
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // TODO: Capture image/video
                },
                customBorder: const CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CameraFlipButton extends StatelessWidget {
  const _CameraFlipButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Flip camera
      },
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
