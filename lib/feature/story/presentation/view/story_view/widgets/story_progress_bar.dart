import 'package:flutter/material.dart';

class StoryProgressBar extends StatelessWidget {
  final List<double> progress;
  final int currentIndex;

  const StoryProgressBar({
    super.key,
    required this.progress,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: List.generate(
          progress.length,
          (index) => Expanded(
            child: Container(
              height: 2,
              margin: EdgeInsets.symmetric(horizontal: index == 0 ? 0 : 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: Colors.white.withOpacity(0.3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: index < currentIndex
                    ? Container(color: Colors.white)
                    : index == currentIndex
                    ? FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: progress[index],
                        child: Container(color: Colors.white),
                      )
                    : const SizedBox.expand(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
