// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          title: Text('Quiz'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];

  int tResult = 0;
  int fResult = 0;

  void checkAnswer(bool pickedAnswer) {
    setState(() {
      if (appBrain.getQuestionAnswer() == pickedAnswer) {
        tResult++;
        //answerResult.add(Padding(
        //  padding: const EdgeInsets.all(5.0),
        //  child: Icon(Icons.thumb_up, color: Colors.blue),
        //));
      } else {
        fResult++;
        //answerResult.add(Padding(
        //  padding: const EdgeInsets.all(5.0),
        //  child: Icon(Icons.thumb_down, color: Colors.red),
        //));
      }

      if (appBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "!انتهى",
          desc:
              "لقد أجبت على جميع الأسئة ولديك $tResult إجابة صحيحة و $fResult إجابة خاطئة",
          buttons: [
            DialogButton(
              // ignore: sort_child_properties_last
              child: Text(
                "!البدء من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        tResult = 0;
        fResult = 0;
        appBrain.reset();
      } else {
        appBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(questionNum);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            //height: MediaQuery.of(context).size.height * 0.05,
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.blue,
                      size: 28.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '$tResult',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '$fResult',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Icon(
                      Icons.thumb_down,
                      color: Colors.red,
                      size: 28.0,
                    ),
                  ],
                ),
              ],
              //children: answerResult,
            ),
          ),
          Container(
            //height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(appBrain.getQuestionImage()),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  appBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    overflow: TextOverflow.fade,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check, size: 30.0),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    'صح',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.clear,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    'خطأ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
