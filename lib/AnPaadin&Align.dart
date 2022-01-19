// ignore: file_names
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, file_names, duplicate_ignore

import 'dart:math';
import 'package:animation_flutter/Drower1.dart';
import 'package:animation_flutter/styles.dart';
import 'package:flutter/material.dart';

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  //ths var used fot theme
  bool swichVal = true;
  ThemeMode tm = ThemeMode.light;
  //this var used for panding
  double padVal = 0;
  //this var used for Align
  double dx = 0;
  double dy = 0;
  TextStyle tx = t1;
  //this var used for Tween
  double _angle = 0;
  double _value = 0;
  Color _color=Colors.green;
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
        drawer: Mydrower(),
        appBar: AppBarFun(),
        body: ListView(
          children: [
            Center(
              child: AnimatedPadding(
                duration: const Duration(seconds: 3),
                padding: EdgeInsets.symmetric(horizontal: padVal),
                child: Container(
                  color: Colors.red[200],
                  height: 200,
                  child: Center(
                    child: Container(
                      width: 350,
                      height: 350,
                      color: Colors.yellow,
                      child: AnimatedAlign(
                        duration: Duration(seconds: 3),
                        alignment: FractionalOffset(dx, dy),
                        child: FlutterLogo(
                          size: 100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: AnimatedDefaultTextStyle(
                duration: Duration(seconds: 3),
                style: tx,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("MyText1"),
                    Text("MyText1"),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: _angle),
                  duration: Duration(seconds: 1),
                  child: Container(
                    height: 200,
                    width: 200,
                    color:_color,
                  ),
                  builder: (_, angle, child) => Transform.rotate(
                    angle: angle,
                    child: child,
                  ),
                ),
              ],
            ),
            Slider(
              value: _value,
              onChanged: (val) => setState(() {
                 Random random = Random();
              
                _value = val;
                _angle = val;
                _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255),
                random.nextInt(255), 1);
                
              }),
              min: 0,
              max: pi * 2,
              divisions: 100,
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  padVal = padVal == 0 ? 100 : 0;
                  dx = dx == 0 ? 1 : 0;
                  dy = dy == 0 ? 1 : 0;
                });
              },
              child: const Icon(Icons.play_arrow_outlined),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  tx = tx == t1 ? t3 : t1;
                });
              },
              child: const Icon(
                Icons.play_arrow,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

//
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
                if (swichVal == true) {
                  tm = ThemeMode.light;
                } else {
                  tm = ThemeMode.dark;
                }
              });
            })
      ],
      title: const Text("Flutter Demo"),
    );
  }
}
