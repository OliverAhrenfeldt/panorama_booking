// import 'package:panorama_booking/services/auth.dart';
// import 'package:panorama_booking/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:panorama_booking/services/auth.dart';
import 'package:panorama_booking/shared/constants.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:panorama_booking/shared/FadeIn.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FadeIn(
                1,
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/light-1.png'),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 120,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/light-2.png'),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 100),
                          child: Center(
                            child: Text(
                              'Ceres Panorama Booking',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      FadeIn(
                        1.2,
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                              hintText: 'Email',
                            ),
                            validator: (val) => val.isEmpty ? 'Indtast en email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            }),
                      ),
                      SizedBox(height: 5),
                      FadeIn(
                        1.4,
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                              hintText: 'Password',
                            ),
                            validator: (val) => val.length < 6 ? 'Indtast en kode over 6 tegn' : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            }),
                      ),
                      SizedBox(height: 20),
                      FadeIn(
                        1.6,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                  if (result == null) {
                                    setState(() {
                                      error =
                                          'Fejl ved log ind - Tjek email og password \n Glemt adgangskode? Tryk her';
                                      loading = false;
                                    });
                                  }
                                }
                              },
                              child: Container(
                                height: 45,
                                width: 120,
                                decoration: buttonDecoration,
                                child: Center(
                                  child: Text(
                                    'Log ind',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.toggleView();
                              },
                              child: Container(
                                height: 45,
                                width: 120,
                                decoration: buttonDecoration,
                                child: Center(
                                  child: Text(
                                    'Registrer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                          onTap: () {
                            widget.toggleView();
                          },
                          child: Text(error,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
