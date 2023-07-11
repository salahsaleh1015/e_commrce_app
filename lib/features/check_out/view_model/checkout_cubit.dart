import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/sevices/user_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../model/checkout_model.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutStates> {
  CheckoutCubit() : super(CheckoutInitial());
  static CheckoutCubit get(context) => BlocProvider.of(context);

  Future<void> addCheckoutData(
      String streetOne, String streetTwo, String city) async {
    final checkOutModel = CheckOutModel(
      streetOne: streetOne,
      streetTwo: streetTwo,
      city: city,
    );
    await UserFireStore().addCheckoutData(checkOutModel).then((value) {
      print("checkout success");
      emit(CheckoutSendDataSuccessfullyState());
    }).catchError((error) {
      emit(CheckoutSendDataFailureState());
    });
  }


  Future<void> retrieveLatestCheckoutData() async {
    try {
      final checkoutData = await UserFireStore().getLatestCheckoutData();
      if (checkoutData != null) {
        emit(LatestCheckoutDataAvailableState(checkoutData));
      } else {
        emit(NoCheckoutDataAvailableState());
      }
    } catch (e) {
      print('Error retrieving latest checkout data: $e');
      emit(RetrieveCheckoutDataFailureState());
    }
  }
  }



