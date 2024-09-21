import 'package:dio/dio.dart';

import '../data/models/meal_model.dart';

class MealService {
  final Dio _dio = Dio();

  // جلب الوجبات التي تبدأ بحرف معين وتحويل البيانات إلى قائمة Meal
  Future<List<Meal>> fetchMealsByLetter(String letter) async {
    try {
      final response = await _dio.get('https://www.themealdb.com/api/json/v1/1/search.php?f=$letter');
      return (response.data['meals'] as List)
          .map((mealData) => Meal.fromJson(mealData))
          .toList();
    } catch (e) {
      throw Exception('Failed to load meals: $e');
    }
  }

  // جلب تفاصيل وجبة معينة باستخدام id
  Future<Meal> fetchMealDetails(String mealId) async {
    try {
      final response = await _dio.get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId');
      return Meal.fromJson(response.data['meals'][0]);
    } catch (e) {
      throw Exception('Failed to load meal details: $e');
    }
  }
}
