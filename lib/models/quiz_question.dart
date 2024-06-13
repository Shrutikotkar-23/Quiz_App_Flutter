class QuizQuestion{
  QuizQuestion(this.text , this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledanswers(){
    final shuffledlist = List.of(answers);
    shuffledlist.shuffle();
    return shuffledlist;
  }
}