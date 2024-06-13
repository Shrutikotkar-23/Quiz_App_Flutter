import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/images/quiz-logo.png',
            width: 300,
            color: Colors.black,
          ),
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset('assets/images/images/quiz-logo.png', width: 300)),

          const SizedBox(height: 70),

          Text('Learn flutter the fun way !',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontStyle: FontStyle.italic,
              )),

          const SizedBox(height: 50),

          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
            ),
            label: const Text(' Start Quiz '),
            icon: const Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
    );
  }
}
