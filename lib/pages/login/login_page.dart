import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfood/pages/login/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input = '';
  var p = '123456';
  var selectedindex = 0;


  void _handleClickButton(int num) {
    setState(() {
      if (num == -1) {
        if (input.length > 0) input = input.substring(0, input.length - 1);
      } else {
        input = '$input$num';
        if(input.length == 6){
          if (input == p) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            _showMaterialDialog(
                '❌ ERROR ❌',
                'Invalid PIN. Please Try Again'
            );
            input = '';
          }
        }
      }
    });
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title,style: TextStyle(color: Colors.black),),
          content: Text(msg),
          actions: [
            TextButton(
              child: const Text(
                'OK',
                style : TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              image: const AssetImage("assets/images/bg8.jpg"),
              fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 60.0,
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 120.0,
                        color: Colors.white,
                      ),
                      Text(
                        'LOGIN',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline1,
                      ),
                      Text(
                        'Enter Pin To Login',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline2,
                      ),

                      Container(
                        child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Dot(
                                    width: 30,
                                    index: 0,
                                    selectedIndex: selectedindex,
                                    code: input,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Dot(
                                    width: 30,
                                    index: 1,
                                    selectedIndex: selectedindex,
                                    code: input,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Dot(
                                    width: 30,
                                    index: 2,
                                    selectedIndex: selectedindex,
                                    code: input,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Dot(
                                    width: 30,
                                    index: 3,
                                    selectedIndex: selectedindex,
                                    code: input,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Dot(
                                    width: 30,
                                    index: 4,
                                    selectedIndex: selectedindex,
                                    code: input,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Dot(
                                    width: 30,
                                    index: 5,
                                    selectedIndex: selectedindex,
                                    code: input,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),

                ),
              ),
              Container(

                ///color: Colors.deepPurple,
                height: 475.0,
                child: Column(
                  children: [
                    [1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9],
                    [-2, 0, -1],
                  ].map((row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: LoginButton(
                              number: item,
                              onCilk: _handleClickButton),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String code;
  final double width;

  const Dot({
    required this.selectedIndex,
    required this.index,
    required this.code,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: code.length > index
                 ? Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent.shade200,
                      shape: BoxShape.circle,
                  ),
                ):Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                ),
              ),
            ],
          )),
    );
  }
}


class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onCilk;

  const LoginButton({
    required this.number,
    required this.onCilk,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {
        onCilk(number);
      },
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: number == -2
            ? null
            : BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 4.0,color: Colors.white),
        ),
        child: Center(
          child: number >= 0
              ? Text(
            '$number',
            style: Theme
                .of(context)
                .textTheme
                .headline6,
          )
              : (number == -1
              ? Icon(
                Icons.backspace_outlined,
            size: 30.0,
            color: Colors.white,
            )
          : SizedBox.shrink()),
        ),
      ),
    );
  }
}

