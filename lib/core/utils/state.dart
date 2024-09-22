/// A generic class representing the state of data at a given moment, including
/// whether the data is being loaded, successfully loaded, or failed.
///
/// [T] is the type of the data being handled.
///
/// This class helps in managing states such as waiting for data, data loaded
/// with success, or an error state during asynchronous operations.
class DataSnapshot<T> {
  /// Indicates if the data is in a loading (waiting) state.
  final bool waiting;

  /// The actual data being handled, if available.
  final T? data;

  /// The error object if an error occurred while fetching the data.
  final Object? error;

  /// Private constructor that initializes the [waiting], [data], and [error] fields.
  const DataSnapshot._({required this.waiting, this.data, this.error});

  /// A factory constructor that represents the initial state where no data is being loaded.
  const DataSnapshot.nothing() : this._(waiting: false);

  /// A factory constructor that represents the state where data is being loaded.
  const DataSnapshot.waiting() : this._(waiting: true);

  /// A factory constructor that represents the state where data has been successfully loaded.
  ///
  /// The [data] parameter holds the successfully loaded data.
  const DataSnapshot.withData(T data) : this._(waiting: false, data: data);

  /// A factory constructor that represents the state where an error occurred.
  ///
  /// The [error] parameter holds the error object encountered during data fetching.
  const DataSnapshot.withError(Object error)
      : this._(waiting: false, error: error);

  /// Returns true if the data is available.
  bool get hasData => data != null;

  /// Returns true if there is an error.
  bool get hasError => error != null;

  /// Returns true if the operation has completed without any error.
  ///
  /// The operation is considered completed if there is no error and the waiting is false.
  bool get completed => error == null && !waiting;

  /// Checks if two [DataSnapshot] instances are equal by comparing their [data] and [error] fields.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is DataSnapshot<T> &&
        other.data == data &&
        other.error == error;
  }

  /// Generates a hash code based on the [data] and [error] fields.
  @override
  int get hashCode => Object.hash(data, error);
}
