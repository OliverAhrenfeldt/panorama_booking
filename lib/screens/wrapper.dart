import 'package:panorama_booking/models/user.dart';
import 'package:panorama_booking/screens/authenticate/authenticate.dart';
import 'package:panorama_booking/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
