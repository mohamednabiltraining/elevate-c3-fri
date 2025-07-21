class NetworkError implements Exception {
  final String message;

  NetworkError(this.message);

  @override
  String toString() => 'NetworkError: $message';
}
class ServerError implements Exception {
  final String message;
  ServerError(this.message);

  @override
  String toString() => 'ServerError: $message';
}