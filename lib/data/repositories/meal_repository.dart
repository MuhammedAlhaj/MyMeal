import '../../core/errors/failure.dart';
import '../../core/network/network_info.dart';
import '../../services/meal_service.dart';
import '../models/meal_model.dart';

class MealRepository {
  final MealService mealService;
  final NetworkInfo networkInfo;

  MealRepository({required this.mealService, required this.networkInfo});

  Future<List<Meal>> getMeals() async {
    if (await networkInfo.isConnected()) {
      try {
        // استدعاء خدمة جلب الوجبات وتحويلها إلى List<Meal>
        return await mealService.fetchMealsByLetter("b");
      } catch (error) {
        throw ServerFailure('Failed to fetch meals from server');
      }
    } else {
      throw NetworkFailure('No Internet Connection');
    }
  }

  Future<Meal> getMealDetails(String mealId) async {
    if (await networkInfo.isConnected()) {
      try {
        return await mealService.fetchMealDetails(mealId);
      } catch (error) {
        throw ServerFailure('Failed to fetch meal details');
      }
    } else {
      throw NetworkFailure('No Internet Connection');
    }
  }
}
