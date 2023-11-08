import 'package:firebase_auth/firebase_auth.dart';
import 'package:fundemetals_of_biomedical/fundemantal_entities/concrate/application_user.dart';

abstract class IServiceFirebase{
  Future<ApplicationUser?> userCreateUserEmailAndPassword({required String userEmail,required String userPassword});
  Future<ApplicationUser?> userSignInUserEmailAndPassword({required String userEmail,required String userPassword});
  Future<void>  userSignOut();
  Stream<ApplicationUser?> get userGetState;
}