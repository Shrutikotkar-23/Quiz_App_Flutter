import 'package:flutter/material.dart';
import 'package:advv_basics/answer_button.dart';
import 'package:advv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key , required this.onSelectanswer});

  final void Function(String answer) onSelectanswer;
  
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  

  var currentQuestionIndex = 0;

  void answerQuestion(String selectAnswers){
    widget.onSelectanswer(selectAnswers);

    setState(() {
      currentQuestionIndex++;
    });
    
  }
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
               
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                
              ),
              textAlign: TextAlign.center,
            ),
      
            const SizedBox(height: 60),
      
            ...currentQuestion.getShuffledanswers().map((answer){
              return  AnswerButton(answerText :answer, onTap: (){ answerQuestion(answer);},);
            }),
          ],
        ),
      ),
    );
  }
}
