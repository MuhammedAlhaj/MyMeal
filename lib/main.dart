import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'blocs/meal_bloc.dart';
import 'blocs/meal_event.dart';
import 'services/meal_service.dart';
import 'core/network/network_info.dart';
import 'data/repositories/meal_repository.dart';
import 'presentation/screens/meal_list_screen.dart';

void main() {
  final mealService = MealService();
  final networkInfo = NetworkInfo(Connectivity());
  final mealRepository = MealRepository(
    mealService: mealService,
    networkInfo: networkInfo,
  );

  runApp(MyApp(mealRepository: mealRepository));
}

class MyApp extends StatelessWidget {
  final MealRepository mealRepository;

  MyApp({required this.mealRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMeal',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => MealBloc(mealRepository: mealRepository)..add(FetchMealsByLetter(letter: 'b')),
        child: MealListScreen(),
      ),
    );
  }
}
