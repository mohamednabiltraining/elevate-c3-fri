import 'package:c3_offline/api/response/BaseServerError.dart';
import 'package:c3_offline/domain/exceptions.dart';
import 'package:dio/dio.dart';

sealed class Result<T>{}

class Success<T> extends Result<T> {
  final T data;

  Success(this.data);
}
class Failure<T> extends Result<T> {
  String errorMessage;
  Exception? exception;
  Failure(this.errorMessage,{
    this.exception,
  });
}
Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {

  try {
    final data = await apiCall();
    return Success(data);
  } on DioException catch (e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.badCertificate:
        {
          return Failure(e.type.name,
              exception: NetworkError(e.message ?? 'Network error occurred'));
        }
      default:
        {
          if (e.response?.data != null) {
            var serverError =  BaseServerError.fromJson(e.response?.data);
            return Failure(e.type.name,
                exception: ServerError(serverError.message ?? 'Server error occurred'));
          }
          return Failure(e.type.name,
              exception: ServerError(e.message ?? 'Server error occurred'));
        }

    }
  }
}