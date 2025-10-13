import 'package:bookly_app/features/home/presentation/views/widgets/custom_play_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class CustomBookImageWithButton extends StatelessWidget {
  const CustomBookImageWithButton({super.key, required this.imageUrl, this.onTap});
  final String imageUrl;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 5,
      child: Stack(
        children: [
          CustomBookImage(
            imageUrl: imageUrl,
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: CustomPlayButtom(
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
