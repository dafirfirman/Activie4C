import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'Apa yang dimaksud dengan Kebugaran Jasmani?',
      'options': [
        {'text': 'Kemampuan tubuh melakukan aktivitas fisik', 'score': 1},
        {'text': 'Berat badan ideal', 'score': 0},
        {'text': 'Tinggi badan sesuai usia', 'score': 0},
        {'text': 'Kecepatan lari', 'score': 0},
      ],
    },
    {
      'question': 'Unsur berikut ini termasuk dalam Kebugaran Jasmani:',
      'options': [
        {'text': 'Kecepatan', 'score': 1},
        {'text': 'Inteligensi', 'score': 0},
        {'text': 'IQ tinggi', 'score': 0},
        {'text': 'Bakat seni', 'score': 0},
      ],
    },
    {
      'question': 'Salah satu cara meningkatkan Kebugaran Jasmani adalah:',
      'options': [
        {'text': 'Olahraga teratur', 'score': 1},
        {'text': 'Makan makanan cepat saji', 'score': 0},
        {'text': 'Tidur sepanjang hari', 'score': 0},
        {'text': 'Menghindari olahraga', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _currentQuestionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Kuis Kebugaran Jasmani',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _currentQuestionIndex < _questions.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pertanyaan ${_currentQuestionIndex + 1} dari ${_questions.length}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _questions[_currentQuestionIndex]['question'] as String,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  ...(_questions[_currentQuestionIndex]['options']
                          as List<Map<String, Object>>)
                      .map((option) {
                    return GestureDetector(
                      onTap: () => _answerQuestion(option['score'] as int),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade100,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          option['text'] as String,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Skor Anda: $_score',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _resetQuiz,
                      child: Text('Ulangi Kuis'),
                      style: ElevatedButton.styleFrom(
                        iconColor: Colors.yellow,
                        shadowColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
