import 'dart:ui';

class ColorClass {
  Color color1;
  Color color2;
  Color color3;
  Color color4;
  String answer;
  ColorClass({this.color1, this.color2, this.color3, this.color4, this.answer});
}

List<ColorClass> colors = [
  new ColorClass(
    color1: Color(0xFF4285f4),
    color2: Color(0xFF34a853),
    color3: Color(0xFFfbbc05),
    color4: Color(0xFFea4335),
    answer: 'google',
  ),
  new ColorClass(
    color1: Color(0xFFf65314),
    color2: Color(0xFF7cbb00),
    color3: Color(0xFF00a1f1),
    color4: Color(0xFFffbb00),
    answer: 'microsoft',
  ),
  new ColorClass(
    color1: Color(0xFF6ecadc),
    color2: Color(0xFFe9a820),
    color3: Color(0xFFe01563),
    color4: Color(0xFF3eb991),
    answer: 'slack',
  ),
  new ColorClass(
    color1: Color(0xFF000000),
    color2: Color(0xFF636466),
    color3: Color(0xFF939598),
    color4: Color(0xFFc7c8ca),
    answer: 'wikipedia',
  ),
];
