import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  final Placeholder;
  final value;
  ReusableRow({required this.value, required this.Placeholder});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(Placeholder),
        Text(value),
      ],
    );
  }
}
