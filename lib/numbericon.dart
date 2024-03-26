import 'package:flutter/material.dart';
class NumberIcon extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPress;

  const NumberIcon({super.key, required this.color, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(text, style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
          ),
        ),
      ),
    );
  }
}
