import 'package:bookly/Features/home/data/model/book/book.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Book>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
      List<Book> books = [];
      for (var item in data['items']) {
        try {
          books.add(Book.fromJson(item));
        // ignore: empty_catches
        } catch (e) {
         
        }
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endpoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<Book> books = [];
      for (var item in data['items']) {
        try {
          books.add(Book.fromJson(item));
        // ignore: empty_catches
        } catch (e) {
         
        }
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetchBooksByCategory(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:programming');
      List<Book> books = [];
      for (var item in data['items']) {
        try {
          books.add(Book.fromJson(item));
        // ignore: empty_catches
        } catch (e) {
        
        }
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
