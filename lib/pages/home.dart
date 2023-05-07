import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDayTime'] ? 'daylight.jpg' : 'nights.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.blue :Colors.black45;
    return Scaffold(
      backgroundColor: bgColor,
     body: SafeArea(
       child: Container(
         decoration:  BoxDecoration(
           image: DecorationImage(
               image: AssetImage('assets/$bgImage'),
             fit: BoxFit.cover
           ),
         ),
         child: Padding(
           padding: const EdgeInsets.only(left: 10,top: 120),
           child: Column(
             children: [
               TextButton.icon(
                   onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDayTime' :result['isDayTime']
                      };
                    });
                   },
                   icon: const Icon(Icons.edit_location,color: Colors.black,size: 30,),
                   label: const Text("Edit Location",style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20,color: Colors.black),),
                   ),
               const SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  Text(data['location'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    fontSize: 50,
                    letterSpacing: 1
                  ),)
                 ],
               ),
               SizedBox(height: 30,),
               Text(data['time'],
                 style:  TextStyle(
                   color: Colors.black,
                 fontWeight: FontWeight.bold,
                 fontSize: 70
               ),)
             ],
           ),
         ),
       ),
     ),
    );
  }
}
