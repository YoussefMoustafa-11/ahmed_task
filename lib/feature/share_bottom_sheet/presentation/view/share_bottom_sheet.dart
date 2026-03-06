import 'package:ahmed_task/Core/themes/app_color.dart';
import 'package:ahmed_task/feature/share_bottom_sheet/presentation/view/widgets/recent_contact_item.dart';
import 'package:ahmed_task/feature/share_bottom_sheet/presentation/view/widgets/share_option_item.dart';
import 'package:ahmed_task/feature/share_bottom_sheet/presentation/view/widgets/suggested_user_item.dart';
import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const ShareBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.92,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF6F7F8),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            children: [
              _buildDragHandle(),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.only(bottom: 32),
                  children: [
                    _buildSearchBar(),
                    const SizedBox(height: 16),
                    _buildRecentContacts(),
                    const SizedBox(height: 24),
                    _buildShareGrid(),
                    const SizedBox(height: 32),
                    _buildSuggestedUsers(),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDragHandle() {
    return const SizedBox(
      height: 32,
      child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFFCBD5E1),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: SizedBox(width: 48, height: 6),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search friends...',
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF94A3B8)),
          filled: true,
          fillColor: const Color(0xFFF1F5F9),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
        ),
        style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B)),
      ),
    );
  }

  Widget _buildRecentContacts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recent Contacts',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 96,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              RecentContactItem(name: 'New', icon: Icons.add),
              SizedBox(width: 20),
              RecentContactItem(
                name: 'Alex',
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuD0mBm2I2QCZ0ur-Og8q2du_IJqhFKWzj3wertZst7hyr-KK59KwLOnf4H0MNPQD_ZW8YBawnuKwnn73OlhTNFPGK-OsuynhJgfBV8ooUthophhWlW-cTWQfjHJoYpu-UMn8XKfupoH_9WFmZaH-WtZUxpD2dNn8qpvfgpputgI3bIYfK6uHdn467kAZvdy9yxiYq3QXHk5VG7B4nWIwB0BzuSI7Dkv3U80e3TAlNPSyVH1EcK6o7UxOdR8P28z5ImKdpUsMnf1swg',
              ),
              SizedBox(width: 20),
              RecentContactItem(
                name: 'Jordan',
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDzPXKf96W8h20PqJA33id-AqbADfv84vf385TVrQVh7t7hytrVTCVwJ7wU1IlB25oCRBYd-KrOd0UUTRUEMJBIt361gfQ6NFeItoJA3Ufs7U7eNl2ouAULThzV5V9O0lirYn7OlVCVDINXU0jWhRaTQl8iMZbFQBJ2IC57XcypdCBeXFLf61ER-YkdWHGn7cCrVJLr6d0-9OO8zFRZvjqQdoMBHKOTcwIZorKIOhKLbuvQeY-pRwdQ83Ie4bfhjs-puiDzEPj5JnY',
              ),
              SizedBox(width: 20),
              RecentContactItem(
                name: 'Taylor',
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCq-Qzal0mTM75fwXFggU3H7i4da2Q80uZIFrzqV6X9hcCQjSjKs5seC_ZMeKOKdi-Z87s2RqCJo7I5UwQIjj_Wwb1C0SFpsnerdE-PqrhzB2wPYS84_sdY9EuV-1RzWMFaqFWOrsaWK8dEce3tsKPK9ir4pXuS5nV7xMf0jcwsl5uFA3lmcd0mEOCY8uIKmjm08RaxGO791x_CukYi12lRlW5z7cvMrP5CpQIN8AjP2y7l23q3436jQUo6gwZkFu3xZTCS3lezITI',
              ),
              SizedBox(width: 20),
              RecentContactItem(
                name: 'Morgan',
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDNYgZJsRyRefdKgquadw1iyVJf72dYFy99DU-VFcXsopjnCSCVKQP6b7uOongnh_wEmLjnvqJIln9LWrhKymR314F3ufEWhEG1hogrnAQu-dg4YQWusaWMP8B5iIv2QYreGNDiMFoFBvvruVCJk9v1UfgIl9su9CxiIJIAxVzrSFq4uYqPi77kxRrJAcqsgha3kxHtGtUahlrbE-91CUXIezXVuiv_qBeRhip2NPk3PGwYc7n7BVp8tq8uMqqRUbppJFCYxfxcxTg',
              ),
              SizedBox(width: 20),
              RecentContactItem(
                name: 'Casey',
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDtiUPfwqAp2jXD5OIaTjPBQgn0YZgd8myDu0D_zOXF6-TH1qPKf5_jJEdLsWdWX3WRgi8kkd_AIcp-8h3bkrXew75PKoCgRbicp0eFDGeKAFq1UnMvBuLro0bza92jpjzkf_fcOe2UqaE134QHyvHEXiyG4MleB_lZV9zprtt91MTqv-cePinZ9k3gkivjvCXCkLRZt9tbCXvZN6pO4ESBbouKMKEZMzsugyK7is7dH_Ib4QlBXVStazmipNWwuai1d17d88BAcP0',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShareGrid() {
    const shareOptions = [
      _ShareOption(Icons.link, 'Copy Link', null, null),
      _ShareOption(Icons.chat, 'SMS', null, null),
      _ShareOption(
        Icons.chat_bubble,
        'WhatsApp',
        Color(0xFF25D366),
        Color(0x1A25D366),
      ),
      _ShareOption(
        Icons.send,
        'Messenger',
        Color(0xFF0084FF),
        Color(0x1A0084FF),
      ),
      _ShareOption(
        Icons.camera_alt,
        'Instagram',
        Color(0xFFE1306C),
        Color(0x1AE1306C),
      ),
      _ShareOption(Icons.more_horiz, 'More', null, null),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Share to',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.85,
            children: shareOptions
                .map(
                  (option) => ShareOptionItem(
                    icon: option.icon,
                    label: option.label,
                    iconColor: option.color,
                    backgroundColor: option.bgColor,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestedUsers() {
    const users = [
      _UserData(
        'Sarah Wilson',
        '@sarah_wils',
        'https://lh3.googleusercontent.com/aida-public/AB6AXuD_Y0D600whCjHZdMG66QX_l7CFEXWVrYwtLyXTVX_98PdM3RrEmDSuiThDZgmqCcJ-RhQU2MzOEGaCxjy-yNCmg4S-tO2rqMAlqiLtpIGbhMcIE3ojE84-gTDyNubJZJ5onZ_G5xfpZOaeG6ZFn2n_OR-JrEPeg0C268RO-caZoEijuyPwBFMUCS3FoUte2ke-y2Bf-Cow_ez80wTPQd9l4FmB4dKou29XQ_Ns-i9_wWzQEY9sprTyL2AQUXLUfbDb7CPmFdLdcDs',
      ),
      _UserData(
        'David Chen',
        '@dchen_creative',
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBazWojPEE4FA6pDM7bMSt7MfWYGrSQRrTxWhe7npJrkeJXlLI4z5LKwodAxvZJPTLUt4x_FO7SGk1SqobgDGGDevyONJD0DXB2JMMoP6BAjDsyWzNL3-oIiRLDneY1YmbFsR5Gs224qX7a9UZSIRS9O50WzCICkAzqsL0fzrCwDq_qGvFDKYsXyYTtRUH7GDssZ-XiZoLi9Tyyd0AOWdQOlliQnwplS3kVCGIKUOGq5OJy5Na2N3o59A_y78-UMyWzPo4oQt49qpk',
      ),
      _UserData(
        'Elena Rodriguez',
        '@elena_rod',
        'https://lh3.googleusercontent.com/aida-public/AB6AXuARwX784nLSYq91C3hl1E0AXmUxr3Irr459Lg24sONo3eXA1KODq8ydNUMjJvzugP2W6E7St304aI96SVpWvezB1lawjgnkKcBHXqvPMANJ09At68U-KP3kOpkbJyAMUkARN0NCdB1MJhS6UO26smVrXh8W7puSh4b14o_upZNA2OQmtkHZNoP7_IkJbcpiCFjbFcIw-QpBlhIRecFroayGMsW7ht8VlRF4Y9ct7MVyRMk7BLH6pnd2ZIInCJo0wasKkUcb56DV4A4',
      ),
      _UserData(
        'Marcus Thorne',
        '@m_thorne',
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBCUYS7Al_ijCHAi1QUACz0-bJi87hZoY8vRkEQjmcW4j72HN8S59RKc2HmCfaM_3fqq1K7ZEN9Dpb-AXdNLbWjpJkfzrLfL3ubtqf1el7IbN9GNuDHSKhXt3RbyEGSR8fh5GYJKKczLea0VqWoSueRHznbo-7W3xL3AqvVi8t6jVdVOkBPibRqiIsxXvkjKYLGdxhXfuFkerhl7q8JrRzj-WdBvhZfSEazTzlPR7ReYVEcj_d_iwrYoLm8GpWN1pIICjohK99HJ0E',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Suggested Users',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E293B),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Invite',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: users
                .map(
                  (user) => SuggestedUserItem(
                    imageUrl: user.imageUrl,
                    name: user.name,
                    username: user.username,
                    onSend: () {},
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _ShareOption {
  final IconData icon;
  final String label;
  final Color? color;
  final Color? bgColor;

  const _ShareOption(this.icon, this.label, this.color, this.bgColor);
}

class _UserData {
  final String name;
  final String username;
  final String imageUrl;

  const _UserData(this.name, this.username, this.imageUrl);
}
