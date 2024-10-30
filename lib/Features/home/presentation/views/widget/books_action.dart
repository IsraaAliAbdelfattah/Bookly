import 'package:bookly/Features/home/data/model/book/book.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/launch_url.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CutomsButton(
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            text: 'Free',
            onPressed: () {},
          ),
        ),
        Expanded(
          child: CutomsButton(
            textColor: Colors.white,
            backgroundColor: const Color(0xffEF8262),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            text: getText(book),
            onPressed: () async {
              launchCustomUrl(context, book.volumeInfo.previewLink);
            },
          ),
        ),
      ],
    );
  }

  String getText(Book book) {
    if (book.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
