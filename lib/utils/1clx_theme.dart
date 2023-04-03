import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
    primaryColor: const Color(0xff3A5DB9),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff3A5DB9)),
    textTheme: GoogleFonts.poppinsTextTheme());

const LinearGradient gradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 77, 118, 220),
    Color.fromARGB(255, 132, 164, 247),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

ButtonStyle buttonTheme({required Color color, bool isRounded = true}) =>
    ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 48),
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isRounded ? 128 : 8),
      ),
    );
