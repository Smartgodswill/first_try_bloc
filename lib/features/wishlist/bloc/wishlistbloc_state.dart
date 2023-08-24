// ignore_for_file: camel_case_types

part of 'wishlistbloc_bloc.dart';

@immutable
 abstract class WishlistState {}
 abstract class WishlistActionstate extends WishlistState{}

 class WishlistblocInitial extends WishlistState {}
 class wishlistSuccessState extends WishlistActionstate{
   final List<HomeProductData> wishitems;

  wishlistSuccessState({ required this.wishitems});
 }
