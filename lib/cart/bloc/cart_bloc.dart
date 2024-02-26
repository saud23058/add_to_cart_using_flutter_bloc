import 'dart:async';

import 'package:add_to_cart_using_bloc/cart/bloc/cart_events.dart';
import 'package:add_to_cart_using_bloc/cart/bloc/cart_state.dart';
import 'package:add_to_cart_using_bloc/data/cart_items.dart';
import 'package:bloc/bloc.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  CartBloc():super(InitialState()){
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveEvent>(removeEvent);
  }



  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(SuccessState(cartItems: cartItems));
  }

  FutureOr<void> removeEvent(RemoveEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productModel);
    emit(SuccessState(cartItems: cartItems));
  }
}