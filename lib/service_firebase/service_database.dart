import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fundemetals_of_biomedical/model/model_user.dart';

class ServiceDatabase{
  final String? uid;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  ModelUser ? modelUser;

  ServiceDatabase( this.uid,{this.modelUser}){
    this.modelUser = modelUser;
  }

  final CollectionReference userCollection  = FirebaseFirestore.instance.collection("users");

  Future updateUserData(String userId,String userName,String userEmail,String userPassword,String userBirthDate)async{
    userCollection.doc(uid).set({
      "userId":uid,
      "userName":modelUser?.userName,
      "userEmail":modelUser?.userEmail,
      "userPassword":modelUser?.userPassword,
      "userBirthdate":modelUser?.userBirthDate,


    });

  }
  
  

}