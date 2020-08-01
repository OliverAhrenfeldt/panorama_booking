// import 'package:panorama_booking/services/auth.dart';
// import 'package:panorama_booking/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:panorama_booking/shared/constants.dart';
import 'package:panorama_booking/shared/FadeInLeft.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FadeInLeft(
                1,
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background_short.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        widget.toggleView();
                      },
                      child: FadeInLeft(
                        1.2,
                        Container(
                          height: 45,
                          width: 120,
                          decoration: buttonDecoration,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Log ind',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      child: Column(
                        children: <Widget>[
                          FadeInLeft(
                            1.4,
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                hintText: 'Fulde navn',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FadeInLeft(
                            1.6,
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                hintText: 'Email',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FadeInLeft(
                            1.8,
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                hintText: 'Lejlighedsnummer',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FadeInLeft(
                            2,
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                hintText: 'Password',
                              ),
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.toggleView();
                            },
                            child: FadeInLeft(
                              2.2,
                              Container(
                                height: 45,
                                width: 120,
                                decoration: buttonDecoration,
                                child: Center(
                                  child: Text(
                                    'Registrer',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
