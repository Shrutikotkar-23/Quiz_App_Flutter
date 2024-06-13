import 'package:advv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:advv_basics/start_screen.dart';
import 'package:advv_basics/question_screen.dart';
import 'package:advv_basics/result_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen ;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // void switchScreen(){
  //   setState(() {
  //     activeScreen = const QuestionScreen();

  //   });

  // }

  //alternative to this initstate is to use conditional = Ternary Expressions & Comparison Operators
  var activeScreen = 'start - screen';
  List<String> selectAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question- screen';
    });
  }

  void chooseAnswer(String answer){
    selectAnswers.add(answer);
    
      if(selectAnswers.length==questions.length){
        setState(() {
          activeScreen = 'result - screen';
        });
      }
  }

  void restartQuiz(){
    setState(() {
      selectAnswers = [];
      activeScreen =  'question- screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenwidget = StartScreen(switchScreen);

    if (activeScreen == 'question- screen') {
      screenwidget = QuestionScreen(onSelectanswer: chooseAnswer,);
    }

    if(activeScreen == 'result - screen'){
      screenwidget = ResultScreen(chosenAnswers: selectAnswers, onRestart: restartQuiz,);
    }


    
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 138, 193, 232),
                Color.fromRGBO(53, 145, 201, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //child: activeScreen,
          // child: activeScreen=='start-screen'
          //           ? StartScreen(switchScreen)
          //           : const QuestionScreen(),
          child: screenwidget,
        ),
      ),
    );
  }
}
