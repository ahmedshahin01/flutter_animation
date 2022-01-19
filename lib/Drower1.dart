// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, unnecessary_string_interpolations, non_constant_identifier_names

import 'package:animation_flutter/AnPaadin&Align.dart';
import 'package:animation_flutter/AnimatedWidget.dart';
import 'package:animation_flutter/CustomExplitedAnimation.dart';
import 'package:animation_flutter/ExplicitAnimation.dart';
import 'package:animation_flutter/HeroAnimation.dart';
import 'package:animation_flutter/PageTransition1.dart';
import 'package:animation_flutter/fadlenImage.dart';
import 'package:animation_flutter/main.dart';
import 'package:flutter/material.dart';
import 'styles.dart';

class Mydrower extends StatelessWidget {
  void selectScreen(BuildContext ctx, x) {
    x == 0
        ? Navigator.of(ctx)
            .push(MaterialPageRoute(builder: (ctx) => MyHomePage()))
        : x == 1
            ? Navigator.of(ctx)
                .push(MaterialPageRoute(builder: (ctx) => MyHomePage2()))
            : x == 2
                ? Navigator.of(ctx)
                    .push(MaterialPageRoute(builder: (ctx) => MyTranstion()))
                : x == 3
                    ? Navigator.of(ctx).push(
                        MaterialPageRoute(builder: (ctx) => MyCoustomAnim()))
                    : x == 4
                        ? Navigator.of(ctx).push(MaterialPageRoute(
                            builder: (ctx) => MyAnimatedWidget()))
                        : x == 5
                            ? Navigator.of(ctx).push(MaterialPageRoute(
                                builder: (ctx) => MyFadlenImage()))
                            : x == 6
                                ? Navigator.of(ctx).push(MaterialPageRoute(
                                    builder: (ctx) => MyHeroanimation()))
                                : Navigator.of(ctx).push(MaterialPageRoute(
                                    builder: (ctx) => MyPageTransition()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListtileFun(
            context,
            0,
            " Animated Container",
          ),
          ListtileFun(
            context,
            1,
            "panding",
          ),
          ListtileFun(
            context,
            2,
            "   MyTranstion",
          ),
          ListtileFun(
            context,
            3,
            " MyCoustomAnim",
          ),
          ListtileFun(
            context,
            4,
            "AnimatedWidget",
          ),
          ListtileFun(
            context,
            5,
            "MyFadlenImage",
          ),
          ListtileFun(
            context,
            6,
            "HeroAnimation",
          ),
          ListtileFun(
            context,
            7,
            "TransitionPage",
          ),
        ],
      ),
    );
  }

  ListTile ListtileFun(BuildContext context, int x, String txt) {
    return ListTile(
        focusColor: Colors.red,
        title: Text(
          "$txt",
          style: t1,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          selectScreen(context, x);
        });
  }
}
