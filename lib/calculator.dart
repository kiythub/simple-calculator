import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {

  int num1 = 0;
  int num2 = 0;
  String userInput = "";
  String result = "";
  String operation = "";

  void clickedbtn(String btnvalue){
    if(btnvalue == "C") {
      userInput = "";
      num1 = 0;
      num2 = 0;
      result = "";
      operation = "";
    }
    else if(btnvalue == "+" || btnvalue == "-" || btnvalue == "x"  || btnvalue == "/"){
      num1 = int.parse(userInput);
      result = "";
      operation = btnvalue;
    }
    else if(btnvalue == "="){
      num2 = int.parse(userInput);

      if(operation == "+"){
        result = (num1 + num2).toString();
      }
      if(operation == "-"){
        result = (num1 - num2).toString();
      }
      if(operation == "x"){
        result = (num1 * num2).toString();
      }
      if(operation == "/"){
        result = (num1 / num2).toString();
      }
    }
    else{
      result = int.parse(userInput + btnvalue).toString();
    }
    setState(() {
      userInput = result;
    });
  }

  Widget customedbutton(String btnvalue)
  {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => clickedbtn(btnvalue),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(25.0),
              backgroundColor: Colors.black12,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
        ),
        child: Text("$btnvalue",
          style:  const TextStyle(
              fontSize: 30.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULATOR"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.black12,
                alignment: Alignment.topRight,
                child:  Text("$num1 $operation $num2 = "
                             "\n\n   $userInput",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: const Divider(color: Colors.black87, height: 10),
            ),
            Row(
              children: <Widget>[
                customedbutton("7"),
                customedbutton("8"),
                customedbutton("9"),
                customedbutton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                customedbutton("4"),
                customedbutton("5"),
                customedbutton("6"),
                customedbutton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                customedbutton("1") ,
                customedbutton("2"),
                customedbutton("3"),
                customedbutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customedbutton("C"),
                customedbutton("0"),
                customedbutton("="),
                customedbutton("+"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}