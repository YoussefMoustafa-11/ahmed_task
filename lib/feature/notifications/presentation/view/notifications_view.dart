import 'package:ahmed_task/Core/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/Core/widgets/custom_button.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar:    const CustomBottomNavigationBar(),
        backgroundColor: Colors.grey[100],
        appBar: _buildAppBar(),
        body: TabBarView(
          dragStartBehavior: DragStartBehavior.down,
          clipBehavior: Clip.hardEdge,
          children: [_buildNotificationsList(), Container(), Container()],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, size: 20),
        onPressed: () {},
        color: AppColors.darkText,
      ),
      centerTitle: true,
      title: const Text(
        'Notifications',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.darkText,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_horiz, size: 24),
          onPressed: () {},
          color: AppColors.darkText,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(66),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.greyText,
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 2.5,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                  dividerColor: AppColors.borderColor,
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Mentions'),
                    Tab(text: 'Verified'),
                  ],
                ),
              ),
            ),
            Container(height: 1, color: AppColors.borderColor),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationsList() {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: [
        // New Section
        const NotificationSectionHeader(title: 'New'),
        const UnreadNotificationItem(
          userName: 'Sarah Miller',
          userAvatar:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuADSwt5NH-MC6I-fYaRIoqac-8lmqeqId6YzrkaiU88GwMb76k1qmgfk0m_L_YjTvGrTlQY6ZTkQMNFmNStegAYrsB1ywx7xp0PPVfzT_PfQplAPOUgo4OWAHk8ydHRcNv9O7R9iH42byei9dWS8x_oLcOJ90JlT1BUZ-_tDtbvbf3ZLe3l5rf8YcTJ55hNHm3hxw5p5G3FNMcQCxu0hbxOubphEEp7exogSGTnd2zPCIe1PdbElz2lYST8x7ko-AykvaHWkFl2Psg',
          notificationText: 'liked your recent travel post.',
          timeAgo: '2m ago',
          postImage:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAQPLVyfNv0WirYpS17xDTp6GrB_2R1jbKY-UDar60TR1XrnIs1anKdTMDJoTiHxfSUwzeh_QHJGteLEAb5BJ8FLV_N0RsSh4N-JxwIrgbEeFXo0zIvd9NtvgWRyK3XdE9mo0OoPsh-0H-SXnQN0AgbcWcBpQvC2I9tnydrzPv3wD9nQI9G_4-s3GI11b9hlbBkDSerNePV5fcwh7p-bRHD7tT2plTdxeJGWEIGuYhMXSMFDcp-bRTjkQ_iK_m5OMrIe5FsISrnzQ8',
        ),
        const NotificationItem(
          userName: 'James Chen',
          userAvatar:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBkl0-wkyXvHkZuWp3rd0bzte1AlLiEeIeADStk2qLX_X_FGrkMznrNN_iHGWfteWrtAIJmbsbsN2l5uKeI65pM8ljIuyTG-8VuJCivzaX9z94kA5MaKtZNR0bn3SLkx7j6aj9ykIyHi6phxBUm_ZCt4jsJfOoOz8PFk3oX9c9o68TutszyvJ9odvfC2dUZ3OfpkUHCrzjOH-xuGS6wKAX13zPGhdcDdiK9lIjDxl6xEpwTy_PfKg3IDQXYginqKuxlD_CzJALhqAo',
          notificationText: 'commented: "Absolutely stunning composition! 🔥"',
          timeAgo: '15m ago',
          postImage:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBTFG3uRV_Oh8NWhIxJHbqbw1R0_mp38eydCpFi7AfJASt8p1qEvgPZCWHiFPp-SRBBUfsknuQmmGo7QptytZ5iZPZA7nnUh6bUlXpQp5pnQdUSdEvQMPGqziTxPN7zVkbvNp2WgSNz4ATCEicJsIwnL7x1UWDkYSLRpM9IXGkew8fcNXoQkAEFgSzH8wBoIvSCgBjTTvpgNgG0nOoi2LKQPKUteO_A5ULKt-3rsRhVsy1eNDZ1gPVGPA8GXeO1SwH2qmd6pePf1y0',
        ),
        // Earlier Today Section
        const NotificationSectionHeader(title: 'Earlier Today'),
        const NotificationItemWithButton(
          userName: 'Alex Rivera',
          userAvatar:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBL5uYxfbbVRkcCUN3Ap_FlafcFVRkOs14DDaRD3BvxO4Y9OeNFSGaeY9Rxy1f5uewlmW45-_vO6mAXnuYr5a-itLwx26kKqEA5Z0wIvU8uKlt_pqXwSLHUS5CsGd7EF2C6gpjTvLxrtmffkTlTbMuj22Ybn4JBFgrHuc4B8EPMXrhnlqhqHcoRzt14y313Pto_MRUvYMkbmJfmfhtkdth4xTnv942TvT4UyO1DuVorxiohtVdrYPi9On_eAx-nYKfSB7T223h1mEI',
          notificationText: 'started following you.',
          timeAgo: '2h ago',
        ),
        const MultipleAvatarsNotificationItem(
          users: ['Emily', '12 others'],
          userAvatars: [
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDziLzEDpTH3u8tV6f7UxtnM11dKsmeB3d7IlS9iQDGGuud048jE9i9GsQ_WNg52zy_cjwIdbv8qBM9Bb0UyGc6NlEIXiQZHZVJ_f1q5W_IEfMJ4vIPHcS33nhO0HA2cK4DyX8xWzGNHMoQfZ0KQFQYD9b6OyvDiOeBXjQ9Gt5yHVfl3N4Oe5gt_GX_EKg5F7QCAYGCAIj6TOmMyg14LJoP5WFLhHsrpyKI-uGN_3jXqEukHKfMQGPGEIWn1b4IQ8yarGiJS_tF360',
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCovpEfIbFA4reO3Jomxotymcm7lbJcPKxpa1lJWsaHc_Ul8UhZ-gkOJFvGEIPg6dOIkbzEwvWIvNlrPeqUcapNLjg3B-jL8pqAdc7ERUeoaDrAiZAYpPboPJu5wdH_MjHhLMOkA4olwaiMl9qwsCb4IMs2VyPbli5k84IrVV6ckxtqabFrvviasEtEHyUgoxUumkGvjWv6jKZg7IKD4Knyg48o3y9mviAwYIwKjgH0O1NFdVqSCZXUeu5JztdPEIvYXAM7si4Ia2g',
          ],
          notificationText: 'liked your collection.',
          timeAgo: '4h ago',
          postImage:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuB7jicvrik2gqGodKgJFD4f4G4kd6oJ6G6kC-RwwFkIYoo0TpkyA6TrE3oA7WrVH8MrfGhA7CiceG8wlCbDIxxO6fhdKEmgcfruLwr9Ip79pT3vckg5gQzCqnbl0kafdExDx_mow2EK-qGks2jxd9bp8FR2BpOy3oaS1qrQRaJU99IK5EOlXXNFwpPz8n9ZbJEC6BXZeEYCxX8ILG-hW9d5PEL1OxZznFNJbPRswSxbAVWckSHA_RJa8sfHWL2uanwNFhhaO0lAQsk',
        ),
        // Yesterday Section
        const NotificationSectionHeader(title: 'Yesterday'),
        const SystemNotificationItem(
          notificationText:
              'Your post is trending in #Photography. Check out the insights!',
          timeAgo: '1d ago',
        ),
      ],
    );
  }
}

class NotificationSectionHeader extends StatelessWidget {
  final String title;

  const NotificationSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          color: AppColors.greyText,
        ),
      ),
    );
  }
}

class UnreadNotificationItem extends StatelessWidget {
  final String userName;
  final String userAvatar;
  final String notificationText;
  final String timeAgo;
  final String? postImage;

  const UnreadNotificationItem({
    super.key,
    required this.userName,
    required this.userAvatar,
    required this.notificationText,
    required this.timeAgo,
    this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary.withOpacity(0.05),
      padding: const EdgeInsets.all(16),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Avatar with online indicator
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(userAvatar),
                  backgroundColor: Colors.grey[300],
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            // Notification content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.darkText,
                      ),
                      children: [
                        TextSpan(
                          text: userName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' $notificationText'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeAgo,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            // Post image
            if (postImage != null) ...[
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  postImage!,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String userName;
  final String userAvatar;
  final String notificationText;
  final String timeAgo;
  final String? postImage;

  const NotificationItem({
    super.key,
    required this.userName,
    required this.userAvatar,
    required this.notificationText,
    required this.timeAgo,
    this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor, width: 0.5),
        ),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(userAvatar),
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.darkText,
                      ),
                      children: [
                        TextSpan(
                          text: userName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' $notificationText'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeAgo,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ),
            if (postImage != null) ...[
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  postImage!,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
    );
  }
}

class NotificationItemWithButton extends StatelessWidget {
  final String userName;
  final String userAvatar;
  final String notificationText;
  final String timeAgo;

  const NotificationItemWithButton({
    super.key,
    required this.userName,
    required this.userAvatar,
    required this.notificationText,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor, width: 0.5),
        ),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(userAvatar),
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.darkText,
                      ),
                      children: [
                        TextSpan(
                          text: userName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' $notificationText'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeAgo,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            CustomButton(
              onPressed: () {},
              buttonText: 'Follow Back',
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              borderRadius: 20,
              height: 32,
              width: 100,
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
    );
  }
}

class MultipleAvatarsNotificationItem extends StatelessWidget {
  final List<String> users;
  final List<String> userAvatars;
  final String notificationText;
  final String timeAgo;
  final String? postImage;

  const MultipleAvatarsNotificationItem({
    super.key,
    required this.users,
    required this.userAvatars,
    required this.notificationText,
    required this.timeAgo,
    this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor, width: 0.5),
        ),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Multiple avatars stack
            SizedBox(
              width: 56,
              height: 40,
              child: Stack(
                children: [
                  for (int i = 0; i < userAvatars.length; i++)
                    Positioned(
                      left: i * 16,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(userAvatars[i]),
                        backgroundColor: Colors.grey[300],
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: 48 + 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.darkText,
                      ),
                      children: [
                        TextSpan(
                          text: users[0],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' and ${users[1]} $notificationText'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeAgo,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ),
            if (postImage != null) ...[
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  postImage!,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
    );
  }
}

class SystemNotificationItem extends StatelessWidget {
  final String notificationText;
  final String timeAgo;

  const SystemNotificationItem({
    super.key,
    required this.notificationText,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor, width: 0.5),
        ),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.star_rounded,
                color: AppColors.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.darkText,
                      ),
                      children: [
                        TextSpan(text: 'Your post is trending in '),
                        TextSpan(
                          text: '#Photography',
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: '. Check out the insights!'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeAgo,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
