import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'dart:math' as math;



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  String time = "loading";

  void getUpdatedTime() async {
    WorldTime instance = WorldTime(location: "Lagos", url: 'Africa/Lagos');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',
    arguments: {
      'location' : instance.location,
      'time' : instance.time,
      'isDayTime' : instance.isDaytime
    }
    );
  }

  late AnimationController _controller ;
   Animation<double>? animation ;

  @override
  void initState() {
    getUpdatedTime();
    _controller = AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this);
    animation = Tween<double>(
        begin: 0,
        end: 2 * math.pi
    ).animate(_controller)
      ..addListener(() {
        setState(() {});})
      ..addStatusListener((status) {
        if(status == AnimationStatus.completed){
          _controller.reverse();
        }else if (status == AnimationStatus.dismissed){
          _controller.forward();
        }

      })
    ;

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[400],
      body: SafeArea(
        child: Center(
          child: Transform.rotate(
            angle: animation!.value,
            child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        image: AssetImage('assets/newtime.jpg'),
                        fit: BoxFit.none
                    )
                )
            ),
          ),
        ),
      ),
    );
  }
}

// void anime(){
//   Transform.rotate(
//     angle: animation!.value,
//     child: Container(
//         width: 250,
//         height: 250,
//         decoration: BoxDecoration(
//             color: Colors.blueGrey[200],
//             shape: BoxShape.circle,
//             image: const DecorationImage(
//                 image: AssetImage('assets/time.jpg'),
//                 fit: BoxFit.none
//             )
//         )
//     ),
//   ),
// }