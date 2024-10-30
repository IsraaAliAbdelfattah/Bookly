
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/book/book.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> getFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    final result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) => emit(
        FeaturedBooksFailure(failure.errmessage),
      ),
      (books) => emit(
        FeaturedBooksSuccess(books),
      ),
    );
  }
}
