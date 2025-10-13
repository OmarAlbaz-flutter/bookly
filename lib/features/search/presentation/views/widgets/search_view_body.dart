import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/home/presentation/views/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });
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
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(height: 20),
                CustomSearchTextField(
                  onSubmitted: (data) {
                    BlocProvider.of<SimilarBooksCubit>(context)
                        .fetchSimilarBooks(category: data);
                  },
                ),
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
