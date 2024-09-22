import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/models/meal_model.dart';

class MealService {
  final Dio _dio = GetIt.I();

  Future<List<Meal>> fetchMealsByLetter(String letter) async {
    try {
      final response = await _dio.get(
        'search.php',
        queryParameters: {"s": letter},
      );
      return (response.data['meals'] as List)
          .map((mealData) => Meal.fromJson(mealData))
          .toList();
    } catch (e) {
      throw Exception('Failed to load meals: $e');
    }
  }

  Future<Meal> fetchMealDetails(String mealId) async {
    try {
      final response = await _dio.get(
        'lookup.php',
        queryParameters: {
          "i": mealId,
        },
      );
      return Meal.fromJson(response.data['meals'][0]);
    } catch (e) {
      throw Exception('Failed to load meal details: $e');
    }
  }
}
