import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_design/features/cart/bloc/cartbloc_bloc.dart';
import 'package:grocery_design/features/cart/ui/cart_tile.dart';


class CartGroceryPage extends StatefulWidget {
  const CartGroceryPage({super.key});

  @override
  State<CartGroceryPage> createState() => _CartGroceryPageState();
}

class _CartGroceryPageState extends State<CartGroceryPage> {
  final CartblocBloc cartBloc = CartblocBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<CartblocBloc, CartblocState>(
            bloc: cartBloc,
            builder: (context, state) {
             switch (state.runtimeType) {
               case CartSuccessState:
                final successState= state as CartSuccessState;
                return  ListView.builder(
            itemCount:successState.cartItems.length ,
            itemBuilder: (context,index){
            return CartTile(productDataModel:successState.cartItems[index] ,cartBloc: cartBloc,);
          });
                 
             
               default:return Container();
             }
            },
            listener: (context, state) {},
            buildWhen: (previous, current) => current is CartactionState,
            listenWhen: (previous, current) => current is !CartactionState,)
            
            );
  }
}
