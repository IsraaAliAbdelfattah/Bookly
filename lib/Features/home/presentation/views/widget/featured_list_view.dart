import 'package:bookly/Features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import 'custom_book_item_image.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksFailure) {
          return CustomError(message: state.message);
        } else if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: height * 0.3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.books[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: CustomBookItemImage(
                        imageUrl: state.books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            '',
                      ),
                    ),
                  );
                }),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
