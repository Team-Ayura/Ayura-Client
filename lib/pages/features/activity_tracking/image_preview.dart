import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreviewScreen extends StatelessWidget {
  final String imagePath;

  const ImagePreviewScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Preview'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.file(File(imagePath)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Implement the logic to keep the image
                  Navigator.of(context).pop(true);
                },
                child: const Text('Keep'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  // Implement the logic to discard the image
                  Navigator.of(context).pop(false);
                },
                child: const Text('Discard'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
