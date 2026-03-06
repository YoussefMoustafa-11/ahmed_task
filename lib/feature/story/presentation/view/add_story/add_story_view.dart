import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'widgets/camera_top_bar.dart';
import 'widgets/bottom_controls.dart';
import 'widgets/quick_share_bar.dart';

class AddStoryView extends StatefulWidget {
  const AddStoryView({super.key});

  @override
  State<AddStoryView> createState() => _AddStoryViewState();
}

class _AddStoryViewState extends State<AddStoryView> {
  final ImagePicker _picker = ImagePicker();
  XFile? _capturedImage;
  bool _isFlashOn = false;
  CameraDevice _cameraDevice = CameraDevice.rear;

  Future<void> _pickFromGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null && mounted) {
      setState(() => _capturedImage = image);
    }
  }

  Future<void> _captureImage() async {
    final image = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: _cameraDevice,
    );
    if (image != null && mounted) {
      setState(() => _capturedImage = image);
    }
  }

  void _flipCamera() {
    setState(() {
      _cameraDevice = _cameraDevice == CameraDevice.rear
          ? CameraDevice.front
          : CameraDevice.rear;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _cameraDevice == CameraDevice.front ? 'Front camera' : 'Rear camera',
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _toggleFlash() {
    setState(() => _isFlashOn = !_isFlashOn);
  }

  void _clearImage() {
    setState(() => _capturedImage = null);
  }

  void _shareStory() {
    if (_capturedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please capture or select an image first'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    Navigator.pop(context, _capturedImage!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1e293b), Color(0xFF0f172a)],
          ),
        ),
        child: Stack(
          children: [
            // Background: captured image or placeholder
            Positioned.fill(
              child: _capturedImage != null
                  ? Image.file(File(_capturedImage!.path), fit: BoxFit.cover)
                  : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuB_jiyAcJY8-NO6PCTDJSRaVqaZrwypxbOmh3rhFEos1v5nQQzOhc1PUQZyfKKj-UNH2JvSyuuwKvwSHnmuFt7f6tsEQRhwRpefM_3FnGhu2hgBo2rXiF6BhJj064yUGcXEUCnZuQNMlqAWSc0VVsCKhHXpfH5uybSvD2Smq425OV1_OyAFNEWFU3o-uIqiLGIYEmIPNX-oD9JBQlauTJN3b4AJD4HnK8-SvRvVrDnrkKXLq5ySY5V4dmkDOHfTuuMOWXxul0a3wUQ',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(color: Colors.black.withOpacity(0.4)),
                    ),
            ),

            // Main Content
            Column(
              children: [
                // Top App Bar with Tools
                CameraTopBar(
                  isFlashOn: _isFlashOn,
                  onFlashToggle: _toggleFlash,
                  hasCapturedImage: _capturedImage != null,
                  onClearImage: _clearImage,
                ),

                // Spacer for Camera View
                Expanded(child: SizedBox()),

                // Bottom Controls Section
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    bottom: 48.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 32,
                    children: [
                      // Camera Controls (Gallery, Capture, Flip)
                      BottomControls(
                        onGalleryPick: _pickFromGallery,
                        onCapture: _captureImage,
                        onFlipCamera: _flipCamera,
                      ),

                      // Quick Share Bar
                      QuickShareBar(
                        onShare: _shareStory,
                        hasImage: _capturedImage != null,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // iOS Safe Area Indicator
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 128,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
