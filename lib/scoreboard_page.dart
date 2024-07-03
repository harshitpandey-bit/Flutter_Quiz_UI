
import 'package:flutter/material.dart';

class ScoreboardPage extends StatelessWidget {
  const ScoreboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoreboard"),
      ),
      body:Center(child:Text("ScoreBoard"))
        ,floatingActionButton: ElevatedButton(onPressed: (){
          Navigator.pop(context);
    },child:
    Text("back")
    ),
    );
  }
}
