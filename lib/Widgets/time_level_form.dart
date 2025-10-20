import 'package:flutter/material.dart';
import 'package:recette_app_pierre/Widgets/form_field.dart';
import 'package:recette_app_pierre/utils/validators.dart';

class time_level_form extends StatelessWidget {
  const time_level_form({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("Temps :"),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: form_field(
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return 'LE titre est requis';
                    }
                    if (!value.isValidDuration) {
                      return 'Le titre doit etre un nombre superieurre a 0.';
                    }
                    return null;
                  },
                )
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 8.0,
                ),
                child: Text("Level :"),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: form_field(
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty ) {
                      return 'LE level est requis';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
