import 'package:buro_employee/repository/bloc/emp_general_info/emp_general_info_cubit.dart';
import 'package:buro_employee/repository/models/employee_general_info.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:buro_employee/views/general_info/generalInfo_search_filter.dart';
import 'package:buro_employee/views/general_info/generalinfo_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bloc/branch_list/branch_list_cubit.dart';
import '../../localization/Language/languages.dart';
import '../../repository/bloc/annual_appraisal/apa_employee_list_cubit.dart';
import '../../repository/bloc/designation_list/designation_list_cubit.dart';
import '../../repository/bloc/liability_list/liability_list_cubit.dart';
import '../../repository/models/annual_appraisal.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/asset_paths.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class EmployeeGeneralInfoList extends StatefulWidget {
  //const EmployeeInfoList({super.key});
  static const routeName = '/employeeInfoList';
  GeneralInfoSearchFilterModel arguments;


  EmployeeGeneralInfoList( this.arguments,{Key? key}) : super(key: key);

  //static route() => MaterialPageRoute(builder: (_) => EmployeeGeneralInfoList(ar));
  @override
  State<EmployeeGeneralInfoList> createState() => _EmployeeGeneralInfoListState();
}

class _EmployeeGeneralInfoListState extends State<EmployeeGeneralInfoList> {

  late AnnualAppraisalCubit bloc;
  late EmpGeneralInfoCubit empGeneralInfoCubit;
  var _searchControllerEmpCode = TextEditingController();

  var count = 0;
  var repository = BuroRepository();
  late DesignationListCubit designationListCubit;
  late LiabilityListCubit liabilityListCubit;
  late BranchListCubit branchListCubit;
  late DesignationData selectedDesignation;
  late DepartmentData selectedDepartment;
  late DivisionData selectedDivision;
  late AreaListData selectedArea;
  late RecomListData selectRecom;


  final ScrollController _scrollController = ScrollController();
  final List<int> _data = [];
  bool _isLoading = false;
  int _page = 1;


  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  final int limit = 10;


  bool noDataFound = false;

  List<EmployeeGeneralInfoData>? _oldListItems=[];
  List<EmployeeGeneralInfoData>? _newListItems = [];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorResources.APP_THEME_COLOR,
          iconTheme: IconThemeData(color: ColorResources.WHITE),
          title: Center(
            child: Text(
              'Employee Info',
              style: Styles.appBarTextStyle,
            ),
          ),

          actions: [
            IconButton(
              icon: Icon(Icons.filter_alt_outlined),
              onPressed: () {
                // Handle action

                Navigator.pushNamed(
                  context,
                  GeneralInfoSearchFilter.routeName,
                );
              },
            ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //bloc.getApaEmployeeList(0,_searchController.text.trim(),0,0,0,0,0,0,0,0,0,0,0);
            //empGeneralInfoCubit.getEmpGeneralInfo(GeneralInfoSearchFilterModel(employeeCode: _searchControllerEmpCode.text,pageNumber: 1, pageSize: 10));
            widget.arguments = GeneralInfoSearchFilterModel();
            if(_searchControllerEmpCode.text.isNotEmpty){
              page = 1;
              fetchItems();
            }


          },
          child: Icon(Icons.search,color: ColorResources.WHITE,),
          backgroundColor: ColorResources.APP_THEME_COLOR,

        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7,),
              Visibility(
                visible:isLoading ,
                child: LinearProgressIndicator(
                  color: ColorResources.APP_THEME_COLOR,
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8),
                      child: Container(
                        child: TextFormField(

                          keyboardType: TextInputType.number,
                          enableSuggestions: true,
                          controller: _searchControllerEmpCode,
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
                                  color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                                  width: 0.0),
                            ),
                            //prefixIcon: Icon(Icons.search),
                            hintText: 'Employee Code',
                            label: Text('Employee Code'),
                            hintStyle: Styles.hintTextStyle,
                            contentPadding: EdgeInsets.all(20),
                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                    SizedBox(
                      width: 10,
                    ),

                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    child:  Column(
                      children: [
                        Expanded(
                            child: noDataFound == true ?
                            Container(
                              child: Center(child: Text('No Data Found'),),)
                            :ListView.builder(
                                itemCount: _oldListItems!.length,
                                controller: _scrollController,
                                itemBuilder: (BuildContext context, int index) {
                                  var employeeItem = _oldListItems![index];
                                  if(index < _oldListItems!.length){
                                    return  Padding(
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
                                        child: Row(
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
                                                              ClipOval(
                                                                child: Image.network(
                                                                  'http://apps.burobd.org/EmpPhoto/${employeeItem.employeeCode}.jpg',
                                                                  loadingBuilder: (context, child, loadingProgress) {
                                                                    if (loadingProgress == null) return child;
                                                                    return Center(
                                                                      child: CircularProgressIndicator(
                                                                        value: loadingProgress.expectedTotalBytes != null
                                                                            ? loadingProgress.cumulativeBytesLoaded /
                                                                            (loadingProgress.expectedTotalBytes ?? 1)
                                                                            : null,
                                                                      ),
                                                                    );
                                                                  },
                                                                  errorBuilder: (context, error, stackTrace) {
                                                                    return const Icon(Icons.error, size: 50, color: Colors.red);
                                                                  },
                                                                  width: 50,
                                                                  height: 50,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                    padding: const EdgeInsets.only(bottom: 10,left: 10),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text(
                                                                          "${employeeItem.employeeCode??''} - ${employeeItem.employeeName}",
                                                                          style: Styles
                                                                              .listHeaderTextStyle,

                                                                          softWrap: false,
                                                                          maxLines: 2,
                                                                          overflow: TextOverflow.ellipsis,

                                                                        ),
                                                                        Text(
                                                                          "${employeeItem.designationName!}",
                                                                          style: Styles
                                                                              .listHeaderTextStyle,

                                                                          softWrap: false,
                                                                          maxLines: 2,
                                                                          overflow: TextOverflow.ellipsis,

                                                                        ),
                                                                      ],)
                                                                ),
                                                              ),



                                                            ],

                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Icon(Icons.account_balance,size: 20,),
                                                                      SizedBox(width: 5,),
                                                                      Text(
                                                                        employeeItem.siteName!,
                                                                        style: Styles
                                                                            .listDescHeadingTextStyle,
                                                                        maxLines:
                                                                        1,
                                                                        softWrap:
                                                                        false,
                                                                        overflow:
                                                                        TextOverflow.ellipsis,
                                                                      ),
                                                                    ],),

                                                                  SizedBox(height: 7,),
                                                                  /* Row(
                                                                    children: [
                                                                      Icon(Icons.account_balance, size: 20),
                                                                      SizedBox(width: 5),
                                                                      Text(
                                                                        employeeItem.zoneName ?? '',
                                                                        style: Styles.listDescHeadingTextStyle,
                                                                        softWrap: false,
                                                                        overflow: TextOverflow.ellipsis,
                                                                      ),
                                                                    ],
                                                                  ),*/
                                                                  InkWell(
                                                                    onTap: (){
                                                                      CommonMethods.makePhoneCall(employeeItem.corporatEMOBILE!);
                                                                    },
                                                                    child: Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(left: 3,right: 3,top: 3,bottom: 3),
                                                                          child: Icon(Icons.add_call,size: 20,),
                                                                        ),

                                                                        Text(
                                                                          employeeItem.corporatEMOBILE??'',
                                                                          style: Styles
                                                                              .listDescHeadingTextStyle,
                                                                          maxLines:
                                                                          1,
                                                                          softWrap:
                                                                          false,
                                                                          overflow:
                                                                          TextOverflow.ellipsis,
                                                                        ),
                                                                      ],
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                    ),
                                                                  ),
                                                                ],),
                                                              SizedBox(width: 7,),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                  children: [
                                                                    /*  Row(
                                                                      children: [
                                                                        Icon(Icons.add_business,size: 20,),
                                                                        SizedBox(width: 5,),
                                                                        Expanded(
                                                                          child: Text(
                                                                            employeeItem.liabilityFriendlyName!,
                                                                            style: Styles
                                                                                .listDescHeadingTextStyle,
                                                                            softWrap: false,
                                                                            overflow: TextOverflow.ellipsis,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,

                                                                    ),*/

                                                                    SizedBox(height: 27,),

                                                                    Row(
                                                                      children: [
                                                                        Icon(Icons.bloodtype_outlined, size: 20),
                                                                        SizedBox(width: 5),
                                                                        Expanded(
                                                                          child: Text(
                                                                            employeeItem.bloodGroup ?? '',
                                                                            style: Styles.listDescHeadingTextStyle,
                                                                            softWrap: false,
                                                                            overflow: TextOverflow.ellipsis,

                                                                          ),
                                                                        ),


                                                                      ],

                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                    ),

                                                                  ],),
                                                              )


                                                            ],),





                                                          /* Row(
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

                                                                  },
                                                                  child: Text(
                                                                    'Edit',
                                                                    style:
                                                                    Styles.listButtonTextStyle,
                                                                  )),
                                                              flex: 1,
                                                            ),


                                                          ],
                                                        )*/
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
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }


                                })
                            )
                      ],),


                  ),
                ),
              ),
            ]),
      ),
    );
  }




  Future<bool> _willPopCallback() async {
    Navigator.pushNamed(
        context, GeneralInfoMain.routeName);
    return true;
  }

  @override
  void dispose() {

    print('EMPLOYEE Dispose called ');

    _scrollController.dispose();

    branchListCubit.branchList.clear();
    designationListCubit.designationList.clear();
    // branchListCubit.selectBranch.c;


    super.dispose();
  }
  Future refresh() {
    return Future.delayed(
      Duration(seconds: 1),
          () {
        //empGeneralInfoCubit.getApaEmployeeList(GeneralInfoSearchFilterModel(siteID: widget.arguments.siteID,designationID: widget.arguments.designationID,liabilityID: widget.arguments.liabilityID));
      },
    );
  }

  @override
  void initState() {
    designationListCubit = context.read<DesignationListCubit>();
    liabilityListCubit = context.read<LiabilityListCubit>();
    branchListCubit = context.read<BranchListCubit>();



    print('EMPLOYEE Length ${branchListCubit.branchList.length}  IsEmpty  ${branchListCubit.branchList.isEmpty}');

    if(branchListCubit.branchList.isEmpty){
      branchListCubit.getBranchList();
      designationListCubit.getDesignationList();
    }


    /* siteID: widget.arguments.siteID??0,
    designationID: widget.arguments.designationID??0,
    bloodGroup: widget.arguments.bloodGroup??'',
    employeeCode: _searchControllerEmpCode.text??'',
    employeeName: widget.arguments.employeeName,*/

    print('widget.arguments.siteID ${widget.arguments.siteID} \n'
        'widget.arguments.designationID ${widget.arguments.designationID}\n'
        'widget.arguments.bloodGroup ${widget.arguments.bloodGroup}\n'
        'widget.arguments.employeeName ${widget.arguments.employeeName}\n'
        '_searchControllerEmpCode.text ${_searchControllerEmpCode.text}');


    if(widget.arguments.siteID != null){

      if(widget.arguments.siteID != 0 ||
          widget.arguments.designationID != 0 ||
          widget.arguments.bloodGroup!.isNotEmpty ||
          widget.arguments.employeeName!.isNotEmpty
      ){
        page = 1;
        fetchItems();
      }



    }


    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
          !isLoading &&
          hasMore) {
        fetchItems();
      }
    });

    empGeneralInfoCubit = context.read<EmpGeneralInfoCubit>();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
          !isLoading &&
          hasMore) {
        fetchItems();
      }
    });


    super.initState();
  }


  Future<void> fetchItems() async {

    setState(() => isLoading = true);



    final response=  await repository.getEmpGeneralInfo(
        GeneralInfoSearchFilterModel(
            siteID: widget.arguments.siteID??0,
            designationID: widget.arguments.designationID??0,
            bloodGroup: widget.arguments.bloodGroup??'',
            employeeCode: _searchControllerEmpCode.text??'',
            employeeName: widget.arguments.employeeName,
            pageNumber: page,
            pageSize: limit
        ));




    print('Data ${response.success}');
    if (response.success == true) {
      noDataFound = false;
      print('In success');
      final List<EmployeeGeneralInfoData>  newItems = response.data!;
      setState(() {
        if (newItems.length > limit) {
          print('In first Condition ${newItems.length} $limit');
          page++;
          _oldListItems?.addAll(newItems);
        } else if (newItems.length == limit){
          page++;
          _oldListItems?.addAll(newItems);
        } else {
          print('In Second Condition ${newItems.length} $limit');
          _oldListItems = newItems;

        }
        print('In Set State');
        /* page++;
        _oldListItems?.addAll(newItems);*/
        if (newItems.length < limit) {
          hasMore = false;

        }
      });
    } else {


      setState(() {
        noDataFound = true;
      });

    }

    setState(() => isLoading = false);
  }





}


