// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_design/features/cart/ui/cart_grocery.dart';
import 'package:grocery_design/features/wishlist/ui/wishList_groceryPage.dart';
import 'package:grocery_design/home/bloc/homebloc_bloc.dart';
import 'package:grocery_design/home/ui/product_contain.dart';

class ComPoRoot extends StatefulWidget {
  const ComPoRoot({super.key});

  @override
  State<ComPoRoot> createState() => _ComPoRootState();
}

class _ComPoRootState extends State<ComPoRoot> {
  final HomeBloc homeBloc= HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeinitialFetchData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current ){ return current is HomeActionState;},
      buildWhen: (previous, current) { return current is !HomeActionState;},
      listener: (context, state) {
         if( state is IwishlistNavigateToState){
          Navigator.push(context, MaterialPageRoute(builder: (context){
              return  WishList_GroceryPage();
          }));
         }else if(state is IcartNavigateToState){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return CartGroceryPage();
          }));
         }else if(state is WishListedclickedState){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Added to favourite')));
         }else if(state is CartedClickedState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Added to cart')));
         }
      },
      builder: (context, state) {
      switch (state.runtimeType) {
        case HomeIsloadingState:
        return Scaffold(
          body: const Center(
            child: const CircularProgressIndicator(
              color: Colors.teal,
            
            ),
          ),
        );
         
          case HomeIsloadingsucessState:
          final successState =state as HomeIsloadingsucessState;
            return Scaffold(
          appBar: AppBar(
            title:const Text('ZenVert Grocery App'),
            backgroundColor: Colors.teal,
            actions:  [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: (){
                    homeBloc.add(HomewishlistNavigateToevent());
                }, icon: const  Icon(Icons.favorite_outline))
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: (){
                  homeBloc.add(HomecarttNavigateToevent());
                }, icon: const Icon(Icons.badge_sharp)),
              )
            ],
          ),
          body: ListView.builder(
            itemCount:successState.products.length ,
            itemBuilder: (context,index){
            return ProdcutContain(productDataModel:successState.products[index] ,homebloc: homeBloc,);
          }),
        );
          
          
          case HomeErrorstate:
          return Scaffold(
            body: Center(
              child:  Text('Error Please check internet connection'),
            ),
          );
        default:
        return SizedBox();
      }
      },
    );
  }
}
