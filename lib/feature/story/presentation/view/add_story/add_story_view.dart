import 'package:flutter/material.dart';
import 'widgets/camera_top_bar.dart';
import 'widgets/bottom_controls.dart';
import 'widgets/quick_share_bar.dart';

class AddStoryView extends StatefulWidget {
  const AddStoryView({super.key});

  @override
  State<AddStoryView> createState() => _AddStoryViewState();
}

class _AddStoryViewState extends State<AddStoryView> {
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
            // Camera Background with gradient overlay
            Positioned.fill(
              child: Container(
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
                CameraTopBar(),

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
                      BottomControls(),

                      // Quick Share Bar
                      QuickShareBar(),
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
