import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:grocery_design/data/cart_item.dart';
import 'package:grocery_design/home/model/Home_Product_data.dart';
import 'package:meta/meta.dart';

part 'cartbloc_event.dart';
part 'cartbloc_state.dart';

class CartblocBloc extends Bloc<CartblocEvent, CartblocState> {
  CartblocBloc() : super(CartblocInitial()) {
   on<CartInitialEvent>(cartInitialEvent);
   on<CartRemovefromCartEvent>(cartRemovefromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartblocState> emit) {
    emit(CartSuccessState(cartItems: cart_item));
  }
  
  

  FutureOr<void> cartRemovefromCartEvent(CartRemovefromCartEvent event, Emitter<CartblocState> emit) {
    cart_item.remove(event.homeProductData);
    emit(CartSuccessState(cartItems: cart_item));
  }
}
