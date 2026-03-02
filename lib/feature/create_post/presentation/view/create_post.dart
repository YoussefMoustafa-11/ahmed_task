import 'package:flutter/material.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/widgets/create_post_app_bar.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/widgets/user_profile_section.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/widgets/text_input_area.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/widgets/image_gallery_preview.dart';
import 'package:ahmed_task/feature/create_post/presentation/view/widgets/bottom_action_bar.dart';
import 'package:image_picker/image_picker.dart';

List<XFile?> profilePic = [];

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _getSelectedImage(XFile? image) {
    if (image != null) {
      setState(() {
        profilePic.add(image);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      profilePic.removeAt(index);
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
    Navigator.pop(context);
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
            if (profilePic.isNotEmpty)
              ImageGalleryPreview(
                onImageSelected: _getSelectedImage,
                images: profilePic.map((file) => file!.path).toList(),
                onRemoveImage: _removeImage,
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomActionBar(onImageSelected: _getSelectedImage),
    );
  }
}
