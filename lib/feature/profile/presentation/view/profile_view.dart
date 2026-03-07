import 'package:ahmed_task/Core/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_info_section.dart';
import 'widgets/profile_tabs.dart';
import 'widgets/profile_image_grid.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _selectedTabIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      backgroundColor: const Color(0xFFF6F7F8),
      body: Stack(
        children: [
          Column(
            children: [
              const ProfileHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ProfileInfoSection(),
                      ProfileTabs(
                        selectedIndex: _selectedTabIndex,
                        onTabChanged: (index) {
                          setState(() => _selectedTabIndex = index);
                        },
                      ),
                      const ProfileImageGrid(),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
