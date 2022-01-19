
 // ignore_for_file: non_constant_identifier_names
 
import 'package:animation_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:like_button/like_button.dart';

import 'Drower1.dart';

class MyPageTransition extends StatefulWidget {
  const MyPageTransition({Key? key}) : super(key: key);

  @override
  _MyPageTransitionState createState() => _MyPageTransitionState();
}

class _MyPageTransitionState extends State<MyPageTransition> {
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
        drawer: Mydrower(),
        appBar: AppBarFun(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LikeButton(
                size: 60,
                likeCount: 500,
                onTap: OnLikebuttonTab,
                bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.green,
                    dotSecondaryColor: Colors.greenAccent),
                    circleColor: const CircleColor(
                      start: Colors.lightBlue,end: Colors.lightBlueAccent),
                      likeBuilder: (bool isLiked){
                        return const Icon(Icons.home,size: 60,color: Colors.pink,) ;
                      },
              ),
              ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rotate,
                          alignment: Alignment.topLeft,
                          duration: const Duration(seconds: 2),
                          child: MyHomePage(),
                        ),
                      ),
                  icon: const Icon(Icons.arrow_forward_ios),
                  label: const Text("Go To Another page")),
            ],
          ),
        ),
      ),
    );
  }

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

  Future<bool> OnLikebuttonTab(bool isLiked) async => !isLiked;
}
