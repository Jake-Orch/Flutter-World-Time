import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;   // location name for the UI
  String time = '';       // time in location
  String flag;       // url to asset flag icon
  String url;        // location url for api endpoint

  WorldTime({ required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try {
      // make request
      Response response = await get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);

      // get properties from data
      DateTime now = DateTime.parse(data['dateTime']);

      // set time property
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time = 'Could not get time data';
    }


  }

}