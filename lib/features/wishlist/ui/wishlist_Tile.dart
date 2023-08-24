import 'package:flutter/material.dart';

import 'package:grocery_design/features/wishlist/bloc/wishlistbloc_bloc.dart';
import 'package:grocery_design/home/model/Home_Product_data.dart';
class wishListTile extends StatefulWidget {
  final  HomeProductData productDataModel;
  final WishlistBloc wishlistBloc;
  const wishListTile({super.key,required this.productDataModel, required this.wishlistBloc,});

  @override
  State<wishListTile> createState() => _wishListTileState();
}

class _wishListTileState extends State<wishListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding:const  EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.teal
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 10),
              child: Container(
                height: 200,
                width: 300,
                 decoration:  BoxDecoration(
                       borderRadius: BorderRadiusDirectional.circular(10),
                    image: DecorationImage(image: NetworkImage(widget.productDataModel.imageUrl),fit: BoxFit.cover)
                  ),
              ),
            ),
            Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.productDataModel.name,style: TextStyle(fontWeight: FontWeight.bold),),
            Text(widget.productDataModel.description,style: TextStyle(fontWeight: FontWeight.bold),),
              ],


            ),
            
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.productDataModel.price,style: TextStyle(fontWeight: FontWeight.bold),),
               IconButton(onPressed: (){
                 // homebloc.add(HomeproductWishlistbuttonclickedEvent(
                   // clickedProduct:productDataModel
                 // )
                  //);
               
               }, icon: Icon(Icons.favorite_outline)),
                  IconButton(onPressed: (){
             
                
                  }, icon: Icon(Icons.shopping_bag))
              ],
            )
        ],
      ),
    );
  }
}