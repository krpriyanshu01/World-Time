import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  final String location;
  String time='';
  final String flag;
  final String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getTime() async{
    try {
      Response response = await get(Uri.parse(
          'https://www.timeapi.io/api/Time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);

      time = data['dateTime'].substring(0, 10)+" "+data['dateTime'].substring(11, 19);
      var parsedDate = DateTime.parse(time);

      isDayTime = parsedDate.hour > 6 && parsedDate.hour < 20 ? true : false;

      time = DateFormat.jm().format(parsedDate);
    }
    catch (e){
      time = "couldn't fetch data";
    }
  }
}