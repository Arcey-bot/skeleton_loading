import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:skeleton_loading_sample/widget/image_card.dart';

const int images = 3;
List<ImageCard> cards = [const ImageCard()];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ImageCard>> album;

  @override
  void initState() {
    super.initState();
    album = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureImageCards(futureAlbum: album),
      ),
    );
  }
}

class FutureImageCards extends StatelessWidget {
  final Future<List<ImageCard>> futureAlbum;
  const FutureImageCards({Key? key, required this.futureAlbum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageCard>>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ImageCard> cards = snapshot.data!;
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) => cards[index],
            itemCount: cards.length,
          );
        } else {
          //? Skeleton loading goes here?
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

Future<List<ImageCard>> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://picsum.photos/v2/list?limit=10'));

  if (response.statusCode == 200) {
    List<ImageCard> album = [];
    dynamic data = json.decode(response.body);
    for (var img in data) {
      ImageCard ic = ImageCard(
        key: UniqueKey(),
      );
      album.add(ic);
      // print('${img["url"]}');
    }
    return album;
    // return Album(id: data['id'], url: data['url']);
    // return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
