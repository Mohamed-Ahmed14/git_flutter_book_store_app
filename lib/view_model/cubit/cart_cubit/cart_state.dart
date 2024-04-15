
abstract class CartState{}

class CartInitState extends CartState{}

class AddItemCartLoadingState extends CartState{}
class AddItemCartSuccessState extends CartState{}
class AddItemCartErrorState extends CartState{}

class ShowCartItemsLoadingState extends CartState{}
class ShowCartItemsSuccessState extends CartState{}
class ShowCartItemsErrorState extends CartState {}

class RemoveCartItemLoadingState extends CartState{}
class RemoveCartItemSuccessState extends CartState{}
class RemoveCartItemErrorState extends CartState{}

class UpdateCartLoadingState extends CartState{}
class UpdateCartSuccessState extends CartState{}
class UpdateCartErrorState extends CartState{}

/// Order States

class CheckoutLoadingState extends CartState{}
class CheckoutSuccessState extends CartState{}
class CheckoutErrorState extends CartState{}

class PlaceOrderLoadingState extends CartState{}
class PlaceOrderSuccessState extends CartState{}
class PlaceOrderErrorState extends CartState{}

class GetOrderHistoryLoadingState extends CartState{}
class GetOrderHistorySuccessState extends CartState{}
class GetOrderHistoryErrorState extends CartState{}

class ShowSingleOrderLoadingState extends CartState{}
class ShowSingleOrderSuccessState extends CartState{}
class ShowSingleOrderErrorState extends CartState{}






