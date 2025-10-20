import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class PhotoSection extends StatelessWidget {
  final XFile? imageFile;
  final VoidCallback onTakePicture;
  final VoidCallback onDeletePicture;

  const PhotoSection({
    super.key,
    required this.imageFile,
    required this.onTakePicture,
    required this.onDeletePicture,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add photo box
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GestureDetector(
            onTap: onTakePicture,
            child: Container(
              width: double.infinity,
              height: 180.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFE5E7EB),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFFFFFFFF),
              ),
              child: imageFile == null
                  ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_rounded,
                    size: 40.0,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 8),
                  Text('Ajouter une photo'),
                ],
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(imageFile!.path),
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        // Take photo buttons
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              SizedBox(
                width: imageFile == null ? 361 : 280,
                height: 40.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: onTakePicture,
                  child: Text(
                    imageFile == null
                        ? 'Ajouter une photo'
                        : 'Reprendre une photo',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              if (imageFile != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 40.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                      onPressed: onDeletePicture,
                      child: const Icon(
                        Icons.delete,
                        size: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
