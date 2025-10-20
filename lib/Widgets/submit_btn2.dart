import 'package:flutter/material.dart';

class submit_btn2 extends StatelessWidget {
  const submit_btn2({super.key, required GlobalKey<FormState> formKey})
    : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: SizedBox(
        width: double.infinity,
        height: 50.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFFFF7E5F),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {}
          },
          child: Text(
            'Publier la reccet',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
