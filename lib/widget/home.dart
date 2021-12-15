import 'package:flutter/material.dart';
import 'package:flutter_quizz/widget/page_quizz.dart';
import 'custom_text.dart';
import 'page_quizz.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 10,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.7,
                  width: MediaQuery.of(context).size.height * 0.8,
                  child: Image.asset(
                    "quizz/android_01.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue.shade700),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return PageQuizz();
                    }));
                  },
                  child: CustomText(
                    "Commencer le quizz",
                    factor: 1.45,
                    color: Colors.black,
                  ))
            ]),
      ),
    );
  }
}
