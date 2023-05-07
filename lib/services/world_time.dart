import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  late String time;
  String url;
  late bool isDaytime;

  WorldTime({
    required this.location,
    required this.url});

  Future <void> getTime() async {
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String dateTime = data["utc_datetime"];
      String offset = data['utc_offset'];
      String newOffset = offset.substring(1,3);

      DateTime now = DateTime.parse(dateTime);
      final currentTime = now.add(Duration(hours: int.parse(newOffset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(currentTime);
    }
    catch (e){
      print(e);
      time = 'could not get time';
    }

  }
}