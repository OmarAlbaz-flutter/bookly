import 'package:bookly_app/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_listview_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 50,
          ),
          CustomListViewItem(),
        ],
      ),
    ));
  }
}
