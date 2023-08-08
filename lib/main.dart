import 'package:math_expressions/math_expressions.dart';

import 'package:flutter/material.dart';


import 'Button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // const MyApp({super.key});
  var userinput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.black,
                body: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Align(
                                alignment: Alignment.topRight,
                                child: Text(userinput.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30))),
                            const SizedBox(height: 30,),
                            Align( alignment: Alignment.bottomRight,
                              child: Text(answer.toString(),
                                  style:
                                  const TextStyle(color: Colors.white, fontSize: 30)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: Column(
                        children: [
                          Row(children: [
                            Button(
                              title: 'AC',
                              color: const Color(0xff505050),
                              onpress: () {
                                userinput = '';
                                answer = '';
                                setState(() {});

                              },
                            ),
                            Button(
                              title: '+/-',
                              color: const Color(0xff505050),
                              onpress: () {
                                userinput += '+/-';
                                setState(() {});


                              },
                            ),
                            Button(
                              title: '%',
                              color: const Color(0xff505050),
                              onpress: () {
                                userinput += '%';
                                setState(() {});

                              },
                            ),
                            Button(
                              title: '/',
                              color: const Color(0xfffffa00a),
                              onpress: () {
                                userinput += '/';
                                setState(() {});
                              },
                            )
                          ]),
                          Row(children: [
                            Button(
                              title: '7',
                              onpress: () {
                                userinput += '7';
                                setState(() {});
                              },
                            ),
                            Button(
                              title: '8',
                              onpress: () {
                                userinput += '8';
                                setState(() {});

                              },
                            ),
                            Button(
                              title: '9',
                              onpress: () {
                                userinput += '9';
                                setState(() {});

                              },
                            ),
                            Button(
                              title: 'X',
                              color: const Color(0xfffffa00a),
                              onpress: () {
                                userinput += 'X';

                                setState(() {});
                              },
                            )
                          ]),
                          Row(children: [
                            Button(
                              title: '4',
                              onpress: () {
                                userinput += '4';
                                setState(() {});
                              },
                            ),
                            Button(
                              title: '5',
                              onpress: () {
                                userinput += '5';
                                setState(() {});

                              },
                            ),
                            Button(
                              title: '6',
                              onpress: () {
                                userinput += '6';
                                setState(() {});

                              },
                            ),
                            Button(
                              title: '-',
                              color: const Color(0xfffffa00a),
                              onpress: () {
                                userinput += '-';
                                setState(() {});
                              },
                            )
                          ]),
                          Row(children: [
                            Button(
                              title: '1',
                              onpress: () {
                                userinput += '1';
                                setState(() {});
                              },
                            ),
                            Button(
                              title: '2',
                              onpress: () {
                                userinput += '2';
                                setState(() {});
                              },
                            ),
                            Button(
                              title: '3',
                              onpress: () {
                                userinput += '3';
                                setState(() {});
                              },
                            ),
                            Button(
                              title: '+',
                              color: const Color(0xfffffa00a),
                              onpress: () {
                                userinput += '+';
                                setState(() {});
                              },
                            )
                          ]),
                          Row(children: [
                            Button(
                              title: '0',
                              onpress: () {
                                userinput += '0';
                                setState(() {});
                              },
                            ),
                            Button(
                              title: '.',
                              onpress: () {
                                userinput += '.';
                                setState(() {});
                              },
                            ),
                            Button(
                              title: 'DEL',
                              onpress: () {
                                userinput =
                                    userinput.substring(0, userinput.length - 1);
                                setState(() {});
                              },
                            ),
                            Button(
                              title: '=',
                              color: const Color(0xfffffa00a),
                              onpress: () {
                                eualPre();
                                setState(() {});
                              },
                            )
                          ]),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ));
  }

  void eualPre() {
    {
      String fuserinput = userinput;
      fuserinput = userinput.replaceAll('X', '*');

      Parser p = Parser();

      Expression expression = p.parse(fuserinput);
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      answer = eval.toString();
    }
  }
}