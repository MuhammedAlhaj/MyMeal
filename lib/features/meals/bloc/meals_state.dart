part of 'meals_cubit.dart';

/// A sealed class representing the different states for a list of meals.
///
/// This state is used by the [MealsCubit] to represent the initial state,
/// or the state when data is available (loading, success, or error).
sealed class MealsState {}

/// The initial state before any meal data is loaded.
final class MealsInitial extends MealsState {}

/// A state that holds a snapshot of the list of meals, representing various
/// states such as loading, success (with data), or error.
class MealsDataState extends MealsState {
  /// A snapshot representing the current state of the meals list (loading, success, or error).
  final DataSnapshot<List<Meal>> snapshot;

  /// Constructor that initializes the [snapshot] field.
  MealsDataState(this.snapshot);
}
