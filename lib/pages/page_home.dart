import 'package:flutter/material.dart';
import 'package:fundemetals_of_biomedical/service_firebase/service_auth.dart';

class PageHome extends StatelessWidget {
  
  PageHome({super.key});

  ServiceAuth _serviceAuth = new ServiceAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Text("name"),
          MaterialButton(onPressed: ()async{
            await _serviceAuth.signOut();
          },child: Icon(Icons.outbond,size: 150,),)
        ],
      ),
    );
  }
}