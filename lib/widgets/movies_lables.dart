import 'package:flutter/material.dart';

class MoviesLable extends StatelessWidget {
 final String text;
   const MoviesLable({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
return Padding(
    padding: const EdgeInsets.only(left: 10, top: 15, bottom: 10),
    child: Text(
      text,
      style: TextStyle(fontSize: 25, color: Colors.red[900]),
    ));  
  }}