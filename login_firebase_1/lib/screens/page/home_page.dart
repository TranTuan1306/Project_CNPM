import 'package:login_firebase_1/models/user_models/user_model.dart';
import 'package:login_firebase_1/widget/exercises_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final UserModel user;

  const HomePage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          buildAppBar(context),
          ExercisesWidget(),
        ],
      ),
    );
  }

  SliverAppBar buildAppBar(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      title: Text('Exercise - ${user.user_name}'),
      centerTitle: true,
      pinned: true,
      leading: Icon(Icons.menu),
      actions: [
        IconButton(icon: Icon(Icons.person, size: 28), onPressed: () {}),
      ],
    );
  }
}
