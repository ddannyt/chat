import 'package:chat/interfaz/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCYu9sa8izTC1i2N4ed0t4oKhmBHB_94vI",
          authDomain: "reto3-chat-b566b.firebaseapp.com",
          projectId: "reto3-chat-b566b",
          storageBucket: "reto3-chat-b566b.appspot.com",
          messagingSenderId: "504093241753",
          appId: "1:504093241753:web:4fd538198da4f6c8ca2308",
          measurementId: "G-P2PBJ6NLP1"));
  runApp(const MyApp());
}
