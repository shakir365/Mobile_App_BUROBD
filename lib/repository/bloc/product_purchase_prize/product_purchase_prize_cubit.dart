import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'product_purchase_prize_state.dart';

class ProductPurchasePrizeCubit extends Cubit<ProductPurchasePrizeState> {

  BuroRepository repository;
  ProductPurchasePrizeCubit(this.repository) : super(ProductPurchasePrizeInitialState());
  final List<ProductPurchase> purchaseList = [] ;

  addProduct(ProductPurchase productPurchase){

    purchaseList.add(productPurchase);


  }


  List<ProductPurchase> getProductList(){

    emit(ProductPurchasePrizeLoadedState(purchaseList)) ;
    return purchaseList;

  }


  deletePurchaseProduct(int position){

    purchaseList.removeAt(position);
   // emit(ProductSalePriceLoadedState(productList)) ;

  }


  Future<ProductPurchasePriceEdit> getProductPurchasePrice(int customerID) async {


    print('getProductPurchasePrice Called');

    emit(ProductPurchasePrizeInitialState());
    // try {
    emit(ProductPurchasePrizeLoadingState());
    var response = await repository.getProductPurchasePrice(customerID);


    emit(ProductPurchasePrizeLoadedFromAPIState(response.data!));


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }




}
