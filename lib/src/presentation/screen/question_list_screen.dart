import 'package:app_widya_edu/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../data/data_source/quesion.dart';
import '../../data/models/model_quesion.dart';

class QuestionsListScreen extends StatefulWidget {
  final String exercisesIdFk;
  final String? courseName;

  QuestionsListScreen({
    Key? key,
    required this.exercisesIdFk,
    this.courseName,
  }) : super(key: key);

  @override
  _QuestionsListScreenState createState() => _QuestionsListScreenState();
}

class _QuestionsListScreenState extends State<QuestionsListScreen> {
  Future<List<Question>?>? _questionsFuture;
  List<Question>? _questions;
  int _currentQuestionIndex = 0;
  int noSoal = 0;
  @override
  void initState() {
    super.initState();
    _questionsFuture = GetQuestionHttp.connectApi(
        widget.exercisesIdFk, 'testerngbayu@gmail.com');
    _loadQuestions();
    noSoal = 0;
  }

  void _loadQuestions() async {
    final questions = await _questionsFuture;
    setState(() {
      _questions = questions;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < (_questions?.length ?? 1) - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        title: Text(widget.courseName ?? 'Latihan Soal'),
      ),
      body: FutureBuilder<List<Question>?>(
        future: _questionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No questions found'));
          } else {
            return _buildQuestionContent(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _buildQuestionContent(List<Question> questions) {
    final Size size = MediaQuery.sizeOf(context);
    Question question = questions[_currentQuestionIndex];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   width: size.width * 100,
                  //   height: 40,
                  //   child: ListView.separated(
                  //     itemCount: _questions!.length,
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     separatorBuilder: (context, index) => SizedBox(width: 5),
                  //     itemBuilder: (context, index) {
                  //       noSoal++;
                  //       return CircleAvatar(
                  //         backgroundColor: AppColors.blue,
                  //         radius: 15,
                  //         child: Text('${noSoal}'),
                  //       );
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Question ${_currentQuestionIndex + 1}:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(question.questionTitle),
                  SizedBox(height: 8.0),
                  Container(
                    width: size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('A : ${question.optionA}'),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('B : ${question.optionB}'),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('C : ${question.optionC}'),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('D : ${question.optionD}'),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('E: ${question.optionE}'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _previousQuestion,
                  child: Text('Sebelumnya'),
                ),
                ElevatedButton(
                  onPressed: _nextQuestion,
                  child: Text('Selanjutnya'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
