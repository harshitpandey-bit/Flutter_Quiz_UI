
import 'package:flutter/material.dart';

class ScoreboardPage extends StatelessWidget {
  int correctAnswers=0;
  int totalPoints=0;
   ScoreboardPage({super.key,required this.correctAnswers,required this.totalPoints});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoreboard"),
      ),
      body:Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text("Total Score: $totalPoints",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Text("Correct Answer: $correctAnswers",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

      ]

      ))
        ,floatingActionButton: ElevatedButton(onPressed: (){
          Navigator.pop(context);
    },child:
    Text("back")
    ),
    );
  }
}
