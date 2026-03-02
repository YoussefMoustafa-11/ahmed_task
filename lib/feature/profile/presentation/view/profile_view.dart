import 'package:flutter/material.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_info_section.dart';
import 'widgets/profile_tabs.dart';
import 'widgets/profile_image_grid.dart';
import 'widgets/bottom_navigation_bar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _selectedTabIndex = 0;
  int _selectedNavIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigationBarWidget(
              selectedIndex: _selectedNavIndex,
              onItemSelected: (index) {
                setState(() => _selectedNavIndex = index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
