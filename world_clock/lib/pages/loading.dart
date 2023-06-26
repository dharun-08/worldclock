import 'dart:io';

import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void worldClock() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    print(instance.time);
    // ignore: use_build_context_synchronously
Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false,arguments: {
  'location':instance.location,
  'flag':instance.flag,
  'time': instance.time,
  'isDayTime':instance.isDayTime,
});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    worldClock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body:Center(
        child: SpinKitFadingCircle(
  color: Colors.white,
  size: 50.0,
),
      ),
    );
  }
}
