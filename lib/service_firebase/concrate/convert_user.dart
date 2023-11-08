import 'package:firebase_auth/firebase_auth.dart';
import 'package:fundemetals_of_biomedical/fundemantal_entities/concrate/application_user.dart';

mixin class ConvertUser {
  ApplicationUser convertUser(UserCredential userCredential) {
    if (userCredential.user?.uid != null && userCredential.user?.email != null)
      return ApplicationUser(
          userId: userCredential.user!.uid,
          userEmail: userCredential.user!.email!);
    else
      return ApplicationUser(
          userId: "null userId", userEmail: "null User Name");
  }
}
