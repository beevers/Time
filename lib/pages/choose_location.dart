import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  List<WorldTime> locations = [
    WorldTime(location: "Abidjan", url: "Africa/Abidjan"),
    WorldTime(location: 'Lagos', url: "Africa/Lagos"),
    WorldTime(location: 'Algiers', url: "Africa/Algiers"),
    WorldTime(location: 'Paris', url: "Europe/Paris"),
    WorldTime(location: 'London', url: "Europe/London"),
    WorldTime(location: 'Luxembourg', url: "Europe/Luxembourg"),
    WorldTime(location: 'Madrid', url: "Europe/Madrid"),
    WorldTime(location: 'Dublin', url: "Europe/Dublin"),
    WorldTime(location: 'Helsinki', url: "Europe/Helsinki"),
    WorldTime(location: 'Berlin', url: "Europe/Berlin"),
    WorldTime(location: 'Andorra', url: "Europe/Andorra"),
    WorldTime(location: 'Amsterdam', url: "Europe/Amsterdam"),
    WorldTime(location: 'Stanley', url: "Atlantic/Stanley"),
    WorldTime(location: 'South Georgia', url: "Atlantic/South_Georgia"),
    WorldTime(location: 'Canary', url: "Atlantic/Canary"),
    WorldTime(location: 'Tokyo', url: "Asia/Tokyo"),
    WorldTime(location: 'Singapore', url: "Asia/Singapore"),
    WorldTime(location: 'Shanghai', url: "Asia/Shanghai"),
    WorldTime(location: 'Hong Kong', url: "Asia/Hong_Kong"),
    WorldTime(location: 'Dubai', url: "Asia/Dubai"),
    WorldTime(location: 'Phoenix', url: "America/Phoenix"),
    WorldTime(location: 'Nome', url: "America/Nome"),
    WorldTime(location: 'New York', url: "America/New_York"),
    WorldTime(location: 'Denver', url: "America/Denver"),
    WorldTime(location: 'Casablanca', url: "Africa/Casablanca"),
    WorldTime(location: 'Cairo', url: "Africa/Cairo"),
    WorldTime(location: 'Accra', url: "Africa/Accra"),
    WorldTime(location: 'Nairobi', url: "Africa/Nairobi"),
    WorldTime(location: 'Tripoli', url: "Africa/Tripoli"),
    WorldTime(location: 'Costa Rica', url: "America/Costa_Rica"),
    WorldTime(location: 'Bahia', url: "America/Bahia"),


  ];

  void upDateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location' : instance.location,
      'time' : instance.time,
      'isDayTime' : instance.isDaytime
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose A Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Card(
              elevation: 4,
              child: ListTile(
                onTap: (){
                  upDateTime(index);
                },
                title: Text(locations[index].location),
              ),
            );
          }
      ),
    );
  }
}
