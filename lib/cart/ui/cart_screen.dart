import 'package:add_to_cart_using_bloc/cart/bloc/cart_bloc.dart';
import 'package:add_to_cart_using_bloc/cart/bloc/cart_events.dart';
import 'package:add_to_cart_using_bloc/cart/bloc/cart_state.dart';
import 'package:add_to_cart_using_bloc/cart/ui/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/ui/product_tile_widget.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc =CartBloc();

  @override
  void initState(){
    cartBloc.add(CartInitialEvent());
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Items'),),
      body: BlocConsumer<CartBloc,CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current)=> current is CartActionState,
        buildWhen: (previous, current)=>current is! CartActionState,
        listener: (context , state){
        },builder: (context, state){
          switch (state.runtimeType){
            case SuccessState:
              final successSate=state as SuccessState;
              return ListView.builder(
               itemCount: successSate.cartItems.length,
               itemBuilder:(context,index){
               return CartTileWidget(
                   productModel:successSate.cartItems[index],
                   cartBloc: cartBloc);
          }
          );
          }
          return  Container();
      },
          )
    );
  }
}
