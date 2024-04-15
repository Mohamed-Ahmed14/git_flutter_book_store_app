import 'package:bloc/bloc.dart';
import 'package:book_store/model/cart_model/cart_model.dart';
import 'package:book_store/model/order_model/order_model.dart';
import 'package:book_store/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:book_store/view_model/data/network/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState>{

  CartCubit():super(CartInitState());
  static CartCubit get(context)=>BlocProvider.of<CartCubit>(context);

  CartModel? cartModel;
  Future<void> addItemToCart(int id) async{
    emit(AddItemCartLoadingState());
    await DioHelper.post(endPoint: "add-to-cart",
    withToken: true,
    body: {
      "product_id":id,
    }).then((value){
      print(value.data["message"]);
      cartModel?.data?.cartItems?.clear();
      cartModel = CartModel.fromJson(value.data);
      emit(AddItemCartSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AddItemCartErrorState());
      throw error;
    });
  }
  
  Future<void> showCartItems () async{
    emit(ShowCartItemsLoadingState());
    await DioHelper.get(endPoint: "cart",
    withToken: true).then((value){
      print(value.data["message"]);
      cartModel?.data?.cartItems?.clear();
      cartModel = CartModel.fromJson(value.data);
      emit(ShowCartItemsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShowCartItemsErrorState());
      throw error;
    });
  }

  Future<void> removeCartItem(int Item_id) async{
    emit(RemoveCartItemLoadingState());
    await DioHelper.post(endPoint: "remove-from-cart",
    withToken: true,
    body: {
      "cart_item_id": Item_id,
    }).then((value){
      print(value.data["message"]);
      showCartItems();
      // cartModel?.data?.cartItems?.clear();
      // cartModel = CartModel.fromJson(value.data);
      emit(RemoveCartItemSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(RemoveCartItemErrorState());
      throw error;
    });
  }

  Future<void> updateCart(int item_id,int item_quantity) async{
    emit(UpdateCartLoadingState());
    await DioHelper.post(endPoint: "update-cart",
        withToken: true,
        body: {
          "cart_item_id":item_id,
          "quantity": item_quantity,
        }).then((value){
      print(value.data["message"]);
      cartModel?.data?.cartItems?.clear();
      cartModel = CartModel.fromJson(value.data);
      emit(UpdateCartSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(UpdateCartErrorState());
      throw error;
    });
  }
  //Model Side
  CartModel? orderModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  GlobalKey<FormState> orderKey = GlobalKey<FormState>();

  Future<void> checkOut()async{
    emit(CheckoutLoadingState());
    await DioHelper.get(endPoint: "checkout",
    withToken: true).then((value){
      print(value.data["message"]);
      orderModel?.data?.cartItems?.clear();
      orderModel = CartModel.fromJson(value.data);
      setDataToCons();
      emit(CheckoutSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(CheckoutErrorState());
      throw error;
    });
  }

  Future<void> placeOrder() async{

    print(nameController.text);
    print(emailController.text);
    print(phoneController.text);
    print(addressController.text);
    emit(PlaceOrderLoadingState());
    await DioHelper.post(endPoint: "place-order",
    withToken: true,
    body: {
      "name" : nameController.text,
      "phone": phoneController.text,
      "email" : emailController.text,
      "address":addressController.text,
      "governorate_id" : 10,
    }).then((value){
      print(value.data["message"]);
      emit(PlaceOrderLoadingState());
    }).catchError((error){
      print(error.toString());
      emit(PlaceOrderErrorState());
      throw error;
    });
  }

  void setDataToCons(){
    if(orderModel?.data?.user != null)
      {
        nameController.text = orderModel!.data!.user!.userName ?? "";
        emailController.text = orderModel!.data!.user!.userEmail ?? "";
        phoneController.text = orderModel!.data!.user!.phone ?? "";
        addressController.text = orderModel!.data!.user!.address ?? "";
        cityController.text = "Asyut";
      }
  }

    //Order History
    OrderHistoryModel? orderHistoryModel;

    Future<void> getOrderHistory() async{
      emit(GetOrderHistoryLoadingState());
      
      await DioHelper.get(endPoint: "order-history",
      withToken: true).then((value){
        print(value.data["message"]);
        orderHistoryModel?.data?.orders?.clear();
        orderHistoryModel = OrderHistoryModel.fromJson(value.data);
        emit(GetOrderHistorySuccessState());
      }).catchError((error){
        print(error.toString());
        emit(GetOrderHistoryErrorState());
        throw error;
      });
    }

    //Single Order
    SingleOrderModel? singleOrderModel;
    Future<void> showSingleOrder(int order_id) async{
      emit(ShowSingleOrderLoadingState());
      
      await DioHelper.get(endPoint: "order-history/${order_id}",
      withToken: true).then((value) {
        print(value.data["message"]);
        singleOrderModel = null;
        singleOrderModel = SingleOrderModel.fromJson(value.data);
        print(singleOrderModel?.data?.name);
        emit(ShowSingleOrderLoadingState());
      }).catchError((error){
        print(error.toString());
        emit(ShowSingleOrderErrorState());
        throw error;
      });

    }


}