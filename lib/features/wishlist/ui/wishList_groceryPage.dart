// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_design/features/wishlist/bloc/wishlistbloc_bloc.dart';
import 'package:grocery_design/features/wishlist/ui/wishlist_Tile.dart';

class WishList_GroceryPage extends StatefulWidget {
  const WishList_GroceryPage({super.key});

  @override
  State<WishList_GroceryPage> createState() => _WishList_GroceryPageState();
} 
final WishlistBloc _wishlistBloc=WishlistBloc();

class _WishList_GroceryPageState extends State<WishList_GroceryPage> {
  @override
  void initState() {
    _wishlistBloc.add(WishlistinitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          listener: (context, state){} ,
            bloc:_wishlistBloc ,
            listenWhen: (previous, current) => current is WishlistActionstate,
            buildWhen: (previous, current) => current is !WishlistActionstate,
            builder: (context, state) {
              
              switch (state.runtimeType) {
                case wishlistSuccessState:
                final successSate= state as wishlistSuccessState;
                return ListView.builder(
                  itemCount:successSate.wishitems.length ,
                  itemBuilder: (context,index){
                    return wishListTile(productDataModel:successSate.wishitems[index] , wishlistBloc: _wishlistBloc);
                  });
                  
                
                default:return Container();
                
              }
            })
            ); 
}}