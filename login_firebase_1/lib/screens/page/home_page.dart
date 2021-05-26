import 'package:login_firebase_1/models/user_models/user_model.dart';
import 'package:login_firebase_1/screens/pages_profile/profile_screen.dart';
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
      title: Text(
        'Exercise - ${user.user_name}',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      pinned: true,
      leading: IconButton(
        color: Colors.white,
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.person, size: 28),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => ProfileScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
