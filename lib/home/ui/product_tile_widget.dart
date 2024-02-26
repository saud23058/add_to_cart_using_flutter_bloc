import 'package:add_to_cart_using_bloc/home/bloc/home_bloc.dart';
import 'package:add_to_cart_using_bloc/home/bloc/home_event.dart';
import 'package:add_to_cart_using_bloc/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';
class ProductTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final HomeBloc homeBloc;
    const ProductTileWidget({super.key, required this.productModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(productModel.imageUrl))
            ),
          ),
          const SizedBox(height: 25,),
          Text(productModel.name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
           Text(productModel.description),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ ${productModel.price}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  IconButton(onPressed: (){
                     homeBloc.add(HomeProductWishListButtonClickedEvent(productClicked: productModel));
                  }, icon: const Icon(Icons.favorite_border,color: Colors.black,)),
                  IconButton(onPressed: (){
                    homeBloc.add(HomeProductCartButtonClickedEvent(productClicked: productModel));
                  }, icon: const Icon(Icons.shopping_bag_outlined,color: Colors.black)),
                ],
              )
            ],
          ),


        ],
      ),
    );
  }
}
