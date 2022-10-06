class Questions {
  String questionText = '';
  String questionImage = '';
  bool questionAnswer = true;

  Questions({String q = '', String i = '', bool a = true}) {
    questionText = q;
    questionImage = i;
    questionAnswer = a;
  }
}
