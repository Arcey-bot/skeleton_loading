import 'package:flutter/material.dart';

import 'package:skeleton_loading_sample/util/styles.dart' as utils;

const String url = 'https://picsum.photos/325/200';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              url,
              fit: BoxFit.cover,
            ),
            const Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: ImageOverlay(),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageOverlay extends StatelessWidget {
  const ImageOverlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Lorem ipsum', style: utils.TextStyles.imageHeader),
            Divider(height: 8.0),
            Text(
                "Etiam diam velit, pretium at fringilla ut, finibus elit nulla.",
                style: utils.TextStyles.imageBody),
          ],
        ),
      ),
    );
  }
}
