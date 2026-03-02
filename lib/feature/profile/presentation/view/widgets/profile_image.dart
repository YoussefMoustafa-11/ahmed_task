import 'package:flutter/material.dart';
import '../../../../../Core/themes/app_color.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const ProfileImage({
    super.key,
    this.imageUrl =
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDG_Tq4G7ZZSCp--ujf3YPjMviVQtf3UjFJeklplWHYHgpiRzx12KCc8b9lNdWpClUSWZHCVfHSIfijFx__bdu58iEGREcy_QbUK952U2CZ5uOee3n0zkDb7urgb9Vhks--Qv9MgoEFV1ojjtU8uV5AFL_pXOR0QcK38L2kQyn6XqTYx-5JAjKchthwM14urmeQkJ1C9Dego4bK8JMnxyLph3sZQfRz_XZt0drkQKEkxC2-VTzhlc0DTZz_yOBd1sTFSnJ34L5N5yo',
    this.size = 128,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size / 2),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.borderColor,
                    child: const Center(child: Icon(Icons.person, size: 60)),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: Icon(Icons.add, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
