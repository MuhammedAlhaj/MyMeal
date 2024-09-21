import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

abstract class MealEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchMealsByLetter extends MealEvent {
  final String letter;

  FetchMealsByLetter({required this.letter});

  @override
  List<Object> get props => [letter];
}

class FetchMealDetails extends MealEvent {
  final String mealId;

  FetchMealDetails({required this.mealId});

  @override
  List<Object> get props => [mealId];
}
