import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase_1/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:login_firebase_1/blocs/authentication_bloc/authentication_event.dart';

import 'components/recomend_plants.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF152B44),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Hello, ${user.email}",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationLoggedOut());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 200),
            // Si
            RecomendsPlants(),
            RecomendsPlants(),
            RecomendsPlants(),
            RecomendsPlants(),
          ],
        ),
      ),
    );
  }
}
