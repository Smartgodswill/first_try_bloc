part of 'homebloc_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeinitialFetchData extends HomeEvent {}

class HomeproductWishlistbuttonclickedEvent extends HomeEvent {
  final HomeProductData clickedProduct;

  HomeproductWishlistbuttonclickedEvent( { required this.clickedProduct});
}

class HomeproductCartbuttonclickedEvent extends HomeEvent {
   final HomeProductData clickedProduct;

  HomeproductCartbuttonclickedEvent( { required this.clickedProduct});
}

class HomewishlistNavigateToevent extends HomeEvent {}

class HomecarttNavigateToevent extends HomeEvent {}
