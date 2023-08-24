part of 'cartbloc_bloc.dart';

@immutable
sealed class CartblocEvent {}

class CartInitialEvent extends CartblocEvent{

}
class CartRemovefromCartEvent extends CartblocEvent{
final HomeProductData homeProductData;

  CartRemovefromCartEvent({ required this.homeProductData});
}

