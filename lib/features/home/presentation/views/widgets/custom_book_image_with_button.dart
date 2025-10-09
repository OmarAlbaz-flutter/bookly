import 'package:bookly_app/features/home/presentation/views/widgets/custom_play_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class CustomBookImageWithButton extends StatelessWidget {
  const CustomBookImageWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 5,
      child: Stack(
        children: [
          CustomBookImage(),
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
