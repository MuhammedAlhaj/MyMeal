/// A custom exception class that represents a failure occurring on the server.
///
/// This class implements the [Exception] interface and is used to handle
/// server-side failures. It contains a [message] property to store the error
/// message, and overrides the [toString] method to return this message.
class ServerFailure implements Exception {
  /// The error message that explains the server failure.
  final String message;

  /// Creates a new instance of [ServerFailure] with the provided [message].
  ServerFailure(this.message);

  /// Overrides the [toString] method to return the error message.
  ///
  /// This method is useful for logging and debugging purposes.
  @override
  String toString() {
    return message;
  }
}
