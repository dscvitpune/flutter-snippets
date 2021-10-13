import 'package:auth_dark/constants.dart';
import 'package:flutter/material.dart';

class SignInCard extends StatelessWidget {
  const SignInCard(this.name, this.cardColor, this.icon, this.func);
  final String name;
  final IconData icon;
  final Color cardColor;
  final double radius = 5;
  final Function() func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        color: cardColor,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              name,
              style: signInCardTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
