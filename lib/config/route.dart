

import 'package:buro_employee/app.dart';
import 'package:buro_employee/repository/models/ApprovalRequestInfo.dart';
import 'package:buro_employee/repository/models/apply_request.dart';
import 'package:buro_employee/repository/models/customer_details.dart';
import 'package:buro_employee/repository/models/generate_otp.dart';
import 'package:buro_employee/repository/models/login_user.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:buro_employee/views/admin_panel/create_role.dart';
import 'package:buro_employee/views/admin_panel/create_user.dart';
import 'package:buro_employee/views/annual_appraisal/annual_appraisal_main.dart';
import 'package:buro_employee/views/annual_appraisal/employee_search_filter.dart';
import 'package:buro_employee/views/annual_appraisal/input_key_performance.dart';
import 'package:buro_employee/views/cash_flow/cash_flow_main.dart';
import 'package:buro_employee/views/cash_flow/customer_details.dart';
import 'package:buro_employee/views/cash_flow/customer_list.dart';
import 'package:buro_employee/views/cash_flow/input_sheet.dart';
import 'package:buro_employee/views/cash_flow/output_sheet.dart';
import 'package:buro_employee/views/field_visit/add_bill/bill_req_list.dart';
import 'package:buro_employee/views/field_visit/add_bill/bill_submit.dart';
import 'package:buro_employee/views/field_visit/apply/apply_list.dart';
import 'package:buro_employee/views/field_visit/apply/apply_page.dart';
import 'package:buro_employee/views/field_visit/approvalrequest/approval_details.dart';
import 'package:buro_employee/views/field_visit/approvalrequest/approval_list.dart';
import 'package:buro_employee/views/field_visit/bill_report/bill_report.dart';
import 'package:buro_employee/views/field_visit/bill_report/search_report.dart';
import 'package:buro_employee/views/field_visit/field_visit_main.dart';
import 'package:buro_employee/views/field_visit/myPlanList/my_plan_detail.dart';
import 'package:buro_employee/views/field_visit/myPlanList/my_plan_list.dart';
import 'package:buro_employee/views/field_visit/myrequest/request_details.dart';
import 'package:buro_employee/views/field_visit/myrequest/request_list.dart';
import 'package:buro_employee/views/field_visit/plan/plan_submit.dart';
import 'package:buro_employee/views/field_visit/planApprovalRequst/plan_approval_details.dart';
import 'package:buro_employee/views/field_visit/planApprovalRequst/plan_approval_list.dart';
import 'package:buro_employee/views/general_info/employee_general_info_list.dart';
import 'package:buro_employee/views/general_info/generalInfo_search_filter.dart';
import 'package:buro_employee/views/general_info/generalinfo_main.dart';
import 'package:buro_employee/views/home/home_page.dart';
import 'package:buro_employee/views/home/notification.dart';
import 'package:buro_employee/views/leave/apply_leave.dart';
import 'package:buro_employee/views/leave/leave_authorization_detail.dart';
import 'package:buro_employee/views/leave/leave_authorization_list.dart';
import 'package:buro_employee/views/leave/leave_history.dart';
import 'package:buro_employee/views/leave/leave_main.dart';
import 'package:buro_employee/views/leave/pending_leave.dart';
import 'package:buro_employee/views/login/create_account.dart';
import 'package:buro_employee/views/login/forget_password.dart';
import 'package:buro_employee/views/login/login_screen.dart';
import 'package:buro_employee/views/login/forgotpass_verification.dart';
import 'package:buro_employee/views/login/login_verification.dart';
import 'package:buro_employee/views/login/reset_password.dart';
import 'package:buro_employee/views/login/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repository/models/annual_appraisal.dart';
import '../repository/models/bill_request.dart';
import '../repository/models/employee_general_info.dart';





class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    //print("routeSettings ${routeSettings.name} ${routeSettings.arguments}");

    switch (routeSettings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case SplashScreen.routeName:
        return SplashScreen.route();
      case LoginVerification.routeName:
        {
          if (routeSettings.arguments != null)
            return MaterialPageRoute(
                builder: (_) =>
                    LoginVerification(routeSettings.arguments as LoginUser));
          else
            break;
        }

      case LandingScreen.routeName:
        {
          return MaterialPageRoute(
              builder: (_) => LandingScreen(
                    title: '',
                  ));
        }

      case FieldVisitMain.routeName:
        {
          return MaterialPageRoute(builder: (_) => FieldVisitMain());
        }

      case Apply.routeName:
        {
          if (routeSettings.arguments != null)
            return MaterialPageRoute(
                builder: (_) => Apply(routeSettings.arguments as ApplyRequest));
          else
            return MaterialPageRoute(builder: (_) => Apply());
        }

      case ApplyList.routeName:
        return ApplyList.route();

      case ApprovalList.routeName:
        return ApprovalList.route();

      case ApprovalDetails.routeName:
        {
          if (routeSettings.arguments != null)
            return MaterialPageRoute(
                builder: (_) => ApprovalDetails(
                    routeSettings.arguments as ApprovalRequestInfo));
          else
            break;
        }

      case RequestList.routeName:
        return RequestList.route();

      case RequestDetails.routeName:
        {
          if (routeSettings.arguments != null)
            return MaterialPageRoute(
                builder: (_) => RequestDetails(routeSettings.arguments as int));
          else
            break;
        }
      case BillSubmit.routeName:
        {
          {
            if (routeSettings.arguments != null)
              return MaterialPageRoute(
                  builder: (_) => BillSubmit(routeSettings.arguments as int));
            else
              break;
          }
        }

      case CreateRole.routeName:
        return CreateRole.route();

      case CreateUser.routeName:
        return CreateUser.route();

      case BillReqList.routeName:
        return BillReqList.route();

      case ForgotPassVerification.routeName:
        {
          if (routeSettings.arguments != null)
            return MaterialPageRoute(
                builder: (_) => ForgotPassVerification(
                    routeSettings.arguments as GenerateOTP));
          else
            break;
        }

      case ResetPassword.routeName:
        {
          if (routeSettings.arguments != null)
            return MaterialPageRoute(
                builder: (_) =>
                    ResetPassword(routeSettings.arguments as String));
          else
            //return ResetPassword.route();
            break;
        }

      case PlanSubmit.routeName:
        return PlanSubmit.route();

      case PlanApprovalList.routeName:
        return PlanApprovalList.route();

      case MyPlanList.routeName:
        return MyPlanList.route();

      case MyPlanDetail.routeName:
        {
          if (routeSettings.arguments != null)
            return MaterialPageRoute(
                builder: (_) => MyPlanDetail(routeSettings.arguments as int));
          else
            break;
        }

      case PlanApprovalDetails.routeName:
        {
          if (routeSettings.arguments != null)
            return MaterialPageRoute(
                builder: (_) => PlanApprovalDetails(
                    routeSettings.arguments as ApprovalRequestInfo));
          else
            break;
        }

      case '/forgetPasswordNew':
        {
          //print('In Switch case');
          return ForgetPassword.routensj();
        }

        case '/annualAppraisalMain':
        {
          //print('In Switch case');

          if (routeSettings.arguments != null){
            return MaterialPageRoute(
                builder: (_) => AnnualAppraisalMain(
                    routeSettings.arguments as SearchFilter));}
          else
            break;
          //return MaterialPageRoute(builder: (_) => AnnualAppraisalMain());
        }

        case '/employeeSearchFilter':
        {
          print('In employeeSearchFilter case');
          return MaterialPageRoute(builder: (_) => EmployeeSearchFilter());
        }
        case '/inputKeyPerformance':
        {
          // print('In employeeSearchFilter case');
          // return MaterialPageRoute(builder: (_) => InputKeyPerformance());


          if (routeSettings.arguments != null)
            return MaterialPageRoute(
                builder: (_) => InputKeyPerformance(
                    routeSettings.arguments as EmployeeListData));
          else
            break;
        }

      case LeaveMain.routeName:
        {
          print('In Switch case');
          return MaterialPageRoute(builder: (_) => LeaveMain());

        }
      case PendingLeave.routeName:
        {
          print('In Switch case');
          return MaterialPageRoute(builder: (_) => PendingLeave());

        }
        case ApplyLeave.routeName:
        {
          print('In Switch case');
          return MaterialPageRoute(builder: (_) => ApplyLeave());

        }
      case LeaveAuthorizationList.routeName:
        {
          print('In Switch case');
          return MaterialPageRoute(builder: (_) => LeaveAuthorizationList());
        }
        
        case LeaveAuthorizationDetail.routeName:
        {
          print('In Switch case');


          if (routeSettings.arguments != null)
            return MaterialPageRoute(
                builder: (_) => LeaveAuthorizationDetail(
                    routeSettings.arguments as int));
          else
            break;


          //return MaterialPageRoute(builder: (_) => LeaveAuthorizationDetail());
        }


      case CashFlowMain.routeName:
        {
          print('In Switch case');

          if (routeSettings.arguments != null){
            return MaterialPageRoute(builder: (_) => CashFlowMain(routeSettings.arguments as CustomerDetailsArguments));

          }
          else
            break;



        }

        case CustomerDetails.routeName:
        {
          print('In Switch case');

          if (routeSettings.arguments != null){
            return MaterialPageRoute(
                builder: (_) => CustomerDetails(
                    routeSettings.arguments as CustomerDetailsArguments));

          }
          else
            break;
        }

        case OutputSheet.routeName:
        {
          print('In Switch case');
          if (routeSettings.arguments != null){
            return MaterialPageRoute(
                builder: (_) => OutputSheet(
                    routeSettings.arguments as CustomerDetailsArguments));}
          else
            break;

        }


      case CustomerList.routeName:
        {
          print('In Switch case');
          return MaterialPageRoute(builder: (_) => CustomerList());
        }

        case InputSheet.routeName:
        {
          print('In Switch case jnnn');
          if (routeSettings.arguments != null){
            return MaterialPageRoute(
                builder: (_) => InputSheet(
                    routeSettings.arguments as CustomerDetailsArguments));
          }
          else {

            break;
          }

        }

      case LeaveHistory.routeName:
        return LeaveHistory.route();

      case BillReport.routeName:
        {
          print('In Switch case jnnn');
          if (routeSettings.arguments != null){
            return MaterialPageRoute(
                builder: (_) => BillReport(
                    routeSettings.arguments as ReportFilter));
          }
          else {

            break;
          }

        }

        case SearchFilterReport.routeName:
        return SearchFilterReport.route();
      case NotificationScreen.routeName:
        return NotificationScreen.route();

      case EmployeeGeneralInfoList.routeName:
        {
          //print('In Switch case');
          if (routeSettings.arguments != null){
            return MaterialPageRoute(
                builder: (_) => EmployeeGeneralInfoList(
                    routeSettings.arguments as GeneralInfoSearchFilterModel));}
          else
            break;
          //return MaterialPageRoute(builder: (_) => AnnualAppraisalMain());
        }

        case GeneralInfoMain.routeName:
        return GeneralInfoMain.route();

      case GeneralInfoSearchFilter.routeName:
        return GeneralInfoSearchFilter.route();

      case CreateAccount.routeName:
        {
          //print('In Switch case');
          return CreateAccount.route();
        }


      default:
        return SplashScreen.route();
    }
  }
}
