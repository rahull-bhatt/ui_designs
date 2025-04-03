import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _AnotherState();
}

class _AnotherState extends State<Screen3> {
  final List<String> images = [
    "images/guru.jpg",
    "images/arman.jpg",
    "images/jubin.jpg",
  ];

  final List<String> name = ["Guru Randhawa", "Armaan Malik", "Jubin Nautiyal"];

  final List<String> songs = ["180+ songs", "150+ songs", "120+ songs"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.sort, size: 27, color: Colors.black),
        actions: [
          Icon(Icons.search, size: 27, color: Colors.black),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              "Rocking Week",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              "2021 top songs to hang on",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.local_fire_department,
                  color: Colors.black.withOpacity(0.6),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Recommended",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.orange.withOpacity(0.8),
                ),
              ),
              Text(
                "Show 2021",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Text(
                "New Songs",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            height: 350,
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        name[index],
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.black.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        songs[index],
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Row(
              children: [
                Text(
                  "Top Songs",
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.black.withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.music_note, color: Colors.orange),
              ],
            ),
          ),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(20),
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('images/high.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ], //children
      ),
    );
  }
}
