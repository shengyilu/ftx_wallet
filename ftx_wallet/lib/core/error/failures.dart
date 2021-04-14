import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String message;
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure(String errorMsg) {
    message = errorMsg;
  }
}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {
  NetworkFailure() {
    message = "Something wrong with your network connection";
  }
}