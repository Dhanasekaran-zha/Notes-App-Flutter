import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_notes_app/src/res/strings.dart';
import 'package:lottie/lottie.dart';
import '../res/assets.dart';

class NoFilesFound extends StatelessWidget {
  const NoFilesFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AnimationAssets.emptyAnimation),
        Text(
          AppStrings.EMPTY_STRING,
          style: GoogleFonts.poppins(fontSize: 16),
        )
      ],
    );
  }
}
