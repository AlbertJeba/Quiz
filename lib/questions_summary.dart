import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    BoxDecoration getDecoration(Map<String, Object> data) {
      bool isAnswerCorrect = data['user_answer'] == data['correct_answer'];

      return BoxDecoration(
        shape: BoxShape.circle,
        color: isAnswerCorrect ? Colors.green : Colors.red,
      );
    }

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: getDecoration(data),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,
                            style: GoogleFonts.outfit(
                                fontSize: 18, color: Colors.white)),
                        const SizedBox(height: 2),
                        Text(data['correct_answer'] as String,
                            style: GoogleFonts.notoSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)),
                        Text(data['user_answer'] as String,
                            style: GoogleFonts.notoSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.green)),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
