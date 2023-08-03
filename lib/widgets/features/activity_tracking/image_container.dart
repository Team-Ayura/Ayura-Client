import 'dart:io';

import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/activity_tracking/image_preview.dart';
import 'package:ayura/provider/activityProviders/cyclingOnRideProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ImageContainer extends StatefulWidget {
  final CyclingOnRideProvider cyclingOnRideProvider;

  ImageContainer({required this.cyclingOnRideProvider});
  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  // List<String> imagePaths = [
  // 'assets/images/activity_tracking/cycling/image1.jpg',
  // 'assets/images/activity_tracking/cycling/image2.jpg',
  // 'assets/images/activity_tracking/cycling/image3.jpg',
  // 'assets/images/activity_tracking/cycling/image4.jpg',
  // 'assets/images/activity_tracking/cycling/image5.jpg',
  // You can add more initial image paths here...
  // ];

  // to save the image
  Future<String> _saveImageToExternalStorage(File imageFile) async {
    try {
      final appDir = await getExternalStorageDirectory();
      final fileName =
          DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
      final savedImage = await imageFile.copy('${appDir!.path}/$fileName');
      return savedImage.path;
    } catch (e) {
      print('Error saving image: $e');
      return ''; // Return an empty string if saving fails
    }
  }

  // to open the camera
  Future<void> _openCameraAndAddImage() async {
    // Check if the camera permission is already granted
    var status = await Permission.camera.status;

    // If the permission is not granted, request it
    if (!status.isGranted) {
      status = await Permission.camera.request();
      if (!status.isGranted) {
        // The user denied camera permissions
        return;
      }
    }
    print("Tapped");
    // The camera permission is granted, proceed with opening the camera
    try {
      final pickedFile = await ImagePicker().pickImage(
          source: ImageSource
              .camera); // change gallery to camera to use tha camera.
      if (pickedFile != null) {
        // Navigate to the image preview screen with the image path
        // bool? keepImage = await Navigator.of(context).push<bool?>(
        //   PageRouteBuilder(
        //     opaque: false,
        //     pageBuilder: (BuildContext context, _, __) {
        //       return ImagePreviewScreen(imagePath: pickedFile.path);
        //     },
        //   ),
        // );

        // Handle the decision made by the user
        // if (keepImage == true) {
        // use provider to get the functionality done.
        String savedPath =
            await _saveImageToExternalStorage(File(pickedFile.path));
        // CyclingOnRideProvider cyclingOnRideProvider =
        //     context.read<CyclingOnRideProvider>();
        widget.cyclingOnRideProvider.addImagePath(savedPath);
        // setState(() {
        //   imagePaths.add(savedPath);
        // });

        // } else {
        //   // Discard the image
        // }
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the available width to determine the number of images in each row
    final screenWidth = MediaQuery.of(context).size.width;
    final imagesPerRow = 3;
    final imageSize =
        (screenWidth - (imagesPerRow - 1) * 5 - 2 * 8) / imagesPerRow;
    List<String> imagePaths = widget.cyclingOnRideProvider.imagePaths;
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: AppColors.textColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(5)),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: imagesPerRow,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: imagePaths.length < 6 ? imagePaths.length + 1 : 6,
        itemBuilder: (context, index) {
          if (index < imagePaths.length) {
            return Padding(
              padding: const EdgeInsets.all(3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                // child: Image.asset(
                //   imagePaths[index],
                //   width: imageSize,
                //   height: imageSize,
                //   fit: BoxFit.cover,
                // ),
                child: Consumer<CyclingOnRideProvider>(
                    builder: (context, cyclingOnRideProvider, _) {
                  return Image.file(
                    File(cyclingOnRideProvider.imagePath(index)),
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  );
                }),
              ),
            );
          } else {
            return GestureDetector(
              onTap:
                  _openCameraAndAddImage, // Call the method to open the camera
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.textColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.camera_alt,
                      size: imageSize / 2,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  // Method to add more images to the container
  // void addMoreImages() {
  //   setState(() {
  //     imagePaths.addAll([
  //       'assets/image4.png',
  //       'assets/image5.png',
  //       // Add more image paths as needed...
  //     ]);
  //   });
  // }
}
