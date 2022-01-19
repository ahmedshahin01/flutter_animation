// ignore_for_file: file_names, use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors, unused_field

import 'package:animation_flutter/Drower1.dart';
import 'package:flutter/material.dart';

class MyCoustomAnim extends StatefulWidget {
  //Animation Controller
  @override
  _MyCoustomAnimState createState() => _MyCoustomAnimState();
}

class _MyCoustomAnimState extends State<MyCoustomAnim>
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
    )..repeat();
    _animation = Tween<Size>(begin: Size(100, 150), end: Size(250, 350))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
   // _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrower(),
      appBar: AppBarFun(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          AnimatedBuilder(
            builder: (ctx, child) => FlutterLogo(
              size: _animation.value.height,
            ),
            animation: _controller,

          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward),
            title: Text("forword"),
            tileColor: Colors.green,
            onTap: () => _controller.forward(),
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text("Back"),
            tileColor: Colors.redAccent,
            onTap: () => _controller.reverse(),
          ),
        ],
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
      title: const Text("Flutter Demo"),
    );
  }
}
