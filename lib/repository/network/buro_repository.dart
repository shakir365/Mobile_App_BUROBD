import 'package:buro_employee/repository/models/ApprovedPlan.dart';
import 'package:buro_employee/repository/models/LeaveModel.dart';
import 'package:buro_employee/repository/models/OutputSheet.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:buro_employee/repository/models/apply_submit.dart';
import 'package:buro_employee/repository/models/approval_action.dart';
import 'package:buro_employee/repository/models/approval_request.dart';
import 'package:buro_employee/repository/models/approval_request_details.dart';
import 'package:buro_employee/repository/models/bill_download_info.dart';
import 'package:buro_employee/repository/models/bill_request.dart';
import 'package:buro_employee/repository/models/bill_request_details.dart';
import 'package:buro_employee/repository/models/bill_submit_model.dart';
import 'package:buro_employee/repository/models/branch.dart';
import 'package:buro_employee/repository/models/change_pass_model.dart';
import 'package:buro_employee/repository/models/customer_details.dart';
import 'package:buro_employee/repository/models/customer_details_input.dart';
import 'package:buro_employee/repository/models/customer_model.dart';
import 'package:buro_employee/repository/models/field_visit_report.dart';
import 'package:buro_employee/repository/models/generate_otp.dart';
import 'package:buro_employee/repository/models/leave.dart';
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
import 'package:buro_employee/repository/network/buro_api_provider.dart';
import 'package:flutter/cupertino.dart';

import '../models/Leaveinfo.dart';
import '../models/bill_model.dart';
import '../models/customer_details_edit.dart';
import '../models/device_info.dart';
import '../models/employee_general_info.dart';
import '../models/leaveapprovalaction.dart';
import '../models/leaveapprovalrequest.dart';
import '../models/leaveapprovalrequestdetails.dart';

class BuroRepository {
  final _provider = BuroApiProvider();

  /*Future<LoginUser> authenticate(String username, String password) async {
    return await _provider.authenticate(username, password);
  }*/

  Future<VerifyOtp> verifyOtp(String mobileOtp, String emailOtp) async {
    return await _provider.verifyOtp(mobileOtp, emailOtp);
  }

  Future<Module?> getModule() async {
    return await _provider.getModule();
  }

  Future<SubModule> getSubModule(String moduleId) async {
    return await _provider.getSubModule(moduleId);
  }

  Future<MyRequest> getRequestList() async {
    return await _provider.getMyRequest();
  }

  Future<MyRequestDetails> getRequestDetail(int applicationId) async {
    return await _provider.getRequestDetails(applicationId);
  }

  Future<RequestCancel> cancelRequest(
      int appDetailsId, int applicationId) async {
    return await _provider.requestCancel(appDetailsId, applicationId);
  }

  Future<RequestCancelAll> cancelAllRequest(int applicationId) async {
    return await _provider.requestCancelAll(applicationId);
  }

  Future<ApprovalRequest> getApprovalRequest() async {
    return await _provider.getApprovalRequest();
  }

  Future<ApprovalRequestDetails> getApprovalDetails(int applicationID) async {
    return await _provider.getApprovalDetails(applicationID);
  }

  Future<ApprovalAction> approvalAction(
      int appDetailsId, int applicationId, String actionType) async {
    return await _provider.approvalAction(
        appDetailsId, applicationId, actionType);
  }

  Future<ApprovalAction> approvalActionAll(
      int applicationId, String actionType) async {
    return await _provider.approvalActionAll(applicationId, actionType);
  }

  Future<ApplySubmit> submitApplyList(List applyList, int planId) async {
    return await _provider.submitApplyList(applyList, planId);
  }

  Future<ChangePasswordModel> changePassword(
      String oldPass, String newPass, String confirmPass) async {
    return await _provider.changePassword(oldPass, newPass, confirmPass);
  }

  Future<Branch> getBranchList() async {
    return await _provider.getAllBranch();
  }

  Future<Branch> getBranchListApa() async {
    return await _provider.getBranchList();
  }

  Future<GenerateOTP> getOtp(String userId) async {
    return await _provider.getOtp(userId);
  }

  Future<VerifyOtp> submitOtpForgotPass(
      String mobileOtp, String emailOtp) async {
    return await _provider.submitOtpForgotPass(mobileOtp, emailOtp);
  }

  Future<BillRequest> getBillRequest() async {
    return await _provider.getBillRequest();
  }

  Future<ChangePasswordModel> resetPassword(
      String oldPass, String newPass, String confirmPass) async {
    return await _provider.resetPassword(oldPass, newPass, confirmPass);
  }

  Future<BillRequestDetails> getBillRequestDetails(int applicationId) async {
    return await _provider.getBillDetails(applicationId);
  }

  Future<BillSubmitModel> billSubmit(List billingList) async {
    return await _provider.billSubmit(billingList);
  }

  Future<BillDownloadInfo?> getBillDownloadInfo(String applicationId) async {
    return await _provider.getBillDownloadInfo(applicationId);
  }

  Future<MyPlan> getMyPlan() async {
    return await _provider.getMyPlan();
  }

  Future<PlanApprovalRequest> getPlanApproval() async {
    return await _provider.getPlanApproval();
  }

  Future<PlanDetailModel> getPlanDetails(int planId) async {
    return await _provider.getPlanDetail(planId);
  }

  Future<PlanApprovalDetailsModel> getPlanApprovalDetails(int planId) async {
    return await _provider.getPlanApprovalDetail(planId);
  }

  /*Future<PlanApprovalDetailsModel> getPlanApprovalDetails(int planId) async {
    return await _provider.getPlanApprovalDetail(planId);
  }*/

  Future<ApprovalAction> planApprovalActionIndividual(
      // plan approval action from list
      int planDetailsId,
      int planId,
      String actionType) async {
    print('tttttttttt planDetailsID $planDetailsId planID $planId');

    return await _provider.planApprovalActionIndividual(
        planDetailsId, planId, actionType);
  }

  Future<ApprovalAction?> planApprovalActionAll(
      // plan approval action from details
      int applicationId,
      String actionType) async {
    return await _provider.planApprovalActionAll(applicationId, actionType);
  }

  Future<RequestCancel> cancelPlanRequestIndividual(int planDetailsId) async {
    return await _provider.cancelPlanReqIndividual(planDetailsId);
  }

  Future<RequestCancel> cancelPlanRequestAll(int planId) async {
    return await _provider.cancelPlanRequestAll(planId);
  }

  Future<ApplySubmit> submitPlan(var plan) async {
    return await _provider.submitPlan(plan);
  }

  Future<ApprovedPlan> getApprovedPlanList() async {
    return await _provider.getApprovedPlan();
  }

  Future<void> setUserData(LoginUser user) async {
    /* await setAccessToken(tokens.accessToken);
    await setRefreshToken(tokens.refreshToken);*/
  }

  Future<UserAthenticate> getToken(String username, String password,
      [BuildContext? context]) async {
    return await _provider.getToken(username, password, context);
  }

  Future<LoginUser> authenticateWithToken(String token) async {
    return await _provider.authenticateWithToken(token);
  }

  Future<ApaEmployeeList> getApaEmployeeList(
      int fdesignationId,
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
    return await _provider.getApaEmployeeList(
        fdesignationId,
        searchEmpPin,
        departmentId,
        branchId,
        zoneId,
        empJobStatus,
        gradeId,
        liabilityId,
        fiscalYear,
        divisionId,
        areaId,
        recomId,
        recomCount);
  }

  Future<ApaEmpBasicinfo> getApaEmpBasicInfo(
      String empPin, int fiscalYear) async {
    return await _provider.getApaEmpBasicInfo(empPin, fiscalYear);
  }

  Future<ApaEmpScore> getApaEmpScore(GetEmpScore getEmpScore) async {
    return await _provider.getApaEmpScore(getEmpScore);
  }

  Future<ApaSupervisorComment> getEmpSupComment(var qAssignId) async {
    return await _provider.getEmpSupComment(qAssignId);
  }

  Future<EmpTargetScore> getEmpTargetScore(
      int qAssignId, int fiscalYear) async {
    return await _provider.getEmpTargetScore(qAssignId, fiscalYear);
  }

  Future<EmpLeaveHistory> getEmpLeaveInfo(int qAssignId) async {
    return await _provider.getEmpLeaveInfo(qAssignId);
  }

  Future<EmpCommentHistory> getEmpCmntHistory(int qAssignId) async {
    return await _provider.getEmpCmntHistory(qAssignId);
  }

  Future<EmpRecomHistory> getEmpRecomHistory(int qAssignId) async {
    return await _provider.getEmpRecomHistory(qAssignId);
  }

  Future<EmpMenuInformation> getEmpMenuInfo(GetMenuInfo getMenu) async {
    return await _provider.getEmpMenuInfo(getMenu);
  }

  Future<ApaApprovalPathInfo> getAprvlPathInfo(
      GetApprovalPathInfo getApprovalPathInfo) async {
    return await _provider.getApprovalPathInfo(getApprovalPathInfo);
  }

  Future<ApaNextPathHistory> getNextPathHistory() async {
    return await _provider.getNextPathHistory();
  }

  Future<ApaHrRecomScore> getHrRecomScore(GetHrScore getHrScore) async {
    return await _provider.getHrScore(getHrScore);
  }

  Future<ApaSubmit> submitGeneralComment(
      SubmitGeneralCommentModel submitModel) async {
    return await _provider.apaSubmitGeneralComment(submitModel);
  }

  Future<ApaSubmit> apaSubmitLeaveInfo(SubmitLeaveInfo submitLeaveInfo) async {
    return await _provider.apaSubmitLeave(submitLeaveInfo);
  }

  Future<ApaSubmit> apaSubmitSuperComment(
      SubmitSuperComment superComment) async {
    return await _provider.apaSubmitSuperComment(superComment);
  }

  Future<ApaSubmit> apaSubmitHrScore(SubmitHrScore submitHrScore) async {
    return await _provider.apaSubmitHrScore(submitHrScore);
  }

  Future<ApaSubmit?> apaSubmitEmpScore(
      List<SubmitScoreItem> scoreList, int historyId) async {
    return await _provider.apaSubmitEmpScore(scoreList, historyId);
  }

  Future<ApaSubmit> apaSubmitTargetScore(
      List<SubmitTargetScoreItem> scoreList, int historyId) async {
    return await _provider.apaSubmitTargetScore(scoreList, historyId);
  }

  Future<ApaSubmit> apaSubmitRecommendation(
      List<SubmitRecomItem> scoreList, int historyId) async {
    return await _provider.apaSubmitRecommendation(scoreList, historyId);
  }

  Future<ApaEmployeeInfo> apaGetEmployeeInfo(String empCode) async {
    return await _provider.apaGetEmployeeInfo(empCode);
  }

  Future<Designation> getDesignation() async {
    return await _provider.getDesignationList();
  }

  Future<Zone> getZone() async {
    return await _provider.getZoneList();
  }

  Future<Grade> getGradeList() async {
    return await _provider.getGradeList();
  }

  Future<Liability> getLiabilityList() async {
    return await _provider.getLiabilityList();
  }

  Future<FiscalYear> getFiscalYearList() async {
    return await _provider.getFiscalYearList();
  }

  Future<Department> getDepartmentList() async {
    return await _provider.getDepartmentList();
  }

  Future<RecommendationList> getRecommendationList() async {
    return await _provider.getRecommendationList();
  }

  Future<AreaList> getAreaList() async {
    return await _provider.getAreaList();
  }

  Future<ApprovalPathSet> getApprovalPathSetInfo(int qSetId) async {
    return await _provider.getApprovalPathSetInfo(qSetId);
  }

  Future<Division> getDivisionList() async {
    return await _provider.getDivisionList();
  }

  Future<RemainingLeaveInfo> getRemainingLeaveInfo() async {
    print('Get leave list called ');
    return await _provider.getRemainingLeaveInfo();
  }

  Future<ApplySubmit> createLeaveRequest(Map data) async {
    return await _provider.createLeaveRequest(data);
  }

//On 20/2/2023 This code has been added for user cancel function
  Future<bool> leaveRequestUpdate(Map data) async {
    return await _provider.leaveRequestUpdate(data);
  }

  Future<RemainingLeaveInfo> getLeaveRecord() async {
    return await _provider.getLeaveRecord();
  }

  Future<dynamic> getCountryList() async {
    return await _provider.getCountryList();
  }

  Future<DivisionLeave> getDivisionListLeave() async {
    return await _provider.getDivisionListLeave();
  }

  Future<DistrictLeave> getDistricttListByDivision(var div) async {
    return await _provider.getDistrictListByDivision(div);
  }

  Future<ApprovalRequestForLeave> getApprovalRequestForLeave() async {
    return await _provider.getApprovalRequestforleave();
  }

  Future<ApprovalRequestDetailsforleave> getApprovalDetailsForLeave(
      int applicationID) async {
    return await _provider.getApprovalDetailsforleave(applicationID);
  }

  Future<ApprovalActionforleave> leaveApprovalActionAll(
      int applicationId, String actionType) async {
    return await _provider.approvalActionAllForLeave(applicationId, actionType);
  }

  Future<PendingLeaveData> getPendingLeaveList() async {
    return await _provider.getPendingLeaveList();
  }

  Future<LeaveApproveList> getPendingLeaveListForApprover() async {
    return await _provider.getPendingLeaveListForApprover();
  }

  Future<ApprovalActionforleave> approvalActionforleave(
      int appDetailsId, int applicationId, String actionType) async {
    return await _provider.approvalActionForLeave(
        appDetailsId, applicationId, actionType);
  }

  Future<AllCashInFlowModel> getAllCashInFlow(int customerId) async {
    return await _provider.getAllCashInFlow(customerId);
  }

  Future<CashOutFlowModel> getBusinessCashOutFlow(int customerId) async {
    return await _provider.getBusinessCashOutFlow(customerId);
  }

  Future<BusinessNetProfitModel> getBusinessNetProfit(int customerId) async {
    return await _provider.getBusinessNetProfit(customerId);
  }

  Future<NetHouseholdSurplusModel> getNetHouseHoldSurplus(
      int customerId) async {
    return await _provider.getNetHouseHoldSurplus(customerId);
  }

  Future<HouseHoldExpensesModel> getHouseholdExpenses(int customerId) async {
    return await _provider.getHouseholdExpenses(customerId);
  }

  Future<RecurringExpenseModel> getRecurringExpense(int customerId) async {
    return await _provider.getRecurringExpense(customerId);
  }

  Future<TotalMonthlySurplusModel> getTotalMonthlySurplus(
      int customerId) async {
    return await _provider.getTotalMonthlySurplus(customerId);
  }

  Future<LoanEligibilityModel> getLoanEligibilityRecord(int customerId) async {
    return await _provider.getLoanEligibilityRecord(customerId);
  }

  Future<ApplySubmit> setCustomerDetails(Customer customerDetails) async {
    return await _provider.setCustomerDetails(customerDetails);
  }

  Future<ApplySubmit> setEnterpriseDetails(
      EnterpriseDetails enterpriseDetails) async {
    return await _provider.setEnterpriseDetails(enterpriseDetails);
  }

  Future<ApplySubmit> setProposedLoanDetails(
      ProposedLoanDetails proposedLoanDetails) async {
    return await _provider.setProposedLoanDetails(proposedLoanDetails);
  }

  Future<ApplySubmit> setSupplierVerification(
      SupplierVerification supplierVerification) async {
    return await _provider.setSupplierVerification(supplierVerification);
  }

  Future<ApplySubmit> setBuyerVerification(
      BuyerVerification buyerInformation) async {
    return await _provider.setBuyerVerification(buyerInformation);
  }

  Future<ApplySubmit> setPersonalReferenceVerification(
      PersonalReferenceVerification personalReferenceVerification) async {
    return await _provider
        .setPersonalReferenceVerification(personalReferenceVerification);
  }

  Future<ApplySubmit> setSalesCashbook(SalesCashbook salesCashbook) async {
    return await _provider.setSalesCashbook(salesCashbook);
  }

  Future<ApplySubmit> setPurchaseCashbook(
      PurchaseCashBook purchaseCashMemoDetails) async {
    return await _provider.setPurchaseCashBook(purchaseCashMemoDetails);
  }

  Future<ApplySubmit> setBankBalance(BankBalance balance) async {
    return await _provider.setBankBalance(balance);
  }

  Future<ApplySubmit> setSales(SalesDetails balance) async {
    return await _provider.setSales(balance);
  }

  Future<ApplySubmit> setPurchase(PurchaseDetails purchaseDetails) async {
    return await _provider.setPurchase(purchaseDetails);
  }

  Future<ApplySubmit> setStock(StockDetails stockDetails) async {
    return await _provider.setStock(stockDetails);
  }

  Future<ApplySubmit> setOtherIncomeMonthly(
      OtherIncomeMonthly stockDetails) async {
    return await _provider.setOtherIncomeMonthly(stockDetails);
  }

  Future<ApplySubmit> setBusinessExpenseMonthly(
      BusinessExpenseDetails businessExpenseDetails) async {
    return await _provider.setBusinessExpenseMonthly(businessExpenseDetails);
  }

  Future<ApplySubmit> setPersonalExpenseMonthly(
      PersonalExpenseDetails businessExpenseDetails) async {
    return await _provider.setPersonalExpenseMonthly(businessExpenseDetails);
  }

  Future<ApplySubmit> setRegularInvestment(
      RegularInvestment regularInvestment) async {
    return await _provider.setRegularInvestment(regularInvestment);
  }

  Future<ApplySubmit> setQualitativeAspects(
      QualitativeAspects regularInvestment) async {
    return await _provider.setQualitativeAspects(regularInvestment);
  }

  Future<ApplySubmit> setProductSalePrice(List productSalePrizeList) async {
    return await _provider.setProductSalePrice(productSalePrizeList);
  }

  Future<ApplySubmit> setProductPurchasePrice(List productSalePrizeList) async {
    return await _provider.setProductPurchasePrice(productSalePrizeList);
  }

  Future<ApplySubmit> setExistingLoans(List productSalePrizeList) async {
    return await _provider.setExistingLoans(productSalePrizeList);
  }

  Future<CustomerListModel> getCustomerList(String memberID) async {
    return await _provider.getCustomerList(memberID);
  }

  Future<ApplySubmit> deleteCustomer(int customerID) async {
    return await _provider.deleteCustomer(customerID);
  }

  Future<ApplySubmit> setManufacturingOptionOne(List manufacturingList) async {
    return await _provider.setManufacturingOptionOne(manufacturingList);
  }

  Future<ApplySubmit> setManufacturingOptionTwo(List manufacturingList) async {
    return await _provider.setManufacturingOptionTwo(manufacturingList);
  }

  Future<NextCustomerID> getNextCustomerID() async {
    return await _provider.getNextCustomerID();
  }

  Future<EnterpriseListEdit> getEnterpriseDetails(int customerID) async {
    return await _provider.getEnterpriseDetails(customerID);
  }

  Future<ProposedLoanEdit> getLoanDetails(int customerID) async {
    return await _provider.getLoanDetails(customerID);
  }

  Future<SupplierInformationEdit> getSupplierVerificationDetails(
      int customerID) async {
    return await _provider.getSupplierVerificationDetails(customerID);
  }

  Future<BuyerInformationEdit> getBuyerVerificationDetails(
      int customerID) async {
    return await _provider.getBuyerVerificationDetails(customerID);
  }

  Future<PersonalReferenceEdit> getPersonalReferenceInformation(
      int customerID) async {
    return await _provider.getPersonalReferenceInformation(customerID);
  }

  Future<SalesCashbookEdit> getSalesCashBook(int customerID) async {
    return await _provider.getSalesCashBook(customerID);
  }

  Future<PurchaseCashbookEdit> getPurchaseCashBook(int customerID) async {
    return await _provider.getPurchaseCashBook(customerID);
  }

  Future<BankBalanceEdit> getBankBalance(int customerID) async {
    return await _provider.getBankBalance(customerID);
  }

  Future<SalesEdit> getSales(int customerID) async {
    return await _provider.getSales(customerID);
  }

  Future<PurchaseEdit> getPurchaseDetails(int customerID) async {
    return await _provider.getPurchaseDetails(customerID);
  }

  Future<StockEdit> getStockDetails(int customerID) async {
    return await _provider.getStockDetails(customerID);
  }

  Future<BusinessExpenseMonthlyEdit> getBusinessExpenseMonthly(
      int customerID) async {
    return await _provider.getBusinessExpenseMonthly(customerID);
  }

  Future<OtherIncomeMonthlyEdit> getOtherIncomeMonthly(int customerID) async {
    return await _provider.getOtherIncomeMonthly(customerID);
  }

  Future<PersonalExpenseMonthlyEdit> getPersonalExpenseDetails(
      int customerID) async {
    return await _provider.getPersonalExpenseDetails(customerID);
  }

  Future<ExistingLoanEdit> getExistingLoan(int customerID) async {
    return await _provider.getExistingLoan(customerID);
  }

  Future<RegularInvestmentEdit> getRegularInvestment(int customerID) async {
    return await _provider.getRegularInvestment(customerID);
  }

  Future<ProductSalePriceEdit> getProductSalePrice(int customerID) async {
    return await _provider.getProductSalePrice(customerID);
  }

  Future<ProductPurchasePriceEdit> getProductPurchasePrice(
      int customerID) async {
    return await _provider.getProductPurchasePrice(customerID);
  }

  Future<ManufecturingOptionOneEdit> getManufacturingOptionOne(
      int customerID) async {
    return await _provider.getManufacturingOptionOne(customerID);
  }

  Future<ManufecturingOptionTwoEdit> getManufacturingOptionTwo(
      int customerID) async {
    return await _provider.getManufacturingOptionTwo(customerID);
  }

  Future<QualitativeAspectsEdit> getQualitativeAspects(int customerID) async {
    return await _provider.getQualitativeAspects(customerID);
  }

  Future<ExistingCustomerInfo> getExistingCustomerInfo(
      String loaneeCode) async {
    return await _provider.getExistingCustomerInfo(
      loaneeCode,
    );
  }

  Future<FrequencyModel> getFrequency(int customerID) async {
    return await _provider.getFrequencyInfo(customerID);
  }

  Future<SeasonalityModel> getSeasonalityInfo(int customerID) async {
    return await _provider.getSeasonalityInfo(customerID);
  }

  Future<WorkingCapitalModel> getWorkingCapital(int customerID) async {
    return await _provider.getWorkingCapital(customerID);
  }

  Future<WorkingCapitalRequirementModel> getWorkingCapitalRequirements(
      int customerID) async {
    return await _provider.getWorkingCapitalRequirements(customerID);
  }

  Future<MarginModel> getMargin(int customerID) async {
    return await _provider.getMargin(customerID);
  }

  Future<ApplySubmit> setDebtBurden(List debtBurdenList) async {
    return await _provider.setDebtBurden(debtBurdenList);
  }

  Future<BreakFastBill> getBreakFastBill() async {
    return await _provider.getBreakFastBill();
  }

  Future<LunchNDinnerBill> getLunchNDinnerBill() async {
    return await _provider.getLunchNDinnerBill();
  }

  Future<ResidenceBill> getResidenceBill() async {
    return await _provider.getResidenceBill();
  }

  Future<DailyNSpecialBill> getDailyNSpecialBill() async {
    return await _provider.getDailyNSpecialBill();
  }

  Future<LeaveHistoryModel> getLeaveHistoryList() async {
    return await _provider.getLeaveHistoryList();
  }

  Future<FieldVisitReport> getPlanSummary(ReportFilter reportFilter) async {
    return await _provider.getPlanSummary(reportFilter);
  }

  Future<ApplySubmit> setDeviceInfo(DeviceInfo deviceInfo) async {
    return await _provider.setDeviceInfo(deviceInfo);
  }

  Future<EmpGeneralInfoListModel> getEmpGeneralInfo(GeneralInfoSearchFilterModel searchFilter) async {
    return await _provider.getEmpGeneralInfo(searchFilter);
  }
  Future<FileUploadModel> fileUpload(FormData formData) async {
    return await _provider.fileUpload(formData);
  }

  Future<FileDownloadModel> fileDownload(int attachmentId) async {
    return await _provider.fileDownload(attachmentId);
  }


  Future<EmpGeneralInfoListModel> getEmpGeneralInfoForRegistration(String pin) async {
    return await _provider.getEmpGeneralInfoForRegistration(pin);
  }

  Future<ChangePasswordModel> changePasswordForRegistration(
      String oldPass, String mobileOTP,String newPass, String confirmPass) async {
    return await _provider.changePasswordForRegistration(oldPass,  mobileOTP,newPass, confirmPass);
  }


}
