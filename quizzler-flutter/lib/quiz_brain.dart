import 'question.dart';

class QuizBrain {
  int _questionNo = 0;

  List<Question> _questionBank = [
    Question('Messi was born in Spain.', false),
    Question('The ratio of our national flag is 10:6.', true),
    Question('The sun rises in the east.', false)
  ];

  bool nextQuestion() {
    if (_questionNo < _questionBank.length - 1) {
      _questionNo++;
      return true;
    }
    return false;
  }

  void startFromFirst() {
    _questionNo = 0;
  }

  String getQuestionText() {
    return _questionBank[_questionNo].questionText;
  }

  bool getCorrectAns() {
    return _questionBank[_questionNo].questionAns;
  }
}