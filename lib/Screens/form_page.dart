import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:recette_app_pierre/Widgets/form_field.dart';
import 'package:recette_app_pierre/Widgets/submit_btn2.dart';
import 'package:recette_app_pierre/Widgets/PhotoSection.dart';
import 'package:recette_app_pierre/Widgets/time_level_form.dart';
import 'package:recette_app_pierre/utils/validators.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({Key? key}) : super(key: key);

  @override
  _FormAddState createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  final _formKey = GlobalKey<FormState>();
  XFile? _imageFile;

  Future<void> _takePicture() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;
    try {
      final CameraController controller = CameraController(
        firstCamera, // <-- from your main.dart global variable
        ResolutionPreset.medium,
      );

      await controller.initialize();

      final XFile image = await controller.takePicture();

      setState(() {
        _imageFile = image;
      });

      await controller.dispose();
    } catch (e) {
      print('Error taking picture: $e');
    }
  }
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // form
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Nom de la recette :"),
                  ),
                  SizedBox(height: 8),
                  form_field(
                    maxLines: 1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'LE titre est requis';
                      }
                      if (!value.isValidTitle) {
                        return 'Le titre doit contenir au moins 3 caracteres.';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text("Ingredients :"),
                  ),
                  SizedBox(height: 8),
                  form_field(
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isNoEmptyText) {
                        return 'Les ingrediens sant requis';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text("Preparation :"),
                  ),
                  SizedBox(height: 8),
                  form_field(
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.isNoEmptyText) {
                        return 'La preparation est requis';
                      }
                      return null;
                    },
                  ),
                  time_level_form(),

                  PhotoSection(
                    imageFile: _imageFile,
                    onTakePicture: _takePicture,
                    onDeletePicture: () {
                      setState(() {
                        _imageFile = null;
                      });
                    },
                  ),
                  //submit_btn()
                  submit_btn2(formKey: _formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
