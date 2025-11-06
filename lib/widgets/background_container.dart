import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  const BackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg2.jpeg"),
          fit: BoxFit.cover,
        ),
      ),

      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: child,
      ),
    );
  }
}
