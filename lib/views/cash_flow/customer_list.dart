import 'package:buro_employee/repository/bloc/customer_list/customer_list_cubit.dart';
import 'package:buro_employee/repository/models/customer_details.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app.dart';
import '../../localization/Language/languages.dart';
import '../../sessionmanager/session_manager.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';

import 'cash_flow_main.dart';
class CustomerList extends StatefulWidget {
  static const String routeName = '/customerList';
  const CustomerList({Key? key}) : super(key: key);
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  var count = 0;
  late CustomerListCubit customerListCubit;
  late BuroRepository buroRepository;
  late TextEditingController _customerID;
  late TextEditingController _branhCode;
  @override
  void initState() {
    print('Init state called');
    customerListCubit = context.read<CustomerListCubit>();
    _customerID = TextEditingController();
    _branhCode = TextEditingController();
    customerListCubit.getCustomerList(' ');
    buroRepository = BuroRepository();
    sessionManager.customerID.then(
        (value) => {print('In Session customerID customer_list ${value}')});
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    //customerListCubit.getCustomerList(0);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Customer List',
            style: Styles.appBarTextStyle,

          ),
          iconTheme: IconThemeData(color: ColorResources.WHITE),
          backgroundColor: ColorResources.APP_THEME_COLOR,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CashFlowMain.routeName,
                arguments: CustomerDetailsArguments(
                  '',
                  0,
                  false,
                  '',
                ));

            // customerListCubit.getExistingCustomerInfo(customerID.text, branhCode.text);

            // bloc.getApaEmployeeList(0,searchController.text.trim(),0,0,0,0,0,0,0,0,0,0,0);
          },
          child: Icon(Icons.add,color: ColorResources.WHITE,),
          backgroundColor: ColorResources.APP_THEME_COLOR,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'Search Existing Customer',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),


                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            enableSuggestions: true,
                            //controller: searchController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorResources.TEXT_FIELD_COLOR,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      color: ColorResources.APP_THEME_COLOR,
                                      style: BorderStyle.solid,
                                      width: 2)),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color:
                                        ColorResources.TEXT_FIELD_BORDER_COLOR,
                                    width: 0.0),
                              ),
                              //prefixIcon: Icon(Icons.search),
                              hintText: 'Search by Member ID',
                              hintStyle: Styles.hintTextStyle,
                              contentPadding: EdgeInsets.all(20),
                            ),
                            controller: _customerID,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // customerListCubit.getExistingCustomerInfo(customerID.text, branhCode.text);
                        customerListCubit.getCustomerList(_customerID.text);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Search',
                            style: Styles.buttonTextStyle,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: ColorResources.APP_THEME_COLOR,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      // NEW
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: BlocConsumer<CustomerListCubit, CustomerListState>(
                      listener: (context, state) {
                        if (state is CustomerListErrorState) {
                          final snackBar = SnackBar(
                            content:
                                Text(Languages.of(context)!.internetErrorText),
                            backgroundColor: Colors.red,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      buildWhen: (previous, current) => previous != current,
                      builder: (context, state) {
                        //print('Customer List State ${state}');
                        if (state is CustomerListInitialState) {
                          return Center(child: SizedBox());
                        } else if (state is CustomerListLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is CustomerListLoadedState) {
                          var requestList = state.data;
                          return requestList.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: requestList.length,
                                  itemBuilder: (context, index) {
                                    var item = requestList[index];

                                    var maritalStatus = 'Not Available';

                                    if (item.gender == 1) {
                                      maritalStatus = 'Male';
                                    } else if (item.gender == 2) {
                                      maritalStatus = 'Female';
                                    } else if (item.maritalStatus == 3) {
                                      maritalStatus = 'Other';
                                    }

                                    var customerStatus = '';
                                    var qualification = '';

                                    return InkWell(
                                      onTap: () {
                                        if (item.memberId != null &&
                                            item.customerId != null) {
                                          Navigator.pushNamed(
                                              context, CashFlowMain.routeName,
                                              arguments:
                                                  CustomerDetailsArguments(
                                                item.memberId!,
                                                item.customerId!,
                                                true,
                                                item.customerName!,
                                              ));
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, bottom: 16),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorResources.WHITE,
                                            border: Border.all(
                                                color: ColorResources
                                                    .LIST_BORDER_WHITE,
                                                width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                              10,
                                            )),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: Wrap(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 16,
                                                                  right: 16,
                                                                  bottom: 16,
                                                                  top: 16),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        "${item.memberId??''}   ${item.customerName}",
                                                                        style: Styles
                                                                            .listHeaderTextStyle,
                                                                      ),
                                                                      flex: 1,
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        customerStatus,
                                                                        style: Styles
                                                                            .listDescTextStyle,
                                                                        maxLines:
                                                                            1,
                                                                        softWrap:
                                                                            false,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                      flex: 1,
                                                                    ),
                                                                  ],
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        maritalStatus,
                                                                        style: Styles
                                                                            .listDescTextStyle,
                                                                        maxLines:
                                                                            1,
                                                                        softWrap:
                                                                            false,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                      flex: 1,
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        qualification,
                                                                        style: Styles
                                                                            .listDescTextStyle,
                                                                        maxLines:
                                                                            1,
                                                                        softWrap:
                                                                            false,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                      flex: 1,
                                                                    ),
                                                                  ],
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Current Balance',
                                                                      style: Styles
                                                                          .listDescHeadingTextStyle,
                                                                      softWrap:
                                                                          true,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      item.currentSavingsAmount
                                                                          .toString(),
                                                                      style: Styles
                                                                          .listDescTextStyle,
                                                                      maxLines:
                                                                          1,
                                                                      softWrap:
                                                                          false,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Previous Loan Savings Amount',
                                                                      style: Styles
                                                                          .listDescHeadingTextStyle,
                                                                      softWrap:
                                                                          true,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      item.previousLoanSavingAmount
                                                                          .toString(),
                                                                      style: Styles
                                                                          .listDescTextStyle,
                                                                      maxLines:
                                                                          1,
                                                                      softWrap:
                                                                          false,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Expanded(
                                                                      child: ElevatedButton(
                                                                          style: ElevatedButton.styleFrom(backgroundColor: ColorResources.LIST_BORDER_WHITE, elevation: 0
                                                                              // minimumSize: const Size.fromHeight(50), // NEW
                                                                              ),
                                                                          onPressed: () {
                                                                            /* var item =
                                                                                  snapshot.data![index];*/
                                                                            /* print(
                                                                  'Click Item data${item.id}\n'
                                                                  'startDate ${item.startDate}'
                                                                  'endDate ${item.endDate}'
                                                                  'startTime ${item.startTime}'
                                                                  'endTime ${item.endTime}'
                                                                  'startForm ${item.startForm}'
                                                                  'endForm ${item.endForm}'
                                                                  'reason ${item.reason}'
                                                                  'transport ${item.transport}');*/

                                                                            /*Navigator.pushNamed(
                                                                                      context, Apply.routeName,
                                                                                      arguments: item);*/
                                                                          },
                                                                          child: Text(
                                                                            'Edit',
                                                                            style:
                                                                                Styles.listButtonTextStyle,
                                                                          )),
                                                                      flex: 1,
                                                                    ),

                                                                    /* Expanded(
                                                                        child: ElevatedButton(
                                                                            style: ElevatedButton.styleFrom(
                                                                              elevation: 0,
                                                                              primary: ColorResources
                                                                                  .CANCEL_BUTTON_COLOR,
                                                                            ),
                                                                            onPressed: () async {

                                                                             // buroRepository.deleteCustomer(item.customerId!);
                                                                              refresh();


                                                                            },
                                                                            child: Text(
                                                                              'Delete',
                                                                              style: Styles
                                                                                  .cancelButtonTextStyle,
                                                                            )),
                                                                        flex: 1,
                                                                      ),*/
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    flex: 7,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              : Center(
                                  child:
                                      Text(Languages.of(context)!.noDataFound),
                                );
                        } else if (state is CustomerDetailErrorState) {
                          return Center(
                            child: Text(Languages.of(context)!.noDataFound),
                          );
                        } else {
                          // (state is WeatherError)
                          return Center(
                            child: Text('jhdhjdh'),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushNamedAndRemoveUntil(
        context, LandingScreen.routeName, (r) => false);
    return true;
  }

  Future refresh() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        customerListCubit.getCustomerList(' ');
      },
    );
  }


  @override
  void dispose() {
    _customerID.dispose();
    super.dispose();
  }
}
