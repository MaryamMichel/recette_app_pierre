import 'package:flutter/material.dart';
import 'package:recette_app_pierre/Widgets/PhotoSection.dart';
import 'package:recette_app_pierre/Widgets/submit_btn.dart';
import 'package:recette_app_pierre/Widgets/time_level_form.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({Key? key}) : super(key: key);

  @override
  _FormAddState createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF9FAFB),
        appBar: AppBar(
          title: Text(
            'Ajouter une recette',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xFFFF7E5F),
        ),
        body: Padding(
            padding: EdgeInsets.all(25.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // form
                        Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Nom de la recette :"),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFFFFFFF),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text("Ingredients :"),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFFFFFFF),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text("Preparation :"),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFFFFFFF),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Décrivez les étapes de préparation...',
                        ),
                      ),
                    time_level_form(),

                    PhotoSection(),

                    submit_btn()
                    ],
                ),
              ),
            ),
        ),
    );
  }
}