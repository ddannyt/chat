import 'package:firebase_auth/firebase_auth.dart';

class Autentificacion {
  final FirebaseAuth fire = FirebaseAuth.instance;
  User? get usuarios => fire.currentUser;
  Stream<User?> get estadologin => fire.authStateChanges();

  Future<void> IniciarSesion(
      {required String email, required String password}) async {
    try {
      await fire.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

    Future<void> CrearUsuario(
      {required String email, required String password}) async {
    try {
      await fire.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<void> CerrarSesion() async {
    try {
      await fire.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }


}
