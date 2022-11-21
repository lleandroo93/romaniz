import 'package:flutter/material.dart';

class MyTextFormWidget extends StatelessWidget {
  final IconData iconData;
  final String label;
  final TextEditingController? controller;
  const MyTextFormWidget({
    super.key,
    required this.iconData,
    required this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              label: Text(label),
              icon: Icon(iconData),
            ),
          ),
        ),
      ],
    );
  }
}
