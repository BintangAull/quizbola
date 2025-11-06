import 'package:flutter/material.dart';

class BackButtonSection extends StatelessWidget {
  const BackButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: const Text("Kembali ke Home"),
      ),
    );
  }
}
