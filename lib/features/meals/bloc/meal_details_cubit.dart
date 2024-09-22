import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/utils/state.dart';
import '../data/models/meal_model.dart';
import '../data/repositories/meal_repository.dart';

part 'meal_details_state.dart';

/// A Cubit responsible for fetching and managing the state of meal details.
///
/// This cubit uses the [MealRepository] to fetch detailed information about
/// a specific meal. It emits different states during the data fetching process,
/// including initial, loading, success (with data), and error states.
class MealDetailsCubit extends Cubit<MealDetailsState> {
  /// A reference to the [MealRepository] to fetch meal details.
  ///
  /// The repository is provided using the GetIt service locator.
  final MealRepository mealRepository = GetIt.I();

  /// The meal object for which details are being fetched.
  final Meal meal;

  /// Initializes the cubit with an initial state and triggers the data fetching.
  ///
  /// The constructor accepts a [Meal] object and immediately calls [fetchMealDetails]
  /// to retrieve the meal details.
  MealDetailsCubit(this.meal) : super(MealDetailsInitial()) {
    fetchMealDetails();
  }

  /// Fetches detailed information about the meal from the repository.
  ///
  /// This method interacts with [MealRepository.getMealDetails] and emits the following states:
  /// - [MealDetailsDataState] with a waiting state during loading.
  /// - [MealDetailsDataState] with data on success.
  /// - [MealDetailsDataState] with an error on failure.
  Future<void> fetchMealDetails() async {
    try {
      // Emit loading state
      emit(MealDetailsDataState(const DataSnapshot.waiting()));

      // Fetch meal details from the repository
      final result = await mealRepository.getMealDetails(meal.idMeal);

      // Emit success state with fetched meal details
      emit(MealDetailsDataState(DataSnapshot.withData(result)));
    } catch (ex) {
      // Emit error state if fetching meal details fails
      emit(MealDetailsDataState(DataSnapshot.withError(ex)));
    }
  }
}
