import 'dart:convert';
import 'dart:io';

import 'package:buro_employee/repository/database/database_handler.dart';
import 'package:buro_employee/repository/models/ApprovedPlan.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:buro_employee/repository/models/apply_submit.dart';
import 'package:buro_employee/repository/models/approval_action.dart';
import 'package:buro_employee/repository/models/approval_request.dart';
import 'package:buro_employee/repository/models/approval_request_details.dart';
import 'package:buro_employee/repository/models/bill_download_info.dart';
import 'package:buro_employee/repository/models/bill_model.dart';
import 'package:buro_employee/repository/models/bill_request.dart';
import 'package:buro_employee/repository/models/bill_request_details.dart';
import 'package:buro_employee/repository/models/bill_submit_model.dart';
import 'package:buro_employee/repository/models/branch.dart';
import 'package:buro_employee/repository/models/change_pass_model.dart';
import 'package:buro_employee/repository/models/common_country/division.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:buro_employee/repository/models/customer_details_input.dart';
import 'package:buro_employee/repository/models/employee_general_info.dart';
import 'package:buro_employee/repository/models/field_visit_report.dart';
import 'package:buro_employee/repository/models/generate_otp.dart';
import 'package:buro_employee/repository/models/login_user.dart';
import 'package:buro_employee/repository/models/module.dart';
import 'package:buro_employee/repository/models/my_plan.dart';
import 'package:buro_employee/repository/models/my_request.dart';
import 'package:buro_employee/repository/models/my_request_details.dart';
import 'package:buro_employee/repository/models/plan_approval_details_model.dart';
import 'package:buro_employee/repository/models/plan_approval_request.dart';
import 'package:buro_employee/repository/models/plan_detail_model.dart';
import 'package:buro_employee/repository/models/request_cancel.dart';
import 'package:buro_employee/repository/models/request_cancel_all.dart';
import 'package:buro_employee/repository/models/sub_module.dart';
import 'package:buro_employee/repository/models/user_authenticate.dart';
import 'package:buro_employee/repository/models/verify_otp.dart';
import 'package:buro_employee/sessionmanager/session_manager.dart';
import 'package:buro_employee/shared/logic/http/api.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:buro_employee/utilities/environments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/LeaveModel.dart';
import '../models/Leaveinfo.dart';
import '../models/OutputSheet.dart';
import '../models/common_country/country.dart';
import '../models/customer_model.dart';
import '../models/device_info.dart';
import '../models/leave.dart';
import '../models/leaveapprovalaction.dart';
import '../models/leaveapprovalrequest.dart';
import '../models/leaveapprovalrequestdetails.dart';
import 'DioException.dart';
import 'DioException.dart';
//import 'package:http/http.dart' as http;
export 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
//import 'package:dio/io.dart';
class BuroApiProvider {
  Dio networkConfig() {
    var dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;

    dio.options = BaseOptions(
        headers: <String, String>{},
        baseUrl: environments.base_url,
        receiveDataWhenStatusError: true);

    /*  dio.interceptors.add(
      // For Print API RESPONSE IN LOG
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );*/


    return dio;
  }

  Dio networkConfigWithToken(String token) {
    var dio = Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;

    dio.options = BaseOptions(headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, baseUrl: environments.base_url, receiveDataWhenStatusError: true);


    /*  if(environments.base_url != 'api/BasicData/BranchList'){
      dio.interceptors.add(
        DioLoggingInterceptor(
          level: Level.body,
          compact: false,
        ),
      );

    }*/


    //dio..interceptors.add(new DialogInterceptor());
    //dio.interceptors.add( AuthTokenInterceptor(api));
    return dio;
  }

  Dio networkConfigWithHeader(String key, String value) {
    var dio = Dio();

    dio.options = BaseOptions(headers: <String, String>{
      key: value,
    }, baseUrl: environments.base_url, receiveDataWhenStatusError: true);

    /* dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );*/
    return dio;
  }

  Dio networkConfigWithoutAuth() {
    var dio = Dio();

    dio.options = BaseOptions(
        baseUrl: environments.base_url, receiveDataWhenStatusError: true);
    /*dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );*/
    return dio;
  }

  Dio networkConfigAuthNHeader(String headerKey, String headerValue,
      String username, String password) {
    var dio = Dio();

    dio.options.contentType = Headers.formUrlEncodedContentType;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    //print("USer NAme $username Password $password");

    dio.options = BaseOptions(headers: <String, String>{
      'authorization': basicAuth,
      headerKey: headerValue,
    }, baseUrl: environments.base_url, receiveDataWhenStatusError: true);

    /*dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );*/
    return dio;
  }

  Future<VerifyOtp> verifyOtp(String mobileOtp, String emailOtp) async {
    var token = await sessionManager.token;
    final response = await networkConfigWithToken(token).post(
      environments.submit_otp_login,
      data: {
        "mobileOtp": mobileOtp,
        "emailOtp": emailOtp,
      },
    );

    final verifyOtp = VerifyOtp.fromJson(response.data);

    return verifyOtp;
  }

  Future<UserAthenticate> getToken(String username, String password,
      [BuildContext? context]) async {
    //print('getToken called');
    late UserAthenticate authenticate;
    try {
      final response = await networkConfig().post(
        environments.userAuthenticate,
        data: {"loginID": username, "password": password},
      );

      authenticate = UserAthenticate.fromJson(response.data);
      await sessionManager.setToken(authenticate.token);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        print('Exception Login ${errorMessage}');
        Navigator.pop(context!);
        CommonMethods.showMessage(
            context, 'Wrong userId or password !', ColorResources.REJECT_COLOR);
      }
      throw DioException.fromDioError(e);
    }


    /*late UserAthenticate authenticate;
    try {
      final response = await networkConfig().post(
        environments.userAuthenticate,
        data: {"loginID": username, "password": password},
      );

      authenticate = UserAthenticate.fromJson(response.data);
      await sessionManager.setToken(authenticate.token);
    } catch (e) {
      print('Exception $e');
      //throw DioException.fromDioError(e);
    }*/


    return authenticate;
  }

  // After Login In App API collection

  Future<Module> getModule() async {
    //print('Get Module called ');
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var module;

    try {
      final response = await networkConfigWithToken('$token').get(
        environments.get_module,
      );
      //print('Response Status Code ${response.statusCode}');
      //print('RESPONSE ${response.data}');
      module = Module.fromJson(response.data);
    } on DioError catch (e) {
      //print('Get Module on error');
      final errorMessage = DioException.fromDioError(e).toString();

      // print('Error Message $errorMessage');

      if (errorMessage == 'Authentication failed.') {
        //print('Authentication failed error');
        await getToken(user, password);
        return getModule();
      }
      throw DioException.fromDioError(e);
    }

    return module;
  }

  Future<SubModule> getSubModule(String moduleId) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var submodule;

    try {
      final response = await networkConfigWithToken('$token').get(
        '${environments.sub_module}$moduleId',
      );
      submodule = SubModule.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getSubModule(moduleId);
      }
      throw DioException.fromDioError(e);
    }

    return submodule;
  }

  Future<MyRequest> getMyRequest() async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var requestList;

    try {
      final response = await networkConfigWithToken('$token').get(
        environments.my_request_list,
      );

      requestList = MyRequest.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getMyRequest();
      }
      throw DioException.fromDioError(e);
    }

    return requestList;
  }

  Future<MyRequestDetails> getRequestDetails(int applicationId) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var requestDetailsList;

    try {
      final response = await networkConfigWithToken('$token').post(
        environments.my_request_details,
        data: {"applicationID": applicationId},
      );

      requestDetailsList = MyRequestDetails.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getRequestDetails(applicationId);
      }
      throw DioException.fromDioError(e);
    }

    return requestDetailsList;
  }

  Future<RequestCancel> requestCancel(int appDetailsId,
      int applicationId) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var requestCancel;

    try {
      final response = await networkConfigWithToken('$token').put(
        environments.my_request_cancel_single,
        data: {
          "appDetailsID": appDetailsId,
          "applicationID": applicationId,
        },
      );

      requestCancel = RequestCancel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return requestCancel(appDetailsId, applicationId);
      }
      throw DioException.fromDioError(e);
    }

    return requestCancel;
  }

  Future<RequestCancelAll> requestCancelAll(int applicationId) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var requestCancelAll;

    try {
      final response = await networkConfigWithToken('$token').put(
        environments.my_request_cancel_all,
        data: {
          "applicationID": applicationId,
        },
      );

      requestCancelAll = RequestCancelAll.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return requestCancelAll(applicationId);
      }
      throw DioException.fromDioError(e);
    }

    return requestCancelAll;
  }

  Future<ApprovalRequest> getApprovalRequest() async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var requestList;

    try {
      final response = await networkConfigWithToken('$token').get(
        environments.approval_request_list,
      );

      requestList = ApprovalRequest.fromJson(response.data);
    } on DioError catch (e) {
      print('Get Sub Module on error');
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        print('Authentication failed error');
        await getToken(user, password);
        return getApprovalRequest();
      }
      throw DioException.fromDioError(e);
    }

    return requestList;
  }

  Future<ApprovalRequestDetails> getApprovalDetails(int applicationId) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var requestDetailList;

    try {
      final response = await networkConfigWithToken('$token').post(
        environments.approval_request_details,
        data: {"applicationID": applicationId},
      );

      requestDetailList = ApprovalRequestDetails.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getApprovalDetails(applicationId);
      }
      throw DioException.fromDioError(e);
    }

    return requestDetailList;
  }

  Future<ApprovalAction> approvalAction(int appDetailsId, int applicationId,
      String actionType) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var actionResponse;

    try {
      final response = await networkConfigWithToken('$token').put(
        environments.approval_action_single,
        data: {
          "appDetailsID": appDetailsId,
          "applicationID": applicationId,
          "ApprovalStatus": actionType
        },
      );

      actionResponse = ApprovalAction.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return approvalAction(appDetailsId, applicationId, actionType);
      }
      throw DioException.fromDioError(e);
    }

    return actionResponse;
  }

  Future<ApprovalAction> approvalActionAll(int applicationId,
      String actionType) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var approvalActionResponse;

    try {
      final response = await networkConfigWithToken('$token').put(
        environments.approval_action_all,
        data: {"applicationID": applicationId, "ApprovalStatus": actionType},
      );

      approvalActionResponse = ApprovalAction.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return approvalActionAll(applicationId, actionType);
      }
      throw DioException.fromDioError(e);
    }

    return approvalActionResponse;
  }

  Future<ApplySubmit> submitApplyList(List applyList, int planId) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var submitResponse;

    try {
      final response = await networkConfigWithToken('$token').post(
        '${environments.submit_apply}/$planId',
        data: applyList,
      );

      submitResponse = ApplySubmit.fromJson(response.data);
    } on DioError catch (e) {
      print('Get Sub Module on error');
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return submitApplyList(applyList, planId);
      }
      throw DioException.fromDioError(e);
    }

    return submitResponse;
  }

  Future<ChangePasswordModel> changePassword(String oldPass, String newPass,
      String confirmPass) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var response;

    try {
      final getResponse = await networkConfigWithToken('$token').post(
        environments.change_pass,
        data: {
          "oldPassword": oldPass,
          "newPassword": newPass,
          "confirmPassword": confirmPass
        },
      );

      response = ChangePasswordModel.fromJson(getResponse.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return changePassword(oldPass, newPass, confirmPass);
      }
      throw DioException.fromDioError(e);
    }
    return response;
  }

  Future<Branch> getAllBranch() async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    late Branch branchList;
    int count = 0;

    try {
      final response = await networkConfigWithToken('$token').get(
        environments.branch_list,
      );

      branchList = Branch.fromJson(response.data);

      branchList.data.forEach((element) {
        count++;
        var item = Item(element.branchCode!, element.branchName!);
        addBranchItem(item);
      });
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getAllBranch();
      }
      throw DioException.fromDioError(e);
    }

    return branchList;
  }

  Future<GenerateOTP> getOtp(String userId) async {
    final response = await networkConfigWithHeader(
        'BUROBD-GP_OTP', 'WgIvOJvZIdiXjiLgQa0wDaLit7WZuif4lksL9y')
        .post(
      environments.generate_otp,
      data: {
        "loginid": userId,
      },
    );

    final data = GenerateOTP.fromJson(response.data);

    return data;
  }

  Future<void> addBranchItem(Item item) async {
    var handler = DataBaseHandler.instance;
    var result;

    handler.initializeDBBranch().whenComplete(() async =>
    {
      result = await handler.insertBranchItem(item),
    });
  }

  Future<VerifyOtp> submitOtpForgotPass(String mobileOtp,
      String emailOtp) async {
    // This method used for submit OTP verify at forgot password

    var user = await sessionManager.userID;

    late VerifyOtp verifyOtp;

    try {
      final response = await networkConfigWithoutAuth().post(
        environments.submit_otp_forgot,
        data: {"loginID": user, "mobileOtp": mobileOtp, "emailOtp": emailOtp},
      );

      verifyOtp = VerifyOtp.fromJson(response.data);
    } on Exception catch (e) {
      print('Exception $e');
    }

    return verifyOtp;
  }

  Future<BillRequest> getBillRequest() async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var requestList;

    try {
      final response = await networkConfigWithToken('$token').get(
        environments.my_bill_req_list,
      );

      requestList = BillRequest.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getBillRequest();
      }
      throw DioException.fromDioError(e);
    }

    return requestList;
  }

  Future<ChangePasswordModel> resetPassword(String oldPass, String newPass,
      String confirmPass) async {
    var user = await sessionManager.userID;

    var response;

    try {
      final getResponse = await networkConfig().post(
        environments.changePassForgot,
        data: {
          "loginID": user,
          "oldPassword": oldPass,
          "newPassword": newPass,
          "confirmPassword": confirmPass
        },
      );

      response = ChangePasswordModel.fromJson(getResponse.data);
    } on Exception catch (e) {
      print('Exception $e');
    }

    return response;
  }

  Future<BillRequestDetails> getBillDetails(int applicationId) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var requestDetails;

    try {
      final response = await networkConfigWithToken('$token').post(
        environments.my_bill_req_details,
        data: {
          "applicationID": applicationId,
        },
      );

      requestDetails = BillRequestDetails.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getBillDetails(applicationId);
      }
      throw DioException.fromDioError(e);
    }

    return requestDetails;
  }

  Future<BillSubmitModel> billSubmit(List list) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var requestDetails;

    try {
      final response = await networkConfigWithToken('$token')
          .post(environments.my_bill_submit, data: list);

      requestDetails = BillSubmitModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return billSubmit(list);
      }
      throw DioException.fromDioError(e);
    }

    return requestDetails;
  }

  Future<BillDownloadInfo> getBillDownloadInfo(String applicationId) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var billDetails;

    print('ApplicationId   $applicationId');

    try {
      final response = await networkConfigWithToken('$token').post(
        environments.my_bill_download_info,
        data: {
          "reportType": "pdf/ word/ excel",
          "applicationID": applicationId
        },
      );

      billDetails = BillDownloadInfo.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getBillDownloadInfo(applicationId);
      }
      throw DioException.fromDioError(e);
    }

    return billDetails;
  }

  Future<PlanApprovalRequest> getPlanApproval() async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var planList;

    try {
      final response = await networkConfigWithToken('$token').get(
        environments.approval_plan_list,
      );

      planList = PlanApprovalRequest.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getPlanApproval();
      }
      throw DioException.fromDioError(e);
    }

    return planList;
  }

  Future<PlanDetailModel> getPlanDetail(int planId) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var planDetail;

    try {
      final response = await networkConfigWithToken('$token').get(
        '${environments.my_plan_detail}$planId',
      );

      planDetail = PlanDetailModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getPlanDetail(planId);
      }
      throw DioException.fromDioError(e);
    }

    return planDetail;
  }

  Future<PlanApprovalDetailsModel> getPlanApprovalDetail(int planId) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var planApprovalDetail;

    try {
      final response = await networkConfigWithToken('$token').get(
        '${environments.approval_plan_details}$planId',
      );

      planApprovalDetail = PlanApprovalDetailsModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getPlanApprovalDetail(planId);
      }
      throw DioException.fromDioError(e);
    }

    return planApprovalDetail;
  }

  Future<RequestCancel> cancelPlanReqIndividual(int planId) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var requestCancel;

    try {
      final response = await networkConfigWithToken('$token').put(
        '${environments.individual_plan_cancel}$planId',
      );

      requestCancel = RequestCancel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return cancelPlanReqIndividual(planId);
      }
      throw DioException.fromDioError(e);
    }

    return requestCancel;
  }

  Future<RequestCancel> cancelPlanRequestAll(int planId) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var requestCancelAll;

    try {
      final response = await networkConfigWithToken('$token').put(
        '${environments.all_plan_cancel}$planId',
      );

      requestCancelAll = RequestCancel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return cancelPlanRequestAll(planId);
      }
      throw DioException.fromDioError(e);
    }

    return requestCancelAll;
  }

  Future<ApprovalAction> planApprovalActionAll(// Plan action from list
      int planID,
      String actionType) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var actionResponse;

    try {
      final response = await networkConfigWithToken('$token').put(
          environments.all_plan_action,
          data: {"PlanID": planID, "ActivityName": actionType});

      actionResponse = PlanDetailModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return planApprovalActionAll(planID, actionType);
      }
      throw DioException.fromDioError(e);
    }

    return actionResponse;
  }

  Future<ApprovalAction> planApprovalActionIndividual(
      // Plan action from details
      int planDetailsID,
      int planID,
      String actionType) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var approvalActionResponse;

    try {
      final response = await networkConfigWithToken('$token').put(
        environments.individual_plan_action,
        data: {
          "PlanDetailsID": planDetailsID,
          "PlanID": planID,
          "ActivityName": actionType
        },
      );

      approvalActionResponse = ApprovalAction.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return planApprovalActionIndividual(planDetailsID, planID, actionType);
      }
      throw DioException.fromDioError(e);
    }

    return approvalActionResponse;
  }

  Future<MyPlan> getMyPlan() async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var planList;

    try {
      final response = await networkConfigWithToken('$token').get(
        environments.my_plan_list,
      );

      planList = MyPlan.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();

      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getMyPlan();
      }
      throw DioException.fromDioError(e);
    }

    return planList;
  }

  Future<ApplySubmit> submitPlan(var data) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var submitResponse;

    try {
      final response = await networkConfigWithToken('$token')
          .post(environments.submit_plan, data: data);

      submitResponse = ApplySubmit.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return submitPlan(data);
      }
      throw DioException.fromDioError(e);
    }

    return submitResponse;
  }

  Future<ApprovedPlan> getApprovedPlan() async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var planList;

    try {
      final response = await networkConfigWithToken('$token').get(
        environments.plan_list_approved,
      );

      planList = ApprovedPlan.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getApprovedPlan();
      }
      throw DioException.fromDioError(e);
    }

    return planList;
  }

  /*Future<UserAthenticate> getToken(String username, String password,
      [BuildContext? context]) async {
    //print('getToken called');
    late UserAthenticate authenticate;
    try {
      final response = await networkConfig().post(
        environments.userAuthenticate,
        data: {"loginID": username, "password": password},
      );

      authenticate = UserAthenticate.fromJson(response.data);
      await sessionManager.setToken(authenticate.token);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        print('Exception Login ${errorMessage}');
        Navigator.pop(context!);
        CommonMethods.showMessage(
            context, 'Wrong userId or password !', ColorResources.REJECT_COLOR);
      }
      throw DioException.fromDioError(e);
    }

    return authenticate;
  }*/

  Future<LoginUser> authenticateWithToken(String token) async {
    final response = await networkConfigWithToken(token).post(
      environments.userLoginWithToken,
    );

    final loginUser = LoginUser.fromJson(response.data);

    return loginUser;
  }

  Future<VerifyOtp> submitOtpForgot(String mobileOtp, String emailOtp) async {
    var user = await sessionManager.userID;

    var token = await sessionManager.token;
    final response = await networkConfigWithToken(token).post(
      environments.submit_otp_forgot,
      data: {"loginID": user, "mobileOtp": mobileOtp, "emailOtp": emailOtp},
    );

    final verifyOtp = VerifyOtp.fromJson(response.data);

    return verifyOtp;
  }

  Future<ApaEmployeeList> getApaEmployeeList(int fdesignationId,
      String searchEmpPin,
      int departmentId,
      int branchId,
      int zoneId,
      int empJobStatus,
      int gradeId,
      int liabilityId,
      int fiscalYear,
      int divisionId,
      int areaId,
      int recomId,
      int recomCount) async {
    var token = await sessionManager.token;
    var recomDataFound = 0; // this for query purpose
    var submodule;
    var employeeCode;
/*
    {
    "employeePin": "16887",
    "fdesignationId":0,
    "fdepartmentId":0,
    "searchEmployeePin": "",
    "branchId":0,
    "zoneId":0,
    "divisionId":0,
    "areaId":0,
    "gradeId":0,
    "empJobStatus": 0,
    "liabilityId":0,
    "fiscalYear": 2022,
    "recomId": 0,
    "recomCount": 0,
    "ctCase": 0
    }*/

    if (recomId == 0) {
      recomDataFound = 0;
    } else {
      recomDataFound = -1;
    }

    if (searchEmpPin.isEmpty) {
      employeeCode = '0';
    } else
      employeeCode = searchEmpPin;

    // try {
    final response = await networkConfigWithToken('$token')
        .post(environments.apa_employee_list, data: {
      "employeeCode": employeeCode,
      "designationId": fdesignationId,
      "departmentId": departmentId,
      "branchId": branchId,
      "zoneId": zoneId,
      "divisionId": divisionId,
      "areaId": areaId,
      "gradeId": gradeId,
      "empJobStatus": empJobStatus,
      "liabilityId": liabilityId,
      "fiscalYear": fiscalYear,
      "recomId": recomId,
      "recomCount": recomCount,
      "recomDataFound": recomDataFound
    });
    submodule = ApaEmployeeList.fromJson(response.data);

    return submodule;
  }

  Future<ApaEmpBasicinfo> getApaEmpBasicInfo(String empPin, int fisYear) async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token').post(
        '/api/AnnualAppraisal/KPIEmployeeBasicInfo',
        data: {"employeePin": empPin, "fiscalYear": fisYear});
    submodule = ApaEmpBasicinfo.fromJson(response.data);

    return submodule;
  }

  Future<ApaEmpScore> getApaEmpScore(GetEmpScore getEmpScore) async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token')
        .post(environments.apa_emp_score, data: {
      "qassignId": getEmpScore.qassignId,
      "quesionSetId": getEmpScore.quesionSetId,
      "fiscalyear": getEmpScore.fiscalyear
    });
    submodule = ApaEmpScore.fromJson(response.data);

    return submodule;
  }

  Future<ApaSupervisorComment> getEmpSupComment(var qAssignId) async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token').get(
      '${environments.apa_sup_comment}$qAssignId',
    );
    submodule = ApaSupervisorComment.fromJson(response.data);

    return submodule;
  }

  Future<EmpTargetScore> getEmpTargetScore(int qAssignId, int fisYear) async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token').post(
        environments.apa_target_score,
        data: {"qassignId": qAssignId, "fiscalYear": fisYear});
    submodule = EmpTargetScore.fromJson(response.data);

    return submodule;
  }

  Future<EmpLeaveHistory> getEmpLeaveInfo(int qAssignId) async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token').get(
      '${environments.apa_leave_info}$qAssignId',
    );
    submodule = EmpLeaveHistory.fromJson(response.data);

    return submodule;
  }

  Future<EmpCommentHistory> getEmpCmntHistory(int qAssignId) async {
    var token = await sessionManager.token;
    var submodule;
    //'${environments.all_plan_cancel}$planId'

    final response = await networkConfigWithToken('$token').get(
      '${environments.apa_comment_history}$qAssignId',
    );
    submodule = EmpCommentHistory.fromJson(response.data);

    return submodule;
  }

  Future<EmpRecomHistory> getEmpRecomHistory(int qAssignId) async {
    var token = await sessionManager.token;
    var submodule;
    //'${environments.all_plan_cancel}$planId'

    final response = await networkConfigWithToken('$token').get(
      '${environments.apa_recommendation_history}$qAssignId',
    );
    submodule = EmpRecomHistory.fromJson(response.data);

    return submodule;
  }

  Future<EmpMenuInformation> getEmpMenuInfo(GetMenuInfo getmenuInfo) async {
    //print('>>>>>>>>> getEmpMenuInfo called');
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token')
        .post(environments.apa_menu_information, data: {
      "receiverId": getmenuInfo.receiverId,
      "empId": getmenuInfo.employeeId,
      "fiscalYear": getmenuInfo.fiscalyear
    });
    submodule = EmpMenuInformation.fromJson(response.data);

    return submodule;
  }

  Future<ApaApprovalPathInfo> getApprovalPathInfo(
      GetApprovalPathInfo getApprovalPathInfo) async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token')
        .post(environments.apa_approval_path_information, data: {
      "questionsetId": getApprovalPathInfo.questionsetId,
      "priorityNo": getApprovalPathInfo.priorityNo,
      "empCode": "${getApprovalPathInfo.empCode}"
    });
    submodule = ApaApprovalPathInfo.fromJson(response.data);

    return submodule;
  }

  Future<ApaNextPathHistory> getNextPathHistory() async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token').get(
      environments.apa_next_path_history,
    );
    submodule = ApaNextPathHistory.fromJson(response.data);

    return submodule;
  }

  Future<ApaHrRecomScore> getHrScore(GetHrScore getHrScore) async {
    var token = await sessionManager.token;
    var submodule;
    //'${environments.all_plan_cancel}$planId'
    // try {
    final response = await networkConfigWithToken('$token')
        .post(environments.apa_hr_recom_score, data: {
      "qassignId": getHrScore.qassignId,
      "isTargetActive": getHrScore.isTargetActive,
      "qSetId": getHrScore.qSetId
    });
    submodule = ApaHrRecomScore.fromJson(response.data);

    return submodule;
  }

  Future<ApaSubmit> apaSubmitGeneralComment(
      SubmitGeneralCommentModel submitModel) async {
    var user = await sessionManager.userID;

    var token = await sessionManager.token;

    var submitResponse;

    var info = {
      "employeeCode": "${submitModel.employeeCode}",
      "assignId": submitModel.assignId,
      "historyid": submitModel.historyId,
      "senderCode": "${user}",
      "receiverEmpCode": "${submitModel.receiverEmpCode}",
      "qsetId": submitModel.qsetId,
      "priorityNo": submitModel.priorityNo,
      "comments": "${submitModel.comment}"
    };

    //print(info);

    try {
      final response = await networkConfigWithToken('$token')
          .post(environments.apa_submit_general_comment, data: info);

      submitResponse = ApaSubmit.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();

      throw DioException.fromDioError(e);
    }

    return submitResponse;
  }

  Future<ApaSubmit> apaSubmitLeave(SubmitLeaveInfo submitModel) async {
    var token = await sessionManager.token;

    var submitResponse;
    //  {
    //  "historyId": 458857,
    // "reason": "ttttt",
    // "duration": "yyyy",
    // "range": "gggg",
    // "comments": "rrrr"
    // }

    final response = await networkConfigWithToken('$token')
        .post(environments.apa_submit_leave, data: {
      "historyId": submitModel.historyId,
      "reason": "${submitModel.reason}",
      "duration": "${submitModel.duration}",
      "range": "${submitModel.range}",
      "comments": "${submitModel.comments}"
    });

    submitResponse = ApaSubmit.fromJson(response.data);

    return submitResponse;
  }

  Future<ApaSubmit> apaSubmitSuperComment(
      SubmitSuperComment submitModel) async {
    var token = await sessionManager.token;

    var submitResponse;

    final response = await networkConfigWithToken('$token')
        .post(environments.apa_submit_super_comment, data: {
      "historyId": submitModel.historyId,
      "comments": "${submitModel.comment}"
    });

    submitResponse = ApaSubmit.fromJson(response.data);

    return submitResponse;
  }

  Future<ApaSubmit> apaSubmitHrScore(SubmitHrScore submitHrScore) async {
    var token = await sessionManager.token;

    var info = {
      "historyid": submitHrScore.historyId,
      "questionId": submitHrScore.questionId,
      "comments": "${submitHrScore.comment}"
    };

    var submitResponse;

    final response = await networkConfigWithToken('$token')
        .post(environments.apa_submit_hr_score, data: info);

    submitResponse = ApaSubmit.fromJson(response.data);

    return submitResponse;
  }

  Future<ApaSubmit?> apaSubmitEmpScore(List<SubmitScoreItem> scoreList,
      int historyId) async {
    var token = await sessionManager.token;
    List<Object> list = [];

    for (var value in scoreList) {
      list.add({
        "historyId": historyId,
        "scorequestionId": value.scorequestionId,
        "score": value.score
      });
    }

    var submitResponse;

    final response = await networkConfigWithToken('$token')
        .post(environments.apa_submit_emp_score, data: list);

    submitResponse = ApaSubmit.fromJson(response.data);

    return submitResponse;
  }

  Future<ApaSubmit> apaSubmitTargetScore(
      List<SubmitTargetScoreItem> trScoreList, int historyId) async {
    var token = await sessionManager.token;
    List<Object> list = [];
    for (var value in trScoreList) {
      list.add({
        "historyId": historyId,
        "questionId": value.questionId,
        "score": value.score,
        "target": value.target,
        "earned": value.earned,
        "percentage": value.percentage
      });
    }

    list.forEach((element) {});

    var submitResponse;

    final response = await networkConfigWithToken('$token')
        .post(environments.apa_submit_target_score, data: list);

    submitResponse = ApaSubmit.fromJson(response.data);

    return submitResponse;
  }

  Future<ApaSubmit> apaSubmitRecommendation(List<SubmitRecomItem> recomList,
      int historyId) async {
    var token = await sessionManager.token;

    var submitResponse;

    List<Object> list = [];

    for (var value in recomList) {
      if (value.recomcomments.isNotEmpty) {
        list.add({
          "historyId": historyId,
          "recomId": value.recomId,
          "recomscore": value.recomscore,
          "recomcomments": "${value.recomcomments}"
        });
      }
    }

    final response = await networkConfigWithToken('$token')
        .post(environments.apa_submit_recommendation, data: list);

    submitResponse = ApaSubmit.fromJson(response.data);

    return submitResponse;
  }

  Future<ApaEmployeeInfo> apaGetEmployeeInfo(String employeeCode) async {
    var token = await sessionManager.token;

    var submitResponse;

    final response = await networkConfigWithToken('$token')
        .get("${environments.apa_employee_info}$employeeCode");

    submitResponse = ApaEmployeeInfo.fromJson(response.data);

    return submitResponse;
  }

  Future<Designation> getDesignationList() async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token').get(
      '${environments.designation_list}',
    );
    submodule = Designation.fromJson(response.data);

    return submodule;
  }

  Future<Division> getDivisionList() async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token').get(
      '${environments.division_list}',
    );
    submodule = Division.fromJson(response.data);

    return submodule;
  }

  Future<Zone> getZoneList() async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token').get(
      '${environments.zone_list}',
    );
    submodule = Zone.fromJson(response.data);

    return submodule;
  }

  Future<Grade> getGradeList() async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token').get(
      '${environments.grade_list}',
    );
    submodule = Grade.fromJson(response.data);

    return submodule;
  }

  Future<Liability> getLiabilityList() async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token').get(
      '${environments.liability_list}',
    );
    submodule = Liability.fromJson(response.data);

    return submodule;
  }

  Future<FiscalYear> getFiscalYearList() async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token').get(
      '${environments.fiscalYear_list}',
    );
    submodule = FiscalYear.fromJson(response.data);

    return submodule;
  }

  Future<Branch> getBranchList() async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    late Branch branchList;

    try {
      final response = await networkConfigWithToken('$token').get(
        environments.branch_list_apa,
      );

      branchList = Branch.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getAllBranch();
      }
      throw DioException.fromDioError(e);
    }

    return branchList;
  }

  Future<Department> getDepartmentList() async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    late Department branchList;

    try {
      final response = await networkConfigWithToken('$token').get(
        environments.department_list,
      );

      branchList = Department.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getDepartmentList();
      }
      throw DioException.fromDioError(e);
    }

    return branchList;
  }

  Future<AreaList> getAreaList() async {
    var token = await sessionManager.token;
    late AreaList areaList;
    var count = 0;

    final response = await networkConfigWithToken('$token').get(
      environments.area_list,
    );

    areaList = AreaList.fromJson(response.data);

    return areaList;
  }

  Future<RecommendationList> getRecommendationList() async {
    var token = await sessionManager.token;
    late RecommendationList recommendationList;

    final response = await networkConfigWithToken('$token').get(
      environments.apa_recommendation_list,
    );

    recommendationList = RecommendationList.fromJson(response.data);

    return recommendationList;
  }

  Future<ApprovalPathSet> getApprovalPathSetInfo(int qSetId) async {
    var token = await sessionManager.token;

    var submitResponse;

    final response = await networkConfigWithToken('$token')
        .get("${environments.apa_approval_path_set}$qSetId");

    submitResponse = ApprovalPathSet.fromJson(response.data);

    return submitResponse;
  }

  // new add leave--------

  Future<RemainingLeaveInfo> getLeaveRecord() async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;

    var leaveList;

    try {
      final response = await networkConfigWithToken('$token').get(
        //The below line will be changed it would be user
        environments.my_leave_report,
      );

      leaveList = RemainingLeaveInfo.fromJson(response.data); //ntc
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();

      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return getLeaveRecord();
      }
      throw DioException.fromDioError(e);
    }

    return leaveList;
  }

  Future<RemainingLeaveInfo> getRemainingLeaveInfo() async {
    var user = await sessionManager.userID;
    var token = await sessionManager.token;
    var returnResponse;

    final response = await networkConfigWithToken('$token').get(
      environments.my_leave_list + user,
    );

    returnResponse = RemainingLeaveInfo.fromJson(response.data); //ntc

    return returnResponse;
  }

  Future<ApplySubmit> createLeaveRequest(Map jsonMap) async {
    var token = await sessionManager.token;
    var submitResponse;

    final response = await networkConfigWithToken('$token')
        .post(environments.my_leave_post_request, data: jsonMap);

    submitResponse = ApplySubmit.fromJson(response.data);

    if (response.statusCode == 200) {
      return submitResponse;
    } else {
      return submitResponse;
    }
  }

  Future<bool> leaveRequestUpdate(Map jsonMap) async {
    var token = await sessionManager.token;

    final response = await networkConfigWithToken('$token')
        .post(environments.leave_self_cancel, data: jsonMap);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

/*  Future<dynamic> getLeaveListTest() async {
    var user = await sessionManager.userID;
    var username = "/" + user;

    var token = await sessionManager.token;

    var response = await http.get(
        Uri.parse(
            environments.base_url + environments.my_leave_list + username),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    return response;
  }*/

  Future<LeaveCountry> getCountryList() async {
    var token = await sessionManager.token;
    var returnResponse;

    final response = await networkConfigWithToken('$token').get(
      environments.my_leave_get_country,
    );

    returnResponse = LeaveCountry.fromJson(response.data);

    return returnResponse;
  }

  Future<dynamic> getCountryListold() async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var requestList;

    try {
      final response = await networkConfigWithToken('$token').get(
        environments.my_leave_get_country,
      );

      requestList = MycountryModel.fromJson(response.data);
    } on DioError catch (e) {
      print('Get Sub Module on error');
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        print('Authentication failed error');
        await getToken(user, password);
        return getCountryList();
      }
      throw DioException.fromDioError(e);
    }

    return requestList;
  }

  Future<DivisionLeave> getDivisionListLeave() async {
    var token = await sessionManager.token;
    var list;

    final response = await networkConfigWithToken('$token').get(
      environments.my_leave_get_division,
    );

    list = DivisionLeave.fromJson(response.data);

    return list;
  }

  Future<DistrictLeave> getDistrictListByDivision(var divisionCode) async {
    var token = await sessionManager.token;
    var list;

    final response = await networkConfigWithToken('$token').get(
      "${environments.my_leave_get_district_by_division}$divisionCode",
    );

    list = DistrictLeave.fromJson(response.data);

    return list;
  }

  Future<ApprovalRequestForLeave> getApprovalRequestforleave() async {
    var token = await sessionManager.token;
    var requestList;
    final response = await networkConfigWithToken('$token').get(
      environments.approval_request_list_for_leave,
    );

    requestList = ApprovalRequestForLeave.fromJson(response.data);

    return requestList;
  }

  Future<ApprovalRequestDetailsforleave> getApprovalDetailsforleave(
      int applicationId) async {
    var token = await sessionManager.token;
    var requestDetailList;

    final response = await networkConfigWithToken('$token').get(
      environments.approval_request_details_for_leave,
    );

    requestDetailList = ApprovalRequestDetails.fromJson(response.data);

    return requestDetailList;
  }

  Future<ApprovalActionforleave> approvalActionForLeave(int appDetailsId,
      int applicationId, String actionType) async {
    var user = await sessionManager.userID;
    var password = await sessionManager.password;
    var token = await sessionManager.token;
    var actionResponse;

    try {
      final response = await networkConfigWithToken('$token').put(
        environments.approval_action_single_for_leave,
        data: {
          "appDetailsID": appDetailsId,
          "applicationID": applicationId,
          "ApprovalStatus": actionType
        },
      );

      actionResponse = ApprovalActionforleave.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (errorMessage == 'Authentication failed.') {
        await getToken(user, password);
        return approvalActionForLeave(appDetailsId, applicationId, actionType);
      }
      throw DioException.fromDioError(e);
    }

    return actionResponse;
  }

  Future<ApprovalActionforleave> approvalActionAllForLeave(int applicationId,
      String actionType) async {
    var token = await sessionManager.token;

    var approvalActionResponse;

    final response = await networkConfigWithToken('$token').put(
      environments.approval_action_all_for_leave,
      data: {"requestId": applicationId, "activityfriendlyname": actionType},
    );

    approvalActionResponse = ApprovalActionforleave.fromJson(response.data);

    return approvalActionResponse;
  }

  Future<PendingLeaveData> getPendingLeaveList() async {
    var token = await sessionManager.token;
    var pendingLeaveList;

    final response = await networkConfigWithToken('$token').get(
      environments.pending_leave_list_for_applicant,
    );

    pendingLeaveList = PendingLeaveData.fromJson(response.data);

    return pendingLeaveList;
  }

  Future<LeaveApproveList> getPendingLeaveListForApprover() async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      environments.pending_leave_list_for_approval,
    );

    leaveList = LeaveApproveList.fromJson(response.data);

    return leaveList;
  }

// ------------------- Cash Flow Start -------------------

  Future<AllCashInFlowModel> getAllCashInFlow(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.all_cash_in_flow}$customerId",
    );

    leaveList = AllCashInFlowModel.fromJson(response.data);

    return leaveList;
  }

  Future<CashOutFlowModel> getBusinessCashOutFlow(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.business_cash_out_flow}$customerId",
    );

    leaveList = CashOutFlowModel.fromJson(response.data);

    return leaveList;
  }

  Future<BusinessNetProfitModel> getBusinessNetProfit(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.business_net_profit}$customerId",
    );

    leaveList = BusinessNetProfitModel.fromJson(response.data);

    return leaveList;
  }

  Future<NetHouseholdSurplusModel> getNetHouseHoldSurplus(
      int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.net_house_hold_cash_surplus}$customerId",
    );

    leaveList = NetHouseholdSurplusModel.fromJson(response.data);

    return leaveList;
  }

  Future<HouseHoldExpensesModel> getHouseholdExpenses(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.house_hold_expenses}$customerId",
    );

    leaveList = HouseHoldExpensesModel.fromJson(response.data);

    return leaveList;
  }

  Future<RecurringExpenseModel> getRecurringExpense(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.recurring_expense}$customerId",
    );

    leaveList = RecurringExpenseModel.fromJson(response.data);

    return leaveList;
  }

  Future<TotalMonthlySurplusModel> getTotalMonthlySurplus(
      int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.total_monthly_surplus}$customerId",
    );

    leaveList = TotalMonthlySurplusModel.fromJson(response.data);

    return leaveList;
  }

  Future<LoanEligibilityModel> getLoanEligibilityRecord(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.loan_eligibility_record}$customerId",
    );

    leaveList = LoanEligibilityModel.fromJson(response.data);

    return leaveList;
  }

  // customer Details

  Future<ApplySubmit> setCustomerDetails(Customer customerDetails) async {
    var token = await sessionManager.token;

    var leaveList;

    var jsonMap = {
      "customerId": customerDetails.customerId,
      "customerName": customerDetails.customerName,
      "dateOfBirth": customerDetails.dateOfBirth,
      "housePincode": customerDetails.housePincode,
      "familyMembersCount": customerDetails.familyMembersCount,
      "earningMembersCount": customerDetails.earningMembersCount,
      "residenceStayVintage": customerDetails.residenceStayVintage,
      "vintageWithBuroMonths": customerDetails.vintageWithBuroMonths,
      "currentSavingsAmount": customerDetails.currentSavingsAmount,
      "peakSavingsAmountLast12Months":
      customerDetails.peakSavingsAmountLast12Months,
      "existingLoanAmount": customerDetails.existingLoanAmount,
      "peakDPDLast12Months": customerDetails.peakDPDLast12Months,
      "previousLoanCustomerStatus": customerDetails.previousLoanCustomerStatus,
      "previousLoanSavingAmount": customerDetails.previousLoanSavingAmount,
      "previousLoanAmount": 0,
      "previousLoanRepaymentBehaviour":
      customerDetails.repaymentBehaviorPrevious,
      "previousLoanPeakDPD": customerDetails.previousLoanPeakDPD,
      "memberId": customerDetails.memberId,
      "customerStatus": customerDetails.customerStatus,
      "gender": customerDetails.gender,
      "maritalStatus": customerDetails.maritalStatus,
      "qualification": customerDetails.qualification,
      "residenceOwnership": customerDetails.residenceOwnership,
      "repaymentBehavior": customerDetails.repaymentBehavior
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_customer_details, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setEnterpriseDetails(EnterpriseDetails enterprise) async {
    var token = await sessionManager.token;

    var returnResponse;
    var jsonMap = {
      "customerid": enterprise.customerid,
      "enterprisename": enterprise.enterprisename,
      "constitutionofenterprise": enterprise.constitutionofenterprise,
      "workplacepincode": enterprise.workplacepincode,
      "businesssegment": enterprise.businesssegment,
      "businesssubsegment": enterprise.businesssubsegment,
      "currenttradelicenseavailable": enterprise.currenttradelicenseavailable,
      "tinavailable": enterprise.tinavailable,
      "workplaceownership": enterprise.workplaceownership,
      "workplacevintage": enterprise.workplacevintage,
      "grossmargin": enterprise.grossmargin,
      "numberofpaidregularemployees": enterprise.numberofpaidregularemployees,
      "previousloangrossmargin": enterprise.previousloangrossmargin,
      "previousloannoofemployees": enterprise.previousloannoofemployees,
    };

    //print('Customer INfo $jsonMap');

    final response = await networkConfigWithToken('$token')
        .post(environments.set_enterprise_details, data: jsonMap);

    returnResponse = ApplySubmit.fromJson(response.data);

    return returnResponse;
  }

  Future<ApplySubmit> setProposedLoanDetails(
      ProposedLoanDetails loanDetails) async {
    var token = await sessionManager.token;

    var leaveList;
    var jsonMap = {
      "customerId": loanDetails.customerId,
      "loanAppliedAmount": loanDetails.loanAppliedAmount,
      "tenureAppliedMonths": loanDetails.tenureAppliedMonths,
      "roiProposedPercentage": loanDetails.roiProposedPercentage,
      "endUse": loanDetails.endUse,
      "facilityApplied": loanDetails.facilityApplied,
      "repaymentFrequency": loanDetails.repaymentFrequency,
      "customerAffordableEMI": loanDetails.customerAffordableEMI,
      "loanEligibilityPolicy": loanDetails.loanEligibilityPolicy,
      "loanAmountApproved": loanDetails.loanAmountApproved,
      "previousLoanAmount": loanDetails.previousLoanAmount,
      "previousLoanTenureApplied": loanDetails.previousLoanTenureApplied,
      "previousLoanROIProposed": loanDetails.previousLoanROIProposed,
      "previousLoanCapital": loanDetails.previousLoanCapital,
      "previousLoanFacilityApplied": loanDetails.previousLoanFacilityApplied,
      "previousLoanRepaymentFrequency":
      loanDetails.previousLoanRepaymentFrequency,
      "previousLoanAffordableEMI": loanDetails.previousLoanAffordableEMI,
      "previousLoanEligibility": loanDetails.previousLoanEligibility,
      "previousLoanApprovedAmount": loanDetails.previousLoanApprovedAmount,
      //"proposeLoanID": loanDetails.proposeLoanID
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_proposed_loan_details, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setSupplierVerification(
      SupplierVerification supplierVerification) async {
    var token = await sessionManager.token;

    var leaveList;

    /*{
      "customeR_ID": 0,
    "suppliername": "string",
    "mobilenumber": "string",
    "supplierlocation": "string",
    "yearssupplyingtocustomer": 0,
    "supplyfrequency": 0,
    "productservicesupplied": "string",
    "averagemonthlysupplyamount": 0,
    "paymentterms": 0,
    "paymenttimeliness": 0,
    "supplierfeedback": 0,
    "supplY_VERIFICATION_ID": 0
    }*/

    Map<String, dynamic> jsonMap = {
      "customeR_ID": supplierVerification.customerID,
      "suppliername": supplierVerification.supplierName,
      "mobilenumber": supplierVerification.mobileNumber,
      "supplierlocation": supplierVerification.supplierLocation,
      "yearssupplyingtocustomer": supplierVerification.yearsSupplyingToCustomer,
      "supplyfrequency": supplierVerification.supplyFrequency,
      "productservicesupplied": supplierVerification.productServicesSupplied,
      "averagemonthlysupplyamount":
      supplierVerification.averageMonthlySupplyAmount,
      "paymentterms": supplierVerification.paymentTerms,
      "paymenttimeliness": supplierVerification.paymentTimeliness,
      "supplierfeedback": supplierVerification.supplierFeedback,
      "supplY_VERIFICATION_ID": 0
    };

    //print(jsonMap);
    final response = await networkConfigWithToken('$token')
        .post(environments.set_supplier_verification, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setBuyerVerification(
      BuyerVerification buyerInformation) async {
    var token = await sessionManager.token;

    var leaveList;

    Map<String, dynamic> jsonMap = {
      "customerid": buyerInformation.customerid,
      "buyername": buyerInformation.buyername,
      "mobilenumber": buyerInformation.mobilenumber,
      "buyerlocation": buyerInformation.buyerlocation,
      "yearspurchasingfromcustomer":
      buyerInformation.yearspurchasingfromcustomer,
      "purchasefrequency": buyerInformation.purchasefrequency,
      "averagemonthlypurchaseamount":
      buyerInformation.averagemonthlypurchaseamount,
      "paymentterms": buyerInformation.paymentterms,
      "productservicequality": buyerInformation.productservicequality,
      "buyerfeedbackoncustomer": buyerInformation.buyerfeedbackoncustomer,
      "buyerverifyid": buyerInformation.buyerverifyid
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_buyer_verification, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setPersonalReferenceVerification(
      PersonalReferenceVerification verification) async {
    var token = await sessionManager.token;

    var leaveList;

    var jsonMap = {
      "customeR_ID": verification.customerID,
      "personname": verification.personName,
      "mobilenumber": verification.mobileNumber,
      "referencelocation": verification.referenceLocation,
      "relationwithcustomer": verification.relationWithCustomer,
      "yearsknowingcustomer": verification.yearsKnowingCustomer,
      "levelofinteraction": verification.levelOfInteraction,
      "feedbackoncustomer": verification.feedbackOnCustomer,
      //"personalreferenceid": verification.personalReferenceID
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_personal_reference_verification, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  // Input Sheet

  Future<ApplySubmit> setSalesCashbook(SalesCashbook salesCashbook) async {
    var token = await sessionManager.token;

    var leaveList;

    Map<String, dynamic> jsonMap = {
      //"saleid": salesCashbook.saleId,
      "customerid": salesCashbook.customerId,
      "firstmontH_5TH": salesCashbook.firstMonth5th,
      "firstmontH_10TH": salesCashbook.firstMonth10th,
      "firstmontH_15TH": salesCashbook.firstMonth15th,
      "firstmontH_20TH": salesCashbook.firstMonth20th,
      "firstmontH_25TH": salesCashbook.firstMonth25th,
      "firstmontH_30TH": salesCashbook.firstMonth30th,
      "firstmontH_PREVIOUSLOAN": salesCashbook.firstMonthPreviousLoan,
      "twomontH_5TH": salesCashbook.twoMonth5th,
      "twomontH_10TH": salesCashbook.twoMonth10th,
      "twomontH_15TH": salesCashbook.twoMonth15th,
      "twomontH_20TH": salesCashbook.twoMonth20th,
      "twomontH_25TH": salesCashbook.twoMonth25th,
      "twomontH_PREVIOUSLOAN": salesCashbook.twoMonthPreviousLoan,
      "twomontH_30TH": salesCashbook.twoMonth30th,
      "threemontH_5TH": salesCashbook.threeMonth5th,
      "threemontH_10TH": salesCashbook.threeMonth10th,
      "threemontH_15TH": salesCashbook.threeMonth15th,
      "threemontH_20TH": salesCashbook.threeMonth20th,
      "threemontH_25TH": salesCashbook.threeMonth25th,
      "threemontH_30TH": salesCashbook.threeMonth30th,
      "threemontH_PREVIOUSLOAN": salesCashbook.threeMonthPreviousLoan
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_sales_cashbook, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setPurchaseCashBook(
      PurchaseCashBook purchaseCashMemoDetails) async {
    var token = await sessionManager.token;

    var leaveList;

    Map<String, dynamic> jsonMap = {
      "customerid": purchaseCashMemoDetails.customerId,
      "firstmontH_5TH": purchaseCashMemoDetails.firstMonth5th,
      "firstmontH_15TH": purchaseCashMemoDetails.firstMonth15th,
      "firstmontH_25TH": purchaseCashMemoDetails.firstMonth25th,
      "firstmontH_PREVIOUSLOAN": 0,
      "twomontH_5TH": purchaseCashMemoDetails.twoMonth5th,
      "twomontH_15TH": purchaseCashMemoDetails.twoMonth15th,
      "twomontH_25TH": purchaseCashMemoDetails.twoMonth25th,
      "twomontH_PREVIOUSLOAN": 0,
      "threemontH_5TH": purchaseCashMemoDetails.threeMonth5th,
      "threemontH_15TH": purchaseCashMemoDetails.threeMonth15th,
      "threemontH_25TH": purchaseCashMemoDetails.threeMonth25th,
      "threemontH_PREVIOUSLOAN": 0
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_purchase_cashbook, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setBankBalance(BankBalance balance) async {
    var token = await sessionManager.token;

    var leaveList;

    var jsonMap = {
      //"balanceid": 0,
      "customerid": balance.customerId,
      "firstmontH_5TH": balance.firstMonth5th,
      "firstmontH_15TH": balance.firstMonth15th,
      "firstmontH_25TH": balance.firstMonth25th,
      "firstmontH_PREVIOUSLOAN": balance.firstMonthPreviousLoan,
      "twomontH_5TH": balance.twoMonth5th,
      "twomontH_15TH": balance.twoMonth15th,
      "twomontH_25TH": balance.twoMonth25th,
      "twomontH_PREVIOUSLOAN": balance.twoMonthPreviousLoan,
      "threemontH_5TH": balance.threeMonth5th,
      "threemontH_15TH": balance.threeMonth15th,
      "threemontH_25TH": balance.threeMonth25th,
      "threemontH_PREVIOUSLOAN": balance.threeMonthPreviousLoan,
      "fourtmontH_5TH": balance.fourthMonth5th,
      "fourtmontH_15TH": balance.fourthMonth15th,
      "fourtmontH_25TH": balance.fourthMonth25th,
      "fourtmontH_PREVIOUSLOAN": balance.fourthMonthPreviousLoan,
      "fivemontH_5TH": balance.fifthMonth5th,
      "fivemontH_15TH": balance.fifthMonth15th,
      "fivemontH_25TH": balance.fifthMonth25th,
      "fivemontH_PREVIOUSLOAN": balance.fifthMonthPreviousLoan,
      "sixmontH_5TH": balance.sixthMonth5th,
      "sixmontH_15TH": balance.sixthMonth15th,
      "sixmontH_25TH": balance.sixthMonth25th,
      "sixmontH_PREVIOUSLOAN": balance.sixthMonthPreviousLoan,
      "averagebankbalancepreviousloan": balance.averageBankBalancePrevious
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_bank_balance, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setSales(SalesDetails salesDetails) async {
    var token = await sessionManager.token;

    var leaveList;
    Map<String, dynamic> jsonMap = {
      "customerid": salesDetails.customerId,
      "closingdayinweek": salesDetails.closingDayInWeek,
      "workingdaysinmonth": salesDetails.workingDaysInMonth,
      "salesdaily": salesDetails.salesDaily,
      "salesweekly": salesDetails.salesWeekly,
      "salesmonthly": salesDetails.salesMonthly,
      "monthpreviousloan": salesDetails.monthPreviousLoan,
      "month": salesDetails.month,
      "weeks": salesDetails.weeks,
      "low": salesDetails.low,
      "high": salesDetails.high,
      "normal": salesDetails.normal,
      "lowmonth": salesDetails.lowMonth,
      "highmonth": salesDetails.highMonth,
      "normalmonth": salesDetails.normalMonth,
      "debtors": salesDetails.debtors,
      "debtorspreviousloan": salesDetails.debtorsPreviousLoan,
      "monthlysalesgrowthpostfunding":
      salesDetails.monthlySalesGrowthPostFunding
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_sales, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setPurchase(PurchaseDetails purchaseDetails) async {
    var token = await sessionManager.token;

    var leaveList;

    Map<String, dynamic> jsonMap = {
      "customerId": purchaseDetails.customerId,
      "daily": purchaseDetails.daily,
      "weekly": purchaseDetails.weekly,
      "monthly": purchaseDetails.monthly,
      "monthlyPreviousLoan": purchaseDetails.monthlyPreviousLoan,
      "creditors": purchaseDetails.creditors,
      "creditorsPreviousLoan": purchaseDetails.creditorsPreviousLoan
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_purchases, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setStock(StockDetails stockDetails) async {
    var token = await sessionManager.token;

    var leaveList;

    Map<String, dynamic> jsonMap = {
      "customerId": stockDetails.customerId,
      "finishedGoods": stockDetails.finishedGoods,
      "rawMaterial": stockDetails.rawMaterial,
      "finishedGoodsPreviousLoan": stockDetails.finishedGoodsPreviousLoan,
      "rawMaterialPreviousLoan": stockDetails.rawMaterialPreviousLoan
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_stock, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setBusinessExpenseMonthly(
      BusinessExpenseDetails businessExpenseDetails) async {
    var token = await sessionManager.token;

    var leaveList;

    var jsonMap = {
      "customerId": businessExpenseDetails.customerId,
      "rent": businessExpenseDetails.rent,
      "rentPreviousLoan": businessExpenseDetails.rentPreviousLoan,
      "electricity": businessExpenseDetails.electricity,
      "electricityPreviousLoan": businessExpenseDetails.electricityPreviousLoan,
      "staffSalary": businessExpenseDetails.staffSalary,
      "staffSalaryPreviousLoan": businessExpenseDetails.staffSalaryPreviousLoan,
      "telephoneMobileInternet": businessExpenseDetails.telephoneMobileInternet,
      "telMobileInterPrevLoan": businessExpenseDetails.telMobileInterPrevLoan,
      "transport": businessExpenseDetails.transport,
      "transportPreviousLoan": businessExpenseDetails.transportPreviousLoan,
      "gasAndWater": businessExpenseDetails.gasAndWater,
      "gasAndWaterPreviousLoan": businessExpenseDetails.gasAndWaterPreviousLoan,
      "maintenance": businessExpenseDetails.maintenance,
      "maintenancePreviousLoan": businessExpenseDetails.maintenancePreviousLoan,
      "dieselForGenerator": businessExpenseDetails.dieselForGenerator,
      "dieselForGeneratorPrevLoan":
      businessExpenseDetails.dieselForGeneratorPrevLoan,
      "marketing": businessExpenseDetails.marketing,
      "marketingPreviousLoan": businessExpenseDetails.marketingPreviousLoan,
      "labourExpense": businessExpenseDetails.labourExpense,
      "labourExpensePreviousLoan":
      businessExpenseDetails.labourExpensePreviousLoan,
      "societyBillSecurity": businessExpenseDetails.societyBillSecurity,
      "societyBillSecurityPrevLoan":
      businessExpenseDetails.societyBillSecurityPrevLoan,
      "tax": businessExpenseDetails.tax,
      "taxPrevLoan": businessExpenseDetails.taxPrevLoan,
      "entertainment": businessExpenseDetails.entertainment,
      "entertainmentPreviousLoan":
      businessExpenseDetails.entertainmentPreviousLoan,
      "otherBusinessExpense": businessExpenseDetails.otherBusinessExpense,
      "otherBusinessExpensePrevLoan":
      businessExpenseDetails.otherBusinessExpensePrevLoan
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_business_expense_monthly, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setOtherIncomeMonthly(
      OtherIncomeMonthly otherIncomeMonthly) async {
    var token = await sessionManager.token;

    var leaveList;

    Map<String, dynamic> jsonMap = {
      "customerId": otherIncomeMonthly.customerId,
      "agricultureIncome": otherIncomeMonthly.agricultureIncome,
      "agricultureIncomePreviousLoan":
      otherIncomeMonthly.agricultureIncomePreviousLoan,
      "rentalIncome": otherIncomeMonthly.rentalIncome,
      "rentalIncomePreviousLoan": otherIncomeMonthly.rentalIncomePreviousLoan,
      "salaryIncomeFM": otherIncomeMonthly.salaryIncomeFM,
      "salaryIncomeFMPreviousLoan":
      otherIncomeMonthly.salaryIncomeFMPreviousLoan,
      "alliedAgriIncome": otherIncomeMonthly.alliedAgriIncome,
      "alliedAgriIncomePreviousLoan":
      otherIncomeMonthly.alliedAgriIncomePreviousLoan,
      "otherIncome": otherIncomeMonthly.otherIncome,
      "otherIncomePreviousLoan": otherIncomeMonthly.otherIncomePreviousLoan
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_other_income_monthly, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setPersonalExpenseMonthly(
      PersonalExpenseDetails expenseDetails) async {
    var token = await sessionManager.token;

    var leaveList;

    var jsonMap = {
      "customerid": expenseDetails.customerId,
      "houserent": expenseDetails.houserent,
      "houserentpreviousloan": expenseDetails.houserentpreviousloan,
      "food": expenseDetails.food,
      "foodpreviousloan": expenseDetails.foodpreviousloan,
      "clothing": expenseDetails.clothing,
      "clothingpreviousloan": expenseDetails.clothingpreviousloan,
      "educationmonthly": expenseDetails.educationmonthly,
      "educationmonthlypreviousloan":
      expenseDetails.educationmonthlypreviousloan,
      "electricity": expenseDetails.electricity,
      "electricitypreviousloan": expenseDetails.electricitypreviousloan,
      "transportconveyance": expenseDetails.transportconveyance,
      "transportconveyanceprevloan": expenseDetails.transportconveyanceprevloan,
      "telmobileinter": expenseDetails.telmobileinter,
      "telmobileinterprevloan": expenseDetails.telmobileinterprevloan,
      "medical": expenseDetails.medical,
      "medicalpreviousloan": expenseDetails.medicalpreviousloan,
      "entertainment": expenseDetails.entertainment,
      "entertainmentpreviousloan": expenseDetails.entertainmentpreviousloan,
      "repairmaintenance": expenseDetails.repairmaintenance,
      "repairmaintenancepreviousloan":
      expenseDetails.repairmaintenancepreviousloan,
      "maid": expenseDetails.maid,
      "maidpreviousloan": expenseDetails.maidpreviousloan,
      "housetax": expenseDetails.housetax,
      "housetaxpreviousloan": expenseDetails.housetaxpreviousloan,
      "anyotherexpense": expenseDetails.anyotherexpense,
      "anyotherexpensepreviousloan": expenseDetails.anyotherexpensepreviousloan
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_personal_expense_monthly, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setExistingLoans(List loanList) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token')
        .post(environments.set_existing_loans, data: loanList);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setRegularInvestment(
      RegularInvestment regularInvestment) async {
    var token = await sessionManager.token;

    var leaveList;

    var jsonMap = {
      "customerid": regularInvestment.customerId,
      "lifeinsurance": regularInvestment.lifeinsurance,
      "lifeinsurancepreviousloan": regularInvestment.lifeinsurancepreviousloan,
      "generalinsurance": regularInvestment.generalinsurance,
      "generalinsurancepreviousloan":
      regularInvestment.generalinsurancepreviousloan,
      "dps": regularInvestment.dps,
      "dpspreviousloan": regularInvestment.dpspreviousloan,
      "grossmargininbusiness": regularInvestment.grossmargininbusiness,
      "grossmargininbusinessprevloan":
      regularInvestment.grossmargininbusinessprevloan,
      "monthlycashinhandfrombusiness":
      regularInvestment.monthlycashinhandfrombusiness,
      "cashinhandfrombusiprevloan": regularInvestment.cashinhandfrombusiprevloan
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_regular_investment, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setProductSalePrice(List productSalePrizeList) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token')
        .post(environments.set_product_sale_price, data: productSalePrizeList);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setProductPurchasePrice(List productPurchasePrice) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').post(
        environments.set_product_purchase_price,
        data: productPurchasePrice);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setManufacturingOptionOne(List manufacturingList) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').post(
        environments.set_manufacturing_option_one,
        data: manufacturingList);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setManufacturingOptionTwo(List manufacturingList) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').post(
        environments.set_manufacturing_option_two,
        data: manufacturingList);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setQualitativeAspects(
      QualitativeAspects qualitativeAspects) async {
    var token = await sessionManager.token;

    var leaveList;

    var jsonMap = {
      "customerId": qualitativeAspects.customerId,
      "promoter": qualitativeAspects.promoter,
      "businessActivity": qualitativeAspects.businessActivity,
      "marketAndDemand": qualitativeAspects.marketAndDemand,
      "recommendation": qualitativeAspects.recommendation
    };

    final response = await networkConfigWithToken('$token')
        .post(environments.set_qualitative_aspects, data: jsonMap);

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<CustomerListModel> getCustomerList(String memberID) async {
    var token = await sessionManager.token;
    // print('Token $token');
    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_customer_list}/$memberID",
    );

    leaveList = CustomerListModel.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> deleteCustomer(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').post(
      "${environments.delete_customer}$customerId",
    );

    leaveList = ApplySubmit.fromJson(response.data);

    return leaveList;
  }

  Future<NextCustomerID> getNextCustomerID() async {
    var token = await sessionManager.token;
    var submodule;

    final response = await networkConfigWithToken('$token').get(
      environments.get_next_customer_id,
    );
    submodule = NextCustomerID.fromJson(response.data);

    return submodule;
  }

  // get customer Info

  Future<EnterpriseListEdit> getEnterpriseDetails(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_enterprise_details}$customerId",
    );

    leaveList = EnterpriseListEdit.fromJson(response.data);

    return leaveList;
  }

  Future<ProposedLoanEdit> getLoanDetails(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_loan_details}$customerId",
    );

    leaveList = ProposedLoanEdit.fromJson(response.data);

    return leaveList;
  }

  Future<SupplierInformationEdit> getSupplierVerificationDetails(
      int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_supplier_information}$customerId",
    );

    leaveList = SupplierInformationEdit.fromJson(response.data);

    return leaveList;
  }

  Future<BuyerInformationEdit> getBuyerVerificationDetails(
      int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_buyer_information}$customerId",
    );

    leaveList = BuyerInformationEdit.fromJson(response.data);

    return leaveList;
  }

  Future<PersonalReferenceEdit> getPersonalReferenceInformation(
      int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_personal_reference_info}$customerId",
    );

    leaveList = PersonalReferenceEdit.fromJson(response.data);

    return leaveList;
  }

  Future<SalesCashbookEdit> getSalesCashBook(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_sales_cashbook}$customerId",
    );

    leaveList = SalesCashbookEdit.fromJson(response.data);

    return leaveList;
  }

  Future<PurchaseCashbookEdit> getPurchaseCashBook(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_purchase_cashbook}$customerId",
    );

    leaveList = PurchaseCashbookEdit.fromJson(response.data);

    return leaveList;
  }

  Future<BankBalanceEdit> getBankBalance(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_bank_balance}$customerId",
    );

    leaveList = BankBalanceEdit.fromJson(response.data);

    return leaveList;
  }

  Future<SalesEdit> getSales(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_sales_info}$customerId",
    );

    leaveList = SalesEdit.fromJson(response.data);

    return leaveList;
  }

  Future<PurchaseEdit> getPurchaseDetails(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_purchase_info}$customerId",
    );

    leaveList = PurchaseEdit.fromJson(response.data);

    return leaveList;
  }

  Future<StockEdit> getStockDetails(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_stock_info}$customerId",
    );

    leaveList = StockEdit.fromJson(response.data);

    return leaveList;
  }

  Future<BusinessExpenseMonthlyEdit> getBusinessExpenseMonthly(
      int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_business_expense_monthly}$customerId",
    );

    leaveList = BusinessExpenseMonthlyEdit.fromJson(response.data);

    return leaveList;
  }

  Future<OtherIncomeMonthlyEdit> getOtherIncomeMonthly(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_other_income_monthly}$customerId",
    );

    leaveList = OtherIncomeMonthlyEdit.fromJson(response.data);

    return leaveList;
  }

  Future<PersonalExpenseMonthlyEdit> getPersonalExpenseDetails(
      int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_personal_expense_monthly}$customerId",
    );

    leaveList = PersonalExpenseMonthlyEdit.fromJson(response.data);

    return leaveList;
  }

  Future<ExistingLoanEdit> getExistingLoan(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_existing_loan}$customerId",
    );

    leaveList = ExistingLoanEdit.fromJson(response.data);

    return leaveList;
  }

  Future<RegularInvestmentEdit> getRegularInvestment(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_regular_investment}$customerId",
    );

    leaveList = RegularInvestmentEdit.fromJson(response.data);
    return leaveList;
  }

  Future<ProductSalePriceEdit> getProductSalePrice(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_product_sale_price}$customerId",
    );

    leaveList = ProductSalePriceEdit.fromJson(response.data);

    return leaveList;
  }

  Future<ProductPurchasePriceEdit> getProductPurchasePrice(
      int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_product_purchase_price}$customerId",
    );

    leaveList = ProductPurchasePriceEdit.fromJson(response.data);

    return leaveList;
  }

  Future<ManufecturingOptionOneEdit> getManufacturingOptionOne(
      int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_manufacturing_option_one}$customerId",
    );

    leaveList = ManufecturingOptionOneEdit.fromJson(response.data);

    return leaveList;
  }

  Future<ManufecturingOptionTwoEdit> getManufacturingOptionTwo(
      int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_manufacturing_option_two}$customerId",
    );

    leaveList = ManufecturingOptionTwoEdit.fromJson(response.data);

    return leaveList;
  }

  Future<QualitativeAspectsEdit> getQualitativeAspects(int customerId) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_qualitative_aspects}$customerId",
    );

    leaveList = QualitativeAspectsEdit.fromJson(response.data);

    return leaveList;
  }

  Future<ExistingCustomerInfo> getExistingCustomerInfo(
      String loaneeCode) async {
    var token = await sessionManager.token;

    var siteCode = await sessionManager.coreFinanceSiteCode;

    var leaveList;

    final response = await networkConfigWithToken('$token')
        .get(environments.get_existing_customer_info, queryParameters: {
      "pBranchCode": siteCode.trim(),
      "pLoaneeCode": loaneeCode
    });

    leaveList = ExistingCustomerInfo.fromJson(response.data);

    return leaveList;
  }

  Future<FrequencyModel> getFrequencyInfo(int customerID) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_frequency_info}$customerID",
    );

    leaveList = FrequencyModel.fromJson(response.data);

    return leaveList;
  }

  Future<SeasonalityModel> getSeasonalityInfo(int customerID) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_seasonality_info}$customerID",
    );

    leaveList = SeasonalityModel.fromJson(response.data);

    return leaveList;
  }

  Future<WorkingCapitalModel> getWorkingCapital(int customerID) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_working_capital}$customerID",
    );

    leaveList = WorkingCapitalModel.fromJson(response.data);

    return leaveList;
  }

  Future<WorkingCapitalRequirementModel> getWorkingCapitalRequirements(
      int customerID) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_working_capital_requirment}$customerID",
    );

    leaveList = WorkingCapitalRequirementModel.fromJson(response.data);

    return leaveList;
  }

  Future<MarginModel> getMargin(int customerID) async {
    var token = await sessionManager.token;

    var leaveList;

    final response = await networkConfigWithToken('$token').get(
      "${environments.get_margin}$customerID",
    );

    leaveList = MarginModel.fromJson(response.data);

    return leaveList;
  }

  Future<ApplySubmit> setDebtBurden(List debtBurdenList) async {
    var token = await sessionManager.token;
    var returnResponse;
    final response = await networkConfigWithToken('$token')
        .post(environments.set_mf_debt_burden, data: debtBurdenList);

    returnResponse = ApplySubmit.fromJson(response.data);

    return returnResponse;
  }

  Future<BreakFastBill> getBreakFastBill() async {
    var token = await sessionManager.token;
    var gradeID = await sessionManager.gardeID;
    var planList;

    final response = await networkConfigWithToken('$token')
        .get(environments.breakfast_bill_info, queryParameters: {
      "gradeID": gradeID,
    });

    planList = BreakFastBill.fromJson(response.data);

    return planList;
  }

  Future<LunchNDinnerBill> getLunchNDinnerBill() async {
    var token = await sessionManager.token;
    var gradeID = await sessionManager.gardeID;
    var planList;

    final response = await networkConfigWithToken('$token').get(
        environments.lunch_dinner_bill_info,
        queryParameters: {"gradeID": gradeID});

    planList = LunchNDinnerBill.fromJson(response.data);

    return planList;
  }

  Future<ResidenceBill> getResidenceBill() async {
    var token = await sessionManager.token;
    var gradeID = await sessionManager.gardeID;
    var planList;

    final response = await networkConfigWithToken('$token')
        .get(environments.residence_bill_info, queryParameters: {
      "gradeID": gradeID,
    });

    planList = ResidenceBill.fromJson(response.data);

    return planList;
  }

  Future<DailyNSpecialBill> getDailyNSpecialBill() async {
    var token = await sessionManager.token;
    var gradeID = await sessionManager.gardeID;
    var planList;

    final response = await networkConfigWithToken('$token')
        .get(environments.daily_n_special_allowance, queryParameters: {
      "gradeID": gradeID,
    });

    planList = DailyNSpecialBill.fromJson(response.data);

    return planList;
  }

  Future<LeaveHistoryModel> getLeaveHistoryList() async {
    var token = await sessionManager.token;

    var pendingLeaveList;

    //?PageNumber=0&PageSize=0

    final response = await networkConfigWithToken('$token').get(
        "${environments.leave_history}",
        queryParameters: {"PageNumber": 0, "PageSize": 0});

    pendingLeaveList = LeaveHistoryModel.fromJson(response.data);

    return pendingLeaveList;
  }


  Future<FieldVisitReport> getPlanSummary(ReportFilter reportFilter) async {
    var token = await sessionManager.token;

    var pendingLeaveList;

    //?PageNumber=0&PageSize=0

    final response = await networkConfigWithToken('$token').post(
        environments.field_visit_plan_summary,
        data: {
          "employeeCode": reportFilter.employeeCode,
          "activityName": reportFilter.status,
          "startDateFrom": reportFilter.startDateFrom,
          "startDateTo": reportFilter.startDateTo,
          "endDateFrom": reportFilter.endDateFrom,
          "endDateTo": reportFilter.endDateTo
        },
        options: Options(headers: {
          'Accept': 'application/json', // Adjust as needed
        },


        ));


    pendingLeaveList = FieldVisitReport.fromJson(response.data);

    return pendingLeaveList;
  }


  Future<ApplySubmit> setDeviceInfo(DeviceInfo deviceInfo) async {
    var token = await sessionManager.token;
    var returnResponse;
    final response = await networkConfigWithToken('$token')
        .post(environments.set_device_info, data: {
      "employeeCode": deviceInfo.employeeCode,
      "isLoggedIn": deviceInfo.isLoggedIn,
      "deviceType": deviceInfo.deviceType,
      "deviceOS": deviceInfo.deviceOS,
      "fcmAndroid": deviceInfo.fcmAndroid,
      "fcmIos": deviceInfo.fcmIos
    });

    returnResponse = ApplySubmit.fromJson(response.data);

    return returnResponse;
  }


  Future<EmpGeneralInfoListModel> getEmpGeneralInfo(
      GeneralInfoSearchFilterModel searchFilter) async {
    var token = await sessionManager.token;
    var requestList;

    final response = await networkConfigWithToken('$token').post(
        environments.emp_general_info,
        data: {
          "employeeCode": searchFilter.employeeCode,
          "pageNumber": searchFilter.pageNumber,
          "pageSize": searchFilter.pageSize,
          "bloodGroup": searchFilter.bloodGroup ?? '',
          "siteID": searchFilter.siteID == null ? 0 : searchFilter.siteID,
          "designationID": searchFilter.designationID == null
              ? 0
              : searchFilter.designationID,
          "jobStatus": "Active",
          "employeeName": searchFilter.employeeName ?? '',


          /*"employeeType": 0,
        "departmentID": 0,
        "locationID": 0,
        "companyCode": "",
        "gradeID": 0,
        "costCenterCode": "",
        "functionID": 0,
        "zoneID": 0,
        "divisionLocationID": 0,
        "gender": "",
        "districtName": "",
        "thanaID": 0,
        "serviceAgeFrom": 0,
        "serviceAgeTo": 0,
        "empAgeFrom": 0,
        "empAgeTo": 0,
        "siteCode": searchFilter.siteCode??'',
        "siteName": "",
        "liabilityID": searchFilter.liabilityID == null? 0:searchFilter.liabilityID,
        "religion": "",
        "addLiabilityID": 0,
        "addLiabilityDateFrom": null,
        "addLiabilityDateTo": null,
        "mobile": searchFilter.mobile?? '',
        "companyDivisionID": 0*/

        }
    );

    requestList = EmpGeneralInfoListModel.fromJson(response.data);


    return requestList;
  }


  Future<FileUploadModel> fileUpload(FormData formData) async {
    var token = await sessionManager.token;
    var requestList;

    final response = await networkConfigWithToken('$token').post(
      environments.file_upload,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),


    );

    requestList = FileUploadModel.fromJson(response.data);


    return requestList;
  }


  Future<FileDownloadModel> fileDownload(int attachmentID) async {
    var token = await sessionManager.token;
    var fileDownloadInfo;

    final response = await networkConfigWithToken('$token').get(
      '${environments.file_download}$attachmentID',
    );

    fileDownloadInfo = FileDownloadModel.fromJson(response.data);


    return fileDownloadInfo;
  }



  Future<EmpGeneralInfoListModel> getEmpGeneralInfoForRegistration(
      pin) async {
    var token = await sessionManager.token;
    var requestList;

    final response = await networkConfig().post(
        environments.get_info_registration,
        data: {
          "employeeCode": pin,
          "pageNumber": 1,
          "pageSize": 10



          /*"employeeType": 0,
        "departmentID": 0,
        "locationID": 0,
        "companyCode": "",
        "gradeID": 0,
        "costCenterCode": "",
        "functionID": 0,
        "zoneID": 0,
        "divisionLocationID": 0,
        "gender": "",
        "districtName": "",
        "thanaID": 0,
        "serviceAgeFrom": 0,
        "serviceAgeTo": 0,
        "empAgeFrom": 0,
        "empAgeTo": 0,
        "siteCode": searchFilter.siteCode??'',
        "siteName": "",
        "liabilityID": searchFilter.liabilityID == null? 0:searchFilter.liabilityID,
        "religion": "",
        "addLiabilityID": 0,
        "addLiabilityDateFrom": null,
        "addLiabilityDateTo": null,
        "mobile": searchFilter.mobile?? '',
        "companyDivisionID": 0*/

        }
    );

    requestList = EmpGeneralInfoListModel.fromJson(response.data);


    return requestList;
  }


  Future<ChangePasswordModel> changePasswordForRegistration(String pin,
      String mobileOTP, String newPass,
      String confirmPass) async {
    var response;

    try {
      final getResponse = await networkConfig().post(
          environments.change_password_registration,
          data: {
            "loginID": pin,
            "oldPassword": mobileOTP,
            "newPassword": newPass,
            "confirmPassword": confirmPass,
            "salt": "string"
          }
      );

      response = ChangePasswordModel.fromJson(getResponse.data);
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
    return response;
  }


}