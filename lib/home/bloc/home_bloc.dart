import 'dart:async';

import 'package:add_to_cart_using_bloc/data/cart_items.dart';
import 'package:add_to_cart_using_bloc/data/wishlist_items.dart';
import 'package:add_to_cart_using_bloc/home/bloc/home_event.dart';
import 'package:add_to_cart_using_bloc/home/bloc/home_state.dart';
import 'package:add_to_cart_using_bloc/home/models/home_product_data_model.dart';
import 'package:bloc/bloc.dart';

import '../../data/grocery.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishListButtonNavigateEvent>(
        homeProductWishListButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 5));
    emit(HomeLoadedSuccessState(
        products: Grocery.groceryItems.map((e) => ProductModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            price: e['price'],
            imageUrl: e['image'])).toList()));
  }

  FutureOr<void> homeProductWishListButtonNavigateEvent(
      HomeProductWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wish List Navigate');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart list Navigate');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Product cart');
    wishListItems.add(event.productClicked);
    emit(ProductAddedToWishList());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('wish cart');
    cartItems.add(event.productClicked);
    emit(ProductAddedToCartList());
  }
}
