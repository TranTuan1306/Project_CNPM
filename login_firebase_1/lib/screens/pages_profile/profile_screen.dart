import 'package:flutter/material.dart';

import 'edit_profile.dart';
import 'home_page_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => EditProfilePage(),
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 10))
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://scontent.fpnh22-3.fna.fbcdn.net/v/t1.6435-9/149208526_2702809756716204_4652106290876094144_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=Pr4QeC3zkPIAX_thfqI&_nc_ht=scontent.fpnh22-3.fna&oh=84fae35f5e895e037e9a2f415fc26a0d&oe=60D41FA7",
                  ),
                ),
              ),
            ),
            Text(
              "Nguyễn Công Chiến",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            HistoryScreen(),
          ],
        ),
      ),
      // body: HistoryScreen(),
    );
  }
}
