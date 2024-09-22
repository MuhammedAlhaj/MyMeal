import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_meal_new/features/meals/bloc/meal_details_cubit.dart';

/// A stateless widget that displays detailed information about a selected meal.
///
/// The widget retrieves the meal details from the MealDetailsCubit and displays
/// the meal's thumbnail, category, area, ingredients, instructions, and YouTube link (if available).
class MealDetailScreen extends StatelessWidget {
  static const route = "MealDetailScreen";  // Route name for navigation

  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the selected meal from the MealDetailsCubit
    var meal = context.read<MealDetailsCubit>().meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.strMeal),  // Display meal name in the app bar
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero animation for smooth transition between list and detail screen
            Hero(
              tag: meal.idMeal,
              child: CachedNetworkImage(
                imageUrl: meal.strMealThumb,  // Display meal thumbnail
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 16),

            // Meal title
            Text(
              meal.strMeal,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Meal category and area
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  meal.strCategory,  // Display meal category
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  meal.strArea,  // Display meal area (region)
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Ingredients Section
            const Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Display ingredients and corresponding measures
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        meal.ingredients[index],  // Display ingredient
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      meal.measures[index],  // Display corresponding measure
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),

            // Instructions Section
            const Text(
              'Instructions',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              meal.strInstructions,  // Display meal preparation instructions
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // YouTube video link if available
            if (meal.strYoutube != null && meal.strYoutube!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Watch on YouTube',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // Handle YouTube link tap (e.g., open in browser)
                    },
                    child: Text(
                      meal.strYoutube!,  // Display YouTube link
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
