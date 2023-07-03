part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitial extends HomeStates {}
class HomeLoadingCategoriesDataState extends HomeStates {}
class HomeSuccessCategoriesDataState extends HomeStates {
}
class HomeErrorCategoriesDataState extends HomeStates {}
class HomeLoadingProductDataState extends HomeStates {}
class HomeSuccessProductDataState extends HomeStates {}
class HomeErrorProductsDataState extends HomeStates {}



