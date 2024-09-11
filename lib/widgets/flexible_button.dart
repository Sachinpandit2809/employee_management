import 'package:flutter/material.dart';

class FlexiableRectangularButton extends StatelessWidget {
  final String title;
  final Color color;
  final double height, width;
  final Color? textColor;
  final VoidCallback onPress;
  final bool loading;

  const FlexiableRectangularButton(
      {super.key,
      required this.title,
      required this.width,
      required this.height,
      required this.color,
      this.loading = false,
      required this.onPress,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  )
                : Text(
                    title,
                 
                  )),
      ),
    );
  }
}