// ignore_for_file: prefer_final_fields

import 'questions.dart';

class AppBrain {
  int _questionNum = 0; // x = [0 ~ 5]
  List<Questions> _questions = [
    Questions(
        q: 'عدد كواكب المجموعة الشمسية هو ثمانية كواكب',
        i: 'images/image-0.jpg',
        a: true),
    Questions(
        q: 'تعتبر القطط من الحيوانات اللاحمة',
        i: 'images/image-1.jpg',
        a: true),
    Questions(
      q: 'تقع الصين في قارة أوروبا',
      i: 'images/image-2.jpg',
      a: false,
    ),
    Questions(
      q: 'تعتبر الأرض مسطحة الشكل',
      i: 'images/image-3.jpg',
      a: false,
    ),
    Questions(
        q: 'الأرض هي أقرب الكواكب إلى الشمس',
        i: 'images/image-4.jpg',
        a: false),
    Questions(
      q: 'يتكاثر الدجاج بالبيوض',
      i: 'images/image-5.jpg',
      a: true,
    ),
  ];

  void nextQuestion() {
    if (_questionNum < _questions.length - 1) {
      _questionNum++;
    }
  }

  String getQuestionText() {
    return _questions[_questionNum].questionText;
  }

  String getQuestionImage() {
    return _questions[_questionNum].questionImage;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNum].questionAnswer;
  }

  bool isFinished() {
    if (_questionNum >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNum = 0;
  }
}
