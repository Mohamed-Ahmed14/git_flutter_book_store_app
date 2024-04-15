

import 'package:bloc/bloc.dart';
import 'package:book_store/model/category_model/category_model.dart';
import 'package:book_store/model/favourite_model/favourite_model.dart';
import 'package:book_store/model/product_model/product_model.dart';
import 'package:book_store/view_model/cubit/product_cubit/product_state.dart';
import 'package:book_store/view_model/data/network/dio_helper.dart';
import 'package:flutter/cupertino.dart';
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
  
  //Get Categories 
  ProductsModel? catProductModel;
  Future<void> getCategoryProducts(int index) async{
    //clear list
    catProductModel?.data?.products?.clear();
    emit(GetCatProductsLoadingState());
    await DioHelper.get(endPoint: "categories/${index}").then((value){
      catProductModel = ProductsModel.fromJson(value.data);
      emit(GetCatProductsSuccessState());
    }).catchError((error){
      emit(GetCatProductsErrorState());
      throw error;
    });

  }
  
  //Products
  //get all product
  ProductsModel? productsModel;

  Future<void> getAllProduct() async{
    productsModel = null;
    emit(GetAllProductLoadingState());
    await DioHelper.get(endPoint: "products").then((value){
      productsModel = ProductsModel.fromJson(value.data);
      emit(GetAllProductSuccessState());
    }).catchError((error){
      emit(GetAllProductErrorState());
      throw error;
    });
  }
  //get one product
  Product? productDetailModel;
  
  Future<void> getProductDetail(int index) async{
    productDetailModel = null;
    emit(GetProductDetailLoadingState());
    await DioHelper.get(endPoint: "products/${index}").then((value){
      productDetailModel = Product.fromJson(value.data["data"]);
      emit(GetProductDetailSuccessState());
    }).catchError((error){
      emit(GetProductDetailErrorState());
      throw error;
    });
  }
  
  
  //favourite side
  //add item to favourite
  Future<void> addToFavourite(int id) async{
    emit(AddFavouriteLoadingState());
    await DioHelper.post(endPoint: "add-to-wishlist",
    withToken: true,
    body: {
      "product_id":id,
    }).then((value) {
      print(value.data["message"]);
      getFavourite();
      emit(AddFavouriteSuccessState());
    }).catchError((error){
      print("Error adding to fav");
      emit(AddFavouriteErrorState());
      throw error;
    });
  }
  //get favourite list
  FavouriteModel? favouriteModel;
  Future<void> getFavourite() async{
    emit(GetFavLoadingState());
    await DioHelper.get(endPoint: "wishlist",
    withToken: true).then((value){
      favouriteModel?.data?.dataList?.clear();
      favouriteModel = FavouriteModel.fromJson(value.data);
      emit(GetFavSuccessState());
    }).catchError((error){
      print("Error Get Favourite");
      emit(GetFavErrorState());
      throw error;
    });
  }
  //is favourite
  //bool isFavourite = false;
  bool isFaouriteItem(int id){
    if(favouriteModel?.data?.dataList == null)
      return false;
    else{
      for(var i in favouriteModel!.data!.dataList!)
        {
          if(i.id == id)
            return true;
        }
    }
    return false;
  }
  //add item to favourite
  Future<void> removeFromFavourite(int id) async{
    emit(RemoveFavouriteLoadingState());
    await DioHelper.post(endPoint: "remove-from-wishlist",
        withToken: true,
        body: {
          "product_id":id,
        }).then((value) {
      print(value.data["message"]);
      favouriteModel!.data!.dataList!.removeWhere((element) => element.id == id);
      emit(RemoveFavouriteSuccessState());
    }).catchError((error){
      print("Error Removing to fav");
      emit(RemoveFavouriteErrorState());
      throw error;
    });
  }



}