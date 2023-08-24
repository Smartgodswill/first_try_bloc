import 'package:flutter/material.dart';
import 'package:grocery_design/home/bloc/homebloc_bloc.dart';
import 'package:grocery_design/home/model/Home_Product_data.dart';
class ProdcutContain extends StatelessWidget {
  final  HomeProductData productDataModel;
  final HomeBloc homebloc;
  const ProdcutContain({super.key,required this.productDataModel, required this.homebloc,});

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
                Text(productDataModel.name,style:const TextStyle(fontWeight: FontWeight.bold),),
            Text(productDataModel.description,style:const TextStyle(fontWeight: FontWeight.bold),),
              ],


            ),
            
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(productDataModel.price,style:const TextStyle(fontWeight: FontWeight.bold),),
               IconButton(onPressed: (){
                  homebloc.add(HomeproductWishlistbuttonclickedEvent(
                    clickedProduct:productDataModel
                  ));
               
               }, icon:const Icon(Icons.favorite_outline,color: Colors.teal,)),
                  IconButton(onPressed: (){
                   homebloc.add(HomeproductCartbuttonclickedEvent(
                    clickedProduct: productDataModel
                   ));
                  }, icon:const Icon(Icons.shopping_bag_outlined,color: Colors.teal,))
              ],
            )
        ],
      ),
    );
  }
}