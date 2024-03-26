import 'package:flutter/material.dart';
class EqualButton extends StatelessWidget {
  final Color color =  Colors.blue;
  final String text;
  final VoidCallback onPress;

  const EqualButton({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: 75,
          width: 160,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(text, style: const TextStyle(
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
