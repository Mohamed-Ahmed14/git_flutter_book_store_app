import 'package:bloc/bloc.dart';
import 'package:book_store/model/category_model/category_model.dart';
import 'package:book_store/model/product_model/product_model.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_state.dart';
import 'package:book_store/view_model/data/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState>{

  ProductCubit():super(ProductInitState());

  static ProductCubit get(context)=>BlocProvider.of<ProductCubit>(context);


  //Best seller model
  ProductsModel? bestSellerModel;

  //Get Best seller Products
  Future<void> getBestSeller() async{

    emit(GetBestSellerLoadingState());
    await DioHelper.get(endPoint: "products-bestseller").then((value){
      bestSellerModel = ProductsModel.fromJson(value.data);
      emit(GetBestSellerSuccessState());
    });
  }
  
  //New Arrival model
  ProductsModel? newArrivalModel;
  
  //get new arrivals
  Future<void> getNewArrivals() async{
    emit(GetNewArrivalsLoadingState());
    await DioHelper.get(endPoint: "products-new-arrivals").then((value){
      newArrivalModel = ProductsModel.fromJson(value.data);
      emit(GetNewArrivalsSuccessState());
    });
  }
  
  //Category Model
  CategoryModel? categoryModel;
  //Get Category
  Future<void> getCategories() async{
    emit(GetCategoriesLoadingState());
    await DioHelper.get(endPoint: "categories").then((value){
      categoryModel = CategoryModel.fromJson(value.data);
      emit(GetCategoriesSuccessState());
    });
  }
  


}