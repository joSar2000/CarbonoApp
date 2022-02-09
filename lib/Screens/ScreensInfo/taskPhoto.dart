// ignore_for_file: file_names, prefer_const_constructors

import 'dart:io';

import 'package:carbono_app/models/multimedia.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class TaskPhoto extends StatefulWidget {
  const TaskPhoto({Key? key}) : super(key: key);

  @override
  _TaskPhotoState createState() => _TaskPhotoState();
}

class _TaskPhotoState extends State<TaskPhoto> {

  Future<File?> cropImage(var image)async{
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop My Image',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
    );
    return croppedFile;
  }

  Future<File?> getImageFromSource(ImageSource source, bool toCrop)async{
    var image = await ImagePicker().getImage(source: source);
    if(image==null)
      return null;
    if(toCrop){
      var croppedImage = await cropImage(File(image.path));
      return croppedImage;
    }
    return File(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: const Text("Detalles de la Actividad"),
            centerTitle: true),
        body: ListView(children: [
          ChangeNotifierProvider<PhotoModel>(
            create: (context) => PhotoModel(),
            child: Consumer<PhotoModel>(
              builder: (context, photo, child) {
                return Center(
                  child: Column(
                    children: [
                      if(photo.image==null)
                        Icon(Icons.camera,size: 70),
                      if(photo.image!=null)
                        Image.file(photo.image,height: 250),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget> [
                            Flexible(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: FloatingActionButton(
                                heroTag: "firstB",
                                elevation: 20.0,
                                child: Icon(Icons.photo),
                                onPressed: ()async{
                                  var image = await getImageFromSource(ImageSource.gallery, photo.Picked);
                                  if(image==null)
                                    return;
                                  photo.setImage(image);
                                },
                              ),
                            ),
                          ),
                          ],
                        )
                    ],
                  ),
                );
              },
            ),
          ),
        ]));
  }
}
