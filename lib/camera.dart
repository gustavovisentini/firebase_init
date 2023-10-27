import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final ImagePicker _picker = ImagePicker();

  _imgFromCamera() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 30);
    setState(() {
      _image = File(pickedFile!.path);
      imageOK = true;
    });
  }

  _imgFromLibrary() async {}

  File _image = File("");

  bool imageOK = false;

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text("camera"),
                onTap: () {
                  _imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text("Library"),
                onTap: () {
                  _imgFromLibrary();
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Camera")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                      radius: 90,
                      child: imageOK != (false)
                          ? Container(child: Image.file(_image))
                          : Container(
                              child: Text("Vazio"),
                            ))),
            )
          ]),
        ),
      ),
    );
  }
}
