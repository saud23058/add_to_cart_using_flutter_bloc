import 'package:add_to_cart_using_bloc/home/models/home_product_data_model.dart';

abstract class HomeEvent{}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishListButtonClickedEvent extends HomeEvent{
  final ProductModel productClicked;
  HomeProductWishListButtonClickedEvent({required this.productClicked});
}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductModel productClicked;
  HomeProductCartButtonClickedEvent({required this.productClicked});
}

class HomeProductWishListButtonNavigateEvent extends HomeEvent{}

class HomeCartButtonNavigateEvent extends HomeEvent{}