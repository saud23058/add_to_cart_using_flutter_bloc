import 'package:add_to_cart_using_bloc/home/bloc/home_event.dart';
import 'package:add_to_cart_using_bloc/home/bloc/home_state.dart';
import 'package:add_to_cart_using_bloc/home/ui/product_tile_widget.dart';
import 'package:add_to_cart_using_bloc/wishlist/ui/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart/ui/cart_screen.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   HomeBloc homeBloc= HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {



    return  BlocConsumer<HomeBloc,HomeState>(
      bloc: homeBloc,
      listenWhen:(previous,current)=> current is HomeActionState ,
      buildWhen: (previous,current)=> current is! HomeActionState,
       listener: (context, state){
        if(state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartScreen()));
        }else if(state is HomeNavigateToWishlistPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const WishListScreen()));
        }else if(state is ProductAddedToCartList){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Item added to Cart')));
        }else if(state is ProductAddedToWishList){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Item added to Wish List')));
        }
      },
      builder: (context,state){
        switch(state.runtimeType){
          case HomeLoadingState:
            return const Scaffold(body: Center(child: CircularProgressIndicator()),);
          case HomeLoadedSuccessState:
            final successState= state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(title: const Text('Grocery App',style: TextStyle(color: Colors.white,),),backgroundColor: Colors.teal,actions: [
                IconButton(onPressed: (){
                  homeBloc.add(HomeProductWishListButtonNavigateEvent());
                }, icon: const Icon(Icons.favorite_border,color: Colors.white,)),
                IconButton(onPressed: (){
                  homeBloc.add(HomeCartButtonNavigateEvent());
                }, icon: const Icon(Icons.shopping_bag_outlined,color: Colors.white)),
              ],),
              body: ListView.builder(
                itemCount: successState.products.length,
                  itemBuilder:(context,index){
                    return ProductTileWidget(
                        homeBloc: homeBloc,
                        productModel:successState.products[index]);
                  }
              ),
            );
          case HomeErrorState:
            return const Scaffold(body: Center(child: Text('Error')),);
          default:
            return const SizedBox();
        }
              },
    );
  }
}
