import 'package:bookly_app/core/utils/style.dart';
import 'package:bookly_app/features/home/presentation/views/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksInitial) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Start searching to see results',
                style: Styles.textStyle20,
              ),
            ),
          );
        } else if (state is SimilarBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(book: state.books[index]),
                );
              },
              childCount: state.books.length,
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
