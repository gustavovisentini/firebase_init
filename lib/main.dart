import 'package:firebase_init/home.dart';
import 'package:firebase_init/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //inicializar o firebase
  await Firebase.initializeApp();
  //inicializa o app
  runApp(const MaterialApp(
    home: Login(),
  ));
}
