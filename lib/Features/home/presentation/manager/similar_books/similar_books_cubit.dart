
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/book/book.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    final result = await homeRepo.fetchBooksByCategory(category: category);
    result.fold(
      (failure) => emit(
        SimilarBooksFailure(failure.errmessage),
      ),
      (books) => emit(
        SimilarBooksSuccess(books),
      ),
    );
  }
}
