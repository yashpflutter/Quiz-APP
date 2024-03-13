import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() => _QuizApp();
}

class _QuizApp extends State<QuizApp> {
  final List<String> explanation = [
    "Explanation:Bill Gates, alongside his childhood friend Paul Allen, co-founded Microsoft Corporation, one of the most influential technology companies in the world. Microsoft was established in 1975",
    "Explanation:Steve Jobs, renowned as a visionary and innovator in the world of technology, co-founded Apple Inc., one of the most iconic companies in the history of computing and consumer electronics,In 1976",
    "Explanation:Jeff Bezos, an American entrepreneur and technology visionary, founded Amazon.com, Inc., in 1994. Starting as an online bookstore, Bezos saw the potential for the internet to revolutionize commerce and set out to build a platform that could offer a vast selection of products with unparalleled convenience. Under Bezos' leadership, Amazon quickly expanded its offerings beyond books to include a wide range of products, from electronics to household goods, becoming the world's largest online retailer.",
    "Explanation:Elon Musk, often described as a modern-day renaissance man, is a South African-born entrepreneur.Musk founded SpaceX in 2002 with the goal of reducing space transportation costs and enabling the colonization of Mars",
    "Explanation:Larry Page, an American computer scientist and entrepreneur, is best known as the co-founder of Google, one of the world's most prominent technology companies. In 1998, Page and his colleague Sergey Brin, while they were both PhD students at Stanford University, founded Google",
  ];
  String now = "Explantion";
  String onpressans() {
    return now;
  }

  List<Map> allQuestions = [
    {
      "Question": "Who is the Founder of Microsoft?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      "answerno": 2,
    },
    {
      "Question": "Who is the Founder of Apple?",
      "options": [
        "Steve Jobs",
        "Jeff Bezos",
        "Elon Musk",
        "Bill Gates",
      ],
      "answerno": 0,
    },
    {
      "Question": "Who is the Founder of Amazon?",
      "options": ["Jeff Bezos", "Bill Gates", "Elon Musk", "Steve Jobs"],
      "answerno": 0,
    },
    {
      "Question": "Who is the Founder of SpaceX?",
      "options": ["Steve Jobs", "Bill Gates", "Elon Musk", "Jeff Bezos"],
      "answerno": 2,
    },
    {
      "Question": "Who is the Founder of Google?",
      "options": ["Steve Jobs", "Larry Page", "Bill Gates", "Elon Musk"],
      "answerno": 1,
    },
  ];

  bool isQuestionScreenb = true;
  int questionIndex = 0;
  int noOfCorrectIndex = 0;
  int selectedAnswerIndex = -1;
  int ifstart = 0;

  Color checkAnswer(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex]["answerno"]) {
        return Colors.green;
      } else if (buttonIndex == selectedAnswerIndex) {
        return Colors.red;
      } else {
        return Colors.white;
      }
    } else {
      return Colors.white;
    }
  }

  void vaildateCurrentPage() {
    if (selectedAnswerIndex == -1) {
      return;
    }

    if (selectedAnswerIndex == allQuestions[questionIndex]["answerno"]) {
      noOfCorrectIndex += 1;
    }

    if (selectedAnswerIndex != -1) {
      if (questionIndex == allQuestions.length - 1) {
        setState(() {
          isQuestionScreenb = false;
        });
      }
      selectedAnswerIndex = -1;
      setState(() {
        questionIndex += 1;
      });
    }
  }

  int count = 0;
  Widget changeicon() {
    if (count > 1) {
      return const Icon(Icons.forward, color: Colors.purple);
    } else if (count == 0) {
      count++;
      return const Icon(Icons.start, color: Colors.purple);
    } else {
      return const Icon(Icons.forward, color: Colors.purple);
    }
  }

  Scaffold isQuestionScreen() {
    if (isQuestionScreenb == true) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            FloatingActionButton(
              backgroundColor: Colors.purple,
              onPressed: () {
                if (ifstart == 0) {
                  ifstart = 1;
                } else if (ifstart > 1) {
                  noOfCorrectIndex = 0;
                  selectedAnswerIndex = -1;
                  questionIndex = 0;
                  isQuestionScreenb = true;
                  ifstart = 0;
                  setState(() {});
                }
              },
              elevation: 30,
              child: const Text("Start", style: TextStyle(color: Colors.white)),
            )
          ],
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: const Text(
            "QUIZ APP",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Question:",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("${questionIndex + 1}/${allQuestions.length}",
                    style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 400,
              height: 60,
              child: Text(
                allQuestions[questionIndex]["Question"],
                style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 23,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (ifstart == 1) {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      now = explanation[questionIndex];
                      selectedAnswerIndex = 0;
                    });
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: checkAnswer(0),
                  elevation: 10),
              child: Text(
                "A. ${allQuestions[questionIndex]["options"][0]}",
                style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (ifstart == 1) {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      now = explanation[questionIndex];
                      selectedAnswerIndex = 1;
                    });
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: checkAnswer(1), elevation: 10),
              child: Text(
                "B. ${allQuestions[questionIndex]["options"][1]}",
                style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (ifstart == 1) {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      now = explanation[questionIndex];
                      selectedAnswerIndex = 2;
                    });
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: checkAnswer(2), elevation: 10),
              child: Text(
                "C. ${allQuestions[questionIndex]["options"][2]}",
                style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (ifstart == 1) {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      now = explanation[questionIndex];
                      selectedAnswerIndex = 3;
                    });
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: checkAnswer(3), elevation: 10),
              child: Text(
                "D. ${allQuestions[questionIndex]["options"][3]}",
                style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 50),
            ListView(
              children: [
                SizedBox(
                  height: 192,
                  width: 400,
                  child: SingleChildScrollView(
                    child: Text(onpressans(),
                        style: const TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            now = "Explanation";
            vaildateCurrentPage();
          },
          backgroundColor: Colors.white,
          elevation: 200,
          child: changeicon(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("QuizApp",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/download.jpg",
                width: 400,
                height: 300,
              ),
              const Text("Congratulation!!!",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "You Have Completed The Quiz",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              Text("$noOfCorrectIndex/${allQuestions.length}"),
              ElevatedButton(
                onPressed: () {
                  noOfCorrectIndex = 0;
                  selectedAnswerIndex = -1;
                  questionIndex = 0;
                  isQuestionScreenb = true;
                  count = 0;
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    elevation: 20, backgroundColor: Colors.white),
                child: const Text(
                  "Reset",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
