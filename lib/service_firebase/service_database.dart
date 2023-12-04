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

  Future addDataForUserInformation(String userName,String userEmail,String userPassword,String userBirthDate)async{
   return await userCollection.doc(uid).set({
      "userId":uid,
      "userName":userName,
      "userEmail":userEmail,
      "userPassword":userPassword,
      "userBirthdate":userBirthDate,


    });

  }
  
  

}