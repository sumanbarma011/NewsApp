import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomizeBottomSheet extends StatelessWidget {
  const CustomizeBottomSheet({super.key, required this.chooseImg});
  final void Function(File imgFile) chooseImg;
  void chooseFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (photo == null) {
      return;
    }
    final File file = File(photo.path);
    chooseImg(file);
  }
   void chooseFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (photo == null) {
      return;
    }
    final File file = File(photo.path);
    chooseImg(file);
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: chooseFromCamera,
            leading: const Icon(Icons.camera_alt_rounded),
            title: const Text('Take from camera'),
          ),
           ListTile(
            onTap:chooseFromGallery ,
            leading:const Icon(Icons.collections),
            title:const Text('Choose from gallery'),
          ),
        ],
      ),
    );
  }
}
