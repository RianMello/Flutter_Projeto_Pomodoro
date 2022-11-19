import 'package:flutter/material.dart';

class StopwatchButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? action;

  const StopwatchButton({
    required this.text,
    required this.icon,
    this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        textStyle: const TextStyle(
          fontSize: 18,
        ),
      ),
      onPressed: action,
      child: Row(
        children: [
          Icon(
            icon,
            size: 26,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(text),
        ],
      ),
    );
  }
}
