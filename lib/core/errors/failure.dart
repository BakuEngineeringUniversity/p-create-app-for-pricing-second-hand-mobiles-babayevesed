import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? errorMessage;
  const Failure({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure({String? errorMessage}) : super(errorMessage: errorMessage);
}

class ConnectionTimeOutFailure extends Failure {
  const ConnectionTimeOutFailure();
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure({String? errorMessage}) : super(errorMessage: errorMessage);
}

class UnknownFailure extends Failure {
  const UnknownFailure({String? errorMessage}) : super(errorMessage: errorMessage);
}

class BannedFailure extends Failure {
  const BannedFailure({String? errorMessage}) : super(errorMessage: errorMessage);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({String? errorMessage}) : super(errorMessage: errorMessage);
}

class CacheFailure extends Failure {
  const CacheFailure({String? errorMessage}) : super(errorMessage: errorMessage);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({String? errorMessage}) : super(errorMessage: errorMessage);
}

class AuthFailure extends Failure {
  const AuthFailure({String? errorMessage}) : super(errorMessage: errorMessage);
}

class RequestFailure extends Failure {
  const RequestFailure({String? errorMessage}) : super(errorMessage: errorMessage);
}

class NoInternetFailure extends Failure {
  const NoInternetFailure({String? errorMessage}) : super(errorMessage: errorMessage);
}
