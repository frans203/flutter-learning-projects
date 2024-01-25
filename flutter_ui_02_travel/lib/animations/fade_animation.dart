import 'package:flutter/material.dart';
import "package:simple_animations/simple_animations.dart";

class FadeAnimation extends StatelessWidget {
  final int delay;
  final Widget child;

  const FadeAnimation({required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    final movieTween = MovieTween();
    movieTween.scene(
        duration: const Duration(milliseconds: 700), curve: Curves.easeOut)
      ..tween(
        'opacity',
        Tween(begin: 0.0, end: 1.0),
      )
      ..tween('translateY', Tween(begin: 120.0, end: 0.0));
    return PlayAnimationBuilder<Movie>(
      tween: movieTween,
      duration: movieTween.duration,
      delay: Duration(milliseconds: delay),
      builder: (context, value, _) {
        return Container(
          child: Transform.translate(
            offset: Offset(
              0,
              value.get("translateY"),
            ),
            child: Opacity(
              opacity: value.get('opacity'),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
