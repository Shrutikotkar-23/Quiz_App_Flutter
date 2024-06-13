import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:advv_basics/Results_updates/quetions_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['User - answer'] == itemData['Correct - Answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['Question - index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['Question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(itemData['User - answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 10, 3, 119),
                      fontSize: 14,
                    )),
                Text(itemData['Correct - Answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 82, 2, 58),
                      fontSize: 14,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
