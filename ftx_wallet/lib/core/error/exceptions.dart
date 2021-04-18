class NoDataConnectionException implements Exception {
  final message = 'There is no data connection now...';
  @override
  String toString() => message;
}
