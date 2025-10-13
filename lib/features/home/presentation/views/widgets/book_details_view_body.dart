import 'package:bookly_app/features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomBookDetailsAppBar(
                      book: book,
                    ),
                    BookDetailsSection(
                      book: book,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SimilarBooksSection(),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
