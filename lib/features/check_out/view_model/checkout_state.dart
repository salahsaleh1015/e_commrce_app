part of 'checkout_cubit.dart';

@immutable
abstract class CheckoutStates {}

class CheckoutInitial extends CheckoutStates {}
class CheckoutSendDataSuccessfullyState extends CheckoutStates{}
class CheckoutSendDataFailureState extends CheckoutStates{}

class LatestCheckoutDataAvailableState extends CheckoutStates {
  final CheckOutModel checkoutData;

  LatestCheckoutDataAvailableState(this.checkoutData);
}

class CheckoutLoadingState extends CheckoutStates{}

class NoCheckoutDataAvailableState extends CheckoutStates {}

class RetrieveCheckoutDataFailureState extends CheckoutStates {}



