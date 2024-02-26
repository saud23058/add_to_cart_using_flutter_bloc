import '../models/home_product_data_model.dart';

abstract class HomeState{}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState{}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductModel>products;
  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistPageActionState extends HomeActionState{}

class HomeNavigateToCartPageActionState extends HomeActionState{}

class ProductAddedToWishList extends HomeActionState{}

class ProductAddedToCartList extends HomeActionState{}