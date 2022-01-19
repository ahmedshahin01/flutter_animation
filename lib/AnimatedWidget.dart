// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, use_key_in_widget_constructors, unused_field, file_names

import 'package:animation_flutter/Drower1.dart';
import 'package:flutter/material.dart';

class MyAnimatedWidget extends StatefulWidget {
  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  bool swichVal = true;
  ThemeMode tm = ThemeMode.light;

  late AnimationController _controller;
  late Animation<Size> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: .5,
      upperBound: 3,
    )..repeat();
    _animation = Tween<Size>(
      begin: Size(100, 150),
      end: Size(250, 350),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    // _controller.addListener(() => setState(() {}));
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
        appBar: AppBarFun(),
        drawer: Mydrower(),
        body: Center(
          child: Transform.scale(
              scale: 3, child: OutlienedButtonTaransation(width: _controller)),
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
      title: const Text("AnimatedWidget"),
    );
  }
}

//
//
//
class OutlienedButtonTaransation extends AnimatedWidget {
  const OutlienedButtonTaransation({width}) : super(listenable: width);

  get width => listenable;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text("Click her!"),
      style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(width: width.value * 3))),
    );
  }
}
