import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({
    super.key,
    required this.title,
    required this.section,
  });
  final String title;
  final String section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: const Color(0xff4D4C4C),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffD0F8FF),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            child: Row(
              children: [
                Text(
                  section,
                  style: GoogleFonts.poppins(
                    color: const Color(0xff40404C),
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xffF2555B),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
