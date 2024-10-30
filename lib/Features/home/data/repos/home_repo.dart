import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../model/book/book.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Book>>> fetchNewestBooks();
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks();
  Future<Either<Failure, List<Book>>> fetchBooksByCategory({required String category});
}
