import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'widgets/edit_profile_app_bar.dart';
import 'widgets/profile_photo_section.dart';
import 'widgets/profile_action_links.dart';
import '../../../../Core/widgets/custom_text_field.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController bioController;
  late TextEditingController websiteController;

  ImageProvider? _profileImage;
  File? selectedImageFile;
  final ImagePicker imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    usernameController = TextEditingController(text: 'alex_sterling');
    bioController = TextEditingController(
      text:
          'Digital creator and photographer based in San Francisco. Exploring the intersection of tech and art.',
    );
    websiteController = TextEditingController(text: 'https://alexsterling.art');
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    bioController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          selectedImageFile = File(pickedFile.path);
          _profileImage = FileImage(selectedImageFile!);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to pick image: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: EditProfileAppBar(
        onCancel: () {
          Navigator.of(context).pop();
        },
        onSave: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfilePhotoSection(
              imageProvider: _profileImage,
              onChangePhoto: pickImage,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CustomTextField(
                    label: 'Name',
                    controller: nameController,
                    hintText: 'Your full name',
                    prefixIcon: Icons.person_outline,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: 'Username',
                    controller: usernameController,
                    hintText: 'username',
                    prefixIcon: Icons.alternate_email,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: 'Bio',
                    controller: bioController,
                    hintText: 'Tell us about yourself',
                    prefixIcon: Icons.info_outline,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: 'Website',
                    controller: websiteController,
                    hintText: 'https://yourwebsite.com',
                    prefixIcon: Icons.link,
                  ),
                ],
              ),
            ),
            ProfileActionLinks(
              onChangePassword: () {},
              onSwitchProfessional: () {},
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
