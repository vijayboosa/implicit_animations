import 'dart:math';

import 'package:flutter/material.dart';

class ContainerAnimation extends StatefulWidget {
  @override
  _ContainerAnimationState createState() => _ContainerAnimationState();
}

class _ContainerAnimationState extends State<ContainerAnimation> {
  double _borderRadius = 20.0;
  double _width = 200.0;
  Color _color = Colors.lightBlue;
  final _rng = Random();

  void _changeBorder() {
    print('changeing the border');

    setState(() {
      _borderRadius = (_rng.nextInt(100) + 10).toDouble();
    });
    print(_borderRadius);
  }

  void _changeWidth() {
    setState(() {
      _width = (_rng.nextDouble() * 300 + 30).toDouble();
    });
  }

  void _changeColor() {
    setState(() {
      _color = Color.fromARGB(
        _rng.nextInt(255),
        _rng.nextInt(255),
        _rng.nextInt(255),
        _rng.nextInt(255),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          curve: Curves.bounceIn,
          duration: Duration(
            seconds: 1,
          ),
          width: _width,
          height: 200,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(_borderRadius),
            border: Border.all(width: 20.0, color: Colors.green),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 20.0,
            children: [
              _outlineButton('Animated Border', _changeBorder),
              _outlineButton('Animated width', _changeWidth),
              _outlineButton('Animated Color', _changeColor),
            ],
          ),
        )
      ],
    );
  }

  Widget _outlineButton(String buttonText, VoidCallback function) {
    return OutlineButton(
      onPressed: function,
      child: Text(buttonText),
    );
  }
}
