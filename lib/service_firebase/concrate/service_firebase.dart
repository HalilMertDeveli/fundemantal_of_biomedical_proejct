import 'package:firebase_auth/firebase_auth.dart';
import 'package:fundemetals_of_biomedical/fundemantal_entities/concrate/application_user.dart';
import 'package:fundemetals_of_biomedical/service_firebase/abstract/i_service_firebase.dart';
import 'package:fundemetals_of_biomedical/service_firebase/concrate/convert_user.dart';

class ServiceFirebase with ConvertUser implements IServiceFirebase {
  final _authInstance = FirebaseAuth.instance;

  ApplicationUser getUser(User ?  user ){
    if(user != null)
    return ApplicationUser(userId: user.uid, userEmail: user.email!);
    else
    return ApplicationUser(userId: "user null on get User ", userEmail: "user emil on get user method");
  }

  @override
  Future<ApplicationUser?> userCreateUserEmailAndPassword(
      {required String userEmail, required String userPassword}) async {
    var _temUser = await _authInstance.createUserWithEmailAndPassword(
        email: userEmail, password: userPassword);
    return convertUser(_temUser);
  }

  @override
  Stream<ApplicationUser?> get userGetState => _authInstance.authStateChanges().map(getUser);

  @override
  Future<ApplicationUser?> userSignInUserEmailAndPassword(
      {required String userEmail, required String userPassword}) async {
    var _temUser = await _authInstance.signInWithEmailAndPassword(
        email: userEmail, password: userPassword);
    return convertUser(_temUser);
  }

  @override
  Future<void> userSignOut() async {
    await _authInstance.signOut();
  }
}
