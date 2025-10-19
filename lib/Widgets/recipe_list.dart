import 'package:flutter/material.dart';
import 'package:recette_app_pierre/Screens/details_page.dart';

class recipe_list extends StatelessWidget {
  const recipe_list({super.key, required this.recipes});

  final List<Map<String, dynamic>> recipes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailPage(
                        emoji: recipe["emoji"],
                        name: recipe["name"],
                        time: recipe["time"],
                        level: recipe["level"],
                        ingredients: List<String>.from(recipe["ingredients"]),
                        steps: List<String>.from(recipe["steps"]),
                      ),
                    ),
                  );
                },
                child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 10,
                    //offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 85,
                    height: 85,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFCEFEA),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    child: FittedBox(
                      alignment: Alignment.center,
                      child: Text(
                        recipe["emoji"],
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                        child: Text(
                          recipe["name"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                        child: Row(
                          children: [
                            const Icon(Icons.access_time, size: 16),
                            Text(recipe['time']),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          left: 10.0,
                          bottom: 5.0,
                        ),
                        child: Text(
                          recipe["level"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
                ),
            );
          },
        ),
      ),
    );
  }
}
