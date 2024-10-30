import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../widget/similar_books_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You might also like',
          style: Styles.textStyle18,
        ),
        SizedBox(
          height: 15,
        ),
        SimilarBookListView(),
      ],
    );
  }
}