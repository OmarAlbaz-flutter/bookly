import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_play_button.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 5,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.yellow,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AssetsData.testLogo,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: CustomPlayButtom(),
          ),
        ],
      ),
    );
  }
}
