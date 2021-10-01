import 'package:flutter/material.dart';

import 'package:skeleton_loading_sample/util/image_requester.dart';
import 'package:skeleton_loading_sample/widget/single_image_card.dart';

class ImageShowcase extends StatelessWidget {
  final int _images;
  const ImageShowcase({Key? key, int? images})
      : _images = images ?? 3,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: _buildSingleImageCards(_images),
      ),
    );
  }
}

List<SingleImageCard> _buildSingleImageCards(int n) {
  // return List.generate(n, (index) => SingleImageCard());
  return List.filled(n, SingleImageCard());
}
