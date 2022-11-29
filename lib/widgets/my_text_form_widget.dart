import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(color: Color(0xFF565656)),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFD0D0D0)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFD0D0D0)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: Icon(iconData),
                  constraints: const BoxConstraints(maxHeight: 28),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 13),
      ],
    );
  }
}
