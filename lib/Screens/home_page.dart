import 'package:flutter/material.dart';
import 'package:recette_app_pierre/Widgets/recipe_list.dart';
import 'package:recette_app_pierre/Widgets/header.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> recipes = [
    {
      "name": "Tajine Poulet Citron",
      "time": "45 min",
      "level": "Moyen",
      "levelColor": Colors.amber[100],
      "img": "assets/Capture.PNG",
      "emoji": "🍲",
    },
    {
      "name": "Couscous Royal",
      "time": "90 min",
      "level": "Difficile",
      "levelColor": Colors.red[100],
      "img": "assets/Capture.PNG",
      "emoji": "🍋",
    },
    {
      "name": "Salade Niçoise",
      "time": "20 min",
      "level": "Facile",
      "levelColor": Colors.green[100],
      "img": "assets/Capture.PNG",
      "emoji": "🥗",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, size: 30),
      ),

      body: Column(
        children: [
          // HEADER
          header(),
          // List
          recipe_list(recipes: recipes),
        ],
      ),
    );
  }
}
