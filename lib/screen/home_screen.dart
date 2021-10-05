import 'package:flutter/material.dart';

import 'package:skeleton_loading_sample/widget/picture_card.dart';

const int images = 5;
List<PictureCard> cards = List.generate(images, (index) => PictureCard());

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        padding: const EdgeInsets.all(32.0),
        itemBuilder: (BuildContext context, int index) => cards[index],
        itemCount: cards.length,
      ),
    );
  }
}
