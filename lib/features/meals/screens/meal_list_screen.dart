import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_meal_new/features/meals/bloc/meals_cubit.dart';

import '../../../core/utils/utils.dart';
import 'meal_detail_screen.dart';

/// A stateless widget that displays a list of meals fetched from the MealsCubit.
///
/// The widget listens for state changes using BlocBuilder and handles the different
/// UI states, including loading, error, and data display.
class MealListScreen extends StatelessWidget {
  static const route = "MealListScreen";  // Route name for navigation

  const MealListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals List'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      // BlocBuilder listens to the MealsCubit and rebuilds the UI based on state changes
      body: BlocBuilder<MealsCubit, MealsState>(
        buildWhen: (previous, current) => current is MealsDataState,  // Rebuild only when MealsDataState is emitted
        builder: (context, state) {
          // Show loading spinner while data is being fetched
          if (state is MealsDataState && state.snapshot.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Show error message if an error occurs
          else if (state is MealsDataState && state.snapshot.hasError) {
            return Center(
              child: Text(
                Utils.resolveErrorMessage(state.snapshot.error),
                style: const TextStyle(color: Colors.redAccent, fontSize: 16),
              ),
            );
          }
          // Display the list of meals when data is available
          else if (state is MealsDataState && state.snapshot.hasData) {
            var meals = state.snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: meals.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final meal = meals[index];
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  leading: Hero(
                    tag: meal.idMeal,  // Hero animation for smooth transition between screens
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        child: CachedNetworkImage(
                          imageUrl: meal.strMealThumb,  // Display meal thumbnail
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    meal.strMeal,  // Display meal name
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    meal.strCategory,  // Display meal category
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    // Navigate to meal detail screen when tapped
                    Navigator.of(context).pushNamed(
                      MealDetailScreen.route,
                      arguments: meal,
                    );
                  },
                );
              },
            );
          }
          // Return an empty widget when no state is active
          return const SizedBox();
        },
      ),
    );
  }
}
