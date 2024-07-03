import 'package:flutter/material.dart';
import 'package:quiz_app/random_number_generator.dart';
import 'package:quiz_app/random_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int num1;
  late int num2;
  late int sum;
  List<int> randomOptions = [];
  List<bool?> isColor = [null, null, null, null];
  RandomNumberGenerator randomNumberGenerator = RandomNumberGenerator();
  bool isButtonEnabled = true;
  int correctAnswers =0;
  int totalPoints = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _generateOptions();
  }

  void _generateOptions() {
    num1 = randomNumberGenerator.num1;
    num2 = randomNumberGenerator.num2;
    isColor = [null, null, null, null];
    sum = num1 + num2;
    randomOptions = RandomOptions(num1, num2).randomList();
    isButtonEnabled = true;
  }

  void _generateQuestion() {
    setState(() {
      randomNumberGenerator = RandomNumberGenerator();
      _generateOptions();
      print(isColor);
    });
  }

  bool validateSum(int option) {
    if(sum == option){
      correctAnswers++;
      totalPoints=correctAnswers;
      return true;
    }
    return false;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Correct Answers:$correctAnswers",style: TextStyle(color:Colors.blue),),
                  Text("Total points $totalPoints",style: TextStyle(color:Colors.blue))
                ],
              ),
            ),
            Container(
              color: Colors.black12,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: MediaQuery.of(context).size.height * 0.17,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  alignment: Alignment.center,
                  child: Text("The Sum of $num1 and $num2 is _ ?",
                      style: const TextStyle(color: Colors.white))),
            ),

              Expanded(
                child: ListView.builder(
                    itemCount: randomOptions.length,
                    itemBuilder: (context, index) {
                      int option = randomOptions[index];
                      return Container(
                        height: MediaQuery.of(context).size.height*0.09,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: ElevatedButton(

                            style: ButtonStyle(
                                shape:WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)
                                    )
                                ),
                                backgroundColor: validateColor(isColor[index])),
                            onPressed:isButtonEnabled?() {
                              setState(() {

                                isColor[index] = validateSum(option) ? true : false;
                                isButtonEnabled = false;
                              });
                            }:null,
                            child: Text("$option",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                      );
                    }),
              ),

          ],
        ),
      ),
      floatingActionButton: !isButtonEnabled? ElevatedButton(
        child:Icon(Icons.navigate_next_rounded),
        onPressed: () {
          _generateQuestion();
        },
      ):null,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  WidgetStateProperty<Color?>? validateColor(bool? color) {
    if (color != null) {
      if (color) {
        return WidgetStateProperty.all(Colors.green);
      }
      return WidgetStateProperty.all(Colors.red);
    }
    return WidgetStateProperty.all(Colors.white);
  }
}
