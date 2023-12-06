import 'package:cloud_firestore/cloud_firestore.dart';


class ServiceDatabase{
  final String? uid;

  ServiceDatabase( this.uid);

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