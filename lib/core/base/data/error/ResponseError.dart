import 'package:equatable/equatable.dart';

abstract class ResponseError extends Equatable {
  final String message;
  final String statusCode;

  const ResponseError(this.message, this.statusCode);

  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends ResponseError {
  const ServerFailure({String message, String statusCode})
      : super(message, statusCode);
}

class CacheFailure extends ResponseError {
  const CacheFailure({String message, String statusCode})
      : super(message, statusCode);
}