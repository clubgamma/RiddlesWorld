import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarButton extends StatelessWidget {
  final String tooltip;
  final double verticalOffset;
  final Color tooltipColor;
  final Color tooltipBackgroundColor;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final Function() onPressed;

  AppbarButton({
     super.key,
    required this.tooltip,
    required this.icon,
    required this.onPressed,
    verticalOffset,
    tooltipColor,
    tooltipBackgroundColor,
    iconColor,
    iconSize,
  })  : this.verticalOffset = verticalOffset ?? 23.0,
        this.tooltipColor = tooltipColor ?? Color.fromRGBO(213, 213, 213, 1),
        this.tooltipBackgroundColor =
            tooltipBackgroundColor ?? Color.fromRGBO(47, 47, 47, 1),
        this.iconColor = iconColor ?? Color.fromRGBO(47, 47, 47, 1),
        this.iconSize = iconSize ?? 37;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: this.tooltip,
      textStyle: GoogleFonts.ubuntu(fontSize: 17, color: this.tooltipColor),
      decoration: BoxDecoration(
          color: this.tooltipBackgroundColor,
          borderRadius: BorderRadius.circular(3)),
      showDuration: Duration(milliseconds: 710),
      // preferBelow: true,
      verticalOffset: verticalOffset,
      child: Container(
        padding: EdgeInsets.all(3),
        child: ButtonTheme(
          minWidth: 31,
          padding: EdgeInsets.all(7),
          child: TextButton(
            child: Icon(
              this.icon,
              size: this.iconSize,
              color: this.iconColor,
            ),
            onPressed: this.onPressed,
          ),
        ),
      ),
    );
  }
}
