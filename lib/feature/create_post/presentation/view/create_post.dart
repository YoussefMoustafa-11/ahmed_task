import 'package:flutter/material.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/widgets/create_post_app_bar.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/widgets/user_profile_section.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/widgets/text_input_area.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/widgets/image_gallery_preview.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/widgets/bottom_action_bar.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final TextEditingController _textController = TextEditingController();

  final List<String> _selectedImages = [
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCiinD4N7VSxec1yJiNZAkNiGKB_jgHRrI4GlY5U_9JhCpjar4B2-S2HIq70m8Os58wVTtstSy0-bTeNvQPP64wQ4wDr5K4kcKAUSzd8pTFkWtgdmZzXYaa0SGX9L8WS37J9rRMMqZXKWaL_H0YIm8de07kvrcr_TQgnUnLSNNA3DqlXPPtmEVbWnaeqqghyPHTEtwMk-K4LNpPEnbk8vWKAYeFQzSuojpnw9VEolvmGa9erc0T6sSF777F4rMO9aCDaOPGcRpRK2M',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuC-ifWmt7rvPsb9IzcdkhDJ-b0vSTnxOJfSkg6Alqm4BQA5rg_2v2QTF-OL61XUiOMXBfz9umR8LpFAEpFGzW3JZ-zxOLxc0rYrUByKWN86WNW1P4jDk01orgvDzbWS3dAawaMGdBH023nhxHS0ix6StLL1m_QxKWLosPq0vLq1eaAltKUBD22p2Hwz7C-fqfBdN4sydZ5PiYjS8xGu9Q8fU9l3ybw7NoHpVHM9URlGc5ZZLQg0QAXwjgSZm48GXssrhTOktwpgIZU',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAOUt1uYd6XBCilYuRUbrNtwFQxgd_yO-OWAuQBAL3fRcuQu-LX-VeSAkRqL8sa78k6sIzRCYvdJo6hmRzXfv-puzzmLKfuUQfNjeLKVAv-bKkSCLhwA3WZw7BN5WYWFIbziSUT5wwehqXAbEuJpdB6HNFSk6n84M3VfdWitpAp48tPb8GD9T69SMEEEpXV9qwwCxKwUZCDblv3-TzBZn0M7OZ5wlDxk6RzzLaEc8ghDyUrDBQKLNE4Kt3TjEpcuzYELerUIo-JxFI',
  ];
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  void _handlePost() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _textController.text.isEmpty
              ? 'Please add some text'
              : 'Post created!',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      appBar: CreatePostAppBar(onPost: _handlePost),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserProfileSection(),
            TextInputArea(controller: _textController),
            if (_selectedImages.isNotEmpty)
              ImageGalleryPreview(
                images: _selectedImages,
                onRemoveImage: _removeImage,
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomActionBar(),
    );
  }
}
