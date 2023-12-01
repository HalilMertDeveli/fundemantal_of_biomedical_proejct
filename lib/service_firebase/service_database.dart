import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServiceDatabase{
  final String uid;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  ServiceDatabase({required this.uid});

  final CollectionReference userCollection  = FirebaseFirestore.instance.collection("users");

  Future updateUserData(String userId,String userName,String userEmail,String userPassword,String userBirthDate)async{
    userCollection.doc(uid).set({
      "userId":userId,
      "userName":userName,
      "userEmail":userEmail,
      "userPassword":userPassword,
      "userBirthdate":userBirthDate,


    });

  }

}