import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    // make request
    Response response = await get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=Europe/London'));
    Map data = jsonDecode(response.body);

    // get properties from data
    DateTime now = DateTime.parse(data['dateTime']);
    print(now);

  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading screen')
    );
  }
}
