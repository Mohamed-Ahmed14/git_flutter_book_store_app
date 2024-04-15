abstract class ProductState{}

class ProductInitState extends ProductState{}

class GetBestSellerLoadingState extends ProductState{}

class GetBestSellerSuccessState extends ProductState{}

class GetNewArrivalsLoadingState extends ProductState{}
class GetNewArrivalsSuccessState extends ProductState{}

class GetCategoriesLoadingState extends ProductState{}
class GetCategoriesSuccessState extends ProductState{}

class GetCatProductsLoadingState extends ProductState{}
class GetCatProductsSuccessState extends ProductState{}
class GetCatProductsErrorState extends ProductState{}

class GetAllProductLoadingState extends ProductState{}
class GetAllProductSuccessState extends ProductState{}
class GetAllProductErrorState extends ProductState{}

class GetProductDetailLoadingState extends ProductState{}
class GetProductDetailSuccessState extends ProductState{}
class GetProductDetailErrorState extends ProductState{}




class AddFavouriteLoadingState extends ProductState{}
class AddFavouriteSuccessState extends ProductState{}
class AddFavouriteErrorState extends ProductState{}

class GetFavLoadingState extends ProductState{}
class GetFavSuccessState extends ProductState{}
class GetFavErrorState extends ProductState{}

class RemoveFavouriteLoadingState extends ProductState{}
class RemoveFavouriteSuccessState extends ProductState{}
class RemoveFavouriteErrorState extends ProductState{}
