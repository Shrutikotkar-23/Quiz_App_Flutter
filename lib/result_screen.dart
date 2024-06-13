import 'package:advv_basics/Results_updates/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:advv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'Question - index': i,
        'Question': questions[i].text,
        'Correct - Answer': questions[i].answers[0],
        'User - answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data) {
        return data['User - answer'] == data['Correct - Answer'];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions questions out of $numTotalQuestions correctly !',
              style: GoogleFonts.b612(
                color: const Color.fromARGB(255, 1, 37, 62),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
                onPressed: onRestart ,
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 1, 37, 62),
                  foregroundColor: Colors.white,
                ),

                icon : const Icon(Icons.refresh),
                label: const Text('Restart Quiz !'),
            )
          ],
        ),
      ),
    );
  }
}
