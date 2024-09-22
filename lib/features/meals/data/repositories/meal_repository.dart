import '../../../../core/errors/failure.dart';
import '../../services/meal_service.dart';
import '../models/meal_model.dart';

/// A repository class responsible for fetching meal data from the service layer.
///
/// This class interacts with the [MealService] to retrieve meal data and
/// manages any potential errors that might occur during the fetching process.
class MealRepository {
  /// A reference to the [MealService], which handles API requests.
  final MealService mealService;

  /// Constructor to initialize the repository with a [MealService] instance.
  MealRepository({required this.mealService});

  /// Fetches a list of meals that start with the letter "b".
  ///
  /// Returns a [List] of [Meal] objects. If an error occurs during fetching,
  /// a [ServerFailure] exception is thrown.
  Future<List<Meal>> getMeals() async {
    try {
      // Fetch meals starting with the letter "b" from the service
      return await mealService.fetchMealsByLetter("b");
    } catch (error) {
      // Throw an exception if an error occurs
      throw ServerFailure('Failed to fetch meals from server');
    }
  }

  /// Fetches detailed information about a specific meal by its [mealId].
  ///
  /// Returns a [Meal] object. If an error occurs during fetching,
  /// a [ServerFailure] exception is thrown.
  Future<Meal> getMealDetails(String mealId) async {
    try {
      // Fetch meal details by meal ID from the service
      return await mealService.fetchMealDetails(mealId);
    } catch (error) {
      // Throw an exception if an error occurs
      throw ServerFailure('Failed to fetch meal details');
    }
  }
}
