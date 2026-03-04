import 'package:ahmed_task/Core/routing/app_routes.dart';
import 'package:ahmed_task/feature/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:ahmed_task/Core/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';

import 'package:ahmed_task/feature/home/presentation/view/widgets/posts_section.dart';
import 'package:ahmed_task/feature/home/presentation/view/widgets/stories_section.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Sample data - في التطبيق الحقيقي، البيانات تأتي من API
  final List<Map<String, dynamic>> stories = [
    {
      'imageUrl': '',
      'username': 'Your Story',
      'isAddStory': true,
      'hasStory': false,
    },
    {
      'imageUrl': '',
      'username': 'alex_d',
      'isAddStory': false,
      'hasStory': true,
    },
    {
      'imageUrl': '',
      'username': 'martha_w',
      'isAddStory': false,
      'hasStory': true,
    },
    {
      'imageUrl': '',
      'username': 'james.k',
      'isAddStory': false,
      'hasStory': true,
    },
    {
      'imageUrl': '',
      'username': 'lily_',
      'isAddStory': false,
      'hasStory': true,
    },
  ];

  final List<Map<String, dynamic>> posts = [
    {
      'userImage': '',
      'username': 'Alex Dan',
      'timeAgo': '2 h',
      'location': 'Swiss Alps',
      'content':
          'Exploring the mountains this weekend! The air is so fresh up here. ⛰️ #adventure #nature',
      'images': [
        'https://lh3.googleusercontent.com/aida-public/AB6AXuA6ZaU8mdL1h1q4dM6h4wF_i6JYb6hw4sTofK13MkPrwwD52R2aUzzKghTodcUStZS3eb3zt0R5OEQtb9C51KaNXNT8G24_wFMMtx4pIJEV1N4tkf1g3wPaRu9WZtRkMNAJzOSJPVyXUyzf9q0TLtYqm_LjI2kFNFE2RzYv6tLCCrLf6vhEm2ITGps6XVGK7vG-4pu_roLrGXZwe4IBRzvECOIRBPlma9zDnlBkN-DBNdGfeTXT7_sahC_THPJ-TRg_R8qOXmhmLW4',
        "https://lh3.googleusercontent.com/aida-public/AB6AXuDeITDNMYXn98esZz6bfYrUeoiqUS3gKjPPXxRn_b5FQohmOWul6u1gKjG386zvwEWqfEtTRlLmbtbifwMqU28f0IEzi6tBB_PpA-BQ3bNqricws2fiXQZHUQpVp3qwRAH-NfC9dCr_fc0G2p99GBNvbc_JG6THZ9g7aGyUrjCeRTH-4FST48FeWkycCV8mEtaMXS1pgLvlVr58cjrFaZcHhRszzjguqis486JvBWonNXk668qOAiZ8hDB-FkPoFWes3mpw5WSVTKM",
      ],
      'likesCount': 1200,
      'commentsCount': 48,
      'isLiked': false,
    },
    {
      'userImage': '',
      'username': 'Martha West',
      'timeAgo': '5 h',
      'location': 'Downtown Studio',
      'content':
          'New workspace setup is finally complete! Minimalist vibes only. ✨',
      'images': [
        'https://lh3.googleusercontent.com/aida-public/AB6AXuA6ZaU8mdL1h1q4dM6h4wF_i6JYb6hw4sTofK13MkPrwwD52R2aUzzKghTodcUStZS3eb3zt0R5OEQtb9C51KaNXNT8G24_wFMMtx4pIJEV1N4tkf1g3wPaRu9WZtRkMNAJzOSJPVyXUyzf9q0TLtYqm_LjI2kFNFE2RzYv6tLCCrLf6vhEm2ITGps6XVGK7vG-4pu_roLrGXZwe4IBRzvECOIRBPlma9zDnlBkN-DBNdGfeTXT7_sahC_THPJ-TRg_R8qOXmhmLW4',
        "https://lh3.googleusercontent.com/aida-public/AB6AXuDeITDNMYXn98esZz6bfYrUeoiqUS3gKjPPXxRn_b5FQohmOWul6u1gKjG386zvwEWqfEtTRlLmbtbifwMqU28f0IEzi6tBB_PpA-BQ3bNqricws2fiXQZHUQpVp3qwRAH-NfC9dCr_fc0G2p99GBNvbc_JG6THZ9g7aGyUrjCeRTH-4FST48FeWkycCV8mEtaMXS1pgLvlVr58cjrFaZcHhRszzjguqis486JvBWonNXk668qOAiZ8hDB-FkPoFWes3mpw5WSVTKM",
      ],
      'likesCount': 856,
      'commentsCount': 12,
      'isLiked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const CustomHomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StoriesSection(stories: stories),
            const SizedBox(height: 8),
            PostsSection(posts: posts),
          ],
        ),
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          GoRouter.of(context).pushNamed(AppRoutes.createPostView);
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
      // CustomBottomNavigationBar
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
