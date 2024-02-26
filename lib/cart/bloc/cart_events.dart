import 'package:add_to_cart_using_bloc/home/models/home_product_data_model.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent{}

class RemoveEvent extends CartEvent{
  final ProductModel productModel;

  RemoveEvent({required this.productModel});
}