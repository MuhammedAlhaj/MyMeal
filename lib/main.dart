import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_meal_new/features/meals/bloc/meal_details_cubit.dart';
import 'package:my_meal_new/features/meals/bloc/meals_cubit.dart';

import 'features/meals/data/models/meal_model.dart';
import 'features/meals/data/repositories/meal_repository.dart';
import 'features/meals/screens/meal_detail_screen.dart';
import 'features/meals/screens/meal_list_screen.dart';
import 'features/meals/services/meal_service.dart';

/// Dependency injection setup using GetIt.
///
/// This method registers instances of Dio, MealService, and MealRepository,
/// making them available throughout the app.
void inject() {
  // Register Dio with a base URL for API calls.
  GetIt.I.registerLazySingleton(
        () => Dio(
      BaseOptions(baseUrl: "https://www.themealdb.com/api/json/v1/1/"),
    ),
  );
  // Register MealService to handle API requests.
  GetIt.I.registerLazySingleton(() => MealService());
  // Register MealRepository to manage data fetching logic.
  GetIt.I.registerLazySingleton(
        () => MealRepository(mealService: GetIt.I()),
  );
}

/// The main entry point of the app.
///
/// This function initializes the dependency injection system
/// and runs the app.
void main() {
  // Inject dependencies.
  inject();

  // Run the app.
  runApp(const MyApp());
}

/// The root widget of the application.
///
/// This widget sets up the application theme, routes, and initial screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMeal',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      // The initial route of the app is set to the MealListScreen.
      initialRoute: MealListScreen.route,
      routes: {
        // Define the route for the MealListScreen.
        MealListScreen.route: (context) {
          // Provide the MealsCubit to handle state management for the meal list.
          return BlocProvider(
            create: (context) => MealsCubit(),
            child: const MealListScreen(),
          );
        },
        // Define the route for the MealDetailScreen.
        MealDetailScreen.route: (context) {
          // Extract the selected meal passed through navigation arguments.
          var meal = ModalRoute.of(context)!.settings.arguments as Meal;
          // Provide the MealDetailsCubit to manage meal details state.
          return BlocProvider(
            create: (context) => MealDetailsCubit(meal),
            child: const MealDetailScreen(),
          );
        },
      },
    );
  }
}
