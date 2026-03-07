import 'package:ahmed_task/Core/routing/app_routes.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).matchedLocation;

    int currentIndex = 0;
    if (currentRoute == AppRoutes.homeView) {
      currentIndex = 0;
    } else if (currentRoute == AppRoutes.exploreView)
      currentIndex = 1;
    else if (currentRoute == AppRoutes.notificationsView)
      currentIndex = 2;
    else if (currentRoute == AppRoutes.profileView)
      currentIndex = 3;

    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go(AppRoutes.homeView);
            break;
          case 1:
            context.go(AppRoutes.exploreView);
            break;
          case 2:
            context.go(AppRoutes.notificationsView);
            break;
          case 3:
            context.go(AppRoutes.profileView);
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.greyText,
      selectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.search),
          icon: Icon(Icons.explore_outlined),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.notifications),
          icon: Icon(Icons.notifications_outlined),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.person),
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
