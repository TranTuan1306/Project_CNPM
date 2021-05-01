import 'package:flutter/material.dart';

import '../../../constant.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendPlantCard(
            image: "assets/images/image-beginner-programe.jpeg",
            title: "BEGINNER PROGRAM",
            country: "30 days to 6 pack abs",
            press: () {
              print("object");
            },
          ),
          RecomendPlantCard(
            image: "assets/images/image-advanced-program.jpeg",
            title: "Samantha",
            country: "Russia",
          ),
          RecomendPlantCard(
            image: "assets/images/image-advanced-program.jpeg",
            title: "Samantha",
            country: "Russia",
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  final String image, title, country;
  final Function press;
  const RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      margin: EdgeInsets.only(
          left: kDefaultPadding, top: kDefaultPadding, bottom: kDefaultPadding),
      width: size.width * 0.7,
      height: size.height * 0.25,
      child: Column(
        children: [
          // Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all((kDefaultPadding / 2)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(image),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "$country",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
