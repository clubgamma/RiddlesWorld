import 'package:flutter/material.dart';

class RGB extends StatelessWidget {

  final int randomR;
  final int randomG;
  final int randomB;

  RGB(this.randomR, this.randomG, this.randomB);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'RGB($randomR, $randomG, $randomB)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}