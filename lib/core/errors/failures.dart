import 'package:dio/dio.dart';

abstract class Failure {
  final String errmessage;

  Failure(this.errmessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errmessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');

      case DioExceptionType.badResponse:
        return ServerFailure('Bad response');
      case DioExceptionType.cancel:
        return ServerFailure('Request to server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        } else {
          return ServerFailure('Unexpected error , please try again later');
        }
      default:
        return ServerFailure('Unexpected error , please try again later');
    }
  }
}
