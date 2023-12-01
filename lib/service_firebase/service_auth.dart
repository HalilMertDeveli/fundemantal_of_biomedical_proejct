import 'package:firebase_auth/firebase_auth.dart';

class ServiceAuth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<dynamic> registerUserWithEmailAndPassword(
      String fullName, String email, String password, String birthDate) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      //update user data from firestore with database service class , user will use here
      return true;
    } on FirebaseAuthException catch (firebaseExceptionInstance) {
      return firebaseExceptionInstance.message;
    }
  }

  //there will be sign-in function
  Future<dynamic> singInEmailAndPassword(
      {required String userEmail, required userPassword}) async {
    try {
      User userInformation = (await firebaseAuth.signInWithEmailAndPassword(
              email: userEmail, password: userPassword))
          .user!;

      return true;
    } on FirebaseAuthException catch (e) {
      print(
          "exception message is${e.message} and exception code is ${e.code.toString()} , halik");

      return null;
    }
  }

  Future<void> signOut() async {
    try {
      //shared will be here for state
      //user name
      //user email
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (instanceOfFirebaseAuthException) {
      print(instanceOfFirebaseAuthException.message);
    }
  }
}
