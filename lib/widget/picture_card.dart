import 'package:flutter/material.dart';

import 'package:skeleton_loading_sample/util/styles.dart' as utils;

const int imageW = 300;
const int imageH = 200;
const String url = 'https://picsum.photos/$imageW/$imageH';

class PictureCard extends StatelessWidget {
  final Future<String> _url =
      Future.delayed(const Duration(seconds: 5), () => url);

  PictureCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: FutureBuilder(
          future: _url,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return const Picture();
            }
            return const PictureSkeleton();
          }),
    );
  }
}

class Picture extends StatelessWidget {
  const Picture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Stack(
        children: <Widget>[
          Image.network(
            url.toString(),
            fit: BoxFit.fill,
          ),
          const Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: PictureOverlay(
              title: 'Lorem ipsum',
              body:
                  'Etiam diam velit, pretium at fringilla ut, finibus elit nulla.',
            ),
          ),
        ],
      ),
    );
  }
}

class PictureSkeleton extends StatelessWidget {
  const PictureSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Stack(
        children: const <Widget>[
          SizedBox(
            width: imageW + .0,
            height: imageH + .0,
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: PictureOverlay(),
          ),
        ],
      ),
    );
  }
}

class PictureOverlay extends StatelessWidget {
  final String? title;
  final String? body;
  const PictureOverlay({
    Key? key,
    this.title,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (title != null && body != null)
            ? _PictureOverlayLoaded(title: title, body: body)
            : const _PictureOverlayLoading(),
      ),
    );
  }
}

class _PictureOverlayLoading extends StatelessWidget {
  const _PictureOverlayLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 48,
      color: Colors.red,
    );
  }
}

class _PictureOverlayLoaded extends StatelessWidget {
  const _PictureOverlayLoaded({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String? title;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title!, style: utils.TextStyles.imageHeader),
        const Divider(height: 8.0),
        Text(body!, style: utils.TextStyles.imageBody),
      ],
    );
  }
}
