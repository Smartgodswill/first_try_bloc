import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:grocery_design/data/cart_item.dart';
import 'package:grocery_design/data/grocery_data.dart';
import 'package:grocery_design/data/wish_list_items.dart';
import 'package:meta/meta.dart';

import '../model/Home_Product_data.dart';
part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeblocInitial()) {
    on<HomeinitialFetchData>(homeinitialFetchData);
    on<HomeproductWishlistbuttonclickedEvent>(
        homeproductWishlistbuttonclickedEvent);
    on<HomeproductCartbuttonclickedEvent>(homeproductCartbuttonclickedEvent);
    on<HomewishlistNavigateToevent>(homewishlistNavigateToevent);
    on<HomecarttNavigateToevent>(homecarttNavigateToevent);
  }
  FutureOr<void> homeinitialFetchData(
      HomeinitialFetchData event, Emitter<HomeState> emit) async {
    emit(HomeIsloadingState());
    await Future.delayed(Duration(seconds: 4));
    emit(HomeIsloadingsucessState(
        products: GroceryData.groceryProduct.map((e) => HomeProductData(
            id: e['id'],
            name:e['name'],
            description: e['description'],
            price: e['price'],
            imageUrl: e['imageUrl'])).toList()));
  }

  FutureOr<void> homeproductWishlistbuttonclickedEvent(
      HomeproductWishlistbuttonclickedEvent event, Emitter<HomeState> emit) {
        
         print('wishlist button clicked');
         emit(WishListedclickedState());
         WishlistItem.add(event.clickedProduct);
      }

  FutureOr<void> homeproductCartbuttonclickedEvent(
      HomeproductCartbuttonclickedEvent event, Emitter<HomeState> emit) {
         print(' cart button clicked');
         cart_item.add(event.clickedProduct);
         emit(CartedClickedState());
      }

  FutureOr<void> homewishlistNavigateToevent(
      HomewishlistNavigateToevent event, Emitter<HomeState> emit) {
    emit(IwishlistNavigateToState());
    print('wishlist button navigate');
  }

  FutureOr<void> homecarttNavigateToevent(
      HomecarttNavigateToevent event, Emitter<HomeState> emit) {
    emit(IcartNavigateToState());
    print('cart button navigate');
  }
}
