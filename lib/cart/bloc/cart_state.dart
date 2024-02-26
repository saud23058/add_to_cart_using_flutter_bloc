import '../../home/models/home_product_data_model.dart';

abstract class CartState{}

class InitialState extends CartState{}

abstract class CartActionState extends CartState{}

class SuccessState extends CartState{
  final List<ProductModel>cartItems;
  SuccessState({required this.cartItems});
}