import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.1,
            child: Image.asset(
              'assets/quiz-logo.png',
              width: 300,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.figtree(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
              /*style: TextStyle(fontSize: 20, color: Colors.white)*/
            ),
          )
        ],
      ),
    );
  }
}
