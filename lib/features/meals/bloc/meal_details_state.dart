part of 'meal_details_cubit.dart';

/// A sealed class representing the different states for meal details.
///
/// This state is used by the [MealDetailsCubit] to represent various states
/// like initial, loading, success (data), or error.
sealed class MealDetailsState {}

/// The initial state before any data has been loaded.
final class MealDetailsInitial extends MealDetailsState {}

/// A state that holds the data snapshot, which could be in one of the following states:
/// - Waiting for data
/// - Data loaded successfully
/// - Error occurred during data fetching
class MealDetailsDataState extends MealDetailsState {
  /// A snapshot representing the current data state (loading, success, or error).
  final DataSnapshot snapshot;

  /// Constructor that initializes the [snapshot] field.
  MealDetailsDataState(this.snapshot);
}
