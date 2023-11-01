// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideTransitionWidget extends PageRouteBuilder {
  final page;
  SideTransitionWidget({this.page})
      : super(
          pageBuilder: (context, animation, animationtwo) => page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            var begin =
                const Offset(1, 0); // التغير هنا بيغير في زاويه الترازيشن
            var end = const Offset(0.0, 0);
            var tween = Tween(begin: begin, end: end);
            // var offsetAnimation = animation.drive(tween);
            var curve = CurvedAnimation(
              parent: animation,
              curve: Curves.slowMiddle,
            );
            return SlideTransition(
              position: tween.animate(curve),
              child: child,
            );
          },
        );
}

class ScaleTransitionWidet extends PageRouteBuilder {
  final page;
  ScaleTransitionWidet({this.page})
      : super(
          pageBuilder: (context, animation, animationtwo) => page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            var begin = 0.0; // غير هنا
            var end = 1.0;
            var tween = Tween(begin: begin, end: end);
            var curve = CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            );
            return ScaleTransition(
              scale: tween.animate(curve),
              child: child,
            );
          },
        );
}

class RotationTransitionWidet extends PageRouteBuilder {
  final page;
  RotationTransitionWidet({this.page})
      : super(
          pageBuilder: (context, animation, animationtwo) => page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            var begin = 0.0;
            var end = 1.0;
            var tween = Tween(begin: begin, end: end);
            var curve = CurvedAnimation(
              parent: animation,
              curve: Curves.ease,
            );
            return RotationTransition(
              turns: tween.animate(curve),
              child: child,
            );
          },
        );
}

class SizeTransitionWidet extends PageRouteBuilder {
  final page;
  SizeTransitionWidet({this.page})
      : super(
          pageBuilder: (context, animation, animationtwo) => page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            );
          },
        );
}

class FadeTransitionWidet extends PageRouteBuilder {
  final page;
  FadeTransitionWidet({this.page})
      : super(
          pageBuilder: (context, animation, animationtwo) => page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            return FadeTransition(
              opacity: animation,
              alwaysIncludeSemantics: true,
              child: child,
            );
          },
        );
} 

class TwoTransitionWidet extends PageRouteBuilder {
  final page;
  TwoTransitionWidet({this.page})
      : super(
          pageBuilder: (context, animation, animationtwo) => page,
          transitionsBuilder: (context, animation, animationtwo, child) {
            var begin = 0.0;
            var end = 1.0;
            var tween = Tween(begin: begin, end: end);
            var curve = CurvedAnimation(
              parent: animation,
              curve: Curves.ease,
            );
            return ScaleTransition(
              scale: tween.animate(curve),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );
}
