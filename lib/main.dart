import 'package:flutter/material.dart';
import 'package:saas/equal.dart';
import 'package:saas/numbericon.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}
var input = "";
var output = "";

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          actions: const [
            Icon(Icons.search, color: Colors.black,),
            SizedBox(width: 15,),
            Icon(Icons.person, color: Colors.black,),
            SizedBox(width: 15,),
          ],
          title:  const Text("Calculator", style: TextStyle(
            color: Colors.black,
          ),),
          leading: IconButton(onPressed: () {  }, icon: const Icon(Icons.menu, color: Colors.black54,),
          ),
        ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250,
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  Container(
                    height: 50,
                    width: 300,
                    child: Text(input,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: 300,
                    child: Text(output,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                ],
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        NumberIcon(color: Colors.orange, text: "AC", onPress: (){
                          input = "";
                          output = "";
                          setState(() {});
                        },
                        ),
                        NumberIcon(color: Colors.orange, text: "÷", onPress: () {
                          input += "÷";
                          setState(() {});
                        },),
                        NumberIcon(color: Colors.orange, text: "x", onPress: () {
                          input += "*";
                          setState(() {});
                        },),
                        NumberIcon(color: Colors.orange, text: "DC", onPress: () {
                          if (input.isNotEmpty) {
                            input = input.substring(0, input.length - 1);
                          }
                          setState(() {});
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        NumberIcon(color: Colors.grey, text: "7", onPress: () {
                          input += "7";
                          setState(() {});
                        },),
                        NumberIcon(color: Colors.grey, text: "8", onPress: () {
                          input += "8";
                          setState(() {});
                        },),
                        NumberIcon(color: Colors.grey, text: "9", onPress: () {
                          input += "9";
                          setState(() {});
                        },),
                        NumberIcon(color: Colors.orange, text: "-", onPress: () {
                          input += "-";
                          setState(() {});
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        NumberIcon(color: Colors.grey, text: "4", onPress: () {
                          input += "4";
                          setState(() {});
                        },),
                        NumberIcon(color: Colors.grey, text: "5", onPress: () {
                          input += "5";
                          setState(() {});
                        },),
                        NumberIcon(color: Colors.grey, text: "6", onPress: () {
                          input += "6";
                          setState(() {});
                        },),
                        NumberIcon(color: Colors.orange, text: "+", onPress: () {
                          input += "+";
                          setState(() {});
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        NumberIcon(color: Colors.grey, text: "1", onPress: () {
                          input += "1";
                          setState(() {});
                        },),
                        NumberIcon(color: Colors.grey, text: "2", onPress: () {
                          input += "2";
                          setState(() {});
                        },),
                        NumberIcon(color: Colors.grey, text: "3", onPress: () {
                          input += "3";
                          setState(() {});
                        },),
                        NumberIcon(color: Colors.orange, text: ".", onPress: () {
                          input += ".";
                          setState(() {});
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        NumberIcon(color: Colors.grey, text: "%", onPress: () {
                          input += "%";
                          setState(() {});
                        },),
                        NumberIcon(color: Colors.grey, text: "0", onPress: () {
                          input += "0";
                          setState(() {});
                        },),
                        EqualButton(text: "=", onPress: () {
                          calculate();
                          setState(() {

                          });
                        },)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  void calculate() {
    Parser p = Parser();
    Expression e = p.parse(input);
    double oval = e.evaluate(EvaluationType.REAL, ContextModel());
    output = oval.toString();
  }
}

