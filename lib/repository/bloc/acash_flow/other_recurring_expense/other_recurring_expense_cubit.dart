import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/OutputSheet.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:equatable/equatable.dart';

part 'other_recurring_expense_state.dart';

class OtherRecurringExpenseCubit extends Cubit<OtherRecurringExpenseState> {

  final BuroRepository buroRepository;
  OtherRecurringExpenseCubit(this.buroRepository) : super(OtherRecurringExpenseInitialState());


  List<TotalMonthlySurplusData> totalMonthlySurplus = [];


  Future<RecurringExpenseModel?> getOtherRecurringExpense(int customerID) async {

    emit(OtherRecurringExpenseInitialState());
     try {
    emit(OtherRecurringExpenseLoadingState());
    var response = await buroRepository.getRecurringExpense(customerID);


    emit(OtherRecurringExpenseLoadedState(response.data!));
    return response;
     } catch (e) {
       emit(OtherRecurringExpenseErrorState(e));
     }

     return null;
  }




  Future<TotalMonthlySurplusModel> getTotalMonthlySurplus(int customerID) async {

    /*emit(OtherRecurringExpenseInitialState());
    // try {
    emit(OtherRecurringExpenseLoadingState());*/
    var response = await buroRepository.getTotalMonthlySurplus(customerID);

    //totalMonthlySurplus.clear();

    try {
      response.data!.forEach((element) {

            print(' In Loop');
            totalMonthlySurplus.add(element);


          });
    } catch (e) {
      print(e);
    }


    print('Total Monthly Surplus ${totalMonthlySurplus[0].customerid}');

    // response.data!.insert(0, DivisionData(id:0,divisionCode: '00',divisionName: 'Select'));
    //print('Division Count >>>>>>> ${response.data?.length!!}');
    //emit(DesignationListLoadedState(response));
    //_selectDivision = response.data!.first;
    //emit(TotalMonthlySurplusLoadedState(response.data!));
    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }



}
