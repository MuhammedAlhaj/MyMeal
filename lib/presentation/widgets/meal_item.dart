import 'package:flutter/material.dart';
import '../../data/models/meal_model.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final VoidCallback onTap;

  MealItem({required this.meal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(meal.imageUrl),  // استخدم imageUrl
      title: Text(meal.name),  // استخدم name
      onTap: onTap,
    );
  }
}

