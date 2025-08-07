import 'package:buro_employee/repository/bloc/acash_flow/bank_balance/bank_balance_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/business_expense_monthly/business_expense_monthly_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/buyer_verification/buyer_verification_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/customer_details/customer_details_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/enterprise_details/enterprise_details_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/other_income_monthly/other_income_monthly_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/personal_expense_monthly/personal_expense_monthly_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/personal_reference_verification/personal_reference_verification_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/proposed_loan_details/proposed_loan_details_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/purchase_cash_book/purchase_cash_book_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/purchases/purchases_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/qualitative_aspects/qualitative_aspects_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/regular_investment/regular_investment_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/sales/sales_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/sales_cash_book/sales_cash_book_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/stock/stock_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/supplier_verification/supplier_verification_cubit.dart';
import 'package:buro_employee/repository/bloc/customer_list/customer_list_cubit.dart';
import 'package:buro_employee/repository/bloc/product_purchase_prize/product_purchase_prize_cubit.dart';
import 'package:buro_employee/repository/bloc/product_sale_price/product_sale_price_cubit.dart';
import 'package:buro_employee/repository/models/customer_details.dart';
import 'package:buro_employee/sessionmanager/session_manager.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:buro_employee/views/cash_flow/input_sheet.dart';

import 'package:flutter/material.dart';

import '../../localization/Language/languages.dart';
import '../../repository/bloc/acash_flow/existing_loans/existing_loans_cubit.dart';
import '../../repository/bloc/manufecturing_option_one/manufecturing_option_one_cubit.dart';
import '../../repository/bloc/menufacturing_option_two/menufacturing_option_two_cubit.dart';
import '../../repository/models/customer_details_input.dart';
import '../../repository/network/buro_repository.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<NameIDModel> listCustomerStatusWithId = [];
List<NameIDModel> listGenderWithId = [];
List<NameIDModel> listGenderStatusWithId = [];
List<NameIDModel> listMaritalStatusWithId = [];
List<NameIDModel> listEducationalQualificationWithId = [];
List<NameIDModel> listConstitutionWithId = [];
var customerID = 0;
List<NameIDModel> listBusinessSegmentWithId = [];
List<NameIDModel> listAvailableTinWithId = [];
List<NameIDModel> listWorkplaceOwnerShipWithId = [];
List<NameIDModel> listWorkingCapitalWithId = [];
List<NameIDModel> listFacilityAppliedWithId = [];
List<NameIDModel> listTradeLicensesWithId = [];
List<NameIDModel> listRepaymentFrequencyWithId = [];
List<NameIDModel> listSupplyFrequencyWithId = [];
List<NameIDModel> listPaymentTermsWithId = [];
List<NameIDModel> listPaymentTimelinessWithId = [];
List<NameIDModel> listFeedbackOnCustomerWithId = [];
List<NameIDModel> listPurchaseFrequencyWithId = [];
List<NameIDModel> listServiceQualityWithId = [];
List<NameIDModel> listRelationWithCustomerWithId = [];
List<NameIDModel> listInteractionWithCustomerWithId = [];
List<NameIDModel> listResidenceOwnerShipWithId = [];
bool hasCustomerInfo = false;
bool hasEnterpriseInfo = false;
bool hasLoanInfo = false;
bool hasSupplierInfo = false;
bool hasBuyerInfo = false;
bool hasReferenceInfo = false;
List<NameIDModel> listRePaymentBehaviourWithId = [];
class CustomerDetails extends StatefulWidget {
  static const String routeName = '/CustomerDetails';
  final CustomerDetailsArguments arguments;
  const CustomerDetails(this.arguments, {Key? key}) : super(key: key);
  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails>
    with SingleTickerProviderStateMixin {
  List<String> titles = <String>[
    'Customer\n Details',
    'Enterprise\n Details',
    'Proposed Loan\n Details',
    'Supplier\n Verification',
    'Buyer \nVerification',
    'Personal \nReference \nVerification',
  ];
  var genderSelectedValue;
  int genderSelectedValueID = 0;

  var maritalStatusSelectedValue;
  int maritalStatusSelectedID = 0;

  var qualificationSelectedValue;
  int qualificationSelectedID = 0;

  var repaymentSelectedValue;
  int repaymentSelectedID = 0;

  var SelectedValueConstitution;
  int SelectedValueConstitutionID = 0;

  var SelectedValueSegment;
  int SelectedValueSegmentID = 0;

  var SelectedValueTradeLicenses;
  int SelectedValueTradeLicensesID = 0;

  var SelectedValueAvailableTin;
  int SelectedValueAvailableTinID = 0;

  var SelectedValueOwnerShip;
  int SelectedValueOwnerShipID = 0;

  var SelectedWorkingCapital;
  var SelectedWorkingCapitalPreviousLoan;

  int SelectedWorkingCapitalID = 0;
  int SelectedWorkingCapitalIDPreviousLoan = 0;

  var SelectedFacilityApplied;
  var SelectedFacilityAppliedPrevious;

  int SelectedFacilityAppliedID = 0;
  int SelectedFacilityAppliedIDPreviousLoan = 0;

  var SelectedRepaymentFrequency;
  var SelectedRepaymentFrequencyPreviousCustomerDetails;
  var SelectedRepaymentFrequencyPreviousProposedLoan;

  int SelectedRepaymentFrequencyID = 0;
  int SelectedRepaymentFrequencyIDPreviousLoan = 0;

  int SelectedRepaymentFrequencyIDPreviousProposedLoan = 0;

  var SelectedSupplyFrequency;
  int SelectedSupplyFrequencyID = 0;

  var SelectedPaymentTerms;
  int SelectedPaymentTermsID = 0;

  var SelectedPaymentTimeLine;
  int SelectedPaymentTimeLineID = 0;

  var SelectedSupplierFeedback;
  int SelectedSupplierFeedbackID = 0;

  var SelectedPurchaseFrequency;
  int SelectedPurchaseFrequencyID = 0;

  var SelectedPaymentTermsBuyer;
  int SelectedPaymentTermsBuyerID = 0;

  var SelectedProductQuality;
  int SelectedProductQualityID = 0;

  var SelectedProductQualityPurchase;
  int SelectedProductQualityPurchaseID = 0;

  var SelectedBuyerFeedback;
  int SelectedBuyerFeedbackID = 0;

  var SelectedRelationWithCustomer;
  int SelectedRelationWithCustomerID = 0;

  var SelectedInteractionWithCustomer;
  int SelectedInteractionWithCustomerID = 0;

  var SelectedFeedbackOnCustomer;
  int SelectedFeedbackOnCustomerID = 0;

  var customerStatusSelectedValue;
  int customerStatusSelectedValueID = 0;

  var customerStatusPreviousSelectedValue;
  int customerStatusPreviousSelectedValueID = 0;

  var SelectedResidenceOwner;
  int SelectedResidenceOwnerID = 0;

  var SelectedRepaymentBehaviorCustomerDetails;
  int SelectedRepaymentBehaviorID = 0;

  var SelectedRepaymentBehaviorPrevious;
  int SelectedRepaymentBehaviorPreviousID = 0;

  final startDateController = TextEditingController();
  final dateFormat = DateFormat("yyyy-MM-dd");
  late DateTime? dateOfBirthDate;

  late final tabController;
  late ProductSalePriceCubit blocProductSale;
  late ProductPurchasePrizeCubit blocProductPurchase;
  late ExistingLoansCubit existingLoansCubit;
  late EnterpriseDetailsCubit enterpriseDetailsCubit;
  late ProposedLoanDetailsCubit proposedLoanDetailsCubit;
  late TextEditingController productSaleTypeController;
  late TextEditingController productSalePriceController;
  late TextEditingController productSaleUnitsController;

  late TextEditingController productPurchaseTypeController;
  late TextEditingController productPurchasePriceController;
  late TextEditingController productPurchaseUnitsController;
  late TextEditingController memberCodeController;
  late TextEditingController customerNameController;
  late TextEditingController customerStatusController;
  late TextEditingController customerStatusPreviousLoanController;
  late TextEditingController genderController;
  late TextEditingController dateOfBirthController;
  late TextEditingController maritalStatusController;
  late TextEditingController qualificationController;
  late TextEditingController housePinCodeController;
  late TextEditingController noOfFamilyMemberController;
  late TextEditingController noOfEarningMemberController;
  late TextEditingController residenceOwnershipController;
  late TextEditingController residenceStayVintageController;
  late TextEditingController vintageWithBuroController;
  late TextEditingController currentSavingsAmountController;
  late TextEditingController currentSavingsAmountPreviousLoanController;
  late TextEditingController peakSavingAmountController;
  late TextEditingController exitingLoanAmountController;

  // late TextEditingController exitingLoanAmountPreviousLoanController;
  late TextEditingController exitingRepaymentBehaviorController;
  late TextEditingController exitingRepaymentBehaviorPreviousLoanController;
  late TextEditingController exitingPeakDPDLast12MonthController;
  late TextEditingController exitingPeakDPDLast12MonthPreviousLoanController;

  late TextEditingController enterpriseName;

  late TextEditingController workplacePinCode;
  late TextEditingController businessSubSegment;
  late TextEditingController workPlaceVintage;
  late TextEditingController grossMarginBusiness;
  //late TextEditingController grossMarginBusinessPrevious;
  late TextEditingController numberPaidRegularEmployee;
  late TextEditingController numberPaidRegularEmployeePrevious;
  late BuroRepository repository;

  // proposed Loan Details;

  late TextEditingController loanAppliedAmountController;
  late TextEditingController loanAppliedAmountPreviousLoanController;
  late TextEditingController tenureAppliedMonthsController;
  late TextEditingController tenureAppliedMonthsPreviousLoanController;
  late TextEditingController roiProposedController;
  late TextEditingController roiProposedControllerPreviousLoan;
  late TextEditingController endUseWorkingCapitalController;

  late TextEditingController endUseWorkingCapitalPreviousController;
  late TextEditingController facilityAppliedController;
  late TextEditingController facilityAppliedPreviousLoanController;
  late TextEditingController proposedLoanRepaymentFrequency;
  late TextEditingController proposedLoanRepaymentFrequencyPreviousLoan;

  late TextEditingController proposedLoanAffordableEMIController;
  late TextEditingController proposedLoanAffordableEMIControllerPreviousLoan;

  late TextEditingController loanEligibilityCashFlowController;
  late TextEditingController loanEligibilityCashFlowControllerPrevious;

  late TextEditingController approvedLoanAmountController;
  late TextEditingController approvedLoanAmountControllerPreviousLoan;

  // Supplier Verification

  late TextEditingController nameOfSupplierController;
  late TextEditingController supplierMobileNumberController;

  late TextEditingController supplierLocationController;
  late TextEditingController numberOfSupplyingYearsController;

  late TextEditingController typeOfProductController;
  late TextEditingController averageMonthlySupplyAmountController;

  // Buyer Verification

  late TextEditingController nameOfBuyerController;
  late TextEditingController buyerMobileNumberController;

  late TextEditingController buyerLocationController;
  late TextEditingController numberOfPurchasingYearsController;

  late TextEditingController purchaseFrequencyController;
  late TextEditingController averageMonthlyPurchaseAmountController;

  // Personal reference Verification

  late TextEditingController nameOfPersonController;
  late TextEditingController referenceMobileNumberController;

  late TextEditingController referenceLocationController;
  late TextEditingController relationWithCustomerController;

  late TextEditingController numberOfKnowingCustomerController;
  late TextEditingController levelOfInteractionWithCustomerController;
  late TextEditingController feedbackWithCustomerController;

  // Sales Cash Book
  //last month
  late TextEditingController salesMemolastMonthFifth;
  late TextEditingController salesMemolastMonthTenth;
  late TextEditingController salesMemolastMonthFifteen;
  late TextEditingController salesMemolastMonthTwenty;
  late TextEditingController salesMemolastMonthTwentyFive;
  late TextEditingController salesMemolastMonthThirty;

  late TextEditingController salesMemotwoMonthBackFifth;
  late TextEditingController salesMemotwoMonthBackTenth;
  late TextEditingController salesMemotwoMonthBackFifteen;
  late TextEditingController salesMemotwoMonthBackTwenty;
  late TextEditingController salesMemotwoMonthBackTwentyFive;
  late TextEditingController salesMemotwoMonthBackThirty;

  late TextEditingController salesMemothreeMonthBackFifth;
  late TextEditingController salesMemothreeMonthBackTenth;
  late TextEditingController salesMemothreeMonthBackFifteen;
  late TextEditingController salesMemothreeMonthBackTwenty;
  late TextEditingController salesMemothreeMonthBackTwentyFive;
  late TextEditingController salesMemothreeMonthBackThirty;

  // Purchase cash Book

  late TextEditingController purchaselastMonthFifth;
  late TextEditingController purchaselastMonthFifteen;
  late TextEditingController purchaselastMonthTwentyFive;

  late TextEditingController purchasetwoMonthBackFifth;
  late TextEditingController purchasetwoMonthBackFifteen;
  late TextEditingController purchasetwoMonthBackTwentyFive;

  late TextEditingController purchasethreeMonthBackFifth;
  late TextEditingController purchasethreeMonthBackFifteen;
  late TextEditingController purchasethreeMonthBackTwentyFive;

  // Bank Balance

  late TextEditingController banklastMonthFifth;
  late TextEditingController banklastMonthFifteen;
  late TextEditingController banklastMonthTwentyFive;

  late TextEditingController banktwoMonthBackFifth;
  late TextEditingController banktwoMonthBackFifteen;
  late TextEditingController banktwoMonthBackTwentyFive;

  late TextEditingController bankthreeMonthBackFifth;
  late TextEditingController bankthreeMonthBackFifteen;
  late TextEditingController bankthreeMonthBackTwentyFive;

  late TextEditingController bankfourMonthFifth;
  late TextEditingController bankfourMonthFifteen;
  late TextEditingController bankfourMonthTwentyFive;

  late TextEditingController bankfiveMonthBackFifth;
  late TextEditingController bankfiveMonthBackFifteen;
  late TextEditingController bankfiveMonthBackTwentyFive;

  late TextEditingController banksixMonthBackFifth;
  late TextEditingController banksixMonthBackFifteen;
  late TextEditingController banksixMonthBackTwentyFive;

  // Sales

  late TextEditingController salesClosedInWeek;
  late TextEditingController salesNoOfDaysWorkingInMonth;

  late TextEditingController salesDaily;
  late TextEditingController salesWeekly;
  late TextEditingController salesMonthly;
  late TextEditingController salesMonthlyPrevious;

  late TextEditingController salesLowMonthCount;
  late TextEditingController salesLowAmount;
  late TextEditingController salesHighMonthCount;
  late TextEditingController salesHighAmount;
  late TextEditingController salesNormalMonthCount;
  late TextEditingController salesNormalAmount;

  late TextEditingController salesDebtors;
  late TextEditingController salesDebtorsPreviousLoan;
  late TextEditingController salesGrowthPostFunding;

  // Purchase

  late TextEditingController purchaseDaily;
  late TextEditingController purchaseWeekly;
  late TextEditingController purchaseMonthly;
  late TextEditingController purchaseCreditors;
  late TextEditingController purchaseMonthlyPreviousLoan;
  late TextEditingController purchaseCreditorsPreviousLoan;

  // Stock

  late TextEditingController stockFinishedGood;
  late TextEditingController stockFinishedGoodPreviousLoan;
  late TextEditingController stockRawMaterial;
  late TextEditingController stockRawMaterialPreviousLoan;

  // OtherIncomeMonthly

  late TextEditingController agricultureIncome;
  late TextEditingController rentalIncome;
  late TextEditingController familyMemberSalaryIncome;
  late TextEditingController alliedAgriIncome;
  late TextEditingController otherIncome;

  late TextEditingController agricultureIncomePreviousLoan;
  late TextEditingController rentalIncomePreviousLoan;
  late TextEditingController familyMemberSalaryIncomePreviousLoan;
  late TextEditingController alliedAgriIncomePreviousLoan;
  late TextEditingController otherIncomPreviousLoan;

  // Business expense Monthly
  late TextEditingController businessFactoryRent;
  late TextEditingController businessElectricity;
  late TextEditingController businessStaffSalary;
  late TextEditingController businessMobileInternet;
  late TextEditingController businessTransportCost;
  late TextEditingController businessGasNWater;
  late TextEditingController businessRepairNMaintenance;
  late TextEditingController businessDieselForGenerator;
  late TextEditingController businessMarketing;
  late TextEditingController businessLabourExpense;
  late TextEditingController businessBillNSecurity;
  late TextEditingController businessTax;
  late TextEditingController businessEntertainment;
  late TextEditingController businessOtherBusinessExpense;

  late TextEditingController businessFactoryRentPreviousLoan;
  late TextEditingController businessElectricityPreviousLoan;
  late TextEditingController businessStaffSalaryPreviousLoan;
  late TextEditingController businessMobileInternetPreviousLoan;
  late TextEditingController businessTransportCostPreviousLoan;
  late TextEditingController businessGasNWaterPreviousLoan;
  late TextEditingController businessRepairNMaintenancePreviousLoan;
  late TextEditingController businessDieselForGeneratorPreviousLoan;
  late TextEditingController businessMarketingPreviousLoan;
  late TextEditingController businessLabourExpensePreviousLoan;
  late TextEditingController businessBillNSecurityPreviousLoan;
  late TextEditingController businessTaxPreviousLoan;
  late TextEditingController businessEntertainmentPreviousLoan;
  late TextEditingController businessOtherBusinessExpensePreviousLoan;

  // Personal expense Monthly
  late TextEditingController personalExpenseHouseRent;
  late TextEditingController personalExpenseFood;
  late TextEditingController personalExpenseCloth;
  late TextEditingController personalExpenseEducation;
  late TextEditingController personalExpenseElectricity;
  late TextEditingController personalExpenseTransport;
  late TextEditingController personalExpenseMobileInternet;
  late TextEditingController personalExpenseMedical;
  late TextEditingController personalExpenseEntertainment;
  late TextEditingController personalExpenseRepairNMaintenance;
  late TextEditingController personalExpenseMaid;
  late TextEditingController personalExpenseHouseTax;
  late TextEditingController personalExpenseOtherExpense;

  late TextEditingController personalExpenseHouseRentPrevious;
  late TextEditingController personalExpenseFoodPrevious;
  late TextEditingController personalExpenseClothPrevious;
  late TextEditingController personalExpenseEducationPrevious;
  late TextEditingController personalExpenseElectricityPrevious;
  late TextEditingController personalExpenseTransportPrevious;
  late TextEditingController personalExpenseMobileInternetPrevious;
  late TextEditingController personalExpenseMedicalPrevious;
  late TextEditingController personalExpenseEntertainmentPrevious;
  late TextEditingController personalExpenseRepairNMaintenancePrevious;
  late TextEditingController personalExpenseMaidPrevious;
  late TextEditingController personalExpenseHouseTaxPrevious;
  late TextEditingController personalExpenseOtherExpensePrevious;

  // Regular Investment

  late TextEditingController investmentLifeInsurance;
  late TextEditingController investmentGeneralInsurance;
  late TextEditingController investmentDPS;
  late TextEditingController investmentGrossMargin;
  late TextEditingController investmentMonthlyCashInhand;
  late TextEditingController investmentLifeInsurancePreviousLoan;
  late TextEditingController investmentGeneralInsurancePreviousLoan;
  late TextEditingController investmentDPSPreviousLoan;
  late TextEditingController investmentGrossMarginPreviousLoan;
  late TextEditingController investmentMonthlyCashInhandPreviousLoan;

  late TextEditingController promoter;
  late TextEditingController businessActivity;
  late TextEditingController marketNDemand;
  late TextEditingController recommendation;

  // Existing Loan

  late TextEditingController existLoanNameOfInstitute;
  late TextEditingController existLoanAmount;
  late TextEditingController existLoanEmi;
  late TextEditingController existLoanOutstanding;
  late TextEditingController existLoanTenor;
  late TextEditingController existLoanpaidTenor;
  late TextEditingController existLoanBalanceTenor;
  late TextEditingController existLoanloanToBeClosed;
  late TextEditingController existLoanobligate;
  late TextEditingController existLoanpreviousObligate;

  // Manufacturing Option One

  late TextEditingController manufacturingTypeOfProduct;
  late TextEditingController manufacturingNumberOfUnits;
  late TextEditingController manufacturingAverageSalePrize;
  late TextEditingController manufacturingProductionCost;

  // Manufacturing Option Two

  late TextEditingController materialCost;
  late TextEditingController otherCashCost;
  late TextEditingController averageSaleVolume;
  late TextEditingController debtBurdenManufacturing;
  late TextEditingController debtBurdenPreviousLoan;
  var addSaleProduct = false;
  var addPurchaseProduct = false;
  var addExistingLoan = false;
  var addManufacturingOptionOne = false;
  var addManufacturingOptionTwo = false;

  //var addPurchaseProduct = false;
  late ManufecturingOptionOneCubit manufecturingOptionOneCubit;
  late ManufacturingOptionTwoCubit manufacturingOptionTwoCubit;
  late CustomerListCubit customerListCubit;
  late SupplierVerificationCubit supplierVerificationCubit;
  late BuyerVerificationCubit buyerVerificationCubit;
  late PersonalReferenceVerificationCubit personalReferenceVerificationCubit;

  late SalesCashBookCubit salesCashBookCubit;
  late PurchaseCashBookCubit purchaseCashBookCubit;
  late BankBalanceCubit bankBalanceCubit;
  late SalesCubit salesCubit;
  late PurchasesCubit purchasesCubit;
  late StockCubit stockCubit;
  late BusinessExpenseMonthlyCubit businessExpenseMonthlyCubit;
  late OtherIncomeMonthlyCubit otherIncomeMonthlyCubit;
  late PersonalExpenseMonthlyCubit personalExpenseMonthlyCubit;
  late RegularInvestmentCubit regularInvestmentCubit;
  late QualitativeAspectsCubit qualitativeAspectsCubit;
  late CustomerDetailsCubit customerDetailsCubit;

  late bool isNewCustomer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.APP_THEME_COLOR,
        iconTheme: IconThemeData(color: ColorResources.WHITE),
        title: Center(
          child: Text(
            'Customer Details',
            style: Styles.appBarTextStyle,
          ),
        ),
        scrolledUnderElevation: 10.0,
        bottom: TabBar(
          labelColor: Colors.white, // Selected tab color
          unselectedLabelColor: Colors.black, // Unselected tab color
          indicatorColor: Colors.white, // Indicator color
          //padding: EdgeInsets.all(5),
          isScrollable: true,
          controller: tabController,
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
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          customer_details(), // Customer Details
          enterprise_details(), // Enterprise Details
          proposed_loan_details(),
          supplier_verification(),
          buyer_verification(),
          personal_reference_verification(),
        ],
      ),
      bottomNavigationBar: BlocConsumer<CustomerListCubit, CustomerListState>(
        listener: (context, state) {
          if (state is CustomerListErrorState) {
            final snackBar = SnackBar(
              content: Text(Languages.of(context)!.internetErrorText),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is CustomerListInitialState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CustomerListLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CustomerListLoadedState) {
            return Padding(
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
                                print(
                                    'dateOfBirthController.text 2 ${dateOfBirthController.text}');

                                tabController
                                    .animateTo(tabController.index - 1);
                              }
                            },
                            label: Text(
                              'Previous ',
                              style: Styles.buttonTextStyle,
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ColorResources.APP_THEME_COLOR,
                              minimumSize: const Size.fromHeight(50), // NEW
                            ),
                          )),
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
                            print('tabController.index ${tabController.index}');

                            print('CustomerID on click $customerID');

                            if(memberCodeController.text.isEmpty){

                              CommonMethods.showMessage(context, 'Insert Member Number', Colors.red);
                            } else {
                              if (widget.arguments.isEditable) {
                                if (tabController.index == 0 &&
                                    customerListCubit.hasCustomerInfo) {
                                  tabController
                                      .animateTo(tabController.index + 1);
                                } else if (tabController.index == 1 &&
                                    customerListCubit.hasEnterpriseInfo) {
                                  tabController
                                      .animateTo(tabController.index + 1);
                                } else if (tabController.index == 2 &&
                                    customerListCubit.hasLoanInfo) {
                                  tabController
                                      .animateTo(tabController.index + 1);
                                } else if (tabController.index == 3 &&
                                    customerListCubit.hasSupplierInfo) {
                                  tabController
                                      .animateTo(tabController.index + 1);
                                } else if (tabController.index == 4 &&
                                    customerListCubit.hasBuyerInfo) {
                                  tabController
                                      .animateTo(tabController.index + 1);
                                } else if (tabController.index == 5 &&
                                    customerListCubit.hasReferenceInfo) {
                                  Navigator.pushNamed(
                                      context, InputSheet.routeName,
                                      arguments: CustomerDetailsArguments(
                                          widget.arguments.isEditable
                                              ? widget.arguments.memberID
                                              : memberCodeController.text,
                                          widget.arguments.customerID,
                                          true,
                                          customerNameController.text));
                                } else {
                                  CommonMethods.showLoaderDialog(context);
                                  setCustomerInformation(
                                      widget.arguments.customerID);
                                }
                              }
                              else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Container(
                                        height: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(),
                                            SizedBox(height: 10),
                                            Text('Loading...'),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                                setCustomerInformation(customerID);
                              }
                            }


                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Submit',
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
                          // NEW
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // (state is WeatherError)
            return Center(
              child: Container(
                child: Text('Network Error 2'),
              ),
            );
          }
        },
      ),
    );
  }

  Widget customer_details() {
    //String? dropdownValue = listGender.first;
    return widget.arguments.isEditable
        ? BlocConsumer<CustomerListCubit, CustomerListState>(
            listener: (context, state) {
              if (state is CustomerListErrorState) {
                final snackBar = SnackBar(
                  content: Text(Languages.of(context)!.internetErrorText),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is CustomerListInitialState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CustomerListLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CustomerListLoadedState) {
                try {
                  memberCodeController.text = state.data[0].memberId!.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  customerNameController.text = state.data[0].customerName!;
                } catch (e) {
                  print(e);
                }
                try {
                  customerStatusSelectedValue = listCustomerStatusWithId[
                                      state.data[0].customerStatus! > 0
                                          ? state.data[0].customerStatus! - 1
                                          : 0];
                } catch (e) {
                  print(e);
                }
                try {
                  customerStatusPreviousSelectedValue = listCustomerStatusWithId[
                                      state.data[0].previousLoanCustomerStatus! > 0
                                          ? state.data[0].previousLoanCustomerStatus! - 1
                                          : 0];
                } catch (e) {
                  print(e);
                }

                print('gender ${state.data[0].gender!}');

                try {
                  genderSelectedValue = listGenderWithId[
                                      state.data[0].gender! > 0 ? state.data[0].gender! - 1 : 0];
                  genderSelectedValueID = listGenderWithId[
                                          state.data[0].gender! > 0
                                              ? state.data[0].gender! - 1
                                              : 0]
                                      .id;
                } catch (e) {
                  print(e);
                }
                try {
                  maritalStatusSelectedValue =
                                      listMaritalStatusWithId[state.data[0].maritalStatus ?? 0];
                } catch (e) {
                  print(e);
                }
                try {
                  maritalStatusSelectedID =
                                      listMaritalStatusWithId[state.data[0].maritalStatus ?? 0]
                                          .id;
                } catch (e) {
                  print(e);
                }
                try {
                  qualificationSelectedValue = listEducationalQualificationWithId[
                                      state.data[0].qualification ?? 0];
                } catch (e) {
                  print(e);
                }
                try {
                  qualificationSelectedID = listEducationalQualificationWithId[
                                          state.data[0].qualification ?? 0]
                                      .id;
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedResidenceOwner = listResidenceOwnerShipWithId[
                                      state.data[0].residenceOwnership ?? 0];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedResidenceOwnerID = listResidenceOwnerShipWithId[
                                          state.data[0].residenceOwnership ?? 0]
                                      .id;
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedRepaymentBehaviorCustomerDetails =
                                      listRePaymentBehaviourWithId[
                                          state.data[0].repaymentBehavior ?? 0];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedRepaymentBehaviorID = listRePaymentBehaviourWithId[
                                          state.data[0].repaymentBehavior ?? 0]
                                      .id;
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedRepaymentBehaviorPrevious =
                                      listRePaymentBehaviourWithId[
                                          state.data[0].previousLoanRepaymentBehaviour ?? 0];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedRepaymentBehaviorID = listRePaymentBehaviourWithId[
                                          state.data[0].previousLoanRepaymentBehaviour ?? 0]
                                      .id;
                } catch (e) {
                  print(e);
                }

                try {
                  String formateDateOfBirth = DateFormat.yMMMMd('en_US').format(
                                      DateTime.parse(state.data[0].dateOfBirth.toString()));


                  try {
                    dateOfBirthController.text = formateDateOfBirth;
                  } catch (e) {
                    print(e);
                  }

                } catch (e) {
                  print(e);
                }


                try {
                  housePinCodeController.text =
                                      state.data[0].housePincode.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  noOfEarningMemberController.text =
                                      state.data[0].earningMembersCount.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  noOfFamilyMemberController.text =
                                      state.data[0].familyMembersCount.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  residenceStayVintageController.text =
                                      state.data[0].residenceStayVintage.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  vintageWithBuroController.text =
                                      state.data[0].vintageWithBuroMonths.toString();
                } catch (e) {
                  print(e);
                }

                try {
                  currentSavingsAmountController.text =
                                      state.data[0].currentSavingsAmount.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  currentSavingsAmountPreviousLoanController.text =
                                      state.data[0].previousLoanSavingAmount.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  peakSavingAmountController.text =
                                      state.data[0].peakSavingsAmountLast12Months.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  exitingLoanAmountController.text =
                                      state.data[0].existingLoanAmount.toString();
                } catch (e) {
                  print(e);
                }
                //exitingLoanAmountPreviousLoanController.text = state.data[0].previousLoanAmount.toString();
                //SelectedRepaymentBehaviorCustomerDetails = listRePaymentBehaviourWithId[state.data[0].repaymentBehavior!];
                //SelectedRepaymentFrequencyPreviousCustomerDetails = listRePaymentBehaviourWithId[state.data[0].previousLoanRepaymentBehaviour!];
                try {
                  exitingPeakDPDLast12MonthController.text =
                                      state.data[0].peakDPDLast12Months.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  exitingPeakDPDLast12MonthPreviousLoanController.text =
                                      state.data[0].previousLoanPeakDPD.toString();
                } catch (e) {
                  print(e);
                }

                return SingleChildScrollView(
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            //Member Number

                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Member Number'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: memberCodeController,
                              onChanged: (comment) {},
                            ),
                          ), // Customer Number
                          Padding(
                            // Customer Name
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Customer Name'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              enabled: true,
                              controller: customerNameController,
                              onChanged: (comment) {},
                            ),
                          ), // Customer Name
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Customer Status'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        //dropdownValue = value?.name;
                                        setState(() {
                                          customerStatusSelectedValue = value;
                                          customerStatusSelectedValueID =
                                              value!.id;
                                        });

                                        print(
                                            'customerStatusSelectedValue ${customerStatusSelectedValue} id ${value!.id}');
                                      },
                                      items:
                                          listCustomerStatusWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: customerStatusSelectedValue,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Customer Status
                         /* Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Customer Status Previous'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        //dropdownValue = value!.name;
                                        setState(() {
                                          customerStatusPreviousSelectedValue =
                                              value;
                                          customerStatusPreviousSelectedValueID =
                                              value!.id;
                                        });
                                      },
                                      items:
                                          listCustomerStatusWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value:
                                          customerStatusPreviousSelectedValue,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), *///Customer Status Previous
                          Padding(
                            //Gender
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration:
                                    Styles.cashFormInputDecoration('Gender'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        print('OnChange called ${value!.name}');
                                        //dropdownValue = value!.name;
                                        setState(() {
                                          genderSelectedValue = value;
                                          genderSelectedValueID = value.id;
                                        });

                                        print(
                                            'OnChange called 2 ${genderSelectedValue} ');
                                      },
                                      items: listGenderWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: genderSelectedValue,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Gender
                          Padding(
                            //Date of Birth
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 15),
                            child: DateTimeField(
                              // Start Date
                              controller: dateOfBirthController,
                              decoration: Styles.cashFormInputDecoration(
                                  '     Date of Birth'),
                              style: Styles.mediumTextStyle,
                              format: dateFormat,
                              onChanged: (date) {
                                if (date != null)
                                  dateOfBirthDate = date;
                                else
                                  dateOfBirthDate = null;
                              },
                              onShowPicker: (context, currentValue) {
                                return showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1900),
                                    initialDate: currentValue ?? DateTime.now(),
                                    lastDate: DateTime(2100));
                              },
                            ),
                          ), //Date of Birth
                          Padding(
                            //Marital Status
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 5, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Marital Status'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select Marital Status'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        //dropdownValue = value!.name;
                                        setState(() {
                                          maritalStatusSelectedValue = value;
                                          maritalStatusSelectedID = value!.id;
                                        });
                                      },
                                      items:
                                          listMaritalStatusWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: maritalStatusSelectedValue,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), // Marital Status
                          Padding(
                            //Educational Qualification
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Educational Qualification'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        //dropdownValue = value!.name;
                                        setState(() {
                                          qualificationSelectedValue = value;
                                          qualificationSelectedID = value!.id;
                                        });
                                      },
                                      items: listEducationalQualificationWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: qualificationSelectedValue,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), // Educational Qualification
                          Padding(
                            //House Pin Code
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'House PostCode'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: housePinCodeController,
                              onChanged: (comment) {},
                            ),
                          ), //House Pin Code
                          Padding(
                            //No. of family members
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'No. of family members'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: noOfFamilyMemberController,
                              onChanged: (comment) {},
                            ),
                          ), //No. of family members
                          Padding(
                            //No. of earning member
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'No. of earning member'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              controller: noOfEarningMemberController,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //No. of earning member
                          Padding(
                            //Residence Ownership
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Residence Ownership'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select '),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        //dropdownValue = value!.name;
                                        setState(() {
                                          SelectedResidenceOwner = value;
                                          SelectedResidenceOwnerID = value!.id;
                                        });
                                      },
                                      items: listResidenceOwnerShipWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedResidenceOwner,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Residence Ownership
                          Padding(
                            //Residence Stay vintage
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Residence Stay vintage (Years)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: residenceStayVintageController,
                              onChanged: (comment) {},
                            ),
                          ), //Residence Stay vintage
                          Padding(
                            //Vintage with buro in month
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Vintage with buro in month'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: vintageWithBuroController,
                              onChanged: (comment) {},
                            ),
                          ), //Vintage with buro in month
                          Padding(
                            //Current Savings amount
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Current Savings amount with BURO (Tk)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: currentSavingsAmountController,
                              onChanged: (comment) {},
                            ),
                          ), //Current Savings amount
                          Padding(
                            //Current Savings amount
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Savings amount during previous loan'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller:
                                  currentSavingsAmountPreviousLoanController,
                              onChanged: (comment) {},
                            ),
                          ), //Current Savings amount
                          Padding(
                            // Peak savings amount
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Highest savings amount in last 12 months in BURO (Tk)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              controller: peakSavingAmountController,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //Peak savings amount
                          Padding(
                            // If existing loan customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'If existing loan customer,previous loan amount(Tk)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              controller: exitingLoanAmountController,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //If existing loan customer
                          /*     Padding(
                      // If existing loan customer Previous
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'If existing loan customer Previous'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        controller: exitingLoanAmountPreviousLoanController,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        onChanged: (comment) {},
                      ),
                    ), //If existing loan customer Previous*/
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Repayment Behavior'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select '),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        //dropdownValue = value!.name;
                                        setState(() {
                                          SelectedRepaymentBehaviorCustomerDetails =
                                              value;
                                          SelectedRepaymentBehaviorID =
                                              value!.id;
                                        });
                                      },
                                      items: listRePaymentBehaviourWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value:
                                          SelectedRepaymentBehaviorCustomerDetails,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Repayment Behavior
                          /*   Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'Repayment Behavior Previous'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select ' ?? ''),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  dropdownValue = value!.name;
                                  setState(() {
                                    SelectedRepaymentBehaviorPrevious = value;
                                    SelectedRepaymentBehaviorPreviousID = value.id;
                                    print('SelectedRepaymentBehaviorPreviousID $SelectedRepaymentBehaviorPreviousID');
                                  });
                                },
                                items: listRePaymentBehaviourWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedRepaymentBehaviorPrevious,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),*/ //Repayment Behavior Previous
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Peak DPD in last 12 month'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: exitingPeakDPDLast12MonthController,
                              onChanged: (comment) {},
                            ),
                          ), //Peak DPD in last 12 month
                          /* Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Peak DPD in last 12 month Previous Loan'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        controller: exitingPeakDPDLast12MonthPreviousLoanController,
                        onChanged: (comment) {},
                      ),
                    ),*/ //Peak DPD in last 12 month Previous
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                // (state is WeatherError)
                return Center(
                  child: Container(
                    child: Text('Network Error 2'),
                  ),
                );
              }
            },
          )
        : SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      //Member Number
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorResources.TEXT_FIELD_COLOR,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
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
                              suffixIcon: IconButton(
                                onPressed: () {
                                  customerDetailsCubit.getExistingCustomerInfo(
                                    memberCodeController.text,
                                  );
                                },
                                icon: Icon(Icons.search),
                              ),

                              //hintText: 'মন্তব্য',
                              label: Text('Member Number'),
                              contentPadding: EdgeInsets.all(20),
                              hintStyle: TextStyle(
                                  color: ColorResources.GREY_SEVENTY)),
                          cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                          style: Styles.hintTextStyle,
                          maxLines: null,
                          keyboardType: TextInputType.number,
                          enabled: true,
                          controller: memberCodeController,
                          onChanged: (comment) {}),
                    ), // Customer Number
                    BlocConsumer<CustomerDetailsCubit, CustomerDetailsState>(
                      listener: (context, state) {
                        if (state is CustomerDetailsErrorState) {
                          /*final snackBar = SnackBar(
            content: Text(Languages.of(context)!.internetErrorText),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
                        }
                      },
                      buildWhen: (previous, current) => previous != current,
                      builder: (context, state) {
                        if (state is CustomerDetailsInitialState) {
                          return Column(
                            children: [
                              Padding(
                                // Customer Name
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 5),
                                child: TextFormField(
                                  decoration: Styles.cashFormInputDecoration(
                                      'Customer Name'),
                                  cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                  style: Styles.hintTextStyle,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  enabled: true,
                                  controller: customerNameController,
                                  onChanged: (comment) {},
                                ),
                              ), // Customer Name
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: Container(
                                  height: 60,
                                  child: InputDecorator(
                                    decoration: Styles.cashFormInputDecoration(
                                        'Customer Status'),
                                    child: DropdownButtonHideUnderline(
                                      child: Theme(
                                        data: ThemeData(
                                            canvasColor: Colors.white),
                                        child: DropdownButton<NameIDModel>(
                                          isExpanded: true,
                                          hint: Text('Select'),
                                          onChanged: (NameIDModel? value) {
                                            //selectedDesignation = value;
                                            //dropdownValue = value?.name;
                                            setState(() {
                                              customerStatusSelectedValue =
                                                  value;
                                              customerStatusSelectedValueID =
                                                  value!.id;
                                            });
                                          },
                                          items: listCustomerStatusWithId
                                              .map((item) {
                                            return DropdownMenuItem<
                                                NameIDModel>(
                                              child: Text(item.name),
                                              value: item,
                                            );
                                          }).toList(),
                                          value: customerStatusSelectedValue,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ), //Customer Status
                             /* Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: Container(
                                  height: 60,
                                  child: InputDecorator(
                                    decoration: Styles.cashFormInputDecoration(
                                        'Customer Status Previous'),
                                    child: DropdownButtonHideUnderline(
                                      child: Theme(
                                        data: ThemeData(
                                            canvasColor: Colors.white),
                                        child: DropdownButton<NameIDModel>(
                                          isExpanded: true,
                                          hint: Text('Select'),
                                          onChanged: (NameIDModel? value) {
                                            //selectedDesignation = value;
                                            //dropdownValue = value!.name;
                                            setState(() {
                                              customerStatusPreviousSelectedValue =
                                                  value;
                                              customerStatusPreviousSelectedValueID =
                                                  value!.id;
                                            });
                                          },
                                          items: listCustomerStatusWithId
                                              .map((item) {
                                            return DropdownMenuItem<
                                                NameIDModel>(
                                              child: Text(item.name),
                                              value: item,
                                            );
                                          }).toList(),
                                          value:
                                              customerStatusPreviousSelectedValue,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),*/ //Customer Status Previous
                              Padding(
                                //Gender
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: Container(
                                  height: 60,
                                  child: InputDecorator(
                                    decoration: Styles.cashFormInputDecoration(
                                        'Gender'),
                                    child: DropdownButtonHideUnderline(
                                      child: Theme(
                                        data: ThemeData(
                                            canvasColor: Colors.white),
                                        child: DropdownButton<NameIDModel>(
                                          isExpanded: true,
                                          hint: Text('Select'),
                                          onChanged: (NameIDModel? value) {
                                            //selectedDesignation = value;
                                            //dropdownValue = value!.name;
                                            setState(() {
                                              genderSelectedValue = value;
                                              genderSelectedValueID = value!.id;
                                            });
                                          },
                                          items: listGenderWithId.map((item) {
                                            return DropdownMenuItem<
                                                NameIDModel>(
                                              child: Text(item.name),
                                              value: item,
                                            );
                                          }).toList(),
                                          value: genderSelectedValue,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ), //Gender
                              Padding(
                                //Date of Birth
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 15),
                                child: DateTimeField(
                                  // Start Date
                                  controller: dateOfBirthController,
                                  decoration: Styles.cashFormInputDecoration(
                                      '     Date of Birth'),
                                  style: Styles.mediumTextStyle,
                                  format: dateFormat,
                                  onChanged: (date) {
                                    if (date != null)
                                      dateOfBirthDate = date;
                                    else
                                      dateOfBirthDate = null;
                                  },
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2100));
                                  },
                                ),
                              ), //Date of Birth
                              Padding(
                                //Marital Status
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 5, bottom: 5),
                                child: Container(
                                  height: 60,
                                  child: InputDecorator(
                                    decoration: Styles.cashFormInputDecoration(
                                        'Marital Status'),
                                    child: DropdownButtonHideUnderline(
                                      child: Theme(
                                        data: ThemeData(
                                            canvasColor: Colors.white),
                                        child: DropdownButton<NameIDModel>(
                                          isExpanded: true,
                                          hint: Text('Select Marital Status'),
                                          onChanged: (NameIDModel? value) {
                                            //selectedDesignation = value;
                                            //dropdownValue = value!.name;
                                            setState(() {
                                              maritalStatusSelectedValue =
                                                  value;
                                              maritalStatusSelectedID =
                                                  value!.id;
                                            });
                                          },
                                          items: listMaritalStatusWithId
                                              .map((item) {
                                            return DropdownMenuItem<
                                                NameIDModel>(
                                              child: Text(item.name),
                                              value: item,
                                            );
                                          }).toList(),
                                          value: maritalStatusSelectedValue,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ), // Marital Status
                              Padding(
                                //Educational Qualification
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: Container(
                                  height: 60,
                                  child: InputDecorator(
                                    decoration: Styles.cashFormInputDecoration(
                                        'Educational Qualification'),
                                    child: DropdownButtonHideUnderline(
                                      child: Theme(
                                        data: ThemeData(
                                            canvasColor: Colors.white),
                                        child: DropdownButton<NameIDModel>(
                                          isExpanded: true,
                                          hint: Text('Select'),
                                          onChanged: (NameIDModel? value) {
                                            //selectedDesignation = value;
                                            //dropdownValue = value!.name;
                                            setState(() {
                                              qualificationSelectedValue =
                                                  value;
                                              qualificationSelectedID =
                                                  value!.id;
                                            });
                                          },
                                          items:
                                              listEducationalQualificationWithId
                                                  .map((item) {
                                            return DropdownMenuItem<
                                                NameIDModel>(
                                              child: Text(item.name),
                                              value: item,
                                            );
                                          }).toList(),
                                          value: qualificationSelectedValue,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ), // Educational Qualification
                              Padding(
                                //House Pin Code
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 5),
                                child: TextFormField(
                                  decoration: Styles.cashFormInputDecoration(
                                      'House Post Code'),
                                  cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                  style: Styles.hintTextStyle,
                                  maxLines: null,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  controller: housePinCodeController,
                                  onChanged: (comment) {},
                                ),
                              ), //House Pin Code
                              Padding(
                                //No. of family members
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 5),
                                child: TextFormField(
                                  decoration: Styles.cashFormInputDecoration(
                                      'No. of family members'),
                                  cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                  style: Styles.hintTextStyle,
                                  maxLines: null,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  controller: noOfFamilyMemberController,
                                  onChanged: (comment) {},
                                ),
                              ), //No. of family members
                              Padding(
                                //No. of earning member
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 5),
                                child: TextFormField(
                                  decoration: Styles.cashFormInputDecoration(
                                      'No. of earning member'),
                                  cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                  style: Styles.hintTextStyle,
                                  maxLines: null,
                                  controller: noOfEarningMemberController,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  onChanged: (comment) {},
                                ),
                              ), //No. of earning member
                              Padding(
                                //Residence Ownership
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: Container(
                                  height: 60,
                                  child: InputDecorator(
                                    decoration: Styles.cashFormInputDecoration(
                                        'Residence Ownership'),
                                    child: DropdownButtonHideUnderline(
                                      child: Theme(
                                        data: ThemeData(
                                            canvasColor: Colors.white),
                                        child: DropdownButton<NameIDModel>(
                                          isExpanded: true,
                                          hint: Text('Select '),
                                          onChanged: (NameIDModel? value) {
                                            //selectedDesignation = value;
                                            //dropdownValue = value!.name;
                                            setState(() {
                                              SelectedResidenceOwner = value;
                                              SelectedResidenceOwnerID =
                                                  value!.id;
                                            });
                                          },
                                          items: listResidenceOwnerShipWithId
                                              .map((item) {
                                            return DropdownMenuItem<
                                                NameIDModel>(
                                              child: Text(item.name),
                                              value: item,
                                            );
                                          }).toList(),
                                          value: SelectedResidenceOwner,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ), //Residence Ownership
                              Padding(
                                //Residence Stay vintage
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: TextFormField(
                                  decoration: Styles.cashFormInputDecoration(
                                      'Residence Stay vintage (Years)'),
                                  cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                  style: Styles.hintTextStyle,
                                  maxLines: null,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  controller: residenceStayVintageController,
                                  onChanged: (comment) {},
                                ),
                              ), //Residence Stay vintage
                              Padding(
                                //Vintage with buro in month
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: TextFormField(
                                  decoration: Styles.cashFormInputDecoration(
                                      'Vintage with buro in month'),
                                  cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                  style: Styles.hintTextStyle,
                                  maxLines: null,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  controller: vintageWithBuroController,
                                  onChanged: (comment) {},
                                ),
                              ), //Vintage with buro in month
                              Padding(
                                //Current Savings amount
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: TextFormField(
                                  decoration: Styles.cashFormInputDecoration(
                                      'Current Savings amount with BURO (Tk)'),
                                  cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                  style: Styles.hintTextStyle,
                                  maxLines: null,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  controller: currentSavingsAmountController,
                                  onChanged: (comment) {},
                                ),
                              ), //Current Savings amount
                              Padding(
                                //Current Savings amount
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: TextFormField(
                                  decoration: Styles.cashFormInputDecoration(
                                      'Savings amount during previous loan'),
                                  cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                  style: Styles.hintTextStyle,
                                  maxLines: null,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  controller:
                                      currentSavingsAmountPreviousLoanController,
                                  onChanged: (comment) {},
                                ),
                              ), //Current Savings amount
                              Padding(
                                // Peak savings amount
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: TextFormField(
                                  decoration: Styles.cashFormInputDecoration(
                                      'Highest savings amount in last 12 months in BURO (Tk)'),
                                  cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                  style: Styles.hintTextStyle,
                                  maxLines: null,
                                  controller: peakSavingAmountController,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  onChanged: (comment) {},
                                ),
                              ), //Peak savings amount
                              Padding(
                                // If existing loan customer
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: TextFormField(
                                  decoration: Styles.cashFormInputDecoration(
                                      'If existing loan customer,previous loan amount(Tk)'),
                                  cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                  style: Styles.hintTextStyle,
                                  maxLines: null,
                                  controller: exitingLoanAmountController,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  onChanged: (comment) {},
                                ),
                              ), //If existing loan customer
                              /*      Padding(
                        // If existing loan customer Previous
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 5),
                        child: TextFormField(
                          decoration: Styles.cashFormInputDecoration(
                              'If existing loan customer Previous'),
                          cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                          style: Styles.hintTextStyle,
                          maxLines: null,
                          controller: exitingLoanAmountPreviousLoanController,
                          keyboardType: TextInputType.number,
                          enabled: true,
                          onChanged: (comment) {},
                        ),
                      ),*/ //If existing loan customer Previous
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: Container(
                                  height: 60,
                                  child: InputDecorator(
                                    decoration: Styles.cashFormInputDecoration(
                                        'Repayment Behavior'),
                                    child: DropdownButtonHideUnderline(
                                      child: Theme(
                                        data: ThemeData(
                                            canvasColor: Colors.white),
                                        child: DropdownButton<NameIDModel>(
                                          isExpanded: true,
                                          hint: Text('Select '),
                                          onChanged: (NameIDModel? value) {
                                            //selectedDesignation = value;
                                            //dropdownValue = value!.name;
                                            setState(() {
                                              SelectedRepaymentBehaviorCustomerDetails =
                                                  value;
                                              SelectedRepaymentBehaviorID =
                                                  value!.id;
                                            });
                                          },
                                          items: listRePaymentBehaviourWithId
                                              .map((item) {
                                            return DropdownMenuItem<
                                                NameIDModel>(
                                              child: Text(item.name),
                                              value: item,
                                            );
                                          }).toList(),
                                          value:
                                              SelectedRepaymentBehaviorCustomerDetails,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ), //Repayment Behavior

                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 5),
                                child: TextFormField(
                                  decoration: Styles.cashFormInputDecoration(
                                      'Peak DPD in last 12 month'),
                                  cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                  style: Styles.hintTextStyle,
                                  maxLines: null,
                                  keyboardType: TextInputType.number,
                                  enabled: true,
                                  controller:
                                      exitingPeakDPDLast12MonthController,
                                  onChanged: (comment) {},
                                ),
                              ), //Peak DPD in last 12 month
                              /* Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 5),
                        child: TextFormField(
                          decoration: Styles.cashFormInputDecoration(
                              'Peak DPD in last 12 month Previous Loan'),
                          cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                          style: Styles.hintTextStyle,
                          maxLines: null,
                          keyboardType: TextInputType.number,
                          enabled: true,
                          controller: exitingPeakDPDLast12MonthPreviousLoanController,
                          onChanged: (comment) {},
                        ),
                      ), */ //Peak DPD in last 12 month Previous
                            ],
                          );
                        } else if (state is CustomerDetailsLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is CustomerDetailsLoadedState) {
                          var principleLoan = state.data[0].principalLoan;

                          customerNameController.text = state.data[0].custName!;
                          //customerStatusPreviousSelectedValue = listCustomerStatusWithId[state.data[0].previousLoanCustomerStatus!];

                          // print('gender ${state.data[0].gender!}');

                          if (state.data[0].gender!.contains('Male')) {
                            genderSelectedValue = listGenderWithId[0];
                            genderSelectedValueID = listGenderWithId[0].id;
                          } else if (state.data[0].gender!.contains('Female')) {
                            genderSelectedValue = listGenderWithId[1];
                            genderSelectedValueID = listGenderWithId[1].id;
                          } else if (state.data[0].gender!
                              .contains('Trigender')) {
                            genderSelectedValue = listGenderWithId[2];
                            genderSelectedValueID = listGenderWithId[2].id;
                          }

                          if (state.data[0].maritalStatus!
                              .contains("Married")) {
                            maritalStatusSelectedValue =
                                listMaritalStatusWithId[1];
                            maritalStatusSelectedID =
                                listMaritalStatusWithId[1].id;
                          } else if (state.data[0].maritalStatus!
                              .contains("Single")) {
                            maritalStatusSelectedID =
                                listMaritalStatusWithId[1].id;
                            maritalStatusSelectedValue =
                                listMaritalStatusWithId[2];
                          } else if (state.data[0].maritalStatus!
                              .contains("Unmarried")) {
                            maritalStatusSelectedID =
                                listMaritalStatusWithId[1].id;
                            maritalStatusSelectedValue =
                                listMaritalStatusWithId[3];
                          } else if (state.data[0].maritalStatus!
                              .contains("Widow")) {
                            maritalStatusSelectedID =
                                listMaritalStatusWithId[1].id;
                            maritalStatusSelectedValue =
                                listMaritalStatusWithId[4];
                          }

                          if (principleLoan > 0) {
                           /* customerStatusSelectedValue =
                                listCustomerStatusWithId[1];*/

                            isNewCustomer = false;
                          } else {
                            /*customerStatusSelectedValue =
                                listCustomerStatusWithId[0];*/
                            isNewCustomer = true;
                          }

                          //genderSelectedValue = listGenderWithId[int.parse(state.data[0].gender!)];
                          dateOfBirthController.text =
                              state.data[0].birthDate.toString();
                          //maritalStatusSelectedValue = listMaritalStatusWithId[int.parse(state.data[0].maritalStatus!!)];
                          qualificationSelectedValue =
                              listEducationalQualificationWithId[
                                  state.data[0].education!];

                          qualificationSelectedID =
                              listEducationalQualificationWithId[
                                      state.data[0].education!]
                                  .id;
                          //housePinCodeController.text = state.data[0].housePincode.toString();
                          noOfEarningMemberController.text =
                              state.data[0].earningMember.toString();
                          // noOfFamilyMemberController.text = state.data[0].familyMembersCount.toString();
                          // residenceOwnershipController.text = state.data[0].residenceOwnership.toString();
                          //residenceStayVintageController.text = state.data[0].residenceStayVintage.toString();
                          //vintageWithBuroController.text = state.data[0].vintageWithBuroMonths.toString();

                          /*currentSavingsAmountController.text =
                              state.data[0].totalCurrBalance.toString();*/
                          currentSavingsAmountPreviousLoanController.text =
                              state.data[0].lastLoanSavBal.toString();
                          peakSavingAmountController.text =
                              state.data[0].maximumBalance.toString();
                          exitingLoanAmountController.text =
                              state.data[0].principalLoan.toString();
                          //exitingLoanAmountPreviousLoanController.text = state.data[0].previousLoanAmount.toString();
                          //SelectedRepaymentBehaviorCustomerDetails = listRePaymentBehaviourWithId[state.data[0].repaymentBehavior!];
                          //SelectedRepaymentFrequencyPreviousCustomerDetails = listRePaymentBehaviourWithId[state.data[0].previousLoanRepaymentBehaviour!];
                          exitingPeakDPDLast12MonthController.text =
                              state.data[0].dpd.toString();
                          //exitingPeakDPDLast12MonthPreviousLoanController.text = state.data[0].previousLoanPeakDPD.toString();

                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    // Customer Name
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 5),
                                    child: TextFormField(
                                      decoration:
                                          Styles.cashFormInputDecoration(
                                              'Customer Name'),
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      style: Styles.hintTextStyle,
                                      maxLines: null,
                                      keyboardType: TextInputType.multiline,
                                      enabled: true,
                                      controller: customerNameController,
                                      onChanged: (comment) {},
                                    ),
                                  ), // Customer Name
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: Container(
                                      height: 60,
                                      child: InputDecorator(
                                        decoration:
                                            Styles.cashFormInputDecoration(
                                                'Customer Status'),
                                        child: DropdownButtonHideUnderline(
                                          child: Theme(
                                            data: ThemeData(
                                                canvasColor: Colors.white),
                                            child: DropdownButton<NameIDModel>(
                                              isExpanded: true,
                                              hint: Text('Select'),
                                              onChanged: (NameIDModel? value) {
                                                //selectedDesignation = value;
                                                //dropdownValue = value?.name;
                                                setState(() {
                                                  customerStatusSelectedValue =
                                                      value;
                                                  customerStatusSelectedValueID =
                                                      value!.id;
                                                });
                                              },
                                              items: listCustomerStatusWithId
                                                  .map((item) {
                                                return DropdownMenuItem<
                                                    NameIDModel>(
                                                  child: Text(item.name),
                                                  value: item,
                                                );
                                              }).toList(),
                                              value:
                                                  customerStatusSelectedValue,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ), //Customer Status
                                 /* Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: Container(
                                      height: 60,
                                      child: InputDecorator(
                                        decoration:
                                            Styles.cashFormInputDecoration(
                                                'Customer Status Previous'),
                                        child: DropdownButtonHideUnderline(
                                          child: Theme(
                                            data: ThemeData(
                                                canvasColor: Colors.white),
                                            child: DropdownButton<NameIDModel>(
                                              isExpanded: true,
                                              hint: Text('Select'),
                                              onChanged: (NameIDModel? value) {
                                                //selectedDesignation = value;
                                                //dropdownValue = value!.name;
                                                setState(() {
                                                  customerStatusPreviousSelectedValue =
                                                      value;
                                                  customerStatusPreviousSelectedValueID =
                                                      value!.id;
                                                });
                                              },
                                              items: listCustomerStatusWithId
                                                  .map((item) {
                                                return DropdownMenuItem<
                                                    NameIDModel>(
                                                  child: Text(item.name),
                                                  value: item,
                                                );
                                              }).toList(),
                                              value:
                                                  customerStatusPreviousSelectedValue,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),*/ //Customer Status Previous
                                  Padding(
                                    //Gender
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: Container(
                                      height: 60,
                                      child: InputDecorator(
                                        decoration:
                                            Styles.cashFormInputDecoration(
                                                'Gender'),
                                        child: DropdownButtonHideUnderline(
                                          child: Theme(
                                            data: ThemeData(
                                                canvasColor: Colors.white),
                                            child: DropdownButton<NameIDModel>(
                                              isExpanded: true,
                                              hint: Text('Select'),
                                              onChanged: (NameIDModel? value) {
                                                //selectedDesignation = value;
                                                //dropdownValue = value!.name;
                                                setState(() {
                                                  genderSelectedValue = value;
                                                  genderSelectedValueID =
                                                      value!.id;
                                                });
                                              },
                                              items:
                                                  listGenderWithId.map((item) {
                                                return DropdownMenuItem<
                                                    NameIDModel>(
                                                  child: Text(item.name),
                                                  value: item,
                                                );
                                              }).toList(),
                                              value: genderSelectedValue,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ), //Gender
                                  Padding(
                                    //Date of Birth
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 15),
                                    child: DateTimeField(
                                      // Start Date
                                      controller: dateOfBirthController,
                                      decoration:
                                          Styles.cashFormInputDecoration(
                                              '     Date of Birth'),
                                      style: Styles.mediumTextStyle,
                                      format: dateFormat,
                                      onChanged: (date) {
                                        if (date != null)
                                          dateOfBirthDate = date;
                                        else
                                          dateOfBirthDate = null;
                                      },
                                      onShowPicker: (context, currentValue) {
                                        return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate:
                                                currentValue ?? DateTime.now(),
                                            lastDate: DateTime(2100));
                                      },
                                    ),
                                  ), //Date of Birth
                                  Padding(
                                    //Marital Status
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 5, bottom: 5),
                                    child: Container(
                                      height: 60,
                                      child: InputDecorator(
                                        decoration:
                                            Styles.cashFormInputDecoration(
                                                'Marital Status'),
                                        child: DropdownButtonHideUnderline(
                                          child: Theme(
                                            data: ThemeData(
                                                canvasColor: Colors.white),
                                            child: DropdownButton<NameIDModel>(
                                              isExpanded: true,
                                              hint:
                                                  Text('Select Marital Status'),
                                              onChanged: (NameIDModel? value) {
                                                //selectedDesignation = value;
                                                //dropdownValue = value!.name;
                                                setState(() {
                                                  maritalStatusSelectedValue =
                                                      value;
                                                  maritalStatusSelectedID =
                                                      value!.id;
                                                });
                                              },
                                              items: listMaritalStatusWithId
                                                  .map((item) {
                                                return DropdownMenuItem<
                                                    NameIDModel>(
                                                  child: Text(item.name),
                                                  value: item,
                                                );
                                              }).toList(),
                                              value: maritalStatusSelectedValue,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ), // Marital Status
                                  Padding(
                                    //Educational Qualification
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: Container(
                                      height: 60,
                                      child: InputDecorator(
                                        decoration:
                                            Styles.cashFormInputDecoration(
                                                'Educational Qualification'),
                                        child: DropdownButtonHideUnderline(
                                          child: Theme(
                                            data: ThemeData(
                                                canvasColor: Colors.white),
                                            child: DropdownButton<NameIDModel>(
                                              isExpanded: true,
                                              hint: Text('Select'),
                                              onChanged: (NameIDModel? value) {
                                                //selectedDesignation = value;
                                                //dropdownValue = value!.name;
                                                setState(() {
                                                  qualificationSelectedValue =
                                                      value;
                                                  qualificationSelectedID =
                                                      value!.id;
                                                });
                                              },
                                              items:
                                                  listEducationalQualificationWithId
                                                      .map((item) {
                                                return DropdownMenuItem<
                                                    NameIDModel>(
                                                  child: Text(item.name),
                                                  value: item,
                                                );
                                              }).toList(),
                                              value: qualificationSelectedValue,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ), // Educational Qualification
                                  Padding(
                                    //House Pin Code
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 5),
                                    child: TextFormField(
                                      decoration:
                                          Styles.cashFormInputDecoration(
                                              'House Post Code'),
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      style: Styles.hintTextStyle,
                                      maxLines: null,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      controller: housePinCodeController,
                                      onChanged: (comment) {},
                                    ),
                                  ), //House Pin Code
                                  Padding(
                                    //No. of family members
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 5),
                                    child: TextFormField(
                                      decoration:
                                          Styles.cashFormInputDecoration(
                                              'No. of family members'),
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      style: Styles.hintTextStyle,
                                      maxLines: null,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      controller: noOfFamilyMemberController,
                                      onChanged: (comment) {},
                                    ),
                                  ), //No. of family members
                                  Padding(
                                    //No. of earning member
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 5),
                                    child: TextFormField(
                                      decoration:
                                          Styles.cashFormInputDecoration(
                                              'No. of earning member'),
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      style: Styles.hintTextStyle,
                                      maxLines: null,
                                      controller: noOfEarningMemberController,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      onChanged: (comment) {},
                                    ),
                                  ), //No. of earning member
                                  Padding(
                                    //Residence Ownership
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: Container(
                                      height: 60,
                                      child: InputDecorator(
                                        decoration:
                                            Styles.cashFormInputDecoration(
                                                'Residence Ownership'),
                                        child: DropdownButtonHideUnderline(
                                          child: Theme(
                                            data: ThemeData(
                                                canvasColor: Colors.white),
                                            child: DropdownButton<NameIDModel>(
                                              isExpanded: true,
                                              hint: Text('Select '),
                                              onChanged: (NameIDModel? value) {
                                                //selectedDesignation = value;
                                                //dropdownValue = value!.name;
                                                setState(() {
                                                  SelectedResidenceOwner =
                                                      value;
                                                  SelectedResidenceOwnerID =
                                                      value!.id;
                                                });
                                              },
                                              items:
                                                  listResidenceOwnerShipWithId
                                                      .map((item) {
                                                return DropdownMenuItem<
                                                    NameIDModel>(
                                                  child: Text(item.name),
                                                  value: item,
                                                );
                                              }).toList(),
                                              value: SelectedResidenceOwner,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ), //Residence Ownership
                                  Padding(
                                    //Residence Stay vintage
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: TextFormField(
                                      decoration:
                                          Styles.cashFormInputDecoration(
                                              'Residence Stay vintage (Years)'),
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      style: Styles.hintTextStyle,
                                      maxLines: null,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      controller:
                                          residenceStayVintageController,
                                      onChanged: (comment) {},
                                    ),
                                  ), //Residence Stay vintage
                                  Padding(
                                    //Vintage with buro in month
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: TextFormField(
                                      decoration:
                                          Styles.cashFormInputDecoration(
                                              'Vintage with buro in month'),
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      style: Styles.hintTextStyle,
                                      maxLines: null,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      controller: vintageWithBuroController,
                                      onChanged: (comment) {},
                                    ),
                                  ), //Vintage with buro in month
                                  Padding(
                                    //Current Savings amount
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: TextFormField(
                                      decoration: Styles.cashFormInputDecoration(
                                          'Current Savings amount with BURO (Tk)'),
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      style: Styles.hintTextStyle,
                                      maxLines: null,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      controller:
                                          currentSavingsAmountController,
                                      onChanged: (comment) {},
                                    ),
                                  ), //Current Savings amount
                                  Padding(
                                    //Current Savings amount
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: TextFormField(
                                      decoration: Styles.cashFormInputDecoration(
                                          'Savings amount during previous loan'),
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      style: Styles.hintTextStyle,
                                      maxLines: null,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      controller:
                                          currentSavingsAmountPreviousLoanController,
                                      onChanged: (comment) {},
                                    ),
                                  ), //Current Savings amount
                                  Padding(
                                    // Peak savings amount
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: TextFormField(
                                      decoration: Styles.cashFormInputDecoration(
                                          'Highest savings amount in last 12 months in BURO (Tk)'),
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      style: Styles.hintTextStyle,
                                      maxLines: null,
                                      controller: peakSavingAmountController,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      onChanged: (comment) {},
                                    ),
                                  ), //Peak savings amount
                                  Padding(
                                    // If existing loan customer
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: TextFormField(
                                      decoration: Styles.cashFormInputDecoration(
                                          'If existing loan customer,previous loan amount(Tk)'),
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      style: Styles.hintTextStyle,
                                      maxLines: null,
                                      controller: exitingLoanAmountController,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      onChanged: (comment) {},
                                    ),
                                  ), //If existing loan customer
                                  /*  Padding(
                            // If existing loan customer Previous
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'If existing loan customer Previous'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              controller: exitingLoanAmountPreviousLoanController,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ),*/ //If existing loan customer Previous
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: Container(
                                      height: 60,
                                      child: InputDecorator(
                                        decoration:
                                            Styles.cashFormInputDecoration(
                                                'Repayment Behavior'),
                                        child: DropdownButtonHideUnderline(
                                          child: Theme(
                                            data: ThemeData(
                                                canvasColor: Colors.white),
                                            child: DropdownButton<NameIDModel>(
                                              isExpanded: true,
                                              hint: Text('Select '),
                                              onChanged: (NameIDModel? value) {
                                                //selectedDesignation = value;
                                                //dropdownValue = value!.name;
                                                setState(() {
                                                  SelectedRepaymentBehaviorCustomerDetails =
                                                      value;
                                                  SelectedRepaymentBehaviorID =
                                                      value!.id;
                                                });
                                              },
                                              items:
                                                  listRePaymentBehaviourWithId
                                                      .map((item) {
                                                return DropdownMenuItem<
                                                    NameIDModel>(
                                                  child: Text(item.name),
                                                  value: item,
                                                );
                                              }).toList(),
                                              value:
                                                  SelectedRepaymentBehaviorCustomerDetails,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ), //Repayment Behavior
                                  /*  Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Repayment Behavior Previous'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select ' ?? ''),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        dropdownValue = value!.name;
                                        setState(() {
                                          SelectedRepaymentBehaviorPrevious = value;
                                          SelectedRepaymentBehaviorPreviousID = value.id;

                                          print('SelectedRepaymentBehaviorPreviousID $SelectedRepaymentBehaviorPreviousID');
                                        });
                                      },
                                      items: listRePaymentBehaviourWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedRepaymentBehaviorPrevious,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),*/ //Repayment Behavior Previous
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: TextFormField(
                                      decoration:
                                          Styles.cashFormInputDecoration(
                                              'Peak DPD in last 12 month'),
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                                      style: Styles.hintTextStyle,
                                      maxLines: null,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      controller:
                                          exitingPeakDPDLast12MonthController,
                                      onChanged: (comment) {},
                                    ),
                                  ), //Peak DPD in last 12 month
                                  /* Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Peak DPD in last 12 month Previous Loan'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: exitingPeakDPDLast12MonthPreviousLoanController,
                              onChanged: (comment) {},
                            ),
                          ),*/ //Peak DPD in last 12 month Previous
                                ],
                              ),
                            ),
                          );
                        } else if (state is CustomerDetailErrorState) {
                          return Center(
                            child: Container(
                              child: Text('No Data Found'),
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
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Widget enterprise_details() {
    return widget.arguments.isEditable
        ? BlocConsumer<EnterpriseDetailsCubit, EnterpriseDetailsState>(
            listener: (context, state) {
              if (state is CustomerListErrorState) {
                final snackBar = SnackBar(
                  content: Text(Languages.of(context)!.internetErrorText),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is EnterpriseDetailsInitialState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is EnterpriseDetailsLoadingState) {
                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            decoration: Styles.cashFormInputDecoration(
                                'Enterprise Name'),
                            cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                            style: Styles.hintTextStyle,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            enabled: true,
                            controller: enterpriseName,
                            onChanged: (comment) {},
                          ),
                        ), //Enterprise Name
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: Styles.cashFormInputDecoration(
                                  'Constitution of Enterprise'),
                              child: DropdownButtonHideUnderline(
                                child: Theme(
                                  data: ThemeData(canvasColor: Colors.white),
                                  child: DropdownButton<NameIDModel>(
                                    isExpanded: true,
                                    hint: Text('Select'),
                                    onChanged: (NameIDModel? value) {
                                      //selectedDesignation = value;
                                      // dropdownValue = value;
                                      setState(() {
                                        SelectedValueConstitution = value;
                                        SelectedValueConstitutionID = value!.id;
                                      });
                                    },
                                    items: listConstitutionWithId.map((item) {
                                      return DropdownMenuItem<NameIDModel>(
                                        child: Text(item.name),
                                        value: item,
                                      );
                                    }).toList(),
                                    value: SelectedValueConstitution,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), //Constitution of Enterprise
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: TextFormField(
                            decoration: Styles.cashFormInputDecoration(
                                'Workplace PostCode'),
                            cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                            style: Styles.hintTextStyle,
                            maxLines: null,
                            keyboardType: TextInputType.number,
                            enabled: true,
                            controller: workplacePinCode,
                            onChanged: (comment) {},
                          ),
                        ), //Workplace Pincode
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: Styles.cashFormInputDecoration(
                                  'Business Segment'),
                              child: DropdownButtonHideUnderline(
                                child: Theme(
                                  data: ThemeData(canvasColor: Colors.white),
                                  child: DropdownButton<NameIDModel>(
                                    isExpanded: true,
                                    hint: Text('Select'),
                                    onChanged: (NameIDModel? value) {
                                      //selectedDesignation = value;
                                      // dropdownValue = value;
                                      setState(() {
                                        SelectedValueSegment = value;
                                        SelectedValueSegmentID = value!.id;
                                      });
                                    },
                                    items:
                                        listBusinessSegmentWithId.map((item) {
                                      return DropdownMenuItem<NameIDModel>(
                                        child: Text(item.name),
                                        value: item,
                                      );
                                    }).toList(),
                                    value: SelectedValueSegment,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), //Business Segment
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: TextFormField(
                            decoration: Styles.cashFormInputDecoration(
                                'Business Sub-Segment'),
                            cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                            style: Styles.hintTextStyle,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            enabled: true,
                            controller: businessSubSegment,
                            onChanged: (comment) {},
                          ),
                        ), //Business Sub-Segment

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: Styles.cashFormInputDecoration(
                                  'Trade Licenses'),
                              child: DropdownButtonHideUnderline(
                                child: Theme(
                                  data: ThemeData(canvasColor: Colors.white),
                                  child: DropdownButton<NameIDModel>(
                                    isExpanded: true,
                                    hint: Text('Select'),
                                    onChanged: (NameIDModel? value) {
                                      //selectedDesignation = value;
                                      // dropdownValue = value;
                                      setState(() {
                                        SelectedValueTradeLicenses = value;
                                        SelectedValueTradeLicensesID =
                                            value!.id;
                                      });
                                    },
                                    items: listTradeLicensesWithId.map((item) {
                                      return DropdownMenuItem<NameIDModel>(
                                        child: Text(item.name),
                                        value: item,
                                      );
                                    }).toList(),
                                    value: SelectedValueTradeLicenses,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), //Trade Licenses
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: Styles.cashFormInputDecoration(
                                  'Available Tin'),
                              child: DropdownButtonHideUnderline(
                                child: Theme(
                                  data: ThemeData(canvasColor: Colors.white),
                                  child: DropdownButton<NameIDModel>(
                                    isExpanded: true,
                                    hint: Text('Select'),
                                    onChanged: (NameIDModel? value) {
                                      //selectedDesignation = value;
                                      // dropdownValue = value;
                                      setState(() {
                                        SelectedValueAvailableTin = value;
                                        SelectedValueAvailableTinID = value!.id;
                                      });
                                    },
                                    items: listAvailableTinWithId.map((item) {
                                      return DropdownMenuItem<NameIDModel>(
                                        child: Text(item.name),
                                        value: item,
                                      );
                                    }).toList(),
                                    value: SelectedValueAvailableTin,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), //Available Tin
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: Styles.cashFormInputDecoration(
                                  'Workplace Ownership'),
                              child: DropdownButtonHideUnderline(
                                child: Theme(
                                  data: ThemeData(canvasColor: Colors.white),
                                  child: DropdownButton<NameIDModel>(
                                    isExpanded: true,
                                    hint: Text('Select'),
                                    onChanged: (NameIDModel? value) {
                                      //selectedDesignation = value;
                                      // dropdownValue = value;
                                      setState(() {
                                        SelectedValueOwnerShip = value;
                                        SelectedValueOwnerShipID = value!.id;
                                      });
                                    },
                                    items: listWorkplaceOwnerShipWithId
                                        .map((item) {
                                      return DropdownMenuItem<NameIDModel>(
                                        child: Text(item.name),
                                        value: item,
                                      );
                                    }).toList(),
                                    value: SelectedValueOwnerShip,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), //Workplace Ownership
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: TextFormField(
                            decoration: Styles.cashFormInputDecoration(
                                'Workplace Vintage (Years)'),
                            cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                            style: Styles.hintTextStyle,
                            maxLines: null,
                            keyboardType: TextInputType.number,
                            enabled: true,
                            controller: workPlaceVintage,
                            onChanged: (comment) {},
                          ),
                        ), //Workplace Vintage
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: TextFormField(
                            decoration: Styles.cashFormInputDecoration(
                                'Gross Margin % in business'),
                            cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                            style: Styles.hintTextStyle,
                            maxLines: null,
                            keyboardType: TextInputType.number,
                            enabled: true,
                            controller: grossMarginBusiness,
                            onChanged: (comment) {},
                          ),
                        ), //Gross Margin in business

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: TextFormField(
                            decoration: Styles.cashFormInputDecoration(
                                'Number of paid regular employees'),
                            cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                            style: Styles.hintTextStyle,
                            maxLines: null,
                            controller: numberPaidRegularEmployee,
                            keyboardType: TextInputType.number,
                            enabled: true,
                            onChanged: (comment) {},
                          ),
                        ), //Number of paid regular employees


                      ],
                    ),
                  ),
                );
              } else if (state is EnterpriseDetailsLoadedState) {
                try {
                  enterpriseName.text = state.data[0].enterprisename!;
                } catch (ec) {}

                try {
                  workplacePinCode.text = state.data[0].workplacepincode!;
                } catch (e) {}

                try {
                  businessSubSegment.text = state.data[0].businesssubsegment!;
                } catch (e) {

                }

                try {
                  workPlaceVintage.text =
                                      state.data[0].workplacevintage!.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  grossMarginBusiness.text =
                                      state.data[0].grossmargin!.toString();
                } catch (e) {
                  print(e);
                }
               /* try {
                  grossMarginBusinessPrevious.text =
                                      state.data[0].previousloangrossmargin!.toString();
                } catch (e) {
                  print(e);
                }*/

                try {
                  numberPaidRegularEmployee.text =
                                      state.data[0].numberofpaidregularemployees!.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  numberPaidRegularEmployeePrevious.text =
                                      state.data[0].previousloannoofemployees!.toString();
                } catch (e) {
                  print(e);
                }

                try {
                  SelectedValueConstitution = listConstitutionWithId[
                                      state.data[0].constitutionofenterprise!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedValueSegment =
                                      listBusinessSegmentWithId[state.data[0].businesssegment!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedValueTradeLicenses = listTradeLicensesWithId[
                                      state.data[0].currenttradelicenseavailable!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedValueAvailableTin =
                                      listAvailableTinWithId[state.data[0].tinavailable!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedValueOwnerShip = listWorkplaceOwnerShipWithId[
                                      state.data[0].workplaceownership!];
                } catch (e) {
                  print(e);
                }

                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            decoration: Styles.cashFormInputDecoration(
                                'Enterprise Name'),
                            cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                            style: Styles.hintTextStyle,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            enabled: true,
                            controller: enterpriseName,
                            onChanged: (comment) {},
                          ),
                        ), //Enterprise Name
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: Styles.cashFormInputDecoration(
                                  'Constitution of Enterprise'),
                              child: DropdownButtonHideUnderline(
                                child: Theme(
                                  data: ThemeData(canvasColor: Colors.white),
                                  child: DropdownButton<NameIDModel>(
                                    isExpanded: true,
                                    hint: Text('Select'),
                                    onChanged: (NameIDModel? value) {
                                      //selectedDesignation = value;
                                      // dropdownValue = value;
                                      setState(() {
                                        SelectedValueConstitution = value;
                                        SelectedValueConstitutionID = value!.id;
                                      });
                                    },
                                    items: listConstitutionWithId.map((item) {
                                      return DropdownMenuItem<NameIDModel>(
                                        child: Text(item.name),
                                        value: item,
                                      );
                                    }).toList(),
                                    value: SelectedValueConstitution,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), //Constitution of Enterprise
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: TextFormField(
                            decoration: Styles.cashFormInputDecoration(
                                'Workplace PostCode'),
                            cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                            style: Styles.hintTextStyle,
                            maxLines: null,
                            keyboardType: TextInputType.number,
                            enabled: true,
                            controller: workplacePinCode,
                            onChanged: (comment) {},
                          ),
                        ), //Workplace Pincode
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: Styles.cashFormInputDecoration(
                                  'Business Segment'),
                              child: DropdownButtonHideUnderline(
                                child: Theme(
                                  data: ThemeData(canvasColor: Colors.white),
                                  child: DropdownButton<NameIDModel>(
                                    isExpanded: true,
                                    hint: Text('Select'),
                                    onChanged: (NameIDModel? value) {
                                      //selectedDesignation = value;
                                      // dropdownValue = value;
                                      setState(() {
                                        SelectedValueSegment = value;
                                        SelectedValueSegmentID = value!.id;
                                      });
                                    },
                                    items:
                                        listBusinessSegmentWithId.map((item) {
                                      return DropdownMenuItem<NameIDModel>(
                                        child: Text(item.name),
                                        value: item,
                                      );
                                    }).toList(),
                                    value: SelectedValueSegment,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), //Business Segment
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: TextFormField(
                            decoration: Styles.cashFormInputDecoration(
                                'Business Sub-Segment'),
                            cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                            style: Styles.hintTextStyle,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            enabled: true,
                            controller: businessSubSegment,
                            onChanged: (comment) {},
                          ),
                        ), //Business Sub-Segment

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: Styles.cashFormInputDecoration(
                                  'Trade Licenses'),
                              child: DropdownButtonHideUnderline(
                                child: Theme(
                                  data: ThemeData(canvasColor: Colors.white),
                                  child: DropdownButton<NameIDModel>(
                                    isExpanded: true,
                                    hint: Text('Select'),
                                    onChanged: (NameIDModel? value) {
                                      //selectedDesignation = value;
                                      // dropdownValue = value;
                                      setState(() {
                                        SelectedValueTradeLicenses = value;
                                        SelectedValueTradeLicensesID =
                                            value!.id;
                                      });
                                    },
                                    items: listTradeLicensesWithId.map((item) {
                                      return DropdownMenuItem<NameIDModel>(
                                        child: Text(item.name),
                                        value: item,
                                      );
                                    }).toList(),
                                    value: SelectedValueTradeLicenses,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), //Trade Licenses
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: Styles.cashFormInputDecoration(
                                  'Available Tin'),
                              child: DropdownButtonHideUnderline(
                                child: Theme(
                                  data: ThemeData(canvasColor: Colors.white),
                                  child: DropdownButton<NameIDModel>(
                                    isExpanded: true,
                                    hint: Text('Select'),
                                    onChanged: (NameIDModel? value) {
                                      //selectedDesignation = value;
                                      // dropdownValue = value;
                                      setState(() {
                                        SelectedValueAvailableTin = value;
                                        SelectedValueAvailableTinID = value!.id;
                                      });
                                    },
                                    items: listAvailableTinWithId.map((item) {
                                      return DropdownMenuItem<NameIDModel>(
                                        child: Text(item.name),
                                        value: item,
                                      );
                                    }).toList(),
                                    value: SelectedValueAvailableTin,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), //Available Tin
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: Styles.cashFormInputDecoration(
                                  'Workplace Ownership'),
                              child: DropdownButtonHideUnderline(
                                child: Theme(
                                  data: ThemeData(canvasColor: Colors.white),
                                  child: DropdownButton<NameIDModel>(
                                    isExpanded: true,
                                    hint: Text('Select'),
                                    onChanged: (NameIDModel? value) {
                                      //selectedDesignation = value;
                                      // dropdownValue = value;
                                      setState(() {
                                        SelectedValueOwnerShip = value;
                                        SelectedValueOwnerShipID = value!.id;
                                      });
                                    },
                                    items: listWorkplaceOwnerShipWithId
                                        .map((item) {
                                      return DropdownMenuItem<NameIDModel>(
                                        child: Text(item.name),
                                        value: item,
                                      );
                                    }).toList(),
                                    value: SelectedValueOwnerShip,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), //Workplace Ownership
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: TextFormField(
                            decoration: Styles.cashFormInputDecoration(
                                'Workplace Vintage (Years)'),
                            cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                            style: Styles.hintTextStyle,
                            maxLines: null,
                            keyboardType: TextInputType.number,
                            enabled: true,
                            controller: workPlaceVintage,
                            onChanged: (comment) {},
                          ),
                        ), //Workplace Vintage
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: TextFormField(
                            decoration: Styles.cashFormInputDecoration(
                                'Gross Margin % in business'),
                            cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                            style: Styles.hintTextStyle,
                            maxLines: null,
                            keyboardType: TextInputType.number,
                            enabled: true,
                            controller: grossMarginBusiness,
                            onChanged: (comment) {},
                          ),
                        ), //Gross Margin in business

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 5),
                          child: TextFormField(
                            decoration: Styles.cashFormInputDecoration(
                                'Number of paid regular employees'),
                            cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                            style: Styles.hintTextStyle,
                            maxLines: null,
                            controller: numberPaidRegularEmployee,
                            keyboardType: TextInputType.number,
                            enabled: true,
                            onChanged: (comment) {},
                          ),
                        ), //Number of paid regular employees


                      ],
                    ),
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
          )
        : SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      decoration:
                          Styles.cashFormInputDecoration('Enterprise Name'),
                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                      style: Styles.hintTextStyle,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      enabled: true,
                      controller: enterpriseName,
                      onChanged: (comment) {},
                    ),
                  ), //Enterprise Name
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 5),
                    child: Container(
                      height: 60,
                      child: InputDecorator(
                        decoration: Styles.cashFormInputDecoration(
                            'Constitution of Enterprise'),
                        child: DropdownButtonHideUnderline(
                          child: Theme(
                            data: ThemeData(canvasColor: Colors.white),
                            child: DropdownButton<NameIDModel>(
                              isExpanded: true,
                              hint: Text('Select'),
                              onChanged: (NameIDModel? value) {
                                //selectedDesignation = value;
                                // dropdownValue = value;
                                setState(() {
                                  SelectedValueConstitution = value;
                                  SelectedValueConstitutionID = value!.id;
                                });
                              },
                              items: listConstitutionWithId.map((item) {
                                return DropdownMenuItem<NameIDModel>(
                                  child: Text(item.name),
                                  value: item,
                                );
                              }).toList(),
                              value: SelectedValueConstitution,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ), //Constitution of Enterprise
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 5),
                    child: TextFormField(
                      decoration:
                          Styles.cashFormInputDecoration('Workplace PostCode'),
                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                      style: Styles.hintTextStyle,
                      maxLines: null,
                      keyboardType: TextInputType.number,
                      enabled: true,
                      controller: workplacePinCode,
                      onChanged: (comment) {},
                    ),
                  ), //Workplace Pincode
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 5),
                    child: Container(
                      height: 60,
                      child: InputDecorator(
                        decoration:
                            Styles.cashFormInputDecoration('Business Segment'),
                        child: DropdownButtonHideUnderline(
                          child: Theme(
                            data: ThemeData(canvasColor: Colors.white),
                            child: DropdownButton<NameIDModel>(
                              isExpanded: true,
                              hint: Text('Select'),
                              onChanged: (NameIDModel? value) {
                                //selectedDesignation = value;
                                // dropdownValue = value;
                                setState(() {
                                  SelectedValueSegment = value;
                                  SelectedValueSegmentID = value!.id;
                                });
                              },
                              items: listBusinessSegmentWithId.map((item) {
                                return DropdownMenuItem<NameIDModel>(
                                  child: Text(item.name),
                                  value: item,
                                );
                              }).toList(),
                              value: SelectedValueSegment,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ), //Business Segment
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 5),
                    child: TextFormField(
                      decoration: Styles.cashFormInputDecoration(
                          'Business Sub-Segment'),
                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                      style: Styles.hintTextStyle,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      enabled: true,
                      controller: businessSubSegment,
                      onChanged: (comment) {},
                    ),
                  ), //Business Sub-Segment

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 5),
                    child: Container(
                      height: 60,
                      child: InputDecorator(
                        decoration:
                            Styles.cashFormInputDecoration('Trade Licenses'),
                        child: DropdownButtonHideUnderline(
                          child: Theme(
                            data: ThemeData(canvasColor: Colors.white),
                            child: DropdownButton<NameIDModel>(
                              isExpanded: true,
                              hint: Text('Select'),
                              onChanged: (NameIDModel? value) {
                                //selectedDesignation = value;
                                // dropdownValue = value;
                                setState(() {
                                  SelectedValueTradeLicenses = value;
                                  SelectedValueTradeLicensesID = value!.id;
                                });
                              },
                              items: listTradeLicensesWithId.map((item) {
                                return DropdownMenuItem<NameIDModel>(
                                  child: Text(item.name),
                                  value: item,
                                );
                              }).toList(),
                              value: SelectedValueTradeLicenses,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ), //Trade Licenses
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 5),
                    child: Container(
                      height: 60,
                      child: InputDecorator(
                        decoration:
                            Styles.cashFormInputDecoration('Available Tin'),
                        child: DropdownButtonHideUnderline(
                          child: Theme(
                            data: ThemeData(canvasColor: Colors.white),
                            child: DropdownButton<NameIDModel>(
                              isExpanded: true,
                              hint: Text('Select'),
                              onChanged: (NameIDModel? value) {
                                //selectedDesignation = value;
                                // dropdownValue = value;
                                setState(() {
                                  SelectedValueAvailableTin = value;
                                  SelectedValueAvailableTinID = value!.id;
                                });
                              },
                              items: listAvailableTinWithId.map((item) {
                                return DropdownMenuItem<NameIDModel>(
                                  child: Text(item.name),
                                  value: item,
                                );
                              }).toList(),
                              value: SelectedValueAvailableTin,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ), //Available Tin
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 5),
                    child: Container(
                      height: 60,
                      child: InputDecorator(
                        decoration: Styles.cashFormInputDecoration(
                            'Workplace Ownership'),
                        child: DropdownButtonHideUnderline(
                          child: Theme(
                            data: ThemeData(canvasColor: Colors.white),
                            child: DropdownButton<NameIDModel>(
                              isExpanded: true,
                              hint: Text('Select'),
                              onChanged: (NameIDModel? value) {
                                //selectedDesignation = value;
                                // dropdownValue = value;
                                setState(() {
                                  SelectedValueOwnerShip = value;
                                  SelectedValueOwnerShipID = value!.id;
                                });
                              },
                              items: listWorkplaceOwnerShipWithId.map((item) {
                                return DropdownMenuItem<NameIDModel>(
                                  child: Text(item.name),
                                  value: item,
                                );
                              }).toList(),
                              value: SelectedValueOwnerShip,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ), //Workplace Ownership
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 5),
                    child: TextFormField(
                      decoration: Styles.cashFormInputDecoration(
                          'Workplace Vintage (Years)'),
                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                      style: Styles.hintTextStyle,
                      maxLines: null,
                      keyboardType: TextInputType.number,
                      enabled: true,
                      controller: workPlaceVintage,
                      onChanged: (comment) {},
                    ),
                  ), //Workplace Vintage
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 5),
                    child: TextFormField(
                      decoration: Styles.cashFormInputDecoration(
                          'Gross Margin % in business'),
                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                      style: Styles.hintTextStyle,
                      maxLines: null,
                      keyboardType: TextInputType.number,
                      enabled: true,
                      controller: grossMarginBusiness,
                      onChanged: (comment) {},
                    ),
                  ), //Gross Margin in business
                /*  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 5),
                    child: TextFormField(
                      decoration: Styles.cashFormInputDecoration(
                          'Gross Margin % in business Previous Loan'),
                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                      style: Styles.hintTextStyle,
                      maxLines: null,
                      keyboardType: TextInputType.number,
                      enabled: true,
                      controller: grossMarginBusinessPrevious,
                      onChanged: (comment) {},
                    ),
                  ),*/ //Gross Margin in business previous
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 5),
                    child: TextFormField(
                      decoration: Styles.cashFormInputDecoration(
                          'Number of paid regular employees'),
                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                      style: Styles.hintTextStyle,
                      maxLines: null,
                      controller: numberPaidRegularEmployee,
                      keyboardType: TextInputType.number,
                      enabled: true,
                      onChanged: (comment) {},
                    ),
                  ), //Number of paid regular employees

                 /* Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 5),
                    child: TextFormField(
                      decoration: Styles.cashFormInputDecoration(
                          'Number of paid regular employees Previous Loan'),
                      cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                      style: Styles.hintTextStyle,
                      maxLines: null,
                      controller: numberPaidRegularEmployeePrevious,
                      keyboardType: TextInputType.number,
                      enabled: true,
                      onChanged: (comment) {},
                    ),
                  ),*/ //Number of paid regular employees
                ],
              ),
            ),
          );
  }

  Widget proposed_loan_details() {
    return widget.arguments.isEditable
        ? BlocConsumer<ProposedLoanDetailsCubit, ProposedLoanDetailsState>(
            listener: (context, state) {
              if (state is CustomerListErrorState) {
                final snackBar = SnackBar(
                  content: Text(Languages.of(context)!.internetErrorText),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is ProposedLoanDetailsInitialState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProposedLoanDetailsLoadingState) {
                return SingleChildScrollView(
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            //Loan Applied Amount (Tk.)
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Loan Applied Amount (Tk.)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: loanAppliedAmountController,
                              onChanged: (comment) {},
                            ),
                          ),
                          //Loan Applied Amount (Tk.)


                          Padding(
                            // Tenure Applied (Months)
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Tenure Applied (Months)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: tenureAppliedMonthsController,
                              onChanged: (comment) {},
                            ),
                          ),
                          //Tenure Applied (Months)



                          Padding(
                            //ROI Proposed (%)
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Service Charge Proposed (%)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: roiProposedController,
                              onChanged: (comment) {},
                            ),
                          ),
                          //ROI Proposed (%)



                          Padding(
                            //End Use - Capex or Working Capital or Both
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'End Use - Capex or Working Capital or Both'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Working Capital'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedWorkingCapital = value;
                                          SelectedWorkingCapitalID = value!.id;
                                        });
                                      },
                                      items:
                                          listWorkingCapitalWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedWorkingCapital,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // End Use - Capex or Working Capital or Both

                         /* Padding(
                            //facility Applied
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'facility Applied'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedFacilityApplied = value;
                                          SelectedFacilityAppliedID = value!.id;
                                        });
                                      },
                                      items:
                                          listFacilityAppliedWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedFacilityApplied,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),*/
                          //facility Applied


                          Padding(
                            //Repayment Frequency
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Repayment Frequency'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedRepaymentFrequency = value;
                                          SelectedRepaymentFrequencyID =
                                              value!.id;
                                        });
                                      },
                                      items: listRepaymentFrequencyWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedRepaymentFrequency,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //Repayment Frequency

                          Padding(
                            //Customer Affordable EMI (Tk)
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Customer Affordable EMI (Tk)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: proposedLoanAffordableEMIController,
                              onChanged: (comment) {},
                            ),
                          ),
                          //Customer Affordable EMI (Tk)


                    Padding(
                      //Loan Eligilibity as per Cash Flow Analysis and Policy
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Loan Eligilibity as per Cash Flow Analysis and Policy'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        controller: loanEligibilityCashFlowController,
                        onChanged: (comment) {},
                      ),
                    ),
                    //Loan Eligilibity as per Cash Flow Analysis and Policy

                    Padding(
                      //Loan Amount Approved (Tk)-m To be filled at the end
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Loan Amount Approved (Tk)-m To be filled at the end'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        controller: approvedLoanAmountController,
                        onChanged: (comment) {},
                      ),
                    ),



                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is ProposedLoanDetailsLoadedState) {
                try {
                  loanAppliedAmountController.text =
                                      state.data[0].loanAppliedAmount.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  loanAppliedAmountPreviousLoanController.text =
                                      state.data[0].previousLoanAmount.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  tenureAppliedMonthsController.text =
                                      state.data[0].tenureAppliedMonths.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  tenureAppliedMonthsPreviousLoanController.text =
                                      state.data[0].previousLoanTenureApplied.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  roiProposedController.text =
                                      state.data[0].roiProposedPercentage.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  roiProposedControllerPreviousLoan.text =
                                      state.data[0].previousLoanROIProposed.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  endUseWorkingCapitalController.text =
                                      state.data[0].endUse.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  endUseWorkingCapitalPreviousController.text =
                                      state.data[0].previousLoanCapital.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedWorkingCapital =
                                      listWorkingCapitalWithId[state.data[0].endUse!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedWorkingCapitalID =
                                      listWorkingCapitalWithId[state.data[0].endUse!].id;
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedWorkingCapitalPreviousLoan = listWorkingCapitalWithId[
                                      state.data[0].previousLoanCapital!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedWorkingCapitalIDPreviousLoan =
                                      listWorkingCapitalWithId[state.data[0].previousLoanCapital!]
                                          .id;
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedFacilityApplied =
                                      listFacilityAppliedWithId[state.data[0].facilityApplied!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedFacilityAppliedID =
                                      listFacilityAppliedWithId[state.data[0].facilityApplied!]
                                          .id;
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedFacilityAppliedPrevious = listFacilityAppliedWithId[
                                      state.data[0].previousLoanFacilityApplied!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedFacilityAppliedIDPreviousLoan =
                                      listFacilityAppliedWithId[
                                              state.data[0].previousLoanFacilityApplied!]
                                          .id;
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedRepaymentFrequency = listRepaymentFrequencyWithId[
                                      state.data[0].repaymentFrequency!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedRepaymentFrequencyID = listRepaymentFrequencyWithId[
                                          state.data[0].repaymentFrequency!]
                                      .id;
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedRepaymentFrequencyPreviousProposedLoan =
                                      listRepaymentFrequencyWithId[
                                          state.data[0].previousLoanRepaymentFrequency!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedRepaymentFrequencyIDPreviousProposedLoan =
                                      listRepaymentFrequencyWithId[
                                              state.data[0].previousLoanRepaymentFrequency!]
                                          .id;
                } catch (e) {
                  print(e);
                }

                try {
                  proposedLoanAffordableEMIController.text =
                                      state.data[0].customerAffordableEMI.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  proposedLoanAffordableEMIControllerPreviousLoan.text =
                                      state.data[0].previousLoanAffordableEMI.toString();
                } catch (e) {
                  print(e);
                }

                return SingleChildScrollView(
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            //Loan Applied Amount (Tk.)
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Loan Applied Amount (Tk.)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: loanAppliedAmountController,
                              onChanged: (comment) {},
                            ),
                          ),
                          //Loan Applied Amount (Tk.)


                          Padding(
                            // Tenure Applied (Months)
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Tenure Applied (Months)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: tenureAppliedMonthsController,
                              onChanged: (comment) {},
                            ),
                          ),
                          //Tenure Applied (Months)


                          Padding(
                            //ROI Proposed (%)
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Service Charge Proposed (%)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: roiProposedController,
                              onChanged: (comment) {},
                            ),
                          ),
                          //ROI Proposed (%)


                          Padding(
                            //End Use - Capex or Working Capital or Both
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'End Use - Capex or Working Capital or Both'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Working Capital'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedWorkingCapital = value;
                                          SelectedWorkingCapitalID = value!.id;
                                        });
                                      },
                                      items:
                                          listWorkingCapitalWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedWorkingCapital,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // End Use - Capex or Working Capital or Both

                        /*  Padding(
                            //facility Applied
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'facility Applied'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedFacilityApplied = value;
                                          SelectedFacilityAppliedID = value!.id;
                                        });
                                      },
                                      items:
                                          listFacilityAppliedWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedFacilityApplied,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),*/
                          //facility Applied


                          Padding(
                            //Repayment Frequency
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Repayment Frequency'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedRepaymentFrequency = value;
                                          SelectedRepaymentFrequencyID =
                                              value!.id;
                                        });
                                      },
                                      items: listRepaymentFrequencyWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedRepaymentFrequency,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //Repayment Frequency

                          Padding(
                            //Customer Affordable EMI (Tk)
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Customer Affordable EMI (Tk)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: proposedLoanAffordableEMIController,
                              onChanged: (comment) {},
                            ),
                          ),
                          //Customer Affordable EMI (Tk)


                        ],
                      ),
                    ),
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
          )
        : SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      //Loan Applied Amount (Tk.)
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Loan Applied Amount (Tk.)'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        controller: loanAppliedAmountController,
                        onChanged: (comment) {},
                      ),
                    ),
                    //Loan Applied Amount (Tk.)



                    Padding(
                      // Tenure Applied (Months)
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Tenure Applied (Months)'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        controller: tenureAppliedMonthsController,
                        onChanged: (comment) {},
                      ),
                    ),
                    //Tenure Applied (Months)


                    Padding(
                      //ROI Proposed (%)
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Service Charge Proposed (%)'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        controller: roiProposedController,
                        onChanged: (comment) {},
                      ),
                    ),
                    //ROI Proposed (%)



                    Padding(
                      //End Use - Capex or Working Capital or Both
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'End Use - Capex or Working Capital or Both'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Working Capital'),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  // dropdownValue = value;
                                  setState(() {
                                    SelectedWorkingCapital = value;
                                    SelectedWorkingCapitalID = value!.id;
                                  });
                                },
                                items: listWorkingCapitalWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedWorkingCapital,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // End Use - Capex or Working Capital or Both

                   /* Padding(
                      //facility Applied
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'facility Applied'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  // dropdownValue = value;
                                  setState(() {
                                    SelectedFacilityApplied = value;
                                    SelectedFacilityAppliedID = value!.id;
                                  });
                                },
                                items: listFacilityAppliedWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedFacilityApplied,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),*/
                    //facility Applied


                    Padding(
                      //Repayment Frequency
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'Repayment Frequency'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  // dropdownValue = value;
                                  setState(() {
                                    SelectedRepaymentFrequency = value;
                                    SelectedRepaymentFrequencyID = value!.id;
                                  });
                                },
                                items: listRepaymentFrequencyWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedRepaymentFrequency,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Repayment Frequency

                    Padding(
                      //Customer Affordable EMI (Tk)
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Customer Affordable EMI (Tk)'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        controller: proposedLoanAffordableEMIController,
                        onChanged: (comment) {},
                      ),
                    ),
                    //Customer Affordable EMI (Tk)



                  ],
                ),
              ),
            ),
          );
  }

  Widget supplier_verification() {
    return widget.arguments.isEditable
        ? BlocConsumer<SupplierVerificationCubit, SupplierVerificationState>(
            listener: (context, state) {
              if (state is CustomerListErrorState) {
                final snackBar = SnackBar(
                  content: Text(Languages.of(context)!.internetErrorText),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is SupplierVerificationInitialState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SupplierVerificationLoadingState) {
                return SingleChildScrollView(
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            //Name of the Supplier
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Name of the Supplier'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              controller: nameOfSupplierController,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //Name of the Supplier
                          Padding(
                            //Mobile Number
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Mobile Number'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              maxLength: 11,
                              controller: supplierMobileNumberController,
                              onChanged: (comment) {},
                            ),
                          ), //Mobile Number
                          Padding(
                            //Location
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration:
                                  Styles.cashFormInputDecoration('Location'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              controller: supplierLocationController,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //Location
                          Padding(
                            //Number of Years supplying to the Customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Number of Years supplying to the Customer'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              controller: numberOfSupplyingYearsController,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //Number of Years supplying to the Customer
                          Padding(
                            //Supply Frequency
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Supply Frequency'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedSupplyFrequency = value;
                                          SelectedSupplyFrequencyID = value!.id;
                                        });
                                      },
                                      items:
                                          listSupplyFrequencyWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedSupplyFrequency,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Supply Frequency
                          Padding(
                            //Type of product/service supplied
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Type of product/service supplied'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              enabled: true,
                              controller: typeOfProductController,
                              onChanged: (comment) {},
                            ),
                          ), //Type of product/service supplied
                          Padding(
                            //Average Monthly Supply Amount (Tk)
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Average Monthly Supply Amount (Tk)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: averageMonthlySupplyAmountController,
                              onChanged: (comment) {},
                            ),
                          ), //Average Monthly Supply Amount (Tk)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Payment Terms'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        setState(() {
                                          SelectedPaymentTerms = value;
                                          SelectedPaymentTermsID = value!.id;
                                        });
                                      },
                                      items: listPaymentTermsWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedPaymentTerms,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), // Payment Terms
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Payment Timeliness'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedPaymentTimeLine = value;
                                          SelectedPaymentTimeLineID = value!.id;
                                        });
                                      },
                                      items: listPaymentTimelinessWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedPaymentTimeLine,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Payment Timeline
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Supplier Feedback'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedSupplierFeedback = value;
                                          SelectedSupplierFeedbackID =
                                              value!.id;
                                        });
                                      },
                                      items: listFeedbackOnCustomerWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedSupplierFeedback,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), // Supplier Feedback
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is SupplierVerificationLoadedState) {
                try {
                  nameOfSupplierController.text = state.data[0].suppliername!;
                } catch (e) {
                  // TODO
                }

                try {
                  supplierMobileNumberController.text =
                      state.data[0].mobilenumber!;
                } catch (e) {
                  // TODO
                }

                try {
                  supplierLocationController.text =
                      state.data[0].supplierlocation!;
                } catch (e) {
                  // TODO
                }
                try {
                  numberOfSupplyingYearsController.text =
                      state.data[0].yearssupplyingtocustomer.toString();
                } catch (e) {
                  // TODO
                }

                try {
                  typeOfProductController.text =
                      state.data[0].productservicesupplied.toString();
                } catch (e) {
                  // TODO
                }

                try {
                  averageMonthlySupplyAmountController.text =
                      state.data[0].averagemonthlysupplyamount.toString();
                } catch (e) {
                  // TODO
                }

                try {
                  SelectedSupplyFrequency =
                                      listSupplyFrequencyWithId[state.data[0].supplyfrequency!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedSupplyFrequencyID =
                                      listSupplyFrequencyWithId[state.data[0].supplyfrequency!]
                                          .id;
                } catch (e) {
                  print(e);
                }

                try {
                  SelectedPaymentTerms =
                                      listPaymentTermsWithId[state.data[0].paymentterms!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedPaymentTermsID =
                                      listPaymentTermsWithId[state.data[0].paymentterms!].id;
                } catch (e) {
                  print(e);
                }

                try {
                  SelectedPaymentTimeLine = listPaymentTimelinessWithId[
                                      state.data[0].paymenttimeliness!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedPaymentTimeLineID = listPaymentTimelinessWithId[
                                          state.data[0].paymenttimeliness!]
                                      .id;
                } catch (e) {
                  print(e);
                }

                try {
                  SelectedSupplierFeedback = listFeedbackOnCustomerWithId[
                                      state.data[0].supplierfeedback!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedSupplierFeedbackID = listFeedbackOnCustomerWithId[
                                          state.data[0].supplierfeedback!]
                                      .id;
                } catch (e) {
                  print(e);
                }

                return SingleChildScrollView(
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            //Name of the Supplier
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Name of the Supplier'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              controller: nameOfSupplierController,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //Name of the Supplier
                          Padding(
                            //Mobile Number
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Mobile Number'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              maxLength: 11,
                              controller: supplierMobileNumberController,
                              onChanged: (comment) {},
                            ),
                          ), //Mobile Number
                          Padding(
                            //Location
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration:
                                  Styles.cashFormInputDecoration('Location'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              controller: supplierLocationController,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //Location
                          Padding(
                            //Number of Years supplying to the Customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Number of Years supplying to the Customer'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              controller: numberOfSupplyingYearsController,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //Number of Years supplying to the Customer
                          Padding(
                            //Supply Frequency
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Supply Frequency'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedSupplyFrequency = value;
                                          SelectedSupplyFrequencyID = value!.id;
                                        });
                                      },
                                      items:
                                          listSupplyFrequencyWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedSupplyFrequency,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Supply Frequency
                          Padding(
                            //Type of product/service supplied
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Type of product/service supplied'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              enabled: true,
                              controller: typeOfProductController,
                              onChanged: (comment) {},
                            ),
                          ), //Type of product/service supplied
                          Padding(
                            //Average Monthly Supply Amount (Tk)
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Average Monthly Supply Amount (Tk)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: averageMonthlySupplyAmountController,
                              onChanged: (comment) {},
                            ),
                          ), //Average Monthly Supply Amount (Tk)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Payment Terms'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        setState(() {
                                          SelectedPaymentTerms = value;
                                          SelectedPaymentTermsID = value!.id;
                                        });
                                      },
                                      items: listPaymentTermsWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedPaymentTerms,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), // Payment Terms
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Payment Timeliness'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedPaymentTimeLine = value;
                                          SelectedPaymentTimeLineID = value!.id;
                                        });
                                      },
                                      items: listPaymentTimelinessWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedPaymentTimeLine,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Payment Timeline
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Supplier Feedback'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedSupplierFeedback = value;
                                          SelectedSupplierFeedbackID =
                                              value!.id;
                                        });
                                      },
                                      items: listFeedbackOnCustomerWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedSupplierFeedback,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), // Supplier Feedback
                        ],
                      ),
                    ),
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
          )
        : SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      //Name of the Supplier
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Name of the Supplier'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        controller: nameOfSupplierController,
                        enabled: true,
                        onChanged: (comment) {},
                      ),
                    ), //Name of the Supplier
                    Padding(
                      //Mobile Number
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                      child: TextFormField(
                        decoration:
                            Styles.cashFormInputDecoration('Mobile Number'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        controller: supplierMobileNumberController,
                        maxLength: 11,
                        onChanged: (comment) {},
                      ),
                    ), //Mobile Number
                    Padding(
                      //Location
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration('Location'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        controller: supplierLocationController,
                        enabled: true,
                        onChanged: (comment) {},
                      ),
                    ), //Location
                    Padding(
                      //Number of Years supplying to the Customer
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Number of Years supplying to the Customer'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        controller: numberOfSupplyingYearsController,
                        enabled: true,
                        onChanged: (comment) {},
                      ),
                    ), //Number of Years supplying to the Customer
                    Padding(
                      //Supply Frequency
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'Supply Frequency'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  // dropdownValue = value;
                                  setState(() {
                                    SelectedSupplyFrequency = value;
                                    SelectedSupplyFrequencyID = value!.id;
                                  });
                                },
                                items: listSupplyFrequencyWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedSupplyFrequency,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ), //Supply Frequency
                    Padding(
                      //Type of product/service supplied
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Type of product/service supplied'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        enabled: true,
                        controller: typeOfProductController,
                        onChanged: (comment) {},
                      ),
                    ), //Type of product/service supplied
                    Padding(
                      //Average Monthly Supply Amount (Tk)
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Average Monthly Supply Amount (Tk)'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        controller: averageMonthlySupplyAmountController,
                        onChanged: (comment) {},
                      ),
                    ), //Average Monthly Supply Amount (Tk)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration:
                              Styles.cashFormInputDecoration('Payment Terms'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  setState(() {
                                    SelectedPaymentTerms = value;
                                    SelectedPaymentTermsID = value!.id;
                                  });
                                },
                                items: listPaymentTermsWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedPaymentTerms,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ), // Payment Terms
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'Payment Timeliness'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  // dropdownValue = value;
                                  setState(() {
                                    SelectedPaymentTimeLine = value;
                                    SelectedPaymentTimeLineID = value!.id;
                                  });
                                },
                                items: listPaymentTimelinessWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedPaymentTimeLine,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ), //Payment Timeline
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'Supplier Feedback'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  // dropdownValue = value;
                                  setState(() {
                                    SelectedSupplierFeedback = value;
                                    SelectedSupplierFeedbackID = value!.id;
                                  });
                                },
                                items: listFeedbackOnCustomerWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedSupplierFeedback,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ), // Supplier Feedback
                  ],
                ),
              ),
            ),
          );
  }

  Widget buyer_verification() {
    return widget.arguments.isEditable
        ? BlocConsumer<BuyerVerificationCubit, BuyerVerificationState>(
            listener: (context, state) {
              if (state is CustomerListErrorState) {
                final snackBar = SnackBar(
                  content: Text(Languages.of(context)!.internetErrorText),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is BuyerVerificationInitialState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is BuyerVerificationLoadingState) {
                return SingleChildScrollView(
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            //Name of the Buyer
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Name of the Buyer'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              controller: nameOfBuyerController,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //Name of the Buyer
                          Padding(
                            //Mobile Number
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Mobile Number'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              controller: buyerMobileNumberController,
                              maxLength: 11,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), // Mobile Number
                          Padding(
                            // Location
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration:
                                  Styles.cashFormInputDecoration('Location'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              enabled: true,
                              controller: buyerLocationController,
                              onChanged: (comment) {},
                            ),
                          ), //Location
                          Padding(
                            //Number of Years purchasing from the Customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Number of Years purchasing from the Customer'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: numberOfPurchasingYearsController,
                              onChanged: (comment) {},
                            ),
                          ), //Number of Years purchasing from the Customer
                          Padding(
                            //Purchase Frequency
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Purchase Frequency'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedPurchaseFrequency = value;
                                          SelectedPurchaseFrequencyID =
                                              value!.id;
                                        });
                                      },
                                      items: listPurchaseFrequencyWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedPurchaseFrequency,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Purchase Frequency
                          Padding(
                            //Average Monthly Purchase Amount (Tk)
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Average Monthly Purchase Amount (Tk)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              controller:
                                  averageMonthlyPurchaseAmountController,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //Average Monthly Purchase Amount (Tk)
                          Padding(
                            //Payment terms
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Payment terms'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedPaymentTermsBuyer = value;
                                          SelectedPaymentTermsBuyerID =
                                              value!.id;
                                        });
                                      },
                                      items: listPaymentTermsWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedPaymentTermsBuyer,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Payment terms
                          Padding(
                            //Product/Service Quality
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Product/Service Quality'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedProductQualityPurchase =
                                              value;
                                          SelectedProductQualityPurchaseID =
                                              value!.id;
                                        });
                                      },
                                      items:
                                          listServiceQualityWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedProductQualityPurchase,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Product/Service Quality
                          Padding(
                            //Buyer Feedback on Customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Buyer Feedback on Customer'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedBuyerFeedback = value;
                                          SelectedBuyerFeedbackID = value!.id;
                                        });
                                      },
                                      items: listFeedbackOnCustomerWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedBuyerFeedback,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Buyer Feedback on Customer
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is BuyerVerificationLoadedState) {
                try {
                  nameOfBuyerController.text = state.data[0].buyername!;
                } catch (e) {
                  // TODO
                }
                try {
                  buyerMobileNumberController.text =
                      state.data[0].mobilenumber!;
                } catch (e) {
                  // TODO
                }

                try {
                  buyerLocationController.text = state.data[0].buyerlocation!;
                } catch (e) {
                  // TODO
                }

                try {
                  numberOfPurchasingYearsController.text =
                      state.data[0].yearspurchasingfromcustomer.toString();
                } catch (e) {
                  // TODO
                }

                try {
                  purchaseFrequencyController.text =
                                      state.data[0].purchasefrequency.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  averageMonthlyPurchaseAmountController.text =
                                      state.data[0].averagemonthlypurchaseamount.toString();
                } catch (e) {
                  print(e);
                }

                try {
                  SelectedPurchaseFrequency = listPurchaseFrequencyWithId[
                                      state.data[0].purchasefrequency!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedPurchaseFrequencyID = listPurchaseFrequencyWithId[
                                          state.data[0].purchasefrequency!]
                                      .id;
                } catch (e) {
                  print(e);
                }

                try {
                  SelectedPaymentTermsBuyer =
                                      listPaymentTermsWithId[state.data[0].paymentterms!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedPaymentTermsBuyerID =
                                      listPaymentTermsWithId[state.data[0].paymentterms!].id;
                } catch (e) {
                  print(e);
                }

                try {
                  SelectedProductQualityPurchase = listServiceQualityWithId[
                                      state.data[0].productservicequality!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedProductQualityPurchaseID = listServiceQualityWithId[
                                          state.data[0].productservicequality!]
                                      .id;
                } catch (e) {
                  print(e);
                }

                try {
                  SelectedBuyerFeedback = listFeedbackOnCustomerWithId[
                                      state.data[0].buyerfeedbackoncustomer!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedBuyerFeedbackID = listFeedbackOnCustomerWithId[
                                          state.data[0].buyerfeedbackoncustomer!]
                                      .id;
                } catch (e) {
                  print(e);
                }

                return SingleChildScrollView(
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            //Name of the Buyer
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Name of the Buyer'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              controller: nameOfBuyerController,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //Name of the Buyer
                          Padding(
                            //Mobile Number
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Mobile Number'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              controller: buyerMobileNumberController,
                              maxLength: 11,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), // Mobile Number
                          Padding(
                            // Location
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration:
                                  Styles.cashFormInputDecoration('Location'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              enabled: true,
                              controller: buyerLocationController,
                              onChanged: (comment) {},
                            ),
                          ), //Location
                          Padding(
                            //Number of Years purchasing from the Customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Number of Years purchasing from the Customer'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: numberOfPurchasingYearsController,
                              onChanged: (comment) {},
                            ),
                          ), //Number of Years purchasing from the Customer
                          Padding(
                            //Purchase Frequency
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Purchase Frequency'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedPurchaseFrequency = value;
                                          SelectedPurchaseFrequencyID =
                                              value!.id;
                                        });
                                      },
                                      items: listPurchaseFrequencyWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedPurchaseFrequency,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Purchase Frequency
                          Padding(
                            //Average Monthly Purchase Amount (Tk)
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Average Monthly Purchase Amount (Tk)'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              controller:
                                  averageMonthlyPurchaseAmountController,
                              enabled: true,
                              onChanged: (comment) {},
                            ),
                          ), //Average Monthly Purchase Amount (Tk)
                          Padding(
                            //Payment terms
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Payment terms'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedPaymentTermsBuyer = value;
                                          SelectedPaymentTermsBuyerID =
                                              value!.id;
                                        });
                                      },
                                      items: listPaymentTermsWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedPaymentTermsBuyer,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Payment terms
                          Padding(
                            //Product/Service Quality
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Product/Service Quality'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedProductQualityPurchase =
                                              value;
                                          SelectedProductQualityPurchaseID =
                                              value!.id;
                                        });
                                      },
                                      items:
                                          listServiceQualityWithId.map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedProductQualityPurchase,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Product/Service Quality
                          Padding(
                            //Buyer Feedback on Customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Buyer Feedback on Customer'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedBuyerFeedback = value;
                                          SelectedBuyerFeedbackID = value!.id;
                                        });
                                      },
                                      items: listFeedbackOnCustomerWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedBuyerFeedback,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Buyer Feedback on Customer
                        ],
                      ),
                    ),
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
          )
        : SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      //Name of the Buyer
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        decoration:
                            Styles.cashFormInputDecoration('Name of the Buyer'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        controller: nameOfBuyerController,
                        enabled: true,
                        onChanged: (comment) {},
                      ),
                    ), //Name of the Buyer
                    Padding(
                      //Mobile Number
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                      child: TextFormField(
                        decoration:
                            Styles.cashFormInputDecoration('Mobile Number'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        controller: buyerMobileNumberController,
                        maxLength: 11,
                        enabled: true,
                        onChanged: (comment) {},
                      ),
                    ), // Mobile Number
                    Padding(
                      // Location
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration('Location'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        enabled: true,
                        controller: buyerLocationController,
                        onChanged: (comment) {},
                      ),
                    ), //Location
                    Padding(
                      //Number of Years purchasing from the Customer
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Number of Years purchasing from the Customer'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        controller: numberOfPurchasingYearsController,
                        onChanged: (comment) {},
                      ),
                    ), //Number of Years purchasing from the Customer
                    Padding(
                      //Purchase Frequency
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'Purchase Frequency'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  // dropdownValue = value;
                                  setState(() {
                                    SelectedPurchaseFrequency = value;
                                    SelectedPurchaseFrequencyID = value!.id;
                                  });
                                },
                                items: listPurchaseFrequencyWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedPurchaseFrequency,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ), //Purchase Frequency
                    Padding(
                      //Average Monthly Purchase Amount (Tk)
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Average Monthly Purchase Amount (Tk)'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        controller: averageMonthlyPurchaseAmountController,
                        enabled: true,
                        onChanged: (comment) {},
                      ),
                    ), //Average Monthly Purchase Amount (Tk)
                    Padding(
                      //Payment terms
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration:
                              Styles.cashFormInputDecoration('Payment terms'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  // dropdownValue = value;
                                  setState(() {
                                    SelectedPaymentTermsBuyer = value;
                                    SelectedPaymentTermsBuyerID = value!.id;
                                  });
                                },
                                items: listPaymentTermsWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedPaymentTermsBuyer,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ), //Payment terms
                    Padding(
                      //Product/Service Quality
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'Product/Service Quality'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  // dropdownValue = value;
                                  setState(() {
                                    SelectedProductQualityPurchase = value;
                                    SelectedProductQualityPurchaseID =
                                        value!.id;
                                  });
                                },
                                items: listServiceQualityWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedProductQualityPurchase,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ), //Product/Service Quality
                    Padding(
                      //Buyer Feedback on Customer
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'Buyer Feedback on Customer'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  // dropdownValue = value;
                                  setState(() {
                                    SelectedBuyerFeedback = value;
                                    SelectedBuyerFeedbackID = value!.id;
                                  });
                                },
                                items: listFeedbackOnCustomerWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedBuyerFeedback,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ), //Buyer Feedback on Customer
                  ],
                ),
              ),
            ),
          );
  }

  Widget personal_reference_verification() {
    return widget.arguments.isEditable
        ? BlocConsumer<PersonalReferenceVerificationCubit,
            PersonalReferenceVerificationState>(
            listener: (context, state) {
              if (state is CustomerListErrorState) {
                final snackBar = SnackBar(
                  content: Text(Languages.of(context)!.internetErrorText),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is PersonalReferenceVerificationInitialState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PersonalReferenceVerificationLoadingState) {
                return SingleChildScrollView(
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            //Name of the Person
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Name of the Person'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.text,
                              enabled: true,
                              controller: nameOfPersonController,
                              onChanged: (comment) {},
                            ),
                          ), //Name of the Person
                          Padding(
                            //Mobile Number
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Mobile Number'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              controller: referenceMobileNumberController,
                              enabled: true,
                              maxLength: 11,
                              onChanged: (comment) {},
                            ),
                          ), //Mobile Number
                          Padding(
                            //Location
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration:
                                  Styles.cashFormInputDecoration('Location'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.text,
                              enabled: true,
                              controller: referenceLocationController,
                              onChanged: (comment) {},
                            ),
                          ), //Location
                          Padding(
                            //Relation with the Customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Relation with the Customer'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedRelationWithCustomer = value;
                                          SelectedRelationWithCustomerID =
                                              value!.id;
                                        });
                                      },
                                      items: listRelationWithCustomerWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedRelationWithCustomer,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Relation with the Customer
                          Padding(
                            //Number of Years Knowing the Customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Number of Years Knowing the Customer'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: numberOfKnowingCustomerController,
                              onChanged: (comment) {},
                            ),
                          ), //Number of Years Knowing the Customer
                          Padding(
                            //Level of interaction with customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Level of interaction with customer'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedInteractionWithCustomer =
                                              value;
                                          SelectedInteractionWithCustomerID =
                                              value!.id;
                                        });
                                      },
                                      items: listInteractionWithCustomerWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedInteractionWithCustomer,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Level of interaction with customer
                          Padding(
                            //Feedback on Customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Feedback on Customer'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        setState(() {
                                          SelectedFeedbackOnCustomer = value;
                                          SelectedFeedbackOnCustomerID =
                                              value!.id;
                                        });
                                      },
                                      items: listFeedbackOnCustomerWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedFeedbackOnCustomer,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Feedback on Customer
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is PersonalReferenceVerificationLoadedState) {
                try {
                  nameOfPersonController.text = state.data[0].personname!;
                } catch (e) {
                  // TODO
                }
                try {
                  referenceMobileNumberController.text =
                      state.data[0].mobilenumber!;
                } catch (e) {
                  // TODO
                }

                try {
                  referenceLocationController.text =
                                      state.data[0].referencelocation.toString();
                } catch (e) {
                  print(e);
                }
                //relationWithCustomerController.text = state.data[0].relationwithcustomer.toString();

                try {
                  numberOfKnowingCustomerController.text =
                                      state.data[0].yearsknowingcustomer.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  levelOfInteractionWithCustomerController.text =
                                      state.data[0].levelofinteraction.toString();
                } catch (e) {
                  print(e);
                }
                try {
                  feedbackWithCustomerController.text =
                                      state.data[0].feedbackoncustomer.toString();
                } catch (e) {
                  print(e);
                }

                try {
                  SelectedRelationWithCustomer = listRelationWithCustomerWithId[
                                      state.data[0].relationwithcustomer!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedRelationWithCustomerID = listRelationWithCustomerWithId[
                                          state.data[0].relationwithcustomer!]
                                      .id;
                } catch (e) {
                  print(e);
                }

                try {
                  SelectedInteractionWithCustomer =
                                      listInteractionWithCustomerWithId[
                                          state.data[0].levelofinteraction!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedInteractionWithCustomerID =
                                      listInteractionWithCustomerWithId[
                                              state.data[0].levelofinteraction!]
                                          .id;
                } catch (e) {
                  print(e);
                }

                try {
                  SelectedFeedbackOnCustomer = listFeedbackOnCustomerWithId[
                                      state.data[0].feedbackoncustomer!];
                } catch (e) {
                  print(e);
                }
                try {
                  SelectedFeedbackOnCustomerID = listFeedbackOnCustomerWithId[
                                          state.data[0].feedbackoncustomer!]
                                      .id;
                } catch (e) {
                  print(e);
                }

                return SingleChildScrollView(
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            //Name of the Person
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Name of the Person'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.text,
                              enabled: true,
                              controller: nameOfPersonController,
                              onChanged: (comment) {},
                            ),
                          ), //Name of the Person
                          Padding(
                            //Mobile Number
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Mobile Number'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              controller: referenceMobileNumberController,
                              enabled: true,
                              maxLength: 11,
                              onChanged: (comment) {},
                            ),
                          ), //Mobile Number
                          Padding(
                            //Location
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration:
                                  Styles.cashFormInputDecoration('Location'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.text,
                              enabled: true,
                              controller: referenceLocationController,
                              onChanged: (comment) {},
                            ),
                          ), //Location
                          Padding(
                            //Relation with the Customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Relation with the Customer'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedRelationWithCustomer = value;
                                          SelectedRelationWithCustomerID =
                                              value!.id;
                                        });
                                      },
                                      items: listRelationWithCustomerWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedRelationWithCustomer,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Relation with the Customer
                          Padding(
                            //Number of Years Knowing the Customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 5),
                            child: TextFormField(
                              decoration: Styles.cashFormInputDecoration(
                                  'Number of Years Knowing the Customer'),
                              cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                              style: Styles.hintTextStyle,
                              maxLines: null,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: numberOfKnowingCustomerController,
                              onChanged: (comment) {},
                            ),
                          ), //Number of Years Knowing the Customer
                          Padding(
                            //Level of interaction with customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Level of interaction with customer'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        //selectedDesignation = value;
                                        // dropdownValue = value;
                                        setState(() {
                                          SelectedInteractionWithCustomer =
                                              value;
                                          SelectedInteractionWithCustomerID =
                                              value!.id;
                                        });
                                      },
                                      items: listInteractionWithCustomerWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedInteractionWithCustomer,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Level of interaction with customer
                          Padding(
                            //Feedback on Customer
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: Container(
                              height: 60,
                              child: InputDecorator(
                                decoration: Styles.cashFormInputDecoration(
                                    'Feedback on Customer'),
                                child: DropdownButtonHideUnderline(
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.white),
                                    child: DropdownButton<NameIDModel>(
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (NameIDModel? value) {
                                        setState(() {
                                          SelectedFeedbackOnCustomer = value;
                                          SelectedFeedbackOnCustomerID =
                                              value!.id;
                                        });
                                      },
                                      items: listFeedbackOnCustomerWithId
                                          .map((item) {
                                        return DropdownMenuItem<NameIDModel>(
                                          child: Text(item.name),
                                          value: item,
                                        );
                                      }).toList(),
                                      value: SelectedFeedbackOnCustomer,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), //Feedback on Customer
                        ],
                      ),
                    ),
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
          )
        : SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      //Name of the Person
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Name of the Person'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.text,
                        enabled: true,
                        controller: nameOfPersonController,
                        onChanged: (comment) {},
                      ),
                    ), //Name of the Person
                    Padding(
                      //Mobile Number
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                      child: TextFormField(
                        decoration:
                            Styles.cashFormInputDecoration('Mobile Number'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        controller: referenceMobileNumberController,
                        enabled: true,
                        maxLength: 11,
                        onChanged: (comment) {},
                      ),
                    ), //Mobile Number
                    Padding(
                      //Location
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration('Location'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.text,
                        enabled: true,
                        controller: referenceLocationController,
                        onChanged: (comment) {},
                      ),
                    ), //Location
                    Padding(
                      //Relation with the Customer
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'Relation with the Customer'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  // dropdownValue = value;
                                  setState(() {
                                    SelectedRelationWithCustomer = value;
                                    SelectedRelationWithCustomerID = value!.id;
                                  });
                                },
                                items:
                                    listRelationWithCustomerWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedRelationWithCustomer,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ), //Relation with the Customer
                    Padding(
                      //Number of Years Knowing the Customer
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 5),
                      child: TextFormField(
                        decoration: Styles.cashFormInputDecoration(
                            'Number of Years Knowing the Customer'),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        controller: numberOfKnowingCustomerController,
                        onChanged: (comment) {},
                      ),
                    ), //Number of Years Knowing the Customer
                    Padding(
                      //Level of interaction with customer
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'Level of interaction with customer'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  //selectedDesignation = value;
                                  // dropdownValue = value;
                                  setState(() {
                                    SelectedInteractionWithCustomer = value;
                                    SelectedInteractionWithCustomerID =
                                        value!.id;
                                  });
                                },
                                items: listInteractionWithCustomerWithId
                                    .map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedInteractionWithCustomer,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ), //Level of interaction with customer
                    Padding(
                      //Feedback on Customer
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 5),
                      child: Container(
                        height: 60,
                        child: InputDecorator(
                          decoration: Styles.cashFormInputDecoration(
                              'Feedback on Customer'),
                          child: DropdownButtonHideUnderline(
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<NameIDModel>(
                                isExpanded: true,
                                hint: Text('Select'),
                                onChanged: (NameIDModel? value) {
                                  setState(() {
                                    SelectedFeedbackOnCustomer = value;
                                    SelectedFeedbackOnCustomerID = value!.id;
                                  });
                                },
                                items: listFeedbackOnCustomerWithId.map((item) {
                                  return DropdownMenuItem<NameIDModel>(
                                    child: Text(item.name),
                                    value: item,
                                  );
                                }).toList(),
                                value: SelectedFeedbackOnCustomer,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ), //Feedback on Customer
                  ],
                ),
              ),
            ),
          );
  }

  @override
  void initState() {
    tabController = TabController(length: titles.length, vsync: this);
    repository = BuroRepository();

    loanEligibilityCashFlowControllerPrevious = TextEditingController();

    memberCodeController = TextEditingController();

    customerNameController = TextEditingController();
    customerStatusController = TextEditingController();
    customerStatusPreviousLoanController = TextEditingController();
    genderController = TextEditingController();
    dateOfBirthController = TextEditingController();
    maritalStatusController = TextEditingController();
    qualificationController = TextEditingController();
    housePinCodeController = TextEditingController();
    noOfFamilyMemberController = TextEditingController();
    noOfEarningMemberController = TextEditingController();
    residenceOwnershipController = TextEditingController();
    residenceStayVintageController = TextEditingController();
    vintageWithBuroController = TextEditingController();
    currentSavingsAmountController = TextEditingController();
    currentSavingsAmountPreviousLoanController = TextEditingController();
    peakSavingAmountController = TextEditingController();
    exitingLoanAmountController = TextEditingController();
    exitingRepaymentBehaviorController = TextEditingController();
    exitingRepaymentBehaviorPreviousLoanController = TextEditingController();
    exitingPeakDPDLast12MonthController = TextEditingController();
    exitingPeakDPDLast12MonthPreviousLoanController = TextEditingController();

    // exitingLoanAmountPreviousLoanController = TextEditingController();

    workplacePinCode = TextEditingController();
    businessSubSegment = TextEditingController();
    workPlaceVintage = TextEditingController();
    grossMarginBusiness = TextEditingController();
    /*grossMarginBusinessPrevious = TextEditingController();*/
    numberPaidRegularEmployee = TextEditingController();
    numberPaidRegularEmployeePrevious = TextEditingController();
    enterpriseName = TextEditingController();

    loanAppliedAmountController = TextEditingController();
    loanAppliedAmountPreviousLoanController = TextEditingController();
    tenureAppliedMonthsController = TextEditingController();
    tenureAppliedMonthsPreviousLoanController = TextEditingController();
    roiProposedController = TextEditingController();
    roiProposedControllerPreviousLoan = TextEditingController();
    endUseWorkingCapitalController = TextEditingController();
    endUseWorkingCapitalPreviousController = TextEditingController();
    facilityAppliedController = TextEditingController();
    facilityAppliedPreviousLoanController = TextEditingController();
    proposedLoanRepaymentFrequency = TextEditingController();
    proposedLoanRepaymentFrequencyPreviousLoan = TextEditingController();
    proposedLoanAffordableEMIController = TextEditingController();
    proposedLoanAffordableEMIControllerPreviousLoan = TextEditingController();
    loanEligibilityCashFlowController = TextEditingController();
    approvedLoanAmountController = TextEditingController();
    approvedLoanAmountControllerPreviousLoan = TextEditingController();

    nameOfSupplierController = TextEditingController();
    supplierMobileNumberController = TextEditingController();

    supplierLocationController = TextEditingController();
    numberOfSupplyingYearsController = TextEditingController();

    typeOfProductController = TextEditingController();
    averageMonthlySupplyAmountController = TextEditingController();

    nameOfBuyerController = TextEditingController();
    buyerMobileNumberController = TextEditingController();

    buyerLocationController = TextEditingController();
    numberOfPurchasingYearsController = TextEditingController();

    purchaseFrequencyController = TextEditingController();
    averageMonthlyPurchaseAmountController = TextEditingController();

    nameOfPersonController = TextEditingController();
    referenceMobileNumberController = TextEditingController();

    referenceLocationController = TextEditingController();
    relationWithCustomerController = TextEditingController();

    numberOfKnowingCustomerController = TextEditingController();
    levelOfInteractionWithCustomerController = TextEditingController();
    feedbackWithCustomerController = TextEditingController();

    productSaleTypeController = TextEditingController();

    productSalePriceController = TextEditingController();
    productSaleUnitsController = TextEditingController();
    productPurchaseTypeController = TextEditingController();
    productPurchasePriceController = TextEditingController();
    productPurchaseUnitsController = TextEditingController();

    customerListCubit = context.read<CustomerListCubit>();
    enterpriseDetailsCubit = context.read<EnterpriseDetailsCubit>();
    proposedLoanDetailsCubit = context.read<ProposedLoanDetailsCubit>();
    supplierVerificationCubit = context.read<SupplierVerificationCubit>();
    buyerVerificationCubit = context.read<BuyerVerificationCubit>();
    personalReferenceVerificationCubit =
        context.read<PersonalReferenceVerificationCubit>();
    customerDetailsCubit = context.read<CustomerDetailsCubit>();

    if (widget.arguments.isEditable) {
      // customerListCubit.getExistingCustomerInfo(widget.arguments.customerID);
      customerListCubit
          .getCustomerList(widget.arguments.memberID)
          .then((value) => {
                hasCustomerInfo = value.success!,
                customerListCubit.hasCustomerInfo = value.success!
              });
      enterpriseDetailsCubit
          .getEnterpriseDetails(widget.arguments.customerID)
          .then((value) => {
                customerListCubit.hasEnterpriseInfo = value.success!,
              });
      proposedLoanDetailsCubit
          .getProposedLoanDetails(widget.arguments.customerID)
          .then((value) => {customerListCubit.hasLoanInfo = value.success!});
      supplierVerificationCubit
          .getSupplierVerificationDetails(widget.arguments.customerID)
          .then(
              (value) => {customerListCubit.hasSupplierInfo = value.success!});
      buyerVerificationCubit
          .getBuyerVerificationDetails(widget.arguments.customerID)
          .then((value) => {customerListCubit.hasBuyerInfo = value.success!});

      personalReferenceVerificationCubit
          .getPersonalReferenceInformation(widget.arguments.customerID)
          .then(
              (value) => {customerListCubit.hasReferenceInfo = value.success!});
    } else {
      customerDetailsCubit.emit(CustomerDetailsInitialState());
    }

    if (listCustomerStatusWithId.isEmpty) {
      //listCustomerStatusWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listCustomerStatusWithId.add(NameIDModel(name: 'New', id: 1));
      listCustomerStatusWithId.add(NameIDModel(name: 'Existing', id: 2));

      //listGenderWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listGenderWithId.add(NameIDModel(name: 'Male', id: 1));
      listGenderWithId.add(NameIDModel(name: 'Female', id: 2));
      listGenderWithId.add(NameIDModel(name: 'Trigender', id: 3));

      listMaritalStatusWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listMaritalStatusWithId.add(NameIDModel(name: 'Married', id: 1));
      listMaritalStatusWithId.add(NameIDModel(name: 'Single', id: 2));
      listMaritalStatusWithId.add(NameIDModel(name: 'Unmarried', id: 3));
      listMaritalStatusWithId.add(NameIDModel(name: 'Widow', id: 4));

      /*  1	Pre-Primary
      2	Primary
      3	Secondary
      4	Higher Secondary
      5	Graduate
      6	PostGraduate
      7	Other*/
      listEducationalQualificationWithId
          .add(NameIDModel(name: 'Select Any', id: 0));
      listEducationalQualificationWithId
          .add(NameIDModel(name: 'Pre-Primary', id: 1));
      listEducationalQualificationWithId
          .add(NameIDModel(name: 'Primary', id: 2));
      listEducationalQualificationWithId
          .add(NameIDModel(name: 'Secondary', id: 3));
      listEducationalQualificationWithId
          .add(NameIDModel(name: 'Higher Secondary', id: 4));
      listEducationalQualificationWithId
          .add(NameIDModel(name: 'Graduate', id: 5));
      listEducationalQualificationWithId
          .add(NameIDModel(name: 'PostGraduate', id: 6));
      listEducationalQualificationWithId.add(NameIDModel(name: 'Other', id: 7));

      listConstitutionWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listConstitutionWithId.add(NameIDModel(name: 'Proprietorship', id: 1));
      listConstitutionWithId.add(NameIDModel(name: 'Partnership', id: 2));
      listConstitutionWithId.add(NameIDModel(name: 'Company', id: 3));

      listBusinessSegmentWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listBusinessSegmentWithId.add(NameIDModel(name: 'Manufacturing', id: 1));
      listBusinessSegmentWithId
          .add(NameIDModel(name: 'Manufacturing & Trading', id: 2));
      listBusinessSegmentWithId.add(NameIDModel(name: 'Trading', id: 3));
      listBusinessSegmentWithId
          .add(NameIDModel(name: 'Trading & Services', id: 4));
      listBusinessSegmentWithId.add(NameIDModel(name: 'Services', id: 5));
      listBusinessSegmentWithId
          .add(NameIDModel(name: 'Manufacturing and Services', id: 6));
      //listBusinessSegmentWithId.add(NameIDModel(name: 'Agri and Agri Allied', id: 7));

      listTradeLicensesWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listTradeLicensesWithId.add(NameIDModel(name: 'Yes', id: 1));
      listTradeLicensesWithId.add(NameIDModel(name: 'Not Applicable', id: 2));
      listTradeLicensesWithId.add(NameIDModel(name: 'No', id: 3));

      /* listBusinessSegmentWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listBusinessSegmentWithId.add(NameIDModel(name: 'Yes', id: 1));
      listBusinessSegmentWithId.add(NameIDModel(name: 'Not Applicable', id: 2));
      listBusinessSegmentWithId.add(NameIDModel(name: 'No', id: 3));
*/
      listAvailableTinWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listAvailableTinWithId.add(NameIDModel(name: 'Yes', id: 1));
      listAvailableTinWithId.add(NameIDModel(name: 'Not Applicable', id: 2));
      listAvailableTinWithId.add(NameIDModel(name: 'No', id: 3));

      listWorkplaceOwnerShipWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listWorkplaceOwnerShipWithId.add(NameIDModel(name: 'Parental', id: 1));
      listWorkplaceOwnerShipWithId.add(NameIDModel(name: 'Rented', id: 2));
      listWorkplaceOwnerShipWithId.add(NameIDModel(name: 'Owned', id: 3));

      listWorkingCapitalWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listWorkingCapitalWithId.add(NameIDModel(name: 'Capex', id: 1));
      listWorkingCapitalWithId.add(NameIDModel(name: 'Working Capital', id: 2));
      listWorkingCapitalWithId.add(NameIDModel(name: 'Not Applicable', id: 3));
      listWorkingCapitalWithId.add(NameIDModel(name: 'Both', id: 4));

      listFacilityAppliedWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listFacilityAppliedWithId.add(NameIDModel(name: 'New', id: 1));
      listFacilityAppliedWithId.add(NameIDModel(name: 'Not Applicable', id: 2));
      listFacilityAppliedWithId.add(NameIDModel(name: 'Repeat', id: 3));

      listRepaymentFrequencyWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listRepaymentFrequencyWithId.add(NameIDModel(name: 'Weekly', id: 1));
      listRepaymentFrequencyWithId.add(NameIDModel(name: 'Fortnightly', id: 2));
      listRepaymentFrequencyWithId
          .add(NameIDModel(name: 'Not Applicable', id: 3));
      listRepaymentFrequencyWithId.add(NameIDModel(name: 'Monthly', id: 4));

      //List<NameIDModel> listSupplyFrequencyWithId = [];

      listSupplyFrequencyWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listSupplyFrequencyWithId.add(NameIDModel(name: 'Daily', id: 1));
      listSupplyFrequencyWithId.add(NameIDModel(name: 'Weekly', id: 2));
      listSupplyFrequencyWithId.add(NameIDModel(name: 'Fortnightly', id: 3));
      listSupplyFrequencyWithId.add(NameIDModel(name: 'Not Applicable', id: 4));
      listSupplyFrequencyWithId.add(NameIDModel(name: 'Monthly', id: 5));

      //List<NameIDModel> listPaymentTermsWithId = [];

      listPaymentTermsWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listPaymentTermsWithId.add(NameIDModel(name: 'Cash', id: 1));
      listPaymentTermsWithId.add(NameIDModel(name: 'Credit', id: 2));
      listPaymentTermsWithId.add(NameIDModel(name: 'Not Applicable', id: 3));
      listPaymentTermsWithId.add(NameIDModel(name: 'Cash and Credit', id: 4));

      listPaymentTimelinessWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listPaymentTimelinessWithId
          .add(NameIDModel(name: 'On or Before Time', id: 1));
      listPaymentTimelinessWithId
          .add(NameIDModel(name: 'Delayed by a few days', id: 2));
      listPaymentTimelinessWithId
          .add(NameIDModel(name: 'Delayed by a few weeks', id: 3));
      listPaymentTimelinessWithId
          .add(NameIDModel(name: 'Delayed by a few months', id: 4));
      listPaymentTimelinessWithId
          .add(NameIDModel(name: 'Not Applicable', id: 5));
      listPaymentTimelinessWithId.add(NameIDModel(name: 'Unpaid', id: 6));

      listFeedbackOnCustomerWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listFeedbackOnCustomerWithId.add(NameIDModel(name: 'Positive', id: 1));
      listFeedbackOnCustomerWithId.add(NameIDModel(name: 'Negative', id: 2));
      listFeedbackOnCustomerWithId
          .add(NameIDModel(name: 'Not Applicable', id: 3));
      listFeedbackOnCustomerWithId.add(NameIDModel(name: 'Neutral', id: 4));

      listPurchaseFrequencyWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listPurchaseFrequencyWithId.add(NameIDModel(name: 'Weekly', id: 1));
      listPurchaseFrequencyWithId.add(NameIDModel(name: 'Monthly', id: 2));
      listPurchaseFrequencyWithId.add(NameIDModel(name: 'Daily', id: 3));

      listServiceQualityWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listServiceQualityWithId.add(NameIDModel(name: 'Good', id: 1));
      listServiceQualityWithId.add(NameIDModel(name: 'Bad', id: 2));
      listServiceQualityWithId.add(NameIDModel(name: 'Average', id: 3));

      listRelationWithCustomerWithId
          .add(NameIDModel(name: 'Select Any', id: 0));
      listRelationWithCustomerWithId.add(NameIDModel(name: 'Relative', id: 1));
      listRelationWithCustomerWithId.add(NameIDModel(name: 'Friend', id: 2));
      listRelationWithCustomerWithId
          .add(NameIDModel(name: 'Residence Neighbour', id: 3));
      listRelationWithCustomerWithId
          .add(NameIDModel(name: 'Not Applicable', id: 4));
      listRelationWithCustomerWithId
          .add(NameIDModel(name: 'Business Neighbour', id: 5));

      listInteractionWithCustomerWithId
          .add(NameIDModel(name: 'Select Any', id: 0));
      listInteractionWithCustomerWithId
          .add(NameIDModel(name: 'Frequent (D/W/M)', id: 1));
      listInteractionWithCustomerWithId
          .add(NameIDModel(name: 'Not Applicable', id: 2));
      listInteractionWithCustomerWithId
          .add(NameIDModel(name: 'Infrequent (Q/H/A)', id: 3));

      listResidenceOwnerShipWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listResidenceOwnerShipWithId.add(NameIDModel(name: 'Parental', id: 1));
      listResidenceOwnerShipWithId.add(NameIDModel(name: 'Rented', id: 2));
      listResidenceOwnerShipWithId.add(NameIDModel(name: 'Owned', id: 3));

      listRePaymentBehaviourWithId.add(NameIDModel(name: 'Select Any', id: 0));
      listRePaymentBehaviourWithId
          .add(NameIDModel(name: 'On or Before due Date', id: 1));
      listRePaymentBehaviourWithId
          .add(NameIDModel(name: 'Paid within the month', id: 2));
      listRePaymentBehaviourWithId
          .add(NameIDModel(name: 'Occasional Overdue', id: 3));
    }

    if (!widget.arguments.isEditable) {
      repository.getNextCustomerID().then((value) => {
            customerID = value.data![0].id!,
            sessionManager.setCustomerID(value.data![0].id!),
          });
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomerDetails oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // customerListCubit.close();
    /*enterpriseDetailsCubit.close();
    proposedLoanDetailsCubit.close();
    supplierVerificationCubit.close();
    buyerVerificationCubit.close();
    personalReferenceVerificationCubit.close();
    customerDetailsCubit.close();*/
    super.deactivate();
  }

  @override
  void dispose() {
    print('Customer Details dispose() called');
    // Dispose the animation controller when the widget is disposed
    productSaleTypeController.dispose();
    productSalePriceController.dispose();
    productSaleUnitsController.dispose();
    productPurchaseTypeController.dispose();
    productPurchasePriceController.dispose();
    productPurchaseUnitsController.dispose();
    memberCodeController.dispose();
    customerStatusController.dispose();
    customerStatusPreviousLoanController.dispose();
    genderController.dispose();
    dateOfBirthController.dispose();
    maritalStatusController.dispose();
    qualificationController.dispose();
    housePinCodeController.dispose();
    noOfFamilyMemberController.dispose();
    noOfEarningMemberController.dispose();
    residenceOwnershipController.dispose();
    residenceStayVintageController.dispose();
    vintageWithBuroController.dispose();
    currentSavingsAmountController.dispose();
    currentSavingsAmountPreviousLoanController.dispose();
    peakSavingAmountController.dispose();
    exitingLoanAmountController.dispose();
    exitingRepaymentBehaviorController.dispose();
    exitingRepaymentBehaviorPreviousLoanController.dispose();
    exitingPeakDPDLast12MonthController.dispose();
    exitingPeakDPDLast12MonthPreviousLoanController.dispose();
    customerNameController.dispose();

    loanAppliedAmountController.dispose();
    loanAppliedAmountPreviousLoanController.dispose();
    tenureAppliedMonthsController.dispose();
    tenureAppliedMonthsPreviousLoanController.dispose();
    roiProposedController.dispose();
    roiProposedControllerPreviousLoan.dispose();
    endUseWorkingCapitalController.dispose();
    endUseWorkingCapitalPreviousController.dispose();
    facilityAppliedController.dispose();
    facilityAppliedPreviousLoanController.dispose();
    proposedLoanRepaymentFrequency.dispose();
    proposedLoanRepaymentFrequencyPreviousLoan.dispose();
    proposedLoanAffordableEMIController.dispose();
    proposedLoanAffordableEMIControllerPreviousLoan.dispose();
    loanEligibilityCashFlowController.dispose();
    approvedLoanAmountController.dispose();
    approvedLoanAmountControllerPreviousLoan.dispose();

    nameOfSupplierController.dispose();
    supplierMobileNumberController.dispose();
    supplierLocationController.dispose();
    numberOfSupplyingYearsController.dispose();
    typeOfProductController.dispose();
    averageMonthlySupplyAmountController.dispose();
    nameOfBuyerController.dispose();
    buyerMobileNumberController.dispose();
    buyerLocationController.dispose();
    numberOfPurchasingYearsController.dispose();
    purchaseFrequencyController.dispose();
    averageMonthlyPurchaseAmountController.dispose();
    nameOfPersonController.dispose();
    referenceMobileNumberController.dispose();
    referenceLocationController.dispose();
    relationWithCustomerController.dispose();
    numberOfKnowingCustomerController.dispose();
    levelOfInteractionWithCustomerController.dispose();
    feedbackWithCustomerController.dispose();








    // Sales Cash Book
    //last month
    salesMemolastMonthFifth.dispose();
    salesMemolastMonthTenth.dispose();
    salesMemolastMonthFifteen.dispose();
    salesMemolastMonthTwenty.dispose();
    salesMemolastMonthTwentyFive.dispose();
    salesMemolastMonthThirty.dispose();

    salesMemotwoMonthBackFifth.dispose();
    salesMemotwoMonthBackTenth.dispose();
    salesMemotwoMonthBackFifteen.dispose();
    salesMemotwoMonthBackTwenty.dispose();
    salesMemotwoMonthBackTwentyFive.dispose();
    salesMemotwoMonthBackThirty.dispose();

    salesMemothreeMonthBackFifth.dispose();
    salesMemothreeMonthBackTenth.dispose();
    salesMemothreeMonthBackFifteen.dispose();
    salesMemothreeMonthBackTwenty.dispose();
    salesMemothreeMonthBackTwentyFive.dispose();
    salesMemothreeMonthBackThirty.dispose();

    // Purchase cash Book

    purchaselastMonthFifth.dispose();
    purchaselastMonthFifteen.dispose();
    purchaselastMonthTwentyFive.dispose();

    purchasetwoMonthBackFifth.dispose();
    purchasetwoMonthBackFifteen.dispose();
    purchasetwoMonthBackTwentyFive.dispose();

    purchasethreeMonthBackFifth.dispose();
    purchasethreeMonthBackFifteen.dispose();
    purchasethreeMonthBackTwentyFive.dispose();

    // Bank Balance

    banklastMonthFifth.dispose();
    banklastMonthFifteen.dispose();
    banklastMonthTwentyFive.dispose();

    banktwoMonthBackFifth.dispose();
    banktwoMonthBackFifteen.dispose();
    banktwoMonthBackTwentyFive.dispose();

    bankthreeMonthBackFifth.dispose();
    bankthreeMonthBackFifteen.dispose();
    bankthreeMonthBackTwentyFive.dispose();

    bankfourMonthFifth.dispose();
    bankfourMonthFifteen.dispose();
    bankfourMonthTwentyFive.dispose();

    bankfiveMonthBackFifth.dispose();
    bankfiveMonthBackFifteen.dispose();
    bankfiveMonthBackTwentyFive.dispose();

    banksixMonthBackFifth.dispose();
    banksixMonthBackFifteen.dispose();
    banksixMonthBackTwentyFive.dispose();

    // Sales

    salesClosedInWeek.dispose();
    salesNoOfDaysWorkingInMonth.dispose();

    salesDaily.dispose();
    salesWeekly.dispose();
    salesMonthly.dispose();
    salesMonthlyPrevious.dispose();

    salesLowMonthCount.dispose();
    salesLowAmount.dispose();
    salesHighMonthCount.dispose();
    salesHighAmount.dispose();
    salesNormalMonthCount.dispose();
    salesNormalAmount.dispose();

    salesDebtors.dispose();
    salesDebtorsPreviousLoan.dispose();
    salesGrowthPostFunding.dispose();
    // Purchase
    purchaseDaily.dispose();
    purchaseWeekly.dispose();
    purchaseMonthly.dispose();
    purchaseCreditors;
    purchaseMonthlyPreviousLoan.dispose();
    purchaseCreditorsPreviousLoan.dispose();
    // Stock
    stockFinishedGood.dispose();
    stockFinishedGoodPreviousLoan.dispose();
    stockRawMaterial.dispose();
    stockRawMaterialPreviousLoan.dispose();

    // OtherIncomeMonthly

    agricultureIncome.dispose();
    rentalIncome.dispose();
    familyMemberSalaryIncome.dispose();
    alliedAgriIncome.dispose();
    otherIncome.dispose();
    agricultureIncomePreviousLoan.dispose();
    rentalIncomePreviousLoan.dispose();
    familyMemberSalaryIncomePreviousLoan.dispose();
    alliedAgriIncomePreviousLoan.dispose();
    otherIncomPreviousLoan.dispose();
    // Business expense Monthly
    businessFactoryRent.dispose();
    businessElectricity.dispose();
    businessStaffSalary.dispose();
    businessMobileInternet.dispose();
    businessTransportCost.dispose();
    businessGasNWater.dispose();
    businessRepairNMaintenance.dispose();
    businessDieselForGenerator.dispose();
    businessMarketing.dispose();
    businessLabourExpense.dispose();
    businessBillNSecurity.dispose();
    businessTax.dispose();
    businessEntertainment.dispose();
    businessOtherBusinessExpense.dispose();

    businessFactoryRentPreviousLoan.dispose();
    businessElectricityPreviousLoan.dispose();
    businessStaffSalaryPreviousLoan.dispose();
    businessMobileInternetPreviousLoan.dispose();
    businessTransportCostPreviousLoan.dispose();
    businessGasNWaterPreviousLoan.dispose();
    businessRepairNMaintenancePreviousLoan.dispose();
    businessDieselForGeneratorPreviousLoan.dispose();
    businessMarketingPreviousLoan.dispose();
    businessLabourExpensePreviousLoan.dispose();
    businessBillNSecurityPreviousLoan.dispose();
    businessTaxPreviousLoan.dispose();
    businessEntertainmentPreviousLoan.dispose();
    businessOtherBusinessExpensePreviousLoan.dispose();

    // Personal expense Monthly
    personalExpenseHouseRent.dispose();
    personalExpenseFood.dispose();
    personalExpenseCloth.dispose();
    personalExpenseEducation.dispose();
    personalExpenseElectricity.dispose();
    personalExpenseTransport.dispose();
    personalExpenseMobileInternet.dispose();
    personalExpenseMedical.dispose();
    personalExpenseEntertainment.dispose();
    personalExpenseRepairNMaintenance.dispose();
    personalExpenseMaid.dispose();
    personalExpenseHouseTax.dispose();
    personalExpenseOtherExpense.dispose();

    personalExpenseHouseRentPrevious.dispose();
    personalExpenseFoodPrevious.dispose();
    personalExpenseClothPrevious.dispose();
    personalExpenseEducationPrevious.dispose();
    personalExpenseElectricityPrevious.dispose();
    personalExpenseTransportPrevious.dispose();
    personalExpenseMobileInternetPrevious.dispose();
    personalExpenseMedicalPrevious.dispose();
    personalExpenseEntertainmentPrevious.dispose();
    personalExpenseRepairNMaintenancePrevious.dispose();
    personalExpenseMaidPrevious.dispose();
    personalExpenseHouseTaxPrevious.dispose();
    personalExpenseOtherExpensePrevious.dispose();

    // Regular Investment

    investmentLifeInsurance.dispose();
    investmentGeneralInsurance.dispose();
    investmentDPS.dispose();
    investmentGrossMargin.dispose();
    investmentMonthlyCashInhand.dispose();
    investmentLifeInsurancePreviousLoan.dispose();
    investmentGeneralInsurancePreviousLoan.dispose();
    investmentDPSPreviousLoan.dispose();
    investmentGrossMarginPreviousLoan.dispose();
    investmentMonthlyCashInhandPreviousLoan.dispose();

    promoter.dispose();
    businessActivity.dispose();
    marketNDemand.dispose();
    recommendation.dispose();

    // Existing Loan

    existLoanNameOfInstitute.dispose();
    existLoanAmount.dispose();
    existLoanEmi.dispose();
    existLoanOutstanding.dispose();
    existLoanTenor.dispose();
    existLoanpaidTenor.dispose();
    existLoanBalanceTenor.dispose();
    existLoanloanToBeClosed.dispose();
    existLoanobligate.dispose();
    existLoanpreviousObligate.dispose();
    // Manufacturing Option One
    manufacturingTypeOfProduct.dispose();
    manufacturingNumberOfUnits.dispose();
    manufacturingAverageSalePrize.dispose();
    manufacturingProductionCost.dispose();
    // Manufacturing Option Two
    materialCost.dispose();
    otherCashCost.dispose();
    averageSaleVolume.dispose();
    debtBurdenManufacturing.dispose();
    debtBurdenPreviousLoan.dispose();

    tabController.dispose();

    //customerDetailsCubit.close();

    super.dispose();
  }

  void setCustomerInformation(int customerID) {
    if (tabController.index < titles.length - 1) {
      if (tabController.index == 0) {
        Customer customer = Customer();
        customer.customerId = customerID;
        customer.memberId = memberCodeController.text;
        customer.customerName = customerNameController.text;
        customer.customerStatus = customerStatusSelectedValueID;
        customer.previousLoanCustomerStatus =
            customerStatusPreviousSelectedValueID;
        customer.customerStatusPreviousLoan =
            customerStatusPreviousSelectedValueID;
        customer.gender = genderSelectedValueID;
        customer.dateOfBirth = dateOfBirthController.text;
        customer.maritalStatus = maritalStatusSelectedID;
        customer.qualification = qualificationSelectedID;
        customer.housePincode = housePinCodeController.text;
        customer.familyMembersCount = int.parse(
            noOfFamilyMemberController.text.isNotEmpty
                ? noOfFamilyMemberController.text
                : '0');
        customer.earningMembersCount = int.parse(
            noOfEarningMemberController.text.isNotEmpty
                ? noOfEarningMemberController.text
                : '0');
        customer.residenceOwnership = SelectedResidenceOwnerID;
        customer.residenceStayVintage = int.parse(
            residenceStayVintageController.text.isNotEmpty
                ? residenceStayVintageController.text
                : '0');
        customer.vintageWithBuroMonths = int.parse(
            vintageWithBuroController.text.isNotEmpty
                ? vintageWithBuroController.text
                : '0');
        customer.currentSavingsAmount = double.parse(
            currentSavingsAmountController.text.isNotEmpty
                ? currentSavingsAmountController.text
                : '0');
        customer.currentSavingsAmountPrevious = double.parse(
            currentSavingsAmountPreviousLoanController.text.isNotEmpty
                ? currentSavingsAmountPreviousLoanController.text
                : '0');
        customer.peakSavingsAmountLast12Months = double.parse(
            peakSavingAmountController.text.isNotEmpty
                ? peakSavingAmountController.text
                : '0');
        customer.existingLoanAmount = double.parse(
            exitingLoanAmountController.text.isNotEmpty
                ? exitingLoanAmountController.text
                : '0');
        customer.repaymentBehavior = SelectedRepaymentBehaviorID;
        customer.repaymentBehaviorPrevious =
            SelectedRepaymentBehaviorPreviousID;
        customer.peakDPDLast12Months = double.parse(
            exitingPeakDPDLast12MonthController.text.isNotEmpty
                ? exitingPeakDPDLast12MonthController.text
                : '0');
        customer.previousLoanPeakDPD = double.parse(
            exitingPeakDPDLast12MonthPreviousLoanController.text.isNotEmpty
                ? exitingPeakDPDLast12MonthPreviousLoanController.text
                : '0');
        customer.previousLoanSavingAmount = double.parse(
            currentSavingsAmountPreviousLoanController.text.isNotEmpty
                ? currentSavingsAmountPreviousLoanController.text
                : '0');

        repository.setCustomerDetails(customer).then((value) => {
              if (value.success == true)
                {
                  CommonMethods.showMessage(
                      context, 'Submitted', ColorResources.APP_THEME_COLOR),
                  Navigator.pop(context),
                  tabController.animateTo(tabController.index + 1),
                  setDebtBurden(customerID, isNewCustomer ? 50 : 40,
                      isNewCustomer ? 40 : 50)
                }
              else
                {
                  Navigator.pop(context),
                  CommonMethods.showMessage(
                      context, 'Not Submitted', ColorResources.REJECT_COLOR)
                }
            });
      } // Customer Details

      if (tabController.index == 1) {
        EnterpriseDetails enterprise = EnterpriseDetails();
        //customer.customerid = customerNameController.text;
        enterprise.enterprisename = enterpriseName.text;
        enterprise.customerid = customerID;
        enterprise.enterprisename = enterpriseName.text;
        enterprise.constitutionofenterprise = SelectedValueConstitutionID;
        enterprise.workplacepincode = workplacePinCode.text;
        enterprise.businesssegment = SelectedValueSegmentID;
        enterprise.businesssubsegment = businessSubSegment.text;
        enterprise.currenttradelicenseavailable = SelectedValueTradeLicensesID;
        enterprise.tinavailable = SelectedValueAvailableTinID;
        enterprise.workplaceownership = SelectedValueOwnerShipID;
        enterprise.workplacevintage = int.parse(
            workPlaceVintage.text.isNotEmpty ? workPlaceVintage.text : '0');
        enterprise.grossmargin = int.parse(grossMarginBusiness.text.isNotEmpty
            ? grossMarginBusiness.text
            : '0');
        enterprise.numberofpaidregularemployees = int.parse(
            numberPaidRegularEmployee.text.isNotEmpty
                ? numberPaidRegularEmployee.text
                : '0');
        /*enterprise.previousloangrossmargin = int.parse(
            grossMarginBusinessPrevious.text.isNotEmpty
                ? grossMarginBusinessPrevious.text
                : '0');*/
        enterprise.previousloannoofemployees = int.parse(
            numberPaidRegularEmployeePrevious.text.isNotEmpty
                ? numberPaidRegularEmployeePrevious.text
                : '0');

        repository.setEnterpriseDetails(enterprise).then((value) => {
              if (value.success == true)
                {
                  CommonMethods.showMessage(
                      context, 'Submitted', ColorResources.APP_THEME_COLOR),
                  Navigator.pop(context),
                  tabController.animateTo(tabController.index + 1),
                }
              else
                {
                  Navigator.pop(context),
                  CommonMethods.showMessage(
                      context, 'Not Submitted', ColorResources.REJECT_COLOR)
                }
            });
      } // Enterprise Details

      if (tabController.index == 2) {
        ProposedLoanDetails loanDetails = ProposedLoanDetails();

        loanDetails.customerId = customerID;
        loanDetails.loanAppliedAmount = double.parse(
            loanAppliedAmountController.text.isNotEmpty
                ? loanAppliedAmountController.text
                : '0');
        loanDetails.tenureAppliedMonths = double.parse(
            tenureAppliedMonthsController.text.isNotEmpty
                ? tenureAppliedMonthsController.text
                : '0');
        loanDetails.roiProposedPercentage = double.parse(
            roiProposedController.text.isNotEmpty
                ? roiProposedController.text
                : '0');
        loanDetails.endUse = SelectedWorkingCapitalID;
        loanDetails.facilityApplied = SelectedFacilityAppliedID;
        loanDetails.repaymentFrequency = SelectedRepaymentFrequencyID;
        loanDetails.customerAffordableEMI = double.parse(
            proposedLoanAffordableEMIController.text.isNotEmpty
                ? proposedLoanAffordableEMIController.text
                : '0');
        loanDetails.loanEligibilityPolicy = double.parse(
            loanEligibilityCashFlowController.text.isNotEmpty
                ? loanEligibilityCashFlowController.text
                : '0');
        loanDetails.loanAmountApproved = double.parse(
            approvedLoanAmountController.text.isNotEmpty
                ? approvedLoanAmountController.text
                : '0');
        try {
          loanDetails.previousLoanAmount = double.parse(
                      loanAppliedAmountPreviousLoanController.text.isNotEmpty
                          ? loanAppliedAmountPreviousLoanController.text
                          : '0');
        } catch (e) {
          print(e);
        }
        try {
          loanDetails.previousLoanTenureApplied = double.parse(
                      tenureAppliedMonthsPreviousLoanController.text.isNotEmpty
                          ? tenureAppliedMonthsPreviousLoanController.text
                          : '0');
        } catch (e) {
          print(e);
        }
        try {
          loanDetails.previousLoanROIProposed = double.parse(
                      roiProposedControllerPreviousLoan.text.isNotEmpty
                          ? roiProposedControllerPreviousLoan.text
                          : '0');
        } catch (e) {
          print(e);
        }
        loanDetails.previousLoanCapital = SelectedWorkingCapitalIDPreviousLoan;
        loanDetails.previousLoanFacilityApplied =
            SelectedFacilityAppliedIDPreviousLoan;
        loanDetails.previousLoanRepaymentFrequency =
            SelectedRepaymentFrequencyIDPreviousLoan;
        try {
          loanDetails.previousLoanAffordableEMI = double.parse(
                      proposedLoanAffordableEMIControllerPreviousLoan.text.isNotEmpty
                          ? proposedLoanAffordableEMIControllerPreviousLoan.text
                          : '0');
        } catch (e) {
          print(e);
        }
        try {
          loanDetails.previousLoanEligibility = double.parse(
                      loanEligibilityCashFlowControllerPrevious.text.isNotEmpty
                          ? loanEligibilityCashFlowControllerPrevious.text
                          : '0');
        } catch (e) {
          print(e);
        }
        try {
          loanDetails.previousLoanApprovedAmount = double.parse(
                      approvedLoanAmountControllerPreviousLoan.text.isNotEmpty
                          ? approvedLoanAmountControllerPreviousLoan.text
                          : '0');
        } catch (e) {
          print(e);
        }
        //loanDetails.proposeLoanID=

        repository.setProposedLoanDetails(loanDetails).then((value) => {
              if (value.success == true)
                {
                  CommonMethods.showMessage(
                      context, 'Submitted', ColorResources.APP_THEME_COLOR),
                  Navigator.pop(context),
                  tabController.animateTo(tabController.index + 1),
                }
              else
                {
                  Navigator.pop(context),
                  CommonMethods.showMessage(
                      context, 'Not Submitted', ColorResources.REJECT_COLOR)
                }
            });
      } // Proposed Loan Details

      if (tabController.index == 3) {
        SupplierVerification supplierVerification = SupplierVerification();

        supplierVerification.customerID = customerID;
        supplierVerification.supplierName = nameOfSupplierController.text;
        supplierVerification.mobileNumber = supplierMobileNumberController.text;
        supplierVerification.supplierLocation = supplierLocationController.text;
        try {
          supplierVerification.yearsSupplyingToCustomer = double.parse(
                      numberOfSupplyingYearsController.text.isNotEmpty
                          ? numberOfSupplyingYearsController.text
                          : '0');
        } catch (e) {
          print(e);
        }
        supplierVerification.supplyFrequency = SelectedSupplyFrequencyID;
        supplierVerification.productServicesSupplied =
            typeOfProductController.text;
        try {
          supplierVerification.averageMonthlySupplyAmount = double.parse(
                      averageMonthlySupplyAmountController.text.isNotEmpty
                          ? averageMonthlySupplyAmountController.text
                          : '0');
        } catch (e) {
          print(e);
        }
        supplierVerification.paymentTerms = SelectedPaymentTermsID;
        supplierVerification.paymentTimeliness = SelectedPaymentTimeLineID;
        supplierVerification.supplierFeedback = SelectedSupplierFeedbackID;

        repository
            .setSupplierVerification(supplierVerification)
            .then((value) => {
                  if (value.success == true)
                    {
                      CommonMethods.showMessage(
                          context, 'Submitted', ColorResources.APP_THEME_COLOR),
                      Navigator.pop(context),
                      tabController.animateTo(tabController.index + 1),
                    }
                  else
                    {
                      Navigator.pop(context),
                      CommonMethods.showMessage(
                          context, 'Not Submitted', ColorResources.REJECT_COLOR)
                    }
                });
      } //Supplier Verification

      if (tabController.index == 4) {
        BuyerVerification buyerverification = BuyerVerification();

        buyerverification.customerid = customerID;
        buyerverification.buyername = nameOfBuyerController.text;
        buyerverification.mobilenumber = buyerMobileNumberController.text;
        buyerverification.buyerlocation = buyerLocationController.text;
        try {
          buyerverification.yearspurchasingfromcustomer = int.parse(
                      numberOfPurchasingYearsController.text.isNotEmpty
                          ? numberOfPurchasingYearsController.text
                          : '0');
        } catch (e) {
          print(e);
        }
        buyerverification.purchasefrequency = SelectedPurchaseFrequencyID;
        try {
          buyerverification.averagemonthlypurchaseamount = double.parse(
                      averageMonthlyPurchaseAmountController.text.isNotEmpty
                          ? averageMonthlyPurchaseAmountController.text
                          : '0');
        } catch (e) {
          print(e);
        }
        buyerverification.paymentterms = SelectedPaymentTermsBuyerID;
        buyerverification.productservicequality =
            SelectedProductQualityPurchaseID;
        buyerverification.buyerfeedbackoncustomer = SelectedBuyerFeedbackID;
        repository.setBuyerVerification(buyerverification).then((value) => {
              if (value.success == true)
                {
                  CommonMethods.showMessage(
                      context, 'Submitted', ColorResources.APP_THEME_COLOR),
                  Navigator.pop(context),
                  tabController.animateTo(tabController.index + 1),
                }
              else
                {
                  Navigator.pop(context),
                  CommonMethods.showMessage(
                      context, 'Not Submitted', ColorResources.REJECT_COLOR)
                }
            });
      } // Buyer Verification
    } else {
      if (tabController.index == 5) {
        PersonalReferenceVerification referenceVerification =
            PersonalReferenceVerification();

        referenceVerification.customerID = customerID;
        referenceVerification.personName = nameOfPersonController.text;
        referenceVerification.mobileNumber =
            referenceMobileNumberController.text;
        referenceVerification.referenceLocation =
            referenceLocationController.text;
        referenceVerification.relationWithCustomer =
            SelectedRelationWithCustomerID;
        try {
          referenceVerification.yearsKnowingCustomer = int.parse(
                      numberOfKnowingCustomerController.text.isNotEmpty
                          ? numberOfKnowingCustomerController.text
                          : '0');
        } catch (e) {
          print(e);
        }
        referenceVerification.levelOfInteraction =
            SelectedInteractionWithCustomerID;
        referenceVerification.feedbackOnCustomer = SelectedFeedbackOnCustomerID;
        repository
            .setPersonalReferenceVerification(referenceVerification)
            .then((value) => {
                  if (value.success == true)
                    {
                      CommonMethods.showMessage(
                          context, 'Submitted', ColorResources.APP_THEME_COLOR),
                      Navigator.pop(context),
                      Navigator.pushNamed(context, InputSheet.routeName,
                          arguments: CustomerDetailsArguments(
                            widget.arguments.isEditable
                                ? widget.arguments.memberID
                                : memberCodeController.text,
                            customerID,
                            true,
                            customerNameController.text,
                          )),
                    }
                  else
                    {
                      Navigator.pop(context),
                      CommonMethods.showMessage(
                          context, 'Not Submitted', ColorResources.REJECT_COLOR)
                    }
                });
      }
    }
  }

  void setDebtBurden(customerID, debtBurden, debtBurdenPrevious) {
    var debtBurdenList = [];
    var jsonMap = {
      "id": 0,
      "customerId": customerID,
      "debtBurden": debtBurden,
      "debtBurdenPreviousLoan": debtBurdenPrevious
    };

    debtBurdenList.add(jsonMap);

    repository.setDebtBurden(debtBurdenList).then((value) => {});
  }
}

class NameIDModel {
  late String name;
  late int id;

  NameIDModel({required String name, required int id}) {
    this.name = name;
    this.id = id;
  }
}
