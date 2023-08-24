part of 'cartbloc_bloc.dart';

@immutable
abstract class CartblocState {}
abstract class CartactionState extends CartblocState{}

final class CartblocInitial extends CartblocState {}
class CartSuccessState extends CartactionState{
  final List<HomeProductData> cartItems;

  CartSuccessState({ required this.cartItems});
}

