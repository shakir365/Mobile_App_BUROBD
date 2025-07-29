import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'sales_cash_book_state.dart';

class SalesCashBookCubit extends Cubit<SalesCashBookState> {

  final BuroRepository repository;


  bool _hasSalesCashBookInfo = false;
  bool _hasPurchaseCashBookInfo = false;
  bool _hasBankBalanceInfo = false;
  bool _hasSalesInfo = false;
  bool _hasPurchaseInfo = false;
  bool _hasStockInfo = false;


  bool _hasBusinessExpenseInfo = false;
  bool _hasOtherIncomeInfo = false;
  bool _hasPersonalExpenseInfo = false;
  bool _hasExistingLoanInfo = false;
  bool _hasRegularInvestmentInfo = false;
  bool _hasProductSalePriceInfo = false;
  bool _hasProductPurchasePriceInfo = false;

  bool get hasSalesCashBookInfo => _hasSalesCashBookInfo;

  set hasSalesCashBookInfo(bool value) {
    _hasSalesCashBookInfo = value;
  }

  bool _hasManufacturingOneInfo = false;
  bool _hasManufacturingTwoInfo = false;
  bool _hasQualitativeAspectsInfo = false;

  SalesCashBookCubit(this.repository) : super(SalesCashBookInitialState());



  Future<SalesCashbookEdit> getSalesCashBook(int customerID) async {

    emit(SalesCashBookInitialState());
    // try {
    emit(SalesCashBookLoadingState());

    var response = await repository.getSalesCashBook(customerID);


    emit(SalesCashBookLoadedState(response.data));


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }


  }

  bool get hasPurchaseCashBookInfo => _hasPurchaseCashBookInfo;

  set hasPurchaseCashBookInfo(bool value) {
    _hasPurchaseCashBookInfo = value;
  }

  bool get hasBankBalanceInfo => _hasBankBalanceInfo;

  set hasBankBalanceInfo(bool value) {
    _hasBankBalanceInfo = value;
  }

  bool get hasSalesInfo => _hasSalesInfo;

  set hasSalesInfo(bool value) {
    _hasSalesInfo = value;
  }

  bool get hasPurchaseInfo => _hasPurchaseInfo;

  set hasPurchaseInfo(bool value) {
    _hasPurchaseInfo = value;
  }

  bool get hasStockInfo => _hasStockInfo;

  set hasStockInfo(bool value) {
    _hasStockInfo = value;
  }

  bool get hasBusinessExpenseInfo => _hasBusinessExpenseInfo;

  set hasBusinessExpenseInfo(bool value) {
    _hasBusinessExpenseInfo = value;
  }

  bool get hasOtherIncomeInfo => _hasOtherIncomeInfo;

  set hasOtherIncomeInfo(bool value) {
    _hasOtherIncomeInfo = value;
  }

  bool get hasPersonalExpenseInfo => _hasPersonalExpenseInfo;

  set hasPersonalExpenseInfo(bool value) {
    _hasPersonalExpenseInfo = value;
  }

  bool get hasExistingLoanInfo => _hasExistingLoanInfo;

  set hasExistingLoanInfo(bool value) {
    _hasExistingLoanInfo = value;
  }

  bool get hasRegularInvestmentInfo => _hasRegularInvestmentInfo;

  set hasRegularInvestmentInfo(bool value) {
    _hasRegularInvestmentInfo = value;
  }

  bool get hasProductSalePriceInfo => _hasProductSalePriceInfo;

  set hasProductSalePriceInfo(bool value) {
    _hasProductSalePriceInfo = value;
  }

  bool get hasProductPurchasePriceInfo => _hasProductPurchasePriceInfo;

  set hasProductPurchasePriceInfo(bool value) {
    _hasProductPurchasePriceInfo = value;
  }

  bool get hasManufacturingOneInfo => _hasManufacturingOneInfo;

  set hasManufacturingOneInfo(bool value) {
    _hasManufacturingOneInfo = value;
  }

  bool get hasManufacturingTwoInfo => _hasManufacturingTwoInfo;

  set hasManufacturingTwoInfo(bool value) {
    _hasManufacturingTwoInfo = value;
  }

  bool get hasQualitativeAspectsInfo => _hasQualitativeAspectsInfo;

  set hasQualitativeAspectsInfo(bool value) {
    _hasQualitativeAspectsInfo = value;
  }
}
