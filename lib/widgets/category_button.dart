import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final int delay; // ✅ delay animasi masuk

  const CategoryButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
    this.delay = 0,
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton>
    with SingleTickerProviderStateMixin {

  bool isPressed = false;
  double opacity = 0;
  double translateY = 20;

  @override
  void initState() {
    super.initState();

    // ✅ animasi masuk fade + slide
    Future.delayed(Duration(milliseconds: widget.delay), () {
      setState(() {
        opacity = 1;
        translateY = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: opacity,
      curve: Curves.easeOut,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.translationValues(0, translateY, 0),
        curve: Curves.easeOut,

        child: GestureDetector(
          onTapDown: (_) => setState(() => isPressed = true),
          onTapUp: (_) {
            setState(() => isPressed = false);
            widget.onTap();
          },
          onTapCancel: () => setState(() => isPressed = false),

          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            transform: Matrix4.identity()
              ..scale(isPressed ? 0.95 : 1.0),

            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,

            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.25),  // ✅ dark overlay effect
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: widget.color, width: 2),

              // ✅ NEON GLOW EFFECT
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(isPressed ? 0.8 : 0.5),
                  blurRadius: isPressed ? 25 : 15,
                  spreadRadius: isPressed ? 3 : 1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),

            child: Row(
              children: [
                Icon(widget.icon, size: 32, color: widget.color),
                const SizedBox(width: 20),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.color,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
