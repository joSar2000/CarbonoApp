// ignore_for_file: unnecessary_this, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class PhotoModel extends ChangeNotifier {
  DocumentReference docReference = FirebaseFirestore.instance.collection("TasksComplete").doc();

  var image;
  bool Picked = false;

  Future setCropAfterPicker(bool value)async{
    this.Picked = value;
    this.notifyListeners();
  }

  Future setImage(var file)async{
    this.image = file;
    this.notifyListeners();
  }

  Future<String> uploadFile(var file1) async {
    firebase_storage.Reference storageReference = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('viewTuristas/${image.path}');
    firebase_storage.UploadTask uploadTask = storageReference.putFile(image);
    print('File1 Uploaded');
    String returnURL = "";

    return returnURL;
  }

  void Carga () {
    uploadFile(image);
  }
}