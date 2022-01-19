// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors, must_call_super

// ignore_for_file: file_names

import 'package:animation_flutter/styles.dart';
import 'package:flutter/material.dart';

import 'Drower1.dart';

class MyTranstion extends StatefulWidget {
  @override
  _MyTranstionState createState() => _MyTranstionState();
}

class _MyTranstionState extends State<MyTranstion>
    with SingleTickerProviderStateMixin {
  bool swichVal = true;
  ThemeMode tm = ThemeMode.light;
  //Animation Controller
  late AnimationController _controller;
  late Animation<double> _animation;
  //this used for Aigntransation
  late Animation<AlignmentGeometry> _animation2;

  //this used for slide
  late Animation<Offset> _animation3;
  //this used for decoration
  late Animation<Decoration> _animation4;
  //this used for DefaultTextStyleTransition
  late Animation<TextStyle> _animation5;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _animation2 = Tween<AlignmentGeometry>(
            begin: Alignment.bottomRight, end: Alignment.topLeft)
        .animate(_animation);
    _animation3 = Tween<Offset>(begin: Offset(0, 0), end: Offset(1, 1))
        .animate(_animation);
    _animation4 = DecorationTween(
            begin: BoxDecoration(color: Colors.blueAccent),
            end: BoxDecoration(color: Colors.redAccent))
        .animate(_animation);
    _animation5 = TextStyleTween(begin: t2, end: t1).animate(_animation);
  }

  @override
  void dispose() {
    _controller.dispose();
  }

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
              child: FadeTransition(
                opacity: _animation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlutterLogo(
                    size: 250,
                  ),
                ),
              ),
            ),
            Center(
              child: SizeTransition(
                sizeFactor: _animation,
                axis: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlutterLogo(
                    size: 250,
                  ),
                ),
              ),
            ),
            Center(
              child: ScaleTransition(
                scale: _animation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlutterLogo(
                    size: 250,
                  ),
                ),
              ),
            ),
            Center(
              child: RotationTransition(
                turns: _animation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlutterLogo(
                    size: 250,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 400,
              height: 400,
              child: Center(
                child: AlignTransition(
                  alignment: _animation2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutterLogo(
                      size: 150,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 400,
              height: 400,
              child: Center(
                child: SlideTransition(
                  position: _animation3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutterLogo(
                      size: 150,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 400,
              height: 400,
              child: Center(
                child: DecoratedBoxTransition(
                  decoration: _animation4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutterLogo(
                      size: 150,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 400,
              height: 400,
              child: Center(
                child: DefaultTextStyleTransition(
                  style: _animation5,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Text Test")),
                ),
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
