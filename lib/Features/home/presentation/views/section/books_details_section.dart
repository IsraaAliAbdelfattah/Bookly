import 'package:bookly/Features/home/data/model/book/book.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../widget/book_rating.dart';
import '../widget/books_action.dart';
import '../widget/custom_book_item_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.17),
          child: CustomBookItemImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          book.volumeInfo.title!,
          style: Styles.textStyle26,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          book.volumeInfo.authors?[0] ?? '',
          style: Styles.textStyle18.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(
          height: 10,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo.averageRating?.round() ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 20,
        ),
        BooksAction(
          book: book,
        ),
      ],
    );
  }
}
