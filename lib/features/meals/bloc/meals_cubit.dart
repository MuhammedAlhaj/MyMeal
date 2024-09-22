import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_meal_new/core/utils/state.dart';

import '../data/models/meal_model.dart';
import '../data/repositories/meal_repository.dart';

part 'meals_state.dart';

/// Cubit for managing meal-related operations such as fetching meals by letter
/// and retrieving meal details.
class MealsCubit extends Cubit<MealsState> {
  final MealRepository mealRepository = GetIt.I();

  /// Constructor for  MealsCubit
  MealsCubit() : super(MealsInitial()) {
    fetchMealsByLetter();
  }

  /// Fetch meals by letter and emit appropriate states.
  Future<void> fetchMealsByLetter() async {
    try {
      emit(MealsDataState(const DataSnapshot.waiting()));
      final result = await mealRepository.getMeals();
      emit(MealsDataState(DataSnapshot.withData(result)));
    } catch (ex) {
      emit(MealsDataState(DataSnapshot.withError(ex)));
    }
  }
}
