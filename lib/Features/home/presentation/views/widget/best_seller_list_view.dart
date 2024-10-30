import 'package:bookly/Features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../section/best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
      if (state is NewestBooksSuccess) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return BookListViewItem(
              book: state.books[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
        );
      } else if (state is NewestBooksFailure) {
        return CustomError(message: state.message);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
