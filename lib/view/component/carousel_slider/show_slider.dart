import 'package:book_store/view_model/cubit/slider_cubit/slider_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/slider_cubit/slider_cubit.dart';
import 'carousel_slider_item.dart';

class ShowSlider extends StatelessWidget {

  const ShowSlider({super.key});

  @override
  Widget build(BuildContext context) {
    SliderCubit.get(context).getSlider();
    return BlocBuilder<SliderCubit,SliderState>(
      builder: (context, state) {
        return Visibility(
          visible: (SliderCubit.get(context).sliderModel?.data?.sliderList ?? []).isNotEmpty,
          replacement: Align(alignment: AlignmentDirectional.topCenter,
              child: CircularProgressIndicator()),
          child: CarouselSlider(items: SliderCubit.get(context).sliderModel?.data?.sliderList.map((e) => CarouselSliderItem(slider: e,)).toList(),
              options: CarouselOptions(height: 120,autoPlay: true,autoPlayAnimationDuration: Duration(seconds: 2),
              viewportFraction: 0.9
              )),
        );
      },

    );
  }
}
