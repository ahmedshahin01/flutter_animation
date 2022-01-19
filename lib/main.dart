
 // ignore_for_file: non_constant_identifier_names
 
import 'dart:math';

import 'package:animation_flutter/Drower1.dart';
import 'package:animation_flutter/styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool swichVal = true;
  ThemeMode tm = ThemeMode.light;

  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  bool visable = true;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

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

        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black12,
            ),
            Center(
              child: Text(
                "text1",
                style: t1,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 3),
              bottom: visable == true ? 300 : 600,
              left: 530,
              child: Container(
                width: 200,
                height: 100,
                decoration:
                    BoxDecoration(color: _color, borderRadius: _borderRadius),
              ),
            ),
            animatedContainer()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              Random random = Random();
              random.nextInt(300);

              //animatedContainerOnPress();
              visable = !visable;
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
              _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255),
                  random.nextInt(255), 1);
            });
          },
          child: const Icon(Icons.play_arrow_outlined),
        ), // This trailing comma makes auto-formatting nicer for build methods.
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

  void animatedContainerOnPress() {
    visable = !visable;
    Random random = Random();
    random.nextInt(300);

    _width = random.nextInt(300).toDouble();
    _height = random.nextInt(300).toDouble();
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    _color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
  }

  Center animatedContainer() {
    return Center(
        child: AnimatedOpacity(
      opacity: visable == true ? 1 : 0,
      duration: const Duration(seconds: 3),
      child: AnimatedContainer(
        curve: Curves.linear,
        duration: const Duration(seconds: 3),
        width: _width,
        height: _height,
        decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
      ),
    ));
  }
}
