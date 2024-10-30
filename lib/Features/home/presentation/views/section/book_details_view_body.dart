import 'package:bookly/Features/home/data/model/book/book.dart';
import 'package:flutter/material.dart';

import '../widget/custom_book_details_app_bar.dart';
import 'books_details_section.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomAppBar(),
                BookDetailsSection(book: book),
                
                const Expanded(
                  child: SizedBox(
                    height: 25,
                  ),
                ),
                const SimilarBooksSection(),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
