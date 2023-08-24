part of 'homebloc_bloc.dart';

@immutable
 abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

 class HomeblocInitial extends HomeState {}

class HomeIsloadingState extends HomeState{}

class HomeIsloadingsucessState extends HomeState{
  final List<HomeProductData>products;
   HomeIsloadingsucessState({
    required this.products
   });
}

 class HomeErrorstate extends HomeState{}

class  IwishlistNavigateToState extends HomeActionState{}

 class IcartNavigateToState extends HomeActionState{}
 class  WishListedclickedState extends HomeActionState{}
  class  CartedClickedState extends HomeActionState{}

