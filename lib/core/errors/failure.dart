import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioExcep) {
    switch (dioExcep.type) {
      case DioExceptionType.connectionTimeout:
        {
          return ServerFailure('Connection timeout with ApiServer');
        }

      case DioExceptionType.sendTimeout:
        {
          return ServerFailure('Send Timeout with ApiServer');
        }
      case DioExceptionType.receiveTimeout:
        {
          return ServerFailure('Receive timeout with ApiServer');
        }
      case DioExceptionType.badCertificate:
        {
          return ServerFailure('Incorrect certificate with ApiServer');
        }
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioExcep.response!.statusCode!, dioExcep.response!.data);
      case DioExceptionType.cancel:
        {
          return ServerFailure('Request to ApiServer was cancelled');
        }
      case DioExceptionType.connectionError:
        {
          return ServerFailure('Connection error with ApiServer');
        }
      case DioExceptionType.unknown:
        if (dioExcep.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexpected Error, please try later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Request not found, please try again later");
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, please try again later');
    } else {
      return ServerFailure('Oops, there was an error, please try again');
    }
  }
}
