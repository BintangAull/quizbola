import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,

        // efek animasi scale & shadow
        transform: Matrix4.identity()
          ..scale(isPressed ? 0.96 : 1.0),

        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,

        decoration: BoxDecoration(
          color: widget.color.withOpacity(0.09),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: widget.color, width: 2),

          // glow shadow saat ditekan
          boxShadow: isPressed
              ? [
            BoxShadow(
              color: widget.color.withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 1,
              offset: const Offset(0, 8),
            )
          ]
              : [
            BoxShadow(
              color: widget.color.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
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
    );
  }
}
