import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 20,
      color: Colors.grey.shade300,
      thickness: 0.9,
    );
  }
}
