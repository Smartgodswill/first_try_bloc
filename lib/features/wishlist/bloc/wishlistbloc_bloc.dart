import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:grocery_design/data/wish_list_items.dart';
import 'package:meta/meta.dart';

import '../../../home/model/Home_Product_data.dart';

part 'wishlistbloc_event.dart';
part 'wishlistbloc_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistblocInitial()) {
    on<WishlistinitialEvent>(wishlistinitialEvent);
  }
  FutureOr<void> wishlistinitialEvent(WishlistinitialEvent event, Emitter<WishlistState> emit) {
    emit(wishlistSuccessState(wishitems: WishlistItem));
  }
}
