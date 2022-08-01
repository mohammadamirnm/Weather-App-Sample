abstract class Failure implements Exception {
  const Failure(this.message);

  final String message;
}

class ConnectionFailure extends Failure {
  ConnectionFailure()
      : super('Please check your internet connection and try again');
}
