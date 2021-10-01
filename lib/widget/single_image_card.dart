import 'package:flutter/material.dart';

class SingleImageCard extends StatelessWidget {
  static const int size = 300;
  const SingleImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          Image.network('https://picsum.photos/$size'),
          Positioned(
            left: 8.0,
            bottom: size / 4,
            child: Column(
              children: const <Widget>[
                Divider(thickness: 0.4),
                Text('Lorem ipsum'),
                Text('Dolor sit amet.')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
