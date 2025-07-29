import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'product_sale_price_state.dart';

class ProductSalePriceCubit extends Cubit<ProductSalePriceState> {
  BuroRepository repository;

  ProductSalePriceCubit(this.repository) : super(ProductSalePriceInitialState());
  final List<ProductSale> productList = [] ;


  addProduct(ProductSale productPurchase){

     productList.add(productPurchase);


  }

  deleteProduct(int position){

    productList.removeAt(position);
    emit(ProductSalePriceLoadedState(productList)) ;

  }


  List<ProductSale> getProductList(){

    emit(ProductSalePriceLoadedState(productList)) ;


    return productList;
    
    
  }




  Future<ProductSalePriceEdit> getProductSalePrice(int customerID) async {


    emit(ProductSalePriceInitialState());
    // try {
    emit(ProductSalePriceLoadingState());
    var response = await repository.getProductSalePrice(customerID);


    emit(ProductSalePriceLoadedFromAPIState(response.data!));


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }





}
