// ignore_for_file: use_key_in_widget_constructors, file_names, non_constant_identifier_names, dead_code, prefer_const_constructors

import 'package:flutter/material.dart';

import 'Drower1.dart';

class MyFadlenImage extends StatefulWidget {
  @override
  _MyFadlenImageState createState() => _MyFadlenImageState();
}

class _MyFadlenImageState extends State<MyFadlenImage> {
  bool swichVal = true;
  ThemeMode tm = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: tm,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBarFun(),
        drawer: Mydrower(),
        body: Center(
          child: SizedBox(
            height: 500,
            width: 500,
            child: FadeInImage(
              placeholder:AssetImage('images/s1.jpg') ,
              image: NetworkImage(
                  "https://media.istockphoto.com/photos/mercedes-benz-g-wagon-picture-id458937159"),
            ),
          ),
        ),
      ),
    );
  }

//
//
//
  AppBar AppBarFun() {
    return AppBar(
      actions: [
        Switch(
            value: swichVal,
            onChanged: (val) {
              setState(() {
                swichVal = val;
                tm = swichVal == true ? ThemeMode.light : ThemeMode.dark;
              });
            })
      ],
      title: const Text("FadlenImage"),
    );
  }
}
