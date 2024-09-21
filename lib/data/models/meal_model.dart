class Meal {
  final String id;
  final String name;
  final String imageUrl;
  final String description;

  Meal({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  // تحويل البيانات من JSON إلى كائن Meal
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      description: json['strInstructions'],
    );
  }
}
