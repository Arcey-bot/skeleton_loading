import 'package:flutter/material.dart';

import 'package:skeleton_loading_sample/widget/picture_card.dart';

List<PictureCard> pictures = [PictureCard()];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PictureCard> cards = pictures;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          cards.add(PictureCard());
        });
      }),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        padding: const EdgeInsets.all(32.0),
        itemBuilder: (BuildContext context, int index) => cards[index],
        itemCount: cards.length,
      ),
    );
  }
}
