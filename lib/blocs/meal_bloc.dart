import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_meal_new/core/network/network_info.dart';
import 'package:my_meal_new/services/meal_service.dart';
import 'meal_event.dart';
import 'meal_state.dart';
import '/../data/repositories/meal_repository.dart';
import '../../core/errors/failure.dart';


class MealBloc extends Bloc<MealEvent, MealState> {
  final MealRepository mealRepository;

  MealBloc({required this.mealRepository}) : super(MealInitial()) {
    on<FetchMealsByLetter>(_onFetchMealsByLetter);
    on<FetchMealDetails>(_onFetchMealDetails);
  }

  // الحدث لجلب الوجبات حسب الحرف
  void _onFetchMealsByLetter(FetchMealsByLetter event, Emitter<MealState> emit) async {
    emit(MealLoading());
    try {
      // استدعاء جلب الوجبات من الريبو
      final meals = await mealRepository.getMeals();
      emit(MealLoaded(meals));
    } catch (error) {
      if (error is NetworkFailure) {
        emit(MealError(error.message));
      } else if (error is ServerFailure) {
        emit(MealError(error.message));
      } else {
        emit(MealError('Unexpected error occurred'));
      }
    }
  }

  // الحدث لجلب تفاصيل وجبة معينة
  void _onFetchMealDetails(FetchMealDetails event, Emitter<MealState> emit) async {
    emit(MealLoading());
    try {
      final mealDetails = await mealRepository.getMealDetails(event.mealId);
      emit(MealDetailsLoaded(mealDetails));
    } catch (error) {
      if (error is NetworkFailure) {
        emit(MealError(error.message));
      } else if (error is ServerFailure) {
        emit(MealError(error.message));
      } else {
        emit(MealError('Unexpected error occurred'));
      }
    }
  }
}
