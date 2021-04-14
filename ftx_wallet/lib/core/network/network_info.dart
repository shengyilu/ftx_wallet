import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  DataConnectionChecker _connectionChecker;

  NetworkInfoImpl() {
    this._connectionChecker = DataConnectionChecker();
  }

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}
