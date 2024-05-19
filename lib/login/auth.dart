import 'package:flutter/material.dart';
import 'package:todo_rout_cours/login/login_screen.dart';
import 'package:todo_rout_cours/login/register_screen.dart';

class AuthScreen extends StatelessWidget {
  static const String routName = "Auth";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Text("Login")),
              Tab(icon: Text("Register")),
            ],
          ),
          title: Text('Auth Screen'),
        ),
        body: TabBarView(
          children: [LoginTab(), RegisterTab()],
        ),
      ),
    );
  }
}
