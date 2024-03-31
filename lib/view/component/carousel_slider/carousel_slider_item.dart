import 'package:flutter/material.dart';

import '../../../model/slider_model/slider_model.dart';

class CarouselSliderItem extends StatelessWidget {
  final Sliders? slider;
  const CarouselSliderItem({super.key, required this.slider});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsetsDirectional.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: Image.network(slider?.image ?? "",).image,
        ),
      ),
    );
  }
}
