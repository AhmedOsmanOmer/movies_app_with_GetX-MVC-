import 'package:flutter/material.dart';
import 'package:flutter_mid_level/utils/screen_size.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.signal_cellular_connected_no_internet_4_bar_rounded,
                size: ScreenSize(context: context).getHeight() * 0.3,color: Colors.red,),
            const Text(
              "No Internet Connection",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "You are not connected to the internet make sure Wi-Fi or celluar network are on",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            )
          ]),
    );
  }
}
