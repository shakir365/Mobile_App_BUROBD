class _Environments {
  //final base_url = 'http://apps.burobd.org/bbhrm_app_test/'; //for all network
  //final base_url = 'http://192.168.1.134/bbhrm_app_test/';
 // final base_url = 'http://192.168.1.115/bbhrm_app_test/'; //for all network

  //final base_url = 'http://27.147.137.34/bbhrm_app_test/'; // test for outside
  final base_url = 'https://apps.burobd.org/bbhrm_app/'; // final or Live url
  // final base_url = 'http://10.50.1.15/bbhrm_app/';
  //final base_url = 'http://192.168.1.134/bbhrm_app_test/
  // Login
  final userAuthenticate = 'api/Authentication/authenticate';
  final userLoginWithToken = 'api/User/LoginUser';
  final submit_otp_login = 'api/User/OTPSubmit';

  // Forgot Password
  final generate_otp = 'api/User/OTP_Generate';
  final changePassForgot = 'api/User/ChangePasswordIfForgot';


  // Home Page
  final get_module = 'api/Home/GetModulePermission';
  final sub_module = 'api/Home/GetModuleUIPermission/';
  final my_request_list = 'api/FieldVisit/MyRequestList';
  final my_request_details = 'api/FieldVisit/MyRequestDetails';
  final my_request_cancel_single = 'api/FieldVisit/MyRequestCancel';
  final my_request_cancel_all = 'api/FieldVisit/MyRequestCancelAll';

  // Plan
  final my_plan_list = 'api/FieldVisit/MyPlanList';
  final my_plan_detail = 'api/FieldVisit/MyPlanDetails/';

  //bill and Report
  final my_bill_req_list = 'api/FieldVisitBill/MyRequestList';
  final my_bill_req_details = 'api/FieldVisitBill/MyRequestDetails';
  final plan_list_approved = 'api/FieldVisit/ApprovedPlanList';
  final submit_plan = 'api/FieldVisit/PlanSubmit';
  final all_plan_cancel = 'api/FieldVisit/PlanCancelAll/';
  final individual_plan_cancel = 'api/FieldVisit/PlanDetailsCancel/';
  final submit_apply = 'api/FieldVisit/ApplicationSubmit/';
  final branch_list = 'api/BasicData/BranchList';
  final change_pass = 'api/User/ChangePassword';
  final my_bill_submit = 'api/FieldVisitBill/ApplicationSubmit';
  final my_bill_download_info =
      'api/Report_FieldVisit/BillDownload'; // this Url is Used for download bill Info
  final approval_plan_list = 'api/FieldVisit/ApprovalPlanList';
  final approval_plan_details = 'api/FieldVisit/ApprovalPlanDetails/';
  final all_plan_action = 'api/FieldVisit/ApprovalPlanAction';
  final individual_plan_action = 'api/FieldVisit/ApprovalPlanDetailsAction';

  final approval_request_list = 'api/FieldVisit/ApprovalRequestList';
  final approval_request_details = 'api/FieldVisit/ApprovalRequestLDetails';
  final approval_action_single = 'api/FieldVisit/ApprovalListDetailsAction';
  final approval_action_all = 'api/FieldVisit/ApprovalListAction';
  final submit_otp_forgot = 'api/User/OTPSubmitIfForgot';

  final breakfast_bill_info = 'api/FieldVisitBill/BreakFastBillInfo';
  final lunch_dinner_bill_info = 'api/FieldVisitBill/LunchNDinnerBillInfo';
  final residence_bill_info = 'api/FieldVisitBill/ResidenceBillInfo';
  final daily_n_special_allowance = 'api/FieldVisitBill/DailyNSpecialBillInfo';
  final field_visit_plan_summary = 'api/FieldVisit/FieldVisitPlanSummary';

  //--Apa--
  final apa_emp_score = 'api/AnnualAppraisal/KPIEmployeeScore';
  final apa_sup_comment = 'api/AnnualAppraisal/KPIEmpSuperVisorComment/';
  final apa_target_score = 'api/AnnualAppraisal/KPIEmployeeTargetScore';
  final apa_leave_info = 'api/AnnualAppraisal/KPIEmployeeleavehistory/';
  final apa_comment_history = 'api/AnnualAppraisal/KPIEmployeeCommenthistory/';
  final apa_recommendation_history =
      'api/AnnualAppraisal/KPIRcommendationhistory/';
  final apa_menu_information = 'api/AnnualAppraisal/KPIMenuInformation';
  final apa_approval_path_information =
      'api/AnnualAppraisal/KPIgetApprovalPathInfo';
  final apa_next_path_history = 'api/AnnualAppraisal/KPIgetNextPathHistoryId';
  final apa_hr_recom_score = 'api/AnnualAppraisal/KPIEmpScoreAvgSum';
  final apa_submit_general_comment =
      'api/AnnualAppraisal/KPISubmitGeneralComment';
  final apa_submit_leave = 'api/AnnualAppraisal/KPISubmitEmpleaveInfo';

  final apa_submit_super_comment =
      'api/AnnualAppraisal/KPISubmitSupervisorComment';
  final apa_submit_hr_score = 'api/AnnualAppraisal/KPISubmitHrRecommendation';
  final apa_submit_emp_score = 'api/AnnualAppraisal/KPISubmitScore';
  final apa_submit_target_score = 'api/AnnualAppraisal/KPISubmitTargetScore';

  final apa_submit_recommendation =
      'api/AnnualAppraisal/KPISubmitRecommendation';
  final apa_employee_info = 'api/Employee/';
  final apa_employee_list = 'api/AnnualAppraisal/EmployeeList';

  final designation_list = 'api/BasicData/DesignationList';
  final zone_list = 'api/BasicData/ZoneList';

  ///api/BasicData/ZoneList
  final grade_list = 'api/BasicData/GradeList';
  final liability_list = 'api/BasicData/LiabilityList';
  final fiscalYear_list = 'api/AnnualAppraisal/fiscalYear';
  final branch_list_apa = 'api/BasicData/BranchList';
  final department_list = 'api/BasicData/DepartmentList';
  final division_list = 'api/BasicData/DivisionList';
  final area_list = 'api/BasicData/AreaList';

  final apa_approval_path_set = 'api/AnnualAppraisal/approvalPathSet/';
  final apa_recommendation_list = 'api/AnnualAppraisal/kpirecommendationList';
  final division_list_bd = 'api/BasicData/DivisionListBD';

  //------Leave-------
  final my_leave_list = 'api/Leave/GetRemainingLeave/';
  final my_leave_post_request = 'api/Leave/leaveApply';
  final my_leave_list_test = 'api/Leave/GetRemainingLeave';
  final my_leave_list_test_single = 'api/Leave/GetRemainingLeave/17816/106';
  final my_leave_report = 'http://localhost:8089/applyforleave';
  final my_leave_approve_request = 'api/Leave/GetRemainingLeave/15857';
  final my_leave_details = 'api/Leave/GetLeavedetails';
  final my_leave_search = 'api/Leave/GetLeavesearch';
  final my_leave_get_country = 'api/BasicData/AllCountry';
  final my_leave_get_division_by_country = 'api/Leave/Getstate';
  final my_leave_get_division = 'api/BasicData/DivisionListBD';
  final my_leave_get_district_by_division = 'api/BasicData/DistrictList/';
  final my_leave_get_thana_by_district = 'api/BasicData/ThanaList';
  final approval_request_list_for_leave = 'api/Leave/GetPendingLeaveBySelf';
  final approval_request_details_for_leave = 'api/Leave/GetPendingLeaveBySelf';
  final approval_action_single_for_leave =
      'api/Leave/ApprovalListDetailsActionforleave';
  final approval_action_all_for_leave = 'api/Leave/ApprovalListActionforleave';
  final leave_get_module = 'api/Home/Leave/GetModulePermission';
  final leave_sub_module = 'api/Home/Leave/GetModuleUIPermission/';
  final leave_my_request_list =
      'api/Leave/GetPendingLeaveBySelf'; //working on 16/2/2023
  final leave_my_request_details = 'api/Leave/MyRequestDetails';
  final leave_my_request_cancel_single = 'api/Leave/MyRequestCancel';
  final leave_my_request_cancel_all = 'api/Leave/MyRequestCancelAll';
  final pending_leave_list_for_applicant = 'api/Leave/GetPendingLeaveBySelf';
  final pending_leave_list_for_approval = 'api/Leave/GetPendingLeaveByApprover';
  final leave_history = '/api/Leave/GetLeaveHistory';
  final leave_self_cancel = 'api/Leave/LeaveRequestUpdate';
  final leave_request_update = 'api/Leave/LeaveRequestUpdate';

  //Cash Flow

  // output sheet
  final all_cash_in_flow = 'api/Customer/GetAllCashInflow/';
  final business_cash_out_flow = 'api/Customer/GetBusinessCashOutflow/';
  final business_net_profit = 'api/Customer/GetNetProfitFromBusiness/';
  final net_house_hold_cash_surplus =
      'api/Customer/GetNetHouseholdCashSurplus/';
  final house_hold_expenses = 'api/Customer/GetHouseholdExpenses/';
  final recurring_expense = 'api/Customer/GetRecurringExpense/';
  final total_monthly_surplus = 'api/Customer/GetTotalMonthlySurplus/';
  final loan_eligibility_record = 'api/Customer/GetLoanEligibilityRecord/';

  // Customer Details

  final set_customer_details = 'api/Customer/SetCustomerDetails';
  final set_enterprise_details = 'api/Customer/SetEnterpriseDetails';
  final set_proposed_loan_details = 'api/Customer/SetLoanDetails';
  final set_supplier_verification = 'api/Customer/SetSupplierInformation';
  final set_buyer_verification = 'api/Customer/SetBuyerVerification/';
  final set_personal_reference_verification =
      'api/Customer/SetPersonalReferenceVerification';

  final set_sales_cashbook = 'api/Customer/SetSalesCashbookInput';
  final set_purchase_cashbook = 'api/Customer/SetPurchaseCashbook';
  final set_bank_balance = 'api/Customer/SetBankBalance';
  final set_sales = 'api/Customer/SetSales';
  final set_purchases = 'api/Customer/SetMFPurchase';
  final set_stock = '/api/Customer/SetMFStock';
  final set_business_expense_monthly =
      'api/Customer/SetMFBusinessExpenseMonthly';
  final set_other_income_monthly = 'api/Customer/SetMFOtherIncomeMonthly';
  final set_personal_expense_monthly =
      'api/Customer/SetMFPersonalExpenseMonthly';
  final set_existing_loans = 'api/Customer/SetMFExistingLoan';
  final set_regular_investment = 'api/Customer/SetMFRegularInvestment';
  final set_product_sale_price = 'api/Customer/SetMFProductSalePrice';
  final set_product_purchase_price = 'api/Customer/SetMFProductPurchasePrice';
  final set_manufacturing_option_one =
      'api/Customer/SetMFManufacturingOptionOne';
  final set_manufacturing_option_two =
      'api/Customer/SetMFManufacturingOptionTwo';
  final set_qualitative_aspects = '/api/Customer/SetMFQualitativeAspects';

  final get_customer_list = '/api/Customer/CustomerList';
  final delete_customer = '/api/Customer/deleteCustomer/';
  final get_next_customer_id = '/api/Customer/MFgetNextCustomerId';

  // Get Customer Details

  final get_enterprise_details = '/api/Customer/EnterpriseList/';
  final get_loan_details = '/api/Customer/LoanList/';
  final get_supplier_information = '/api/Customer/SupplierInformation/';
  final get_buyer_information = '/api/Customer/BuyerInformation/';
  final get_personal_reference_info = '/api/Customer/PersonalReferences/';
  final get_sales_cashbook = '/api/Customer/SalesCashbook/';
  final get_purchase_cashbook = '/api/Customer/PurchaseCashbook/';
  final get_bank_balance = '/api/Customer/BankBalance/';
  final get_sales_info = '/api/Customer/GetSales/';
  final get_purchase_info = '/api/Customer/getMFPurchase/';
  final get_stock_info = '/api/Customer/GetMFStock/';
  final get_other_income_monthly = '/api/Customer/getMFOtherIncomeMonthly/';

  final get_business_expense_monthly =
      '/api/Customer/GetMFBusinessExpenseMonthly/';
  final get_personal_expense_monthly =
      '/api/Customer/getMFPersonalExpenseMonthly/';
  final get_existing_loan = '/api/Customer/GetMFExistingLoan/';

  final get_regular_investment = '/api/Customer/GetMFRegularInvestment/';
  final get_product_sale_price = '/api/Customer/GetMFProductSalePrice/';
  final get_product_purchase_price = '/api/Customer/GetMFProductPurchasePrice/';
  final get_manufacturing_option_one =
      '/api/Customer/GetMFManufacturingOptionOne/';
  final get_manufacturing_option_two =
      '/api/Customer/GetMFManufacturingOptionTwo/';
  final get_qualitative_aspects = '/api/Customer/getMFQualitativeAspects/';

  final get_existing_customer_info =
      '/api/CoreFinance/GetExistingCustomerInfo?';
  final get_frequency_info = '/api/Customer/GetSalesPurchasesFrequency/';
  final get_seasonality_info = '/api/Customer/GetSeasonalitySales/';

  final get_working_capital = '/api/Customer/GetNetWorkingCapitalDays/';
  final get_working_capital_requirment =
      '/api/Customer/GetWorkingCapitalRequirement/';
  final set_mf_debt_burden = '/api/Customer/SetMFDebtBurden';

  final get_margin = '/api/Customer/GetMargin/';



  //Device Info
  final set_device_info = '/api/Notification/SendDeviceInfo';
  final emp_general_info = '/api/EmpGeneralInfo/EmployeeGeneralInformation';

  //registration
  final get_info_registration = '/api/EmpRegistration/RegistrationEmpInformation';
  final change_password_registration = '/api/EmpRegistration/RegistrationChangePassword';


  //File Upload Download
  final  file_upload = '/api/FileUploadDownload/upload';
  final  file_download = '/api/FileUploadDownload/download/';

   //



}

_Environments environments = _Environments();
