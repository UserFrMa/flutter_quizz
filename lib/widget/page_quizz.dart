import 'package:flutter/material.dart';
import 'custom_text.dart';
import '../models/question.dart';

class PageQuizz extends StatefulWidget {
  @override
  State<PageQuizz> createState() => _PageQuizz();
}

class _PageQuizz extends State<PageQuizz> {
  late Question question;

  List<Question> ListQuestions = [
    Question(
        'Kurita Ryôkan apparaît dans l\'animé intitulé \'Captaine Tsubasa\'. ',
        false,
        '123',
        '1_13DIU.jpg'),
    Question('Mayu est un personnage issu de l\'animé \'Mirai Nikki\'. ', false,
        '123', '2_432W8.jpg'),
    Question(
        'On voit Lucy Heartfilia dans l\'animé célèbre intitulé \'Fairy Tail\'. ',
        true,
        '123',
        '3_45hMW.jpg'),
    Question(
        'Kurosaki Ichigo est le personnage principal dans l\'animé \'Sword Art Online\'. ',
        false,
        '123',
        '4_C7gES.jpg'),
    Question('Cette fille nommée Amane Misa est dans l\'animé \'Death Note\'. ',
        true, '123', '5_KVJL5.jpg'),
    Question('Ce personnage appelé Sanji est dans l\'animé \'One Piece\'. ',
        true, '123', '6_wENij.jpg'),
    Question('Onizuka Eikichi apparaît dans l\'animé \'Bleach\'. ', false,
        '123', '7_w80p4.jpg'),
    Question(
        'Tendô Akane est un personnage qui vient de l\'animé \'Ranma 1/2\'. ',
        true,
        '123',
        '8_z0XF7.jpg'),
    Question(
        'Hoshigaki Kisame apparaît dans les animés suivants : \'Naruto\' et \'Naruto Shippuden\'. ',
        true,
        '123',
        '9_ay788.jpg'),
    Question(
        'Narusegawa Naru est l\'un des personnages de l\'animé \'To Love Ru\'. ',
        false,
        '123',
        '10_Gqy9f.jpg'),
  ];

  int index = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    question = ListQuestions[index];
  }

  @override
  Widget build(BuildContext context) {
    double taille = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: CustomText('Le Quizz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomText(
              "Question numéro ${index + 1}",
              color: Colors.black,
            ),
            CustomText(
              "Score: $score / $index",
              color: Colors.black87,
            ),
            Card(
              elevation: 10.0,
              child: Container(
                height: taille,
                width: taille,
                child: Image.asset(
                  'quizz/dossier_quizz/${question.imagePath}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CustomText(
              question.question,
              color: Colors.black,
              factor: 1.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonBool(true),
                buttonBool(false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buttonBool(bool b) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade700),
        elevation: MaterialStateProperty.all(15.0),
      ),
      onPressed: (() => dialogue(b)),
      child: CustomText(
        (b) ? "Vrai" : "Faux",
        factor: 1.45,
        color: Colors.black,
      ),
    );
  }

  Future<Null> dialogue(bool b) async {
    bool bonneReponse = (b == question.reponse);
    String vrai = "quizz/android_02.jpg";
    String faux = "quizz/faux.jpg";
    if (bonneReponse) {
      score++;
    }
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: CustomText(
              (bonneReponse) ? "Bien trouvé!" : "Oups! raté inculte ...",
              factor: 1.45,
              color: (bonneReponse)
                  ? Colors.greenAccent.shade700
                  : Colors.redAccent.shade700,
            ),
            contentPadding: EdgeInsets.all(20.0),
            children: <Widget>[
              Image.asset(
                (bonneReponse) ? vrai : faux,
                fit: BoxFit.fitHeight,
              ),
              Container(
                height: 25.0,
              ),
              CustomText(
                "Au suivant",
                factor: 1.3,
                color: Colors.grey.shade900,
              ),
              Container(
                height: 25.0,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue.shade700),
                  elevation: MaterialStateProperty.all(15.0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  questionSuivante();
                },
                child: CustomText(
                  "Suivant",
                  factor: 1.45,
                  color: Colors.black,
                ),
              ),
            ],
          );
        });
  }

  Future<Null> alerte() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: CustomText(
              'C\'est fini',
              color: Colors.blueAccent.shade700,
              factor: 1.45,
            ),
            contentPadding: EdgeInsets.all(12.0),
            content: CustomText(
              "Votre score: $score / $index",
              color: Colors.grey.shade900,
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: (() {
                    Navigator.pop(buildContext);
                    Navigator.pop(context);
                  }),
                  child: CustomText("Ok", factor: 1.25, color: Colors.black))
            ],
          );
        });
  }

  void questionSuivante() {
    if (index < ListQuestions.length - 1) {
      index++;
      setState(() {
        question = ListQuestions[index];
      });
    } else {
      alerte();
    }
  }
}
