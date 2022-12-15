import 'package:flutter/material.dart';

class RoutePage extends PageRouteBuilder {
  final page;

  RoutePage({this.page})
      : super(
            pageBuilder: (context, animation, animationtwo) => page,
            transitionsBuilder: (context, animation, animationtwo, child) {
              double begin = 0.0;
              double end = 1.0;
              var tween = Tween(begin: begin, end: end);
              CurvedAnimation curve = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInBack,
              );

              return ScaleTransition(
                scale: tween.animate(curve),
                child: child,
              );
            });
}
