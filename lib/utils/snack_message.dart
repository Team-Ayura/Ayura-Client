import 'package:flutter/material.dart';

//This is a common flashmessage 
//create success and error messages if needed (depends on UI design)

void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ),
  );
}

