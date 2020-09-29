import 'package:flutter/material.dart';

class CrossFadeAnimation extends StatefulWidget {
  @override
  _CrossFadeAnimationState createState() => _CrossFadeAnimationState();
}

class _CrossFadeAnimationState extends State<CrossFadeAnimation> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  void _changeState() {
    if (_crossFadeState == CrossFadeState.showFirst) {
      _crossFadeState = CrossFadeState.showSecond;
    } else {
      _crossFadeState = CrossFadeState.showFirst;
    }

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnimatedCrossFade(
            firstChild: Container(
              decoration: BoxDecoration(
                color: Colors.green[50],
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.favpng.com/17/22/14/dart-logo-programming-language-computer-programming-png-favpng-dxsn9fxX3pi0nNgU3ehqpmPWN.jpg',
                  ),
                ),
              ),
              width: 200,
              height: 200,
            ),
            secondChild: Container(
              decoration: BoxDecoration(
                color: Colors.red[200],
                image: DecorationImage(
                  image: NetworkImage(
                      'https://img.icons8.com/ios/452/flutter.png'),
                ),
              ),
              width: 200,
              height: 200,
            ),
            crossFadeState: _crossFadeState,
            duration: Duration(
              seconds: 2,
            ),
          ),
          RaisedButton(
            onPressed: _changeState,
            child: Text('Fade'),
          ),
        ],
      ),
    );
  }
}
