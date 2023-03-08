import 'package:esantren_v1/Classes/Authentication.dart';
import 'package:esantren_v1/Classes/CurrentUserClass.dart';
import 'package:esantren_v1/Objects/CurrentUserObject.dart';
import 'package:esantren_v1/Screens/HomePage.dart';
import 'package:esantren_v1/Screens/LoginPage.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);
  static const String id = 'widget-tree';

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  // Future<CurrentUserObject> userDetail = CurrentUserClass().getUserDetail();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginScreen();
          }
        });
  }
}
