import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key? key,
    required this.usernameController,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController usernameController;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: usernameController,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueAccent,
            )),
        border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueAccent,
            )),
      ),
    );
  }
}