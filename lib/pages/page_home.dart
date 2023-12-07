import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fundemetals_of_biomedical/service/notification_service.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = 
new FlutterLocalNotificationsPlugin();


class PageHome extends StatefulWidget {
  PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  void initState() {
    super.initState();
    NotificationService.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Flutter notification with water "),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 100.0),
            child: Image.asset("assets/justwater.jpg",scale: 0.9,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){
                NotificationService.showBigTextNotifaction(title: "Hello ", body: "Hello", fln: flutterLocalNotificationsPlugin);
              }, child: const Text("Drink now"),),
              ElevatedButton(onPressed: (){}, child: const Text("Schedule drank"),),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){}, child: const Text("Drink grouped"),),
              ElevatedButton(onPressed: (){}, child: const Text("Cancel all Drinks"),),
            ],
          )
        ],
      ),
    );
  }
}


