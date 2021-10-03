import 'package:flutter/material.dart';

import 'package:skeleton_loading_sample/widget/image_card.dart';

const int images = 3;
List<ImageCard> cards = [const ImageCard()];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => cards[index],
          itemCount: cards.length,
        ),
      ),
    );
  }
}
