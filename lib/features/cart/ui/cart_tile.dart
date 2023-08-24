import 'package:flutter/material.dart';
import 'package:grocery_design/features/cart/bloc/cartbloc_bloc.dart';
import 'package:grocery_design/home/model/Home_Product_data.dart';
class CartTile extends StatelessWidget {
  final  HomeProductData productDataModel;
  final CartblocBloc cartBloc;
  const CartTile({super.key,required this.productDataModel, required this.cartBloc,});

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
                    image: DecorationImage(image: NetworkImage(productDataModel.imageUrl),fit: BoxFit.cover)
                  ),
              ),
            ),
            Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productDataModel.name,style: TextStyle(fontWeight: FontWeight.bold),),
            Text(productDataModel.description,style: TextStyle(fontWeight: FontWeight.bold),),
              ],


            ),
            
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(productDataModel.price,style: TextStyle(fontWeight: FontWeight.bold),),
               IconButton(onPressed: (){
                 // homebloc.add(HomeproductWishlistbuttonclickedEvent(
                   // clickedProduct:productDataModel
                 // )
                  //);
               
               }, icon: Icon(Icons.favorite_outline,color: Colors.teal,)),
                  IconButton(onPressed: (){
                 cartBloc.add(CartRemovefromCartEvent(
                  homeProductData: productDataModel
                 ));
                  }, icon: Icon(Icons.shopping_bag,color: Colors.teal,))
              ],
            )
        ],
      ),
    );
  }
}