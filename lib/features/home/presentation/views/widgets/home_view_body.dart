import 'package:bookly_app/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomAppBar(),
        ],
      ),
    ));
  }
}
