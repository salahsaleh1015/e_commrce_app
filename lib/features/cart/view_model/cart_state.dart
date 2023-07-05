part of 'cart_cubit.dart';


abstract class CartStates {}

class CartInitial extends CartStates {}
class CartDataInsertedSuccessfullyState extends CartStates{}
class CartDataRetrievedSuccessfullyState extends CartStates{}
class CartProductPriceCalculatedSuccessfullyState extends CartStates{}
class CartProductQuantityIncreasedSuccessfullyState extends CartStates{}
class CartProductQuantityDecreasedSuccessfullyState extends CartStates{}
class CartProductDeletedFromCartSuccessfullyState extends CartStates{}


