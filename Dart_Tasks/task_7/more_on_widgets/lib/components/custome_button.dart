import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.bgColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(color: iconColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
