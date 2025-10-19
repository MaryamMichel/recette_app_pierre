import 'package:flutter/material.dart';
// import 'package:lucide_icons/lucide_icons.dart';

class RecipeDetailPage extends StatelessWidget {
  final String emoji;
  final String name;
  final String time;
  final String level;
  final List<String> ingredients;
  final List<String> steps;

  const RecipeDetailPage({
    super.key,
    required this.emoji,
    required this.name,
    required this.time,
    required this.level,
    required this.ingredients,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {

    final Color levelColor = level == "Facile"
        ? Colors.green.shade100
        : level == "Moyen"
        ? Colors.amber.shade100
        : Colors.red.shade100;

    final Color textColor = level == "Facile"
        ? Colors.green.shade800
        : level == "Moyen"
        ? Colors.amber.shade800
        : Colors.red.shade800;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              children: [
                Container(
                  height: 230,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFE0B2), Color(0xFFFFCCBC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 15,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      emoji,
                      style: const TextStyle(fontSize: 100),
                    ),
                  ),
                ),
              ],
            ),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),


                  Row(
                    children: [
                      const Icon(Icons.lock_clock, size: 18),
                      const SizedBox(width: 5),
                      Text(time,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black87)),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: levelColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Text(
                          level,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),


                  const Text(
                    'Ingrédients',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),

                  for (var item in ingredients)
                    _buildIngredientItem(item),

                  const SizedBox(height: 25),


                  const Text(
                    'Étapes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  for (int i = 0; i < steps.length; i++)
                    _buildStepItem(i + 1, steps[i]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Ing
  Widget _buildIngredientItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 15, color: Colors.black87)),
        ],
      ),
    );
  }


  Widget _buildStepItem(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 26,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.orange[400],
              shape: BoxShape.circle,
            ),
            child: Text(
              '$number',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}