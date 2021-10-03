import 'package:flutter/material.dart';

import 'package:skeleton_loading_sample/util/styles.dart' as utils;

const String url = 'https://picsum.photos/325/200';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          Image.network(
            url,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 8.0,
            bottom: 16.0,
            child: Column(
              children: const <Widget>[
                Text('Lorem ipsum', style: utils.TextStyles.imageHeader),
                Divider(height: 8.0),
                Text('Dolor sit amet.', style: utils.TextStyles.imageBody),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
