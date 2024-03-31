

import 'package:bloc/bloc.dart';
import 'package:book_store/view_model/cubit/auth_cubit/auth_state.dart';
import 'package:book_store/view_model/cubit/slider_cubit/slider_state.dart';
import 'package:book_store/view_model/data/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/slider_model/slider_model.dart';

class SliderCubit extends Cubit<SliderState>{

  SliderCubit():super(SliderInitState());
  static SliderCubit get(context)=>BlocProvider.of<SliderCubit>(context);


  //Slider Model
  SliderModel? sliderModel;
  //get Slider
  Future<void> getSlider()async{

    emit(GetSliderLoadingState());
    await DioHelper.get(endPoint: "sliders",).then((value){
      sliderModel = SliderModel.fromJson(value.data);
      emit(GetSliderSuccessState());
    });
  }
}