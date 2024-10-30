import 'package:bookly/Features/home/presentation/views/widget/custom_book_item_image.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/model/book/book.dart';
import '../widget/book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookItemImage(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: Text(
                      book.volumeInfo.title!,
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    book.volumeInfo.authors![0],
                    style: Styles.textStyle14.copyWith(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Free',
                          style: Styles.textStyle20,
                        ),
                        const Spacer(),
                        BookRating(
                          rating: book.volumeInfo.averageRating?.round() ?? 0,
                          count: book.volumeInfo.ratingsCount ?? 0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
