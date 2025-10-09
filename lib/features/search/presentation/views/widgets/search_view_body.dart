import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_listview_item.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchTextField(),
                SizedBox(height: 16),
                Text(
                  'Search Result',
                  style: Styles.textStyle18,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          sliver: SearchResultListView(),
        ),
      ],
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BookListViewItem(),
          );
        },
      ),
    );
  }
}
