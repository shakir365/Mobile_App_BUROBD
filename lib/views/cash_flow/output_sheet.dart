import 'package:buro_employee/repository/bloc/acash_flow/all_cash_inflow/all_cash_inflow_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/business_cash_outflow/business_cash_outflow_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/frequency/frequency_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/house_hold_expenses/house_hold_expenses_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/loan_eligibility/loan_eligibility_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/margin/margin_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/other_recurring_expense/other_recurring_expense_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/seasonality_n_margin/seasonality_n_margin_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/working_capital/working_capital_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/working_capital_requirment/working_capital_requirment_cubit.dart';
import 'package:buro_employee/repository/models/customer_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../localization/Language/languages.dart';
import '../../repository/models/OutputSheet.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cash_flow_main.dart';

class OutputSheet extends StatefulWidget {
  static const String routeName = '/inputSheetSteps';

  final CustomerDetailsArguments arguments;

  const OutputSheet(this.arguments, {Key? key}) : super(key: key);

  @override
  _OutputSheetState createState() => _OutputSheetState();
}

class _OutputSheetState extends State<OutputSheet>
    with SingleTickerProviderStateMixin {
  List<String> titles = <String>[
    'All Cash Inflow', //1
    'Business Cash Outlfow', //2
    'House hold Expenses', //3
    'Other recurring \n Expense/Investment', //4
    'Loan Eligibility', //5
    'Frequency', //6
    'Seasonality and Margin', //7
    'Working Capital', //8
    'Working Capital Requirements',
  ];

  late AllCashInflowCubit allCashInflowCubit;
  late final tabController;
  late BusinessCashOutflowCubit businessCashOutflowCubit;
  late HouseHoldExpensesCubit householdExpensesCubit;
  late OtherRecurringExpenseCubit otherRecurringExpenseCubit;
  late LoanEligibilityCubit loanEligibilityCubit;
  late FrequencyCubit frequencyCubit;
  late SeasonalityNMarginCubit seasonalityNMarginCubit;
  late WorkingCapitalCubit workingCapitalCubit;
  late WorkingCapitalRequirmentCubit workingCapitalRequirmentCubit;
  late MarginCubit marginCubit;
  String nextButtonText = 'Next';

  @override
  void initState() {
    tabController = TabController(length: titles.length, vsync: this);
    super.initState();

    allCashInflowCubit = context.read<AllCashInflowCubit>();
    businessCashOutflowCubit = context.read<BusinessCashOutflowCubit>();
    householdExpensesCubit = context.read<HouseHoldExpensesCubit>();
    otherRecurringExpenseCubit = context.read<OtherRecurringExpenseCubit>();
    loanEligibilityCubit = context.read<LoanEligibilityCubit>();
    frequencyCubit = context.read<FrequencyCubit>();
    seasonalityNMarginCubit = context.read<SeasonalityNMarginCubit>();
    workingCapitalCubit = context.read<WorkingCapitalCubit>();
    workingCapitalRequirmentCubit =
        context.read<WorkingCapitalRequirmentCubit>();
    marginCubit = context.read<MarginCubit>();

    allCashInflowCubit.getAllCashInFlow(widget.arguments.customerID);
    businessCashOutflowCubit
        .getBusinessCashOutFlow(widget.arguments.customerID);
    businessCashOutflowCubit.getBusinessNetProfit(widget.arguments.customerID);
    businessCashOutflowCubit
        .getNetHouseHoldSurplus(widget.arguments.customerID);
    householdExpensesCubit.getHouseholdExpenses(widget.arguments.customerID);
    otherRecurringExpenseCubit
        .getOtherRecurringExpense(widget.arguments.customerID);
    otherRecurringExpenseCubit
        .getTotalMonthlySurplus(widget.arguments.customerID);
    loanEligibilityCubit.getLoanEligibility(widget.arguments.customerID);
    frequencyCubit.getFrequency(widget.arguments.customerID);
    seasonalityNMarginCubit.getSeasonalityInfo(widget.arguments.customerID);
    seasonalityNMarginCubit.getMargin(widget.arguments.customerID);
    workingCapitalCubit.getWorkingCapital(widget.arguments.customerID);
    workingCapitalRequirmentCubit
        .getWorkingCapitalRequirements(widget.arguments.customerID);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorResources.APP_THEME_COLOR,
          iconTheme: IconThemeData(color: ColorResources.WHITE),
          title: Text(
            'Output',
            style: Styles.appBarTextStyle,
          ),

          scrolledUnderElevation: 10.0,
          //shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            //padding: EdgeInsets.all(5),
            //indicatorSize: TabBarIndicatorSize(),
            labelColor: Colors.white, // Selected tab color
            unselectedLabelColor: Colors.black, // Unselected tab color
            indicatorColor: Colors.white, // Indicator color
            isScrollable: true,
            controller: tabController,
            onTap: (index){

              print('On tap Index $index');

              if(tabController.index == 8){

                setState(() {
                  nextButtonText = 'Finish';
                });
              } else {
                setState(() {
                  nextButtonText = 'Next';
                });
              }


            },
            tabs: <Widget>[
              Tab(
                child: Text(
                  titles[0],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  titles[1],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  titles[2],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  titles[3],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  titles[4],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  titles[5],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  titles[6],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  titles[7],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  titles[8],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            all_cash_flow(),
            business_cash_out_flow(),
            house_hold_expense(),
            other_recurring_expense(),
            loan_eligibility(),
            frequency(),
            seasonality(),
            working_capital(),
            working_capital_requirement()
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.arrow_back_ios,
                          size: 15, color: ColorResources.WHITE),
                      onPressed: () {
                        if (tabController.index > 0) {
                          tabController.animateTo(tabController.index - 1);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: ColorResources.APP_THEME_COLOR,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      label: Text(
                        'Previous',
                        style: Styles.buttonTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        print('tabController.index ${tabController.index}  ${titles.length}');
                        if (tabController.index < titles.length - 1) {

                          if(tabController.index == 7){

                            setState(() {
                              nextButtonText = 'Finish';
                            });
                          } else {
                            setState(() {
                              nextButtonText = 'Next';
                            });
                          }

                          tabController.animateTo(tabController.index + 1);



                        } else {

                          nextButtonText = 'Next';
                          setState(() {

                          });

                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            nextButtonText,
                            style: Styles.buttonTextStyle,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,
                              size: 15, color: ColorResources.WHITE),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: ColorResources.APP_THEME_COLOR,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget all_cash_flow() {
    return BlocConsumer<AllCashInflowCubit, AllCashInflowState>(
      listener: (context, state) {
        if (state is AllCashInflowErrorState) {
          /*final snackBar = SnackBar(
            content: Text(Languages.of(context)!.internetErrorText),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is AllCashInflowInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AllCashInflowLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AllCashInflowLoadedState) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: buildDataTable(state.data),
              ),
            ),
          );
        } else {
          // (state is WeatherError)
          return Center(
            child: Container(
              child: Text('No Data Found'),
            ),
          );
        }
      },
    );
  }

  Widget buildDataTable(List<AllCashInFlowData> data) {
    var rowList = <RowItem>[];

    data.asMap().forEach((index, value) => {
          rowList.add(
            RowItem(
              'Business Income',
              value.businessIncomeCashFlow ?? 0,
              value.businessIncomePrevCashFlow ?? 0,
            ),
          ),
          rowList.add(RowItem(
            'Agriculture Income',
            value.agricultureIncomeCashFlow ?? 0,
            value.agricultureIncomePrevCashFlow ?? 0,
          )),
          rowList.add(
            RowItem(
              'Rental Income',
              value.rentalIncomeCashFlow ?? 0,
              value.rentalIncomePrevCashFlow ?? 0,
            ),
          ),
          rowList.add(RowItem(
            'Salary Income \n(Family Members)',
            value.salaryIncomeCashFlow ?? 0,
            value.salaryIncomePrevCashFlow ?? 0,
          )),
          rowList.add(
            RowItem(
              'Allied Agri \n Income (livestock, fisheries)',
              value.alliedagriIncomeCashFlow ?? 0,
              value.alliedagriIncomePrevCashFlow ?? 0,
            ),
          ),
          rowList.add(RowItem(
            'Other Income',
            value.otherIncomeCashFlow ?? 0,
            value.otherIncomePrevCashFlow ?? 0,
          )),
          rowList.add(RowItem(
            'Total Businness Outflow',
            value.currentTotalCashFlow ?? 0,
            value.previousTotalCashFlow ?? 0,
          )),
        });

    return DataTable(
        columnSpacing: 1,
        columns: [
          DataColumn(label: Text('All Cash \nInflow \n(Tk)')),
          DataColumn(label: Text('Current\n Cash Flow\n (Tk)')),
          DataColumn(label: Text('Previous\n Cash Flow \n(Tk)')),
        ],
        rows: rowList
            .map((e) => DataRow(cells: [
                  DataCell(Text(e.heading)),
                  DataCell(Text(e.cashFlow.toString())),
                  DataCell(Text(e.previousCashFlow.toString())),
                ]))
            .toList());
  }

  DataRow buildDataRow(String label, String currentFlow, String prevFlow) {
    return DataRow(
      cells: [
        DataCell(Text(label)),
        DataCell(Text(currentFlow)),
        DataCell(Text(prevFlow)),
      ],
    );
  }

  Widget business_cash_out_flow() {
    return BlocConsumer<BusinessCashOutflowCubit, BusinessCashOutflowState>(
      listener: (context, state) {
        if (state is BusinessCashOutflowErrorState) {
          final snackBar = SnackBar(
            content: Text(Languages.of(context)!.internetErrorText),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is BusinessCashOutflowInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is BusinessCashOutflowLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is BusinessCashOutflowLoadedState) {
          var rowList = <RowItem>[];

          state.data.asMap().forEach((index, value) => {
                rowList.add(
                  RowItem(
                    'Purchases',
                    value.cashOutfowPurchases ?? 0,
                    value.prevCashOutfowPurchases ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Shop/Godown/Factory\n Rent',
                  value.cashOutfowRent ?? 0,
                  value.prevCashOutfowRent ?? 0,
                )),
                rowList.add(
                  RowItem(
                    'Electricity',
                    value.cashOutfowElectricity ?? 0,
                    value.prevCashOutfowElectricity ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Staff Salary',
                  value.cashOutfowStaffsalary ?? 0,
                  value.prevCashOutfowStaffsalary ?? 0,
                )),
                rowList.add(
                  RowItem(
                    'Telephone/Mobile/\nInternet',
                    value.telephonemobileinternet ?? 0,
                    value.telmobileinterprevloan ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Transport/Conveyance',
                  value.transport ?? 0,
                  value.transportpreviousloan ?? 0,
                )),
                rowList.add(
                  RowItem(
                    'Gas and Water',
                    value.gasandwater ?? 0,
                    value.gasandwaterpreviousloan ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Repair and \nMaintenance',
                  value.maintainence ?? 0,
                  value.maintainencepreviousloan ?? 0,
                )),
                rowList.add(
                  RowItem(
                    'Diesel for Generator',
                    value.dieselforgenerator ?? 0,
                    value.dieselforgeneratorprevloan ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Marketing',
                  value.marketing ?? 0,
                  value.marketingpreviousloan ?? 0,
                )),
                rowList.add(
                  RowItem(
                    'Labour Expense',
                    value.labourexpense ?? 0,
                    value.labourexpensepreviousloan ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Society Bill & Security',
                  value.societybillsecurity ?? 0,
                  value.societybillsecurityprevloan ?? 0,
                )),
                rowList.add(
                  RowItem(
                    'Tax',
                    value.tax ?? 0,
                    value.taxprevloan ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Entertainment',
                  value.entertainment ?? 0,
                  value.entertainmentpreviousloan ?? 0,
                )),
                rowList.add(
                  RowItem(
                    'Other Business \nExpense (10% of total expense)',
                    value.otherbusinessexpense ?? 0,
                    value.otherbusinessexpenseprevloan ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Total Business \nOutflow',
                  value.currentTotalCashOutflow ?? 0,
                  value.previousTotalCashOutflow ?? 0,
                )),
              });

          try {
            rowList.add(
              RowItem(
                'Net Profit From\n Business',
                businessCashOutflowCubit.netProfitList[0].currentcashflow ?? 0,
                businessCashOutflowCubit.netProfitList[0].previouscashflow ?? 0,
              ),
            );
          } on Exception catch (e) {
            print(e);
          }

          try {
            rowList.add(RowItem(
              'Net Household \nCash Surplus',
              businessCashOutflowCubit
                      .netHouseHoldSurplusList[0].currentcashflow ??
                  0,
              businessCashOutflowCubit
                      .netHouseHoldSurplusList[0].previouscashflow ??
                  0,
            ));
          } on Exception catch (e) {
            print(e);
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: DataTable(
                    columnSpacing: 5,
                    columns: [
                      DataColumn(label: Text('Business Cash\nOutflow (Tk)')),
                      DataColumn(label: Text('Current\n(Tk)')),
                      DataColumn(label: Text('Previous\n(Tk)')),
                    ],
                    rows: rowList
                        .map((e) => DataRow(cells: [
                              DataCell(Text(e.heading)),
                              DataCell(Text(e.cashFlow.toString())),
                              DataCell(Text(e.previousCashFlow.toString())),
                            ]))
                        .toList()),
              ),
            ),
          );
        }
        else if (state is BusinessCashOutflowErrorState) {
          // (state is WeatherError)
          return Center(
            child: Container(
              child: Text('No Data Found'),
            ),
          );
        } else {
          return Center(
            child: Container(
              child: Text('Network Error'),
            ),
          );
        }
      },
    );
  }

  Widget house_hold_expense() {
    return BlocConsumer<HouseHoldExpensesCubit, HouseHoldExpensesState>(
      listener: (context, state) {
        if (state is HouseHoldExpensesErrorState) {
          final snackBar = SnackBar(
            content: Text(Languages.of(context)!.internetErrorText),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is HouseHoldExpensesInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HouseHoldExpensesLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HouseHoldExpensesLoadedState) {
          var rowList = <RowItem>[];

          state.data.asMap().forEach((index, value) => {
                // Calculate the total cash outflow for the current entry
                rowList.add(
                  RowItem(
                    'House Rent',
                    value.houserent ?? 0,
                    value.houserentpreviousloan ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Food',
                  value.food ?? 0,
                  value.foodpreviousloan ?? 0,
                )),
                rowList.add(
                  RowItem(
                    'Clothing',
                    value.clothing ?? 0,
                    value.clothingpreviousloan ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Education - Monthly School\n and Tuition Fees',
                  value.educationmonthly ?? 0,
                  value.educationmonthlypreviousloan ?? 0,
                )),
                rowList.add(
                  RowItem(
                    'Electricity',
                    value.electricity ?? 0,
                    value.electricitypreviousloan ?? 0,
                  ),
                ),
                rowList.add(
                  RowItem(
                    'Transport',
                    value.transportconveyance ?? 0,
                    value.transportconveyanceprevloan ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Telephone/Mobile\n/Internet',
                  value.telmobileinter ?? 0,
                  value.telmobileinterprevloan ?? 0,
                )),
                rowList.add(
                  RowItem(
                    'Medical',
                    value.medical ?? 0,
                    value.medicalpreviousloan ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Entertainment',
                  value.entertainment ?? 0,
                  value.entertainmentpreviousloan ?? 0,
                )),
                rowList.add(
                  RowItem(
                    'Repair and Maintenance',
                    value.repairmaintenance ?? 0,
                    value.repairmaintenancepreviousloan ?? 0,
                  ),
                ),
                rowList.add(
                  RowItem(
                    'Maid',
                    value.maid ?? 0,
                    value.maidpreviousloan ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'House Tax',
                  value.housetax ?? 0,
                  value.housetaxpreviousloan ?? 0,
                )),
                rowList.add(
                  RowItem(
                    'Any other expense\n (10% of total expense)',
                    value.anyotherexpense ?? 0,
                    value.anyotherexpensepreviousloan ?? 0,
                  ),
                ),
                rowList.add(RowItem(
                  'Total Household\n Expense',
                  value.totalHouseholdexpense ?? 0,
                  value.totalPreviousMonthlyExpenses ?? 0,
                )),
              });

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: DataTable(
                    columnSpacing: 5,
                    columns: [
                      DataColumn(label: Text('Household \nExpenses (Tk)')),
                      DataColumn(label: Text('Current\n(Tk)')),
                      DataColumn(label: Text('Previous\n(Tk)')),
                    ],
                    rows: rowList
                        .map((e) => DataRow(cells: [
                              DataCell(Text(e.heading)),
                              DataCell(Text(e.cashFlow.toString())),
                              DataCell(Text(e.previousCashFlow.toString())),
                            ]))
                        .toList()),
              ),
            ),
          );
        } else if (state is HouseHoldExpensesErrorState){
          return Center(
            child: Container(
              child: Text('No Data Found'),
            ),
          );
        } else {
          // (state is WeatherError)
          return Center(
            child: Container(
              child: Text('Network Error test'),
            ),
          );
        }
      },
    );
  }

  Widget other_recurring_expense() {
    return BlocConsumer<OtherRecurringExpenseCubit, OtherRecurringExpenseState>(
      listener: (context, state) {
        if (state is OtherRecurringExpenseErrorState) {
          final snackBar = SnackBar(
            content: Text(Languages.of(context)!.internetErrorText),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is OtherRecurringExpenseInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is OtherRecurringExpenseLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is OtherRecurringExpenseLoadedState) {
          var rowList = <RowItem>[];

          // Calculate the total cash outflow for the current entry

          //print('totalMonthlySurplus list ${otherRecurringExpenseCubit.totalMonthlySurplus}');
          // print('Total Monthly Surplus customerID ${otherRecurringExpenseCubit.totalMonthlySurplus[0].currentMonthlySurplus}');
          rowList.add(
            RowItem(
              'Life Insurance',
              state.data[0].lifeinsurance ?? 0,
              state.data[0].lifeinsurancepreviousloan ?? 0,
            ),
          );
          rowList.add(RowItem(
            'General Insurance - \nFor Health and Business',
            state.data[0].generalinsurance ?? 0,
            state.data[0].generalinsurancepreviousloan ?? 0,
          ));
          rowList.add(
            RowItem(
              'DPS',
              state.data[0].dps ?? 0,
              state.data[0].dpspreviousloan ?? 0,
            ),
          );
          rowList.add(
            RowItem(
              'Total Other Recurring\n Investment/Expense',
              state.data[0].totalOtherRecurringExpense ?? 0,
              state.data[0].prevTotalOtherRecurringExpense ?? 0,
            ),
          );
          try {
            rowList.add(
                        RowItem(
                          'Total Monthly \n Surplus',
                          otherRecurringExpenseCubit
                              .totalMonthlySurplus[0].currentMonthlySurplus??0,
                          otherRecurringExpenseCubit
                              .totalMonthlySurplus[0].previousMonthlySurplus??0,
                        ),
                      );
          } catch (e) {
            rowList.add(
              RowItem(
                'Total Monthly \n Surplus',
                0,
                0,
              ),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: DataTable(
                    columnSpacing: 5,
                    columns: [
                      DataColumn(
                          label: Text(
                              'Other Recurring \nExpense/Investment (Tk)')),
                      DataColumn(label: Text('Current\n (Tk)')),
                      DataColumn(label: Text('Previous \n(Tk)')),
                    ],
                    rows: rowList
                        .map((e) => DataRow(cells: [
                              DataCell(Text(e.heading)),
                              DataCell(Text(e.cashFlow.toString())),
                              DataCell(Text(e.previousCashFlow.toString())),
                            ]))
                        .toList()),
              ),
            ),
          );
        }
        else if (state is OtherRecurringExpenseErrorState){

          return Center(
            child: Container(
              child: Text('No data found'),
            ),
          );
        } else {
          // (state is WeatherError)
          return Center(
            child: Container(
              child: Text('Network Error'),
            ),
          );
        }
      },
    );
  }

  Widget loan_eligibility() {
    return BlocConsumer<LoanEligibilityCubit, LoanEligibilityState>(
      listener: (context, state) {
        if (state is LoanEligibilityErrorState) {
          final snackBar = SnackBar(
            content: Text(Languages.of(context)!.internetErrorText),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        // print('HouseHoldExpenses State $state');
        if (state is LoanEligibilityInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is LoanEligibilityLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is LoanEligibilityLoadedState) {
          var rowList = <RowItem>[];

          NumberFormat formatter = NumberFormat("#,##0.00");
          rowList.add(
            RowItem(
              'Total Monthly\nSurplus',
              state.data[0].currentMonthlySurplus ?? 0,
              state.data[0].previousMonthlySurplus ?? 0,
            ),
          );
          rowList.add(RowItem(
            'Debt \nBurden',
            "${state.data[0].debtburden ?? 0}%",
            "${state.data[0].debtburdenpreviousloan ?? 0}%",
          ));
          rowList.add(RowItem(
            'Eligible EMI \nDebt Burden',
            state.data[0].eligibleEMIDebtBurden ?? 0,
            state.data[0].previousEligibleEMIDebtBurden ?? 0,
          ));
          rowList.add(
            RowItem(
              'Existing Loan EMI\n (Personal + Business)\n+ OD CC Interest',
              state.data[0].obligate ?? 0,
              state.data[0].previousloanobligation ?? 0,
            ),
          );
          rowList.add(
            RowItem(
              'Balance Surplus\n for new loan',
              state.data[0].balanceSurplusfornewloan ?? 0,
              state.data[0].previousBalSurplusNewloan ?? 0,
            ),
          );
          rowList.add(
            RowItem(
              'Customer \nAffordable EMI',
              state.data[0].customeraffordableemi ?? 0,
              state.data[0].previousloanaffortableemi ?? 0,
            ),
          );
          rowList.add(RowItem(
            'Monthly \nCash In hand',
            state.data[0].monthlycashinhandbusi ?? 0,
            state.data[0].cashinhandbusiprevln ?? 0,
          ));
          rowList.add(
            RowItem(
              'Eligible \nEMI (lower of J & K)',
              state.data[0].eligibleEMI ?? 0,
              state.data[0].previousLnEligibleEMI ?? 0,
            ),
          );
          rowList.add(
            RowItem(
                'Average Bank\n Balance : EMI',
                formatter.format(state.data[0].averageBankBalanceEMI ?? 0),
                formatter
                    .format(state.data[0].previousAverageBankBalanceEMI ?? 0)),
          );
          rowList.add(
            RowItem(
              'Eligible Loan \nAmount (PV)',
              state.data[0].eligibleLoanAmount ?? 0,
              state.data[0].eligibleLoanAmountPrevLoan ?? 0,
            ),
          );
          rowList.add(RowItem(
            'Proposed\n Rate',
            state.data[0].roiproposedpercentage ?? 0,
            state.data[0].previousloanroiproposed ?? 0,
          ));
          rowList.add(
            RowItem(
              'Proposed \nTenure',
              state.data[0].tenureappliedmonths ?? 0,
              state.data[0].tenureappliedmonths ?? 0,
            ),
          );
          rowList.add(
            RowItem(
              'Loan \nApplied',
              state.data[0].loanappliedamount ?? 0,
              state.data[0].previousloanamount ?? 0,
            ),
          );
          rowList.add(
            RowItem(
              'Max \nLoan Amount',
              state.data[0].maxLoanAmount ?? 0,
              state.data[0].maxLoanAmountPrevLoan ?? 0,
            ),
          );
          // rowList.add(RowItem('Final Amount',state.data[0].loanappliedamount?? 0,state.data[0].previousloanamount?? 0,)); // approved Loan amount

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: DataTable(
                    columnSpacing: 5,
                    columns: [
                      DataColumn(label: Text('Loan \nEligibility')),
                      DataColumn(label: Text('Current\n(Tk)')),
                      DataColumn(label: Text('Previous\n(Tk)')),
                    ],
                    rows: rowList
                        .map((e) => DataRow(cells: [
                              DataCell(Text(e.heading)),
                              DataCell(Text(e.cashFlow.toString())),
                              DataCell(Text(e.previousCashFlow.toString())),
                            ]))
                        .toList()),
              ),
            ),
          );
        }
        else if (state is LoanEligibilityErrorState){
          return Center(
            child: Container(
              child: Text('No Data Found'),
            ),
          );
        }
        else {
          // (state is WeatherError)
          return Center(
            child: Container(
              child: Text('Network Error'),
            ),
          );
        }
      },
    );
  }

  Widget frequency() {
    return BlocConsumer<FrequencyCubit, FrequencyState>(
      listener: (context, state) {
        if (state is FrequencyErrorState) {
          final snackBar = SnackBar(
            content: Text(Languages.of(context)!.internetErrorText),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        // print('HouseHoldExpenses State $state');
        if (state is FrequencyInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FrequencyLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is FrequencyLoadedState) {
          var rowListSales = <RowItemFour>[];
          var rowListPurchase = <RowItemFour>[];
          rowListSales.add(
            RowItemFour(
                'Monthly Sales \nAverage',
                state.data[0].salesDaily ?? 0,
                state.data[0].salesWeekly ?? 0,
                state.data[0].salesMonthly ?? 0),
          );
          rowListPurchase.add(
            RowItemFour(
                'Monthly Purchase \nAverage',
                state.data[0].purchaseDaily ?? 0,
                state.data[0].purchaseWeekly ?? 0,
                state.data[0].purchaseMonthly ?? 0),
          );
          return SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      'Sales',
                      style: Styles.listHeaderTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DataTable(
                      columnSpacing: 5,
                      columns: [
                        DataColumn(label: Text('Frequency\n (Sales)')),
                        DataColumn(label: Text('Sales\n Daily (Tk)')),
                        DataColumn(label: Text('Sales \nWeekly (Tk)')),
                        DataColumn(label: Text('Sales \nMonthly (Tk)')),
                      ],
                      rows: rowListSales
                          .map((e) => DataRow(cells: [
                                DataCell(Text(e.heading)),
                                DataCell(Text(e.daiyly.toString())),
                                DataCell(Text(e.weekly.toString())),
                                DataCell(Text(e.moonthly.toString())),
                              ]))
                          .toList()),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Purchase',
                      style: Styles.listHeaderTextStyle,
                    ),
                  ),
                  DataTable(
                      columnSpacing: 10,
                      columns: [
                        DataColumn(label: Text('Frequency \nPurchase')),
                        DataColumn(label: Text('Daily')),
                        DataColumn(label: Text('Weekly')),
                        DataColumn(label: Text('Monthly')),
                      ],
                      rows: rowListPurchase
                          .map((e) => DataRow(cells: [
                                DataCell(Text(e.heading)),
                                DataCell(Text(e.daiyly.toString())),
                                DataCell(Text(e.weekly.toString())),
                                DataCell(Text(e.moonthly.toString())),
                              ]))
                          .toList()),
                ],
              ),
            ),
          );
        }
        else if (state is FrequencyErrorState){
          return Center(
            child: Container(
              child: Text('No Data Found'),
            ),
          );
        }

        else {
          // (state is WeatherError)
          return Center(
            child: Container(
              child: Text('Network Error'),
            ),
          );
        }
      },
    );
  }

  Widget seasonality() {
    return BlocConsumer<SeasonalityNMarginCubit, SeasonalityNMarginState>(
      listener: (context, state) {
        if (state is SeasonalityNMarginErrorState) {
          final snackBar = SnackBar(
            content: Text(Languages.of(context)!.internetErrorText),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        // print('HouseHoldExpenses State $state');
        if (state is SeasonalityNMarginInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SeasonalityNMarginLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is SeasonalityNMarginLoadedState) {
          var rowList = <RowItemFive>[];
          var marginRowList = <RowItemFive>[];

          NumberFormat formatter = NumberFormat("#,##0.00");

          rowList.add(
            RowItemFive('Sales Volume \n Monthly (Tk.)', state.data[0].low ?? 0,
                state.data[0].normal ?? 0, state.data[0].high ?? 0, 0),
          );
          rowList.add(
            RowItemFive(
                'Months ',
                state.data[0].lowmonth ?? 0,
                state.data[0].normalmonth ?? 0,
                state.data[0].highmonth ?? 0,
                state.data[0].totalmonth ?? 0),
          );
          rowList.add(
            RowItemFive(
                'Total \n Sales',
                state.data[0].lowtotalsales ?? 0,
                state.data[0].normaltotalsales ?? 0,
                state.data[0].hightotalsales ?? 0,
                state.data[0].totalsales ?? 0),
          );
          rowList.add(
            RowItemFive('Average', 0, 0, 0, state.data[0].average ?? 0),
          );
          marginRowList.add(
            RowItemFive(
                'GP Margin',
                "${seasonalityNMarginCubit.marginList[0].gpAcutalMargin ?? 0}%",
                "${seasonalityNMarginCubit.marginList[0].gpStatedMargin ?? 0}%",
                "${formatter.format(seasonalityNMarginCubit.marginList[0].gpProductMargin ?? 0)}%",
                "${seasonalityNMarginCubit.marginList[0].gpPreviousLoanMargin ?? 0}%"),
          );
          marginRowList.add(
            RowItemFive(
                'NP Margin',
                "${seasonalityNMarginCubit.marginList[0].npAcutalMargin ?? 0}%",
                0,
                0,
                "${seasonalityNMarginCubit.marginList[0].npPreviousLoanMargin ?? 0}%"),
          );

          return SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataTable(
                      columnSpacing: 15,
                      columns: [
                        DataColumn(label: Text('Seasonality')),
                        DataColumn(label: Text('Low')),
                        DataColumn(label: Text('Medium')),
                        DataColumn(label: Text('High')),
                        DataColumn(label: Text('Total')),
                      ],
                      rows: rowList
                          .map((e) => DataRow(cells: [
                                DataCell(Text(e.heading)),
                                DataCell(Text(e.low.toString())),
                                DataCell(Text(e.normal.toString())),
                                DataCell(Text(e.high.toString())),
                                DataCell(Text(e.total.toString())),
                              ]))
                          .toList()),
                  SizedBox(
                    height: 10,
                  ),
                  DataTable(
                      columnSpacing: 15,
                      columns: [
                        DataColumn(label: Text('Margin')),
                        DataColumn(label: Text('Actual')),
                        DataColumn(label: Text('Stated')),
                        DataColumn(label: Text('Product \nMargin')),
                        DataColumn(label: Text('Previous \nLoan\n Margin')),
                      ],
                      rows: marginRowList
                          .map((e) => DataRow(cells: [
                                DataCell(Text(e.heading)),
                                DataCell(Text(e.low.toString())),
                                DataCell(Text(e.normal.toString())),
                                DataCell(Text(e.high.toString())),
                                DataCell(Text(e.total.toString())),
                              ]))
                          .toList()),
                ],
              ),
            ),
          );
        }
        else if (state is SeasonalityNMarginErrorState){
          return Center(
            child: Container(
              child: Text('No data found'),
            ),
          );
        } else {
          // (state is WeatherError)
          return Center(
            child: Container(
              child: Text('Network Error'),
            ),
          );
        }
      },
    );
  }

  Widget working_capital() {
    return BlocConsumer<WorkingCapitalCubit, WorkingCapitalState>(
      listener: (context, state) {
        if (state is SeasonalityNMarginErrorState) {
          final snackBar = SnackBar(
            content: Text(Languages.of(context)!.internetErrorText),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        // print('HouseHoldExpenses State $state');
        if (state is WorkingCapitalInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WorkingCapitalLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WorkingCapitalLoadedState) {
          var rowList = <RowItem>[];

          rowList.add(
            RowItem(
              'Debtors',
              state.data[0].debtorsCurrentLoan ?? 0,
              state.data[0].debtorsPreviousLoan ?? 0,
            ),
          );
          rowList.add(
            RowItem(
              'Stock',
              state.data[0].stockCurrentLoan ?? 0,
              state.data[0].stockPreviousLoan ?? 0,
            ),
          );
          rowList.add(
            RowItem(
              'Creditors',
              state.data[0].creditorsCurrentLoan ?? 0,
              state.data[0].creditorsPreviousLoan ?? 0,
            ),
          );
          rowList.add(
            RowItem(
              'Net Working \nCapital Cycle',
              state.data[0].netWorkingCapitalCycle ?? 0,
              state.data[0].netCapitalCyPreviousLoan ?? 0,
            ),
          );

          return SingleChildScrollView(
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                DataTable(
                    columns: [
                      DataColumn(label: Text('Working Capital\n Requirement')),
                      DataColumn(label: Text('Current \nLoan')),
                      DataColumn(label: Text('Previous\n Loan')),
                    ],
                    rows: rowList
                        .map((e) => DataRow(cells: [
                              DataCell(Text(e.heading)),
                              DataCell(Text(e.cashFlow.toString())),
                              DataCell(Text(e.previousCashFlow.toString())),
                            ]))
                        .toList()),
              ],
            )),
          );
        } else {
          // (state is WeatherError)
          return Center(
            child: Container(
              child: Text('Network Error test'),
            ),
          );
        }
      },
    );
  }

  Widget working_capital_requirement() {
    return BlocConsumer<WorkingCapitalRequirmentCubit,
        WorkingCapitalRequirmentState>(
      listener: (context, state) {
        if (state is WorkingCapitalRequirmentErrorState) {
          final snackBar = SnackBar(
            content: Text(Languages.of(context)!.internetErrorText),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        // print('HouseHoldExpenses State $state');
        if (state is WorkingCapitalRequirmentInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is WorkingCapitalRequirmentLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is WorkingCapitalRequirmentLoadedState) {
          var rowList = <RowItem>[];

          rowList.add(
            RowItem(
              'Sales Growth',
              "${state.data[0].salesGrowthCurrentLoan ?? 0}%",
              "${state.data[0].salesGrowthPreviousLoan ?? 0}%",
            ),
          );
          rowList.add(
            RowItem(
              'Sales',
              state.data[0].salesCurrentLoan ?? 0,
              state.data[0].salesPreviousLoan ?? 0,
            ),
          );
          rowList.add(
            RowItem(
              'WCC',
              state.data[0].wccCurrentLoan ?? 0,
              state.data[0].wccPreviousLoan ?? 0,
            ),
          );
          rowList.add(
            RowItem(
              'WC',
              state.data[0].wcCurrentLoanCalculation ?? 0,
              state.data[0].wcPreviousLoanCalculation ?? 0,
            ),
          );
          rowList.add(
            RowItem(
              'Current Working Capital',
              state.data[0].currentLoanWorkingCapital ?? 0,
              state.data[0].previousLoanWorkingCapital ?? 0,
            ),
          );
          rowList.add(
            RowItem(
              'Additional Working Capital',
              state.data[0].currentAdditionalWCapital ?? 0,
              state.data[0].previousAdditionalWCapital ?? 0,
            ),
          );

          return SingleChildScrollView(
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                DataTable(
                    //columnSpacing: 5,
                    columns: [
                      DataColumn(label: Text('Working Capital\n Requirement')),
                      DataColumn(label: Text('Current \nLoan')),
                      DataColumn(label: Text('Previous\n Loan')),
                    ],
                    rows: rowList
                        .map((e) => DataRow(cells: [
                              DataCell(Text(e.heading)),
                              DataCell(Text(e.cashFlow.toString())),
                              DataCell(Text(e.previousCashFlow.toString())),
                            ]))
                        .toList()),
              ],
            )),
          );
        }
        else if (state is WorkingCapitalRequirmentErrorState){
          return Center(
            child: Container(
              child: Text('No data found'),
            ),
          );
        } else {
          // (state is WeatherError)
          return Center(
            child: Container(
              child: Text('Network Error'),
            ),
          );
        }
      },
    );
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushNamed(context, CashFlowMain.routeName,
        arguments: widget.arguments);
    return true;
  }
}

DataRow buildDataRow(String title, String current, String previous) {
  return DataRow(cells: [
    DataCell(Text(title)),
    DataCell(Text(current)),
    DataCell(Text(previous)),
  ]);
}

DataRow buildDataRowWithFour(
    String frequency, String daily, String weekly, String monthly) {
  return DataRow(cells: [
    DataCell(Text(frequency)),
    DataCell(Text(daily)),
    DataCell(Text(weekly)),
    DataCell(Text(monthly)),
  ]);
}
DataRow buildDataRowWithFive(
    String seasonality, String low, String medium, String high, String total) {
  return DataRow(cells: [
    DataCell(Text(seasonality)),
    DataCell(Text(low)),
    DataCell(Text(medium)),
    DataCell(Text(high)),
    DataCell(Text(total)),
  ]);
}

class RowItem {
  late String heading;
  late dynamic cashFlow;
  late dynamic previousCashFlow;

  RowItem(this.heading, this.cashFlow, this.previousCashFlow);
}

class RowItemFour {
  late String heading;
  late int daiyly;
  late int weekly;
  late int moonthly;

  RowItemFour(this.heading, this.daiyly, this.weekly, this.moonthly);
}

class RowItemFive {
  late String heading;
  late dynamic low;
  late dynamic normal;
  late dynamic high;
  late dynamic total;

  RowItemFive(this.heading, this.low, this.normal, this.high, this.total);
}
