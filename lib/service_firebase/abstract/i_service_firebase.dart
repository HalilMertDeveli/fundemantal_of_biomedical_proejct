import 'package:firebase_auth/firebase_auth.dart';

abstract class IServiceFirebase{
  Future<User?> userCreateUserEmailAndPassword({required String userEmail,required String userPassword});
  Future<User?> userSignInUserEmailAndPassword({required String userEmail,required String userPassword});
  Future<void>  userSignOut();
  Stream<User?> get userGetState;
}