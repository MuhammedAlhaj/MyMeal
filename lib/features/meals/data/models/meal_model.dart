/// A model class that represents a meal.
///
/// This class contains detailed information about a meal, such as its
/// name, category, ingredients, and instructions. It also provides
/// methods to convert between JSON and [Meal] objects.
class Meal {
  /// The unique identifier of the meal.
  final String idMeal;

  /// The name of the meal.
  final String strMeal;

  /// An alternate drink to serve with the meal, if available.
  final String? strDrinkAlternate;

  /// The category of the meal (e.g., "Dessert", "Main Course").
  final String strCategory;

  /// The area or cuisine type of the meal (e.g., "Italian", "Chinese").
  final String strArea;

  /// The instructions for preparing the meal.
  final String strInstructions;

  /// The URL of the thumbnail image for the meal.
  final String strMealThumb;

  /// Tags associated with the meal, if available.
  final String? strTags;

  /// A YouTube link showing how to prepare the meal, if available.
  final String? strYoutube;

  /// A list of ingredients used in the meal.
  final List<String> ingredients;

  /// A list of measurements corresponding to each ingredient.
  final List<String> measures;

  /// Constructor to initialize a [Meal] object with the given properties.
  Meal({
    required this.idMeal,
    required this.strMeal,
    this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    this.strTags,
    this.strYoutube,
    required this.ingredients,
    required this.measures,
  });

  /// A factory method to create a [Meal] object from a JSON map.
  ///
  /// This method extracts up to 20 ingredients and measurements from the
  /// provided JSON, filtering out any empty values.
  factory Meal.fromJson(Map<String, dynamic> json) {
    // Collect all non-empty ingredient fields
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'] as String?;
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }
    }

    // Collect all non-empty measure fields
    List<String> measures = [];
    for (int i = 1; i <= 20; i++) {
      final measure = json['strMeasure$i'] as String?;
      if (measure != null && measure.isNotEmpty) {
        measures.add(measure);
      }
    }

    return Meal(
      idMeal: json['idMeal'] as String,
      strMeal: json['strMeal'] as String,
      strDrinkAlternate: json['strDrinkAlternate'] as String?,
      strCategory: json['strCategory'] as String,
      strArea: json['strArea'] as String,
      strInstructions: json['strInstructions'] as String,
      strMealThumb: json['strMealThumb'] as String,
      strTags: json['strTags'] as String?,
      strYoutube: json['strYoutube'] as String?,
      ingredients: ingredients,
      measures: measures,
    );
  }

  /// Converts a [Meal] object into a JSON map.
  ///
  /// This method also serializes the ingredients and measures into
  /// their respective numbered fields (e.g., 'strIngredient1', 'strMeasure1').
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['idMeal'] = idMeal;
    data['strMeal'] = strMeal;
    data['strDrinkAlternate'] = strDrinkAlternate;
    data['strCategory'] = strCategory;
    data['strArea'] = strArea;
    data['strInstructions'] = strInstructions;
    data['strMealThumb'] = strMealThumb;
    data['strTags'] = strTags;
    data['strYoutube'] = strYoutube;

    for (int i = 0; i < ingredients.length; i++) {
      data['strIngredient${i + 1}'] = ingredients[i];
      data['strMeasure${i + 1}'] = measures.length > i ? measures[i] : '';
    }

    return data;
  }
}
