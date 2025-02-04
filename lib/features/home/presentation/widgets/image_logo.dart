import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Image.asset(
        Assets.imagesLogo,
        width: width / 3,
        height: height/3,
      ),
    );
  }
}
