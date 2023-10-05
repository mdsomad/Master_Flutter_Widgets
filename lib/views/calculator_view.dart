// ignore_for_file: unused_import

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  late final AppLifecycleListener _listener;

  int x = 0;
  int y = 0;
  num z = 0;

  int iconActiveColor = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
      // onExitRequested: _onExitRequested,
    );
  }

  void _onShow() => log("onShow called");

  void _onHide() => log("onHide called");

  void _onResume() => log("onResume called");

  void _onDetach() => log("onDetach called");

  void _onInactive() => log("onInactive called");

  void _onPause() => log("onPause called");

  void _onRestart() => log("onRestart called");

  void _onStateChange(AppLifecycleState state) {
    log("onStateChange called with state: $state");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          CalculatorDisplay(
            key: Key('displayOne'),
              hintText: "Enter First Number", controller: displayOneController),
          const SizedBox(
            height: 30,
          ),
          CalculatorDisplay(
              key: Key('displayTwo'),
              hintText: "Enter Second Number",
              controller: displayTwoController),
          const SizedBox(
            height: 30,
          ),
          Text(
            key: Key("Result"),
            z.toString(),
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    iconActiveColor = 1;
                    z = num.tryParse(displayOneController.text)! +
                        num.tryParse(displayTwoController.text)!;
                    print(z);
                    log("click add");
                  });
                },
                child:  Icon(CupertinoIcons.add,color: iconActiveColor == 1 ? Colors.green : Colors.white,),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    iconActiveColor = 2;
                    z = num.tryParse(displayOneController.text)! -
                        num.tryParse(displayTwoController.text)!;
                    log("click minus");
                  });
                },
                child:  Icon(CupertinoIcons.minus,color: iconActiveColor == 2 ? Colors.green : Colors.white,),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    iconActiveColor = 3;
                    z = num.tryParse(displayOneController.text)! *
                        num.tryParse(displayTwoController.text)!;
                    log("click multiply");
                  });
                },
                child: Icon(CupertinoIcons.multiply,color: iconActiveColor == 3 ? Colors.green : Colors.white,),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    iconActiveColor = 4;
                    z = num.tryParse(displayOneController.text)! /
                        num.tryParse(displayTwoController.text)!;
                    log("click divide");
                  });
                },
                child:  Icon(CupertinoIcons.divide,color: iconActiveColor == 4 ? Colors.green : Colors.white,),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayOneController.clear();
                displayTwoController.clear();
                iconActiveColor = 0;
              });
            },
            label: Text('Clear'),
          ),
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  const CalculatorDisplay(
      {super.key, this.hintText = "Enter a Number", required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      autofocus: true,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow, width: 3.0),
            borderRadius: BorderRadius.circular(10)),
        labelText: '0',
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
