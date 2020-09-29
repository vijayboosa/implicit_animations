import 'dart:math';

import 'package:flutter/material.dart';

class AlignAnimation extends StatefulWidget {
  @override
  _AlignAnimationState createState() => _AlignAnimationState();
}

class _AlignAnimationState extends State<AlignAnimation> {
  final _rng = Random();

  Alignment _alignment = Alignment(
    0.0,
    0.0,
  );
  void _changeAlignment() {
    setState(() {
      _alignment = Alignment(
        _rng.nextDouble() * 2 - 1,
        _rng.nextDouble() * 2 - 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
      _rng.nextDouble() * 2 - 1,
    );
    return AnimatedAlign(
      curve: Curves.elasticIn,
      alignment: _alignment,
      duration: Duration(seconds: 1),
      child: GestureDetector(
        onTap: _changeAlignment,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
      ),
    );
  }
}
