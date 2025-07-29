class Customer {
   int _customerId = 0;
   String _customerName = '';
   String _dateOfBirth = '';
   String _housePincode = '';
   int _familyMembersCount = 0;
   int _earningMembersCount = 0;
   int _residenceStayVintage = 0;
   int _vintageWithBuroMonths = 0;
   double _currentSavingsAmount = 0;
   double _currentSavingsAmountPrevious=0;
   double _peakSavingsAmountLast12Months=0;
   double _existingLoanAmount=0;
   double _existingLoanAmountPrevious=0;
   double _peakDPDLast12Months=0;
   int _previousLoanCustomerStatus=0;
   double _previousLoanSavingAmount=0;
   double _previousLoanAmount=0;
   int _previousLoanRepaymentBehaviour=0;
   double _previousLoanPeakDPD=0;
   String _memberId= '';
   int _customerStatus=0;
   int _customerStatusPreviousLoan=0;
   int _gender=0;
   int _maritalStatus=0;
   int _qualification=0;
   int _residenceOwnership=0;
   int _repaymentBehavior=0;
   int _repaymentBehaviorPrevious=0;

  double get currentSavingsAmountPrevious => _currentSavingsAmountPrevious;

  set currentSavingsAmountPrevious(double value) {
    _currentSavingsAmountPrevious = value;
  }

  double get existingLoanAmountPrevious => _existingLoanAmountPrevious;

  set existingLoanAmountPrevious(double value) {
    _existingLoanAmountPrevious = value;
  }

  int get customerStatusPreviousLoan => _customerStatusPreviousLoan;

  set customerStatusPreviousLoan(int value) {
    _customerStatusPreviousLoan = value;
  }



  int get customerId => _customerId;

  set customerId(int value) {
    _customerId = value;
  }



  int get repaymentBehaviorPrevious => _repaymentBehaviorPrevious;

  set repaymentBehaviorPrevious(int value) {
    _repaymentBehaviorPrevious = value;
  } //Customer();



  String get customerName => _customerName;

  set customerName(String value) {
    _customerName = value;
  }

   String get dateOfBirth => _dateOfBirth;

  set dateOfBirth(String value) {
    _dateOfBirth = value;
  }

  String get housePincode => _housePincode;

  set housePincode(String value) {
    _housePincode = value;
  }

  int get familyMembersCount => _familyMembersCount;

  set familyMembersCount(int value) {
    _familyMembersCount = value;
  }

  int get earningMembersCount => _earningMembersCount;

  set earningMembersCount(int value) {
    _earningMembersCount = value;
  }

  int get residenceStayVintage => _residenceStayVintage;

  set residenceStayVintage(int value) {
    _residenceStayVintage = value;
  }

  int get vintageWithBuroMonths => _vintageWithBuroMonths;

  set vintageWithBuroMonths(int value) {
    _vintageWithBuroMonths = value;
  }

  double get currentSavingsAmount => _currentSavingsAmount;

  set currentSavingsAmount(double value) {
    _currentSavingsAmount = value;
  }

  double get peakSavingsAmountLast12Months => _peakSavingsAmountLast12Months;

  set peakSavingsAmountLast12Months(double value) {
    _peakSavingsAmountLast12Months = value;
  }

  double get existingLoanAmount => _existingLoanAmount;

  set existingLoanAmount(double value) {
    _existingLoanAmount = value;
  }

  double get peakDPDLast12Months => _peakDPDLast12Months;

  set peakDPDLast12Months(double value) {
    _peakDPDLast12Months = value;
  }

  int get previousLoanCustomerStatus => _previousLoanCustomerStatus;

  set previousLoanCustomerStatus(int value) {
    _previousLoanCustomerStatus = value;
  }

  double get previousLoanSavingAmount => _previousLoanSavingAmount;

  set previousLoanSavingAmount(double value) {
    _previousLoanSavingAmount = value;
  }

  double get previousLoanAmount => _previousLoanAmount;

  set previousLoanAmount(double value) {
    _previousLoanAmount = value;
  }

  int get previousLoanRepaymentBehaviour => _previousLoanRepaymentBehaviour;

  set previousLoanRepaymentBehaviour(int value) {
    _previousLoanRepaymentBehaviour = value;
  }

   double get previousLoanPeakDPD => _previousLoanPeakDPD;

  set previousLoanPeakDPD(double value) {
    _previousLoanPeakDPD = value;
  }

  String get memberId => _memberId;

  set memberId(String value) {
    _memberId = value;
  }

  int get customerStatus => _customerStatus;

  set customerStatus(int value) {
    _customerStatus = value;
  }

  int get gender => _gender;

  set gender(int value) {
    _gender = value;
  }

  int get maritalStatus => _maritalStatus;

  set maritalStatus(int value) {
    _maritalStatus = value;
  }

  int get qualification => _qualification;

  set qualification(int value) {
    _qualification = value;
  }

  int get residenceOwnership => _residenceOwnership;

  set residenceOwnership(int value) {
    _residenceOwnership = value;
  }

  int get repaymentBehavior => _repaymentBehavior;

  set repaymentBehavior(int value) {
    _repaymentBehavior = value;
  }


}


class EnterpriseDetails {
  int _customerId = 0;
  String _enterpriseName = '';
  int _constitutionOfEnterprise=0;
  String _workPlacePinCode='';
  int _businessSegment=0;
  String _businessSubSegment='';
  int _currentTradeLicenseAvailable=0;
  int _tinAvailable=0;
  int _workPlaceOwnership=0;
  int _workPlaceVintage=0;
  int _grossMargin=0;
  int _numberOfPaidRegularEmployees=0;
  int _previousLoanGrossMargin=0;
  int _previousLoanNoOfEmployees=0;
  int _enterpriseId=0;

  int get customerid => _customerId;

  set customerid(int value) {
    _customerId = value;
  }



  String get enterprisename => _enterpriseName;

  set enterprisename(String value) {
    _enterpriseName = value;
  }

  int get constitutionofenterprise => _constitutionOfEnterprise;

  set constitutionofenterprise(int value) {
    _constitutionOfEnterprise = value;
  }

  String get workplacepincode => _workPlacePinCode;

  set workplacepincode(String value) {
    _workPlacePinCode = value;
  }

  int get businesssegment => _businessSegment;

  set businesssegment(int value) {
    _businessSegment = value;
  }

  String get businesssubsegment => _businessSubSegment;

  set businesssubsegment(String value) {
    _businessSubSegment = value;
  }

  int get currenttradelicenseavailable => _currentTradeLicenseAvailable;

  set currenttradelicenseavailable(int value) {
    _currentTradeLicenseAvailable = value;
  }

  int get tinavailable => _tinAvailable;

  set tinavailable(int value) {
    _tinAvailable = value;
  }

  int get workplaceownership => _workPlaceOwnership;

  set workplaceownership(int value) {
    _workPlaceOwnership = value;
  }

  int get workplacevintage => _workPlaceVintage;

  set workplacevintage(int value) {
    _workPlaceVintage = value;
  }

  int get grossmargin => _grossMargin;

  set grossmargin(int value) {
    _grossMargin = value;
  }

  int get numberofpaidregularemployees => _numberOfPaidRegularEmployees;

  set numberofpaidregularemployees(int value) {
    _numberOfPaidRegularEmployees = value;
  }

  int get previousloangrossmargin => _previousLoanGrossMargin;

  set previousloangrossmargin(int value) {
    _previousLoanGrossMargin = value;
  }

  int get previousloannoofemployees => _previousLoanNoOfEmployees;

  set previousloannoofemployees(int value) {
    _previousLoanNoOfEmployees = value;
  }

  int get enterpriseid => _enterpriseId;

  set enterpriseid(int value) {
    _enterpriseId = value;
  }
}

class ProposedLoanDetails {
  int _customerId = 0;
  double _loanAppliedAmount= 0;
  double _tenureAppliedMonths= 0;

  int get customerId => _customerId;

  set customerId(int value) {
    _customerId = value;
  }

  double _roiProposedPercentage= 0;
  int _endUse= 0;
  int _facilityApplied= 0;
  int _repaymentFrequency= 0;

  int get endUse => _endUse;

  set endUse(int value) {
    _endUse = value;
  }

  double _customerAffordableEMI= 0;
  double _loanEligibilityPolicy= 0;
  double _loanAmountApproved= 0;
  double _previousLoanAmount= 0;
  double _previousLoanTenureApplied= 0;
  double _previousLoanROIProposed= 0;
  int _previousLoanCapital= 0;
  int _previousLoanFacilityApplied= 0;
  int _previousLoanRepaymentFrequency= 0;
  double _previousLoanAffordableEMI= 0;
  double _previousLoanEligibility= 0;
  double _previousLoanApprovedAmount= 0;
  double _proposeLoanID= 0;

  double get loanAppliedAmount => _loanAppliedAmount;

  set loanAppliedAmount(double value) {
    _loanAppliedAmount = value;
  }

  double get tenureAppliedMonths => _tenureAppliedMonths;

  set tenureAppliedMonths(double value) {
    _tenureAppliedMonths = value;
  }

  double get roiProposedPercentage => _roiProposedPercentage;

  set roiProposedPercentage(double value) {
    _roiProposedPercentage = value;
  }



  double get customerAffordableEMI => _customerAffordableEMI;

  set customerAffordableEMI(double value) {
    _customerAffordableEMI = value;
  }

  double get loanEligibilityPolicy => _loanEligibilityPolicy;

  set loanEligibilityPolicy(double value) {
    _loanEligibilityPolicy = value;
  }

  double get loanAmountApproved => _loanAmountApproved;

  set loanAmountApproved(double value) {
    _loanAmountApproved = value;
  }

  double get previousLoanAmount => _previousLoanAmount;

  set previousLoanAmount(double value) {
    _previousLoanAmount = value;
  }

  double get previousLoanTenureApplied => _previousLoanTenureApplied;

  set previousLoanTenureApplied(double value) {
    _previousLoanTenureApplied = value;
  }

  double get previousLoanROIProposed => _previousLoanROIProposed;

  set previousLoanROIProposed(double value) {
    _previousLoanROIProposed = value;
  }



  double get previousLoanAffordableEMI => _previousLoanAffordableEMI;

  set previousLoanAffordableEMI(double value) {
    _previousLoanAffordableEMI = value;
  }

  double get previousLoanEligibility => _previousLoanEligibility;

  set previousLoanEligibility(double value) {
    _previousLoanEligibility = value;
  }

  double get previousLoanApprovedAmount => _previousLoanApprovedAmount;

  set previousLoanApprovedAmount(double value) {
    _previousLoanApprovedAmount = value;
  }

  double get proposeLoanID => _proposeLoanID;

  set proposeLoanID(double value) {
    _proposeLoanID = value;
  }

  int get facilityApplied => _facilityApplied;

  set facilityApplied(int value) {
    _facilityApplied = value;
  }

  int get repaymentFrequency => _repaymentFrequency;

  set repaymentFrequency(int value) {
    _repaymentFrequency = value;
  }

  int get previousLoanCapital => _previousLoanCapital;

  set previousLoanCapital(int value) {
    _previousLoanCapital = value;
  }

  int get previousLoanFacilityApplied => _previousLoanFacilityApplied;

  set previousLoanFacilityApplied(int value) {
    _previousLoanFacilityApplied = value;
  }

  int get previousLoanRepaymentFrequency => _previousLoanRepaymentFrequency;

  set previousLoanRepaymentFrequency(int value) {
    _previousLoanRepaymentFrequency = value;
  }

// Constructor
/*  ProposedLoanDetails({
    required this._customerId,
    required this._loanAppliedAmount,
    required this._tenureAppliedMonths,
    required this._roiProposedPercentage,
    required this._endUse,
    required this._facilityApplied,
    required this._repaymentFrequency,
    required this._customerAffordableEMI,
    required this._loanEligibilityPolicy,
    required this._loanAmountApproved,
    required this._previousLoanAmount,
    required this._previousLoanTenureApplied,
    required this._previousLoanROIProposed,
    required this._previousLoanCapital,
    required this._previousLoanFacilityApplied,
    required this._previousLoanRepaymentFrequency,
    required this._previousLoanAffordableEMI,
    required this._previousLoanEligibility,
    required this._previousLoanApprovedAmount,
    required this._proposeLoanID,
  });*/
}

class SupplierVerification {
  int _customerID = 0;
  String _supplierName ='';
  String _mobileNumber ='';
  String _supplierLocation = '';
  double _yearsSupplyingToCustomer = 0;
  int _supplyFrequency  = 0;
  String _productServicesSupplied = '';
  double _averageMonthlySupplyAmount = 0;
  int _paymentTerms = 0;
  int _paymentTimeliness = 0;
  int _supplierFeedback = 0;

  int get customerID => _customerID;

  set customerID(int value) {
    _customerID = value;
  }

  String get supplierName => _supplierName;

  set supplierName(String value) {
    _supplierName = value;
  }

  String get mobileNumber => _mobileNumber;

  set mobileNumber(String value) {
    _mobileNumber = value;
  }

  String get supplierLocation => _supplierLocation;

  set supplierLocation(String value) {
    _supplierLocation = value;
  }

  double get yearsSupplyingToCustomer => _yearsSupplyingToCustomer;

  set yearsSupplyingToCustomer(double value) {
    _yearsSupplyingToCustomer = value;
  }

  int get supplyFrequency => _supplyFrequency;

  set supplyFrequency(int value) {
    _supplyFrequency = value;
  }

  String get productServicesSupplied => _productServicesSupplied;

  set productServicesSupplied(String value) {
    _productServicesSupplied = value;
  }

  double get averageMonthlySupplyAmount => _averageMonthlySupplyAmount;

  set averageMonthlySupplyAmount(double value) {
    _averageMonthlySupplyAmount = value;
  }

  int get paymentTerms => _paymentTerms;

  set paymentTerms(int value) {
    _paymentTerms = value;
  }

  int get paymentTimeliness => _paymentTimeliness;

  set paymentTimeliness(int value) {
    _paymentTimeliness = value;
  }

  int get supplierFeedback => _supplierFeedback;

  set supplierFeedback(int value) {
    _supplierFeedback = value;
  }

// Constructor
 /* SupplierVerification({
    required this.customerID,
    required this.supplierName,
    required this.mobileNumber,
    required this.supplierLocation,
    required this.yearsSupplyingToCustomer,
    required this.supplyFrequency,
    required this.productServicesSupplied,
    required this.averageMonthlySupplyAmount,
    required this.paymentTerms,
    required this.paymentTimeliness,
    required this.supplierFeedback,
    required this.supplyVerificationID,
  });*/
}

class BuyerVerification {
  int _customerid = 0 ;
  String _buyername = '';
  String _mobilenumber = '';
  String _buyerlocation = '';
  int _yearspurchasingfromcustomer = 0;
  int _purchasefrequency = 0;
  double _averagemonthlypurchaseamount = 0;
  int _paymentterms = 0;
  int _productservicequality = 0;
  int _buyerfeedbackoncustomer = 0;
  int _buyerverifyid = 0;

  int get customerid => _customerid;

  set customerid(int value) {
    _customerid = value;
  }

  String get buyername => _buyername;

  set buyername(String value) {
    _buyername = value;
  }

  String get mobilenumber => _mobilenumber;

  set mobilenumber(String value) {
    _mobilenumber = value;
  }

  String get buyerlocation => _buyerlocation;

  set buyerlocation(String value) {
    _buyerlocation = value;
  }

  int get yearspurchasingfromcustomer => _yearspurchasingfromcustomer;

  set yearspurchasingfromcustomer(int value) {
    _yearspurchasingfromcustomer = value;
  }

  int get purchasefrequency => _purchasefrequency;

  set purchasefrequency(int value) {
    _purchasefrequency = value;
  }

  double get averagemonthlypurchaseamount => _averagemonthlypurchaseamount;

  set averagemonthlypurchaseamount(double value) {
    _averagemonthlypurchaseamount = value;
  }

  int get paymentterms => _paymentterms;

  set paymentterms(int value) {
    _paymentterms = value;
  }

  int get productservicequality => _productservicequality;

  set productservicequality(int value) {
    _productservicequality = value;
  }

  int get buyerfeedbackoncustomer => _buyerfeedbackoncustomer;

  set buyerfeedbackoncustomer(int value) {
    _buyerfeedbackoncustomer = value;
  }

  int get buyerverifyid => _buyerverifyid;

  set buyerverifyid(int value) {
    _buyerverifyid = value;
  }

// Constructor

}


class PersonalReferenceVerification {
  int _customerID = 0;
  String _personName = " ";
  String _mobileNumber = " ";
  String _referenceLocation = " ";
  int _relationWithCustomer = 0;
  int _yearsKnowingCustomer = 0;
  int _levelOfInteraction = 0;
  int _feedbackOnCustomer = 0;
  int _personalReferenceID = 0;

  int get customerID => _customerID;

  set customerID(int value) {
    _customerID = value;
  }

  String get personName => _personName;

  set personName(String value) {
    _personName = value;
  }

  String get mobileNumber => _mobileNumber;

  set mobileNumber(String value) {
    _mobileNumber = value;
  }

  String get referenceLocation => _referenceLocation;

  set referenceLocation(String value) {
    _referenceLocation = value;
  }

  int get relationWithCustomer => _relationWithCustomer;

  set relationWithCustomer(int value) {
    _relationWithCustomer = value;
  }

  int get yearsKnowingCustomer => _yearsKnowingCustomer;

  set yearsKnowingCustomer(int value) {
    _yearsKnowingCustomer = value;
  }

  int get levelOfInteraction => _levelOfInteraction;

  set levelOfInteraction(int value) {
    _levelOfInteraction = value;
  }

  int get feedbackOnCustomer => _feedbackOnCustomer;

  set feedbackOnCustomer(int value) {
    _feedbackOnCustomer = value;
  }

  int get personalReferenceID => _personalReferenceID;

  set personalReferenceID(int value) {
    _personalReferenceID = value;
  }

// You can also add setter methods if needed.


}



class SalesCashbook {
  double _saleId = 0.0;
  int _customerId = 0;
  double _firstMonth5th = 0.0;
  double _firstMonth10th = 0.0;
  double _firstMonth15th = 0.0;
  double _firstMonth20th = 0.0;
  double _firstMonth25th = 0.0;
  double _firstMonth30th = 0.0;
  double _firstMonthPreviousLoan = 0.0;
  double _twoMonth5th = 0.0;
  double _twoMonth10th = 0.0;
  double _twoMonth15th = 0.0;
  double _twoMonth20th = 0.0;
  double _twoMonth25th = 0.0;
  double _twoMonthPreviousLoan = 0.0;
  double _twoMonth30th = 0.0;
  double _threeMonth5th = 0.0;


  double _threeMonth10th = 0.0;
  double _threeMonth15th = 0.0;
  double _threeMonth20th = 0.0;
  double _threeMonth25th = 0.0;
  double _threeMonth30th = 0.0;
  double _threeMonthPreviousLoan = 0.0;

  SalesCashbook();

  double get saleId => _saleId;
  int get customerId => _customerId;
  double get firstMonth5th => _firstMonth5th;
  double get firstMonth10th => _firstMonth10th;
  double get firstMonth15th => _firstMonth15th;
  double get firstMonth20th => _firstMonth20th;
  double get firstMonth25th => _firstMonth25th;
  double get firstMonth30th => _firstMonth30th;
  double get firstMonthPreviousLoan => _firstMonthPreviousLoan;
  double get twoMonth5th => _twoMonth5th;
  double get twoMonth10th => _twoMonth10th;
  double get twoMonth15th => _twoMonth15th;
  double get twoMonth20th => _twoMonth20th;
  double get twoMonth25th => _twoMonth25th;
  double get twoMonthPreviousLoan => _twoMonthPreviousLoan;
  double get twoMonth30th => _twoMonth30th;
  double get threeMonth5th => _threeMonth5th;
  double get threeMonth10th => _threeMonth10th;
  double get threeMonth15th => _threeMonth15th;
  double get threeMonth20th => _threeMonth20th;
  double get threeMonth25th => _threeMonth25th;
  double get threeMonth30th => _threeMonth30th;
  double get threeMonthPreviousLoan => _threeMonthPreviousLoan;


  set saleId(double value) {
    _saleId = value;
  }


  set customerId(int value) {
    _customerId = value;
  }

  set firstMonth5th(double value) {
    _firstMonth5th = value;
  }

  set firstMonth10th(double value) {
    _firstMonth10th = value;
  }

  set firstMonth15th(double value) {
    _firstMonth15th = value;
  }

  set firstMonth20th(double value) {
    _firstMonth20th = value;
  }

  set firstMonth25th(double value) {
    _firstMonth25th = value;
  }

  set firstMonth30th(double value) {
    _firstMonth30th = value;
  }

  set firstMonthPreviousLoan(double value) {
    _firstMonthPreviousLoan = value;
  }

  set twoMonth5th(double value) {
    _twoMonth5th = value;
  }

  set twoMonth10th(double value) {
    _twoMonth10th = value;
  }

  set twoMonth15th(double value) {
    _twoMonth15th = value;
  }

  set twoMonth20th(double value) {
    _twoMonth20th = value;
  }

  set twoMonth25th(double value) {
    _twoMonth25th = value;
  }

  set twoMonthPreviousLoan(double value) {
    _twoMonthPreviousLoan = value;
  }

  set twoMonth30th(double value) {
    _twoMonth30th = value;
  }

  set threeMonth5th(double value) {
    _threeMonth5th = value;
  }

  set threeMonth10th(double value) {
    _threeMonth10th = value;
  }

  set threeMonth15th(double value) {
    _threeMonth15th = value;
  }

  set threeMonth20th(double value) {
    _threeMonth20th = value;
  }

  set threeMonth25th(double value) {
    _threeMonth25th = value;
  }

  set threeMonth30th(double value) {
    _threeMonth30th = value;
  }

  set threeMonthPreviousLoan(double value) {
    _threeMonthPreviousLoan = value;
  }
}


class PurchaseCashBook {

  int _customerId = 0;
  double _firstMonth5th = 0.0;
  double _firstMonth15th = 0.0;
  double _firstMonth25th = 0.0;
  double _firstMonthPreviousLoan = 0.0;
  double _twoMonth5th = 0.0;
  double _twoMonth15th = 0.0;
  double _twoMonth25th = 0.0;
  double _twoMonthPreviousLoan = 0.0;
  double _threeMonth5th = 0.0;
  double _threeMonth15th = 0.0;
  double _threeMonth25th = 0.0;

  set customerId(int value) {
    _customerId = value;
  }

  double _threeMonthPreviousLoan = 0.0;

  PurchaseCashBook();

  int get customerId => _customerId;
  double get firstMonth5th => _firstMonth5th;
  double get firstMonth15th => _firstMonth15th;
  double get firstMonth25th => _firstMonth25th;
  double get firstMonthPreviousLoan => _firstMonthPreviousLoan;
  double get twoMonth5th => _twoMonth5th;
  double get twoMonth15th => _twoMonth15th;
  double get twoMonth25th => _twoMonth25th;
  double get twoMonthPreviousLoan => _twoMonthPreviousLoan;
  double get threeMonth5th => _threeMonth5th;
  double get threeMonth15th => _threeMonth15th;
  double get threeMonth25th => _threeMonth25th;
  double get threeMonthPreviousLoan => _threeMonthPreviousLoan;

  set firstMonth5th(double value) {
    _firstMonth5th = value;
  }

  set firstMonth15th(double value) {
    _firstMonth15th = value;
  }

  set firstMonth25th(double value) {
    _firstMonth25th = value;
  }

  set firstMonthPreviousLoan(double value) {
    _firstMonthPreviousLoan = value;
  }

  set twoMonth5th(double value) {
    _twoMonth5th = value;
  }

  set twoMonth15th(double value) {
    _twoMonth15th = value;
  }

  set twoMonth25th(double value) {
    _twoMonth25th = value;
  }

  set twoMonthPreviousLoan(double value) {
    _twoMonthPreviousLoan = value;
  }

  set threeMonth5th(double value) {
    _threeMonth5th = value;
  }

  set threeMonth15th(double value) {
    _threeMonth15th = value;
  }

  set threeMonth25th(double value) {
    _threeMonth25th = value;
  }

  set threeMonthPreviousLoan(double value) {
    _threeMonthPreviousLoan = value;
  }
}


class BankBalance {
  double _balanceId = 0.0;
  int _customerId = 0;
  double _firstMonth5th = 0.0;
  double _firstMonth15th = 0.0;
  double _firstMonth25th = 0.0;
  double _firstMonthPreviousLoan = 0.0;
  double _twoMonth5th = 0.0;
  double _twoMonth15th = 0.0;
  double _twoMonth25th = 0.0;
  double _twoMonthPreviousLoan = 0.0;
  double _threeMonth5th = 0.0;
  double _threeMonth15th = 0.0;
  double _threeMonth25th = 0.0;
  double _threeMonthPreviousLoan = 0.0;
  double _fourthMonth5th = 0.0;
  double _fourthMonth15th = 0.0;
  double _fourthMonth25th = 0.0;
  double _fourthMonthPreviousLoan = 0.0;
  double _fifthMonth5th = 0.0;
  double _fifthMonth15th = 0.0;
  double _averageBankBalancePrevious = 0.0;





  set balanceId(double value) {
    _balanceId = value;
  }

  double _fifthMonth25th = 0.0;
  double _fifthMonthPreviousLoan = 0.0;
  double _sixthMonth5th = 0.0;
  double _sixthMonth15th = 0.0;
  double _sixthMonth25th = 0.0;
  double _sixthMonthPreviousLoan = 0.0;

  BankBalance();

  double get balanceId => _balanceId;
  int get customerId => _customerId;
  double get firstMonth5th => _firstMonth5th;
  double get firstMonth15th => _firstMonth15th;
  double get firstMonth25th => _firstMonth25th;
  double get firstMonthPreviousLoan => _firstMonthPreviousLoan;
  double get twoMonth5th => _twoMonth5th;
  double get twoMonth15th => _twoMonth15th;
  double get twoMonth25th => _twoMonth25th;
  double get twoMonthPreviousLoan => _twoMonthPreviousLoan;
  double get threeMonth5th => _threeMonth5th;
  double get threeMonth15th => _threeMonth15th;
  double get threeMonth25th => _threeMonth25th;
  double get threeMonthPreviousLoan => _threeMonthPreviousLoan;
  double get fourthMonth5th => _fourthMonth5th;
  double get fourthMonth15th => _fourthMonth15th;
  double get fourthMonth25th => _fourthMonth25th;
  double get fourthMonthPreviousLoan => _fourthMonthPreviousLoan;
  double get fifthMonth5th => _fifthMonth5th;
  double get fifthMonth15th => _fifthMonth15th;
  double get fifthMonth25th => _fifthMonth25th;
  double get fifthMonthPreviousLoan => _fifthMonthPreviousLoan;
  double get sixthMonth5th => _sixthMonth5th;
  double get sixthMonth15th => _sixthMonth15th;
  double get sixthMonth25th => _sixthMonth25th;
  double get sixthMonthPreviousLoan => _sixthMonthPreviousLoan;
  double get averageBankBalancePrevious => _averageBankBalancePrevious;

  set customerId(int value) {
    _customerId = value;
  }

  set firstMonth5th(double value) {
    _firstMonth5th = value;
  }

  set firstMonth15th(double value) {
    _firstMonth15th = value;
  }

  set firstMonth25th(double value) {
    _firstMonth25th = value;
  }

  set firstMonthPreviousLoan(double value) {
    _firstMonthPreviousLoan = value;
  }

  set twoMonth5th(double value) {
    _twoMonth5th = value;
  }

  set twoMonth15th(double value) {
    _twoMonth15th = value;
  }

  set twoMonth25th(double value) {
    _twoMonth25th = value;
  }

  set twoMonthPreviousLoan(double value) {
    _twoMonthPreviousLoan = value;
  }

  set threeMonth5th(double value) {
    _threeMonth5th = value;
  }

  set threeMonth15th(double value) {
    _threeMonth15th = value;
  }

  set threeMonth25th(double value) {
    _threeMonth25th = value;
  }

  set threeMonthPreviousLoan(double value) {
    _threeMonthPreviousLoan = value;
  }

  set fourthMonth5th(double value) {
    _fourthMonth5th = value;
  }

  set fourthMonth15th(double value) {
    _fourthMonth15th = value;
  }

  set fourthMonth25th(double value) {
    _fourthMonth25th = value;
  }

  set fourthMonthPreviousLoan(double value) {
    _fourthMonthPreviousLoan = value;
  }

  set fifthMonth5th(double value) {
    _fifthMonth5th = value;
  }

  set fifthMonth15th(double value) {
    _fifthMonth15th = value;
  }

  set fifthMonth25th(double value) {
    _fifthMonth25th = value;
  }

  set fifthMonthPreviousLoan(double value) {
    _fifthMonthPreviousLoan = value;
  }

  set sixthMonth5th(double value) {
    _sixthMonth5th = value;
  }

  set sixthMonth15th(double value) {
    _sixthMonth15th = value;
  }

  set sixthMonth25th(double value) {
    _sixthMonth25th = value;
  }

  set sixthMonthPreviousLoan(double value) {
    _sixthMonthPreviousLoan = value;
  }

  set averageBankBalancePrevious(double value) {
    _averageBankBalancePrevious = value;
  }
}

class SalesDetails {


  double _closingDayInWeek = 0;
  int _workingDaysInMonth = 0;
  double _salesDaily = 0.0;
  double _salesWeekly = 0.0;
  double _salesMonthly = 0.0;
  double _monthPreviousLoan = 0.0;
  double _month = 0.0;
  double _weeks = 0.0;
  double _low = 0.0;
  double _high = 0.0;
  double _normal = 0.0;
  double _lowMonth = 0.0;
  double _highMonth = 0.0;
  double _normalMonth = 0.0;
  double _debtors = 0.0;
  double _debtorsPreviousLoan = 0.0;
  double _monthlySalesGrowthPostFunding = 0.0;
  double _salesId = 0.0;
  int _customerId = 0;

  set salesId(double value) {
    _salesId = value;
  }



  SalesDetails();

  double get salesId => _salesId;
  int get customerId => _customerId;
  double get closingDayInWeek => _closingDayInWeek;
  int get workingDaysInMonth => _workingDaysInMonth;
  double get salesDaily => _salesDaily;
  double get salesWeekly => _salesWeekly;
  double get salesMonthly => _salesMonthly;
  double get monthPreviousLoan => _monthPreviousLoan;
  double get month => _month;
  double get weeks => _weeks;
  double get low => _low;
  double get high => _high;
  double get normal => _normal;
  double get lowMonth => _lowMonth;
  double get highMonth => _highMonth;
  double get normalMonth => _normalMonth;
  double get debtors => _debtors;
  double get debtorsPreviousLoan => _debtorsPreviousLoan;
  double get monthlySalesGrowthPostFunding => _monthlySalesGrowthPostFunding;

  set customerId(int value) {
    _customerId = value;
  }

  set closingDayInWeek(double value) {
    _closingDayInWeek = value;
  }

  set workingDaysInMonth(int value) {
    _workingDaysInMonth = value;
  }

  set salesDaily(double value) {
    _salesDaily = value;
  }

  set salesWeekly(double value) {
    _salesWeekly = value;
  }

  set salesMonthly(double value) {
    _salesMonthly = value;
  }

  set monthPreviousLoan(double value) {
    _monthPreviousLoan = value;
  }

  set month(double value) {
    _month = value;
  }

  set weeks(double value) {
    _weeks = value;
  }

  set low(double value) {
    _low = value;
  }

  set high(double value) {
    _high = value;
  }

  set normal(double value) {
    _normal = value;
  }

  set lowMonth(double value) {
    _lowMonth = value;
  }

  set highMonth(double value) {
    _highMonth = value;
  }

  set normalMonth(double value) {
    _normalMonth = value;
  }

  set debtors(double value) {
    _debtors = value;
  }

  set debtorsPreviousLoan(double value) {
    _debtorsPreviousLoan = value;
  }

  set monthlySalesGrowthPostFunding(double value) {
    _monthlySalesGrowthPostFunding = value;
  }
}



class PurchaseDetails {

  int _customerId = 0;
  double _daily = 0.0;
  double _weekly = 0.0;
  double _monthly = 0.0;
  double _monthlyPreviousLoan = 0.0;
  double _creditors = 0.0;
  double _creditorsPreviousLoan = 0.0;

  PurchaseDetails();


  set customerId(int value) {
    _customerId = value;
  }

  int get customerId => _customerId;
  double get daily => _daily;
  double get weekly => _weekly;
  double get monthly => _monthly;
  double get monthlyPreviousLoan => _monthlyPreviousLoan;
  double get creditors => _creditors;
  double get creditorsPreviousLoan => _creditorsPreviousLoan;

  set daily(double value) {
    _daily = value;
  }

  set weekly(double value) {
    _weekly = value;
  }

  set monthly(double value) {
    _monthly = value;
  }

  set monthlyPreviousLoan(double value) {
    _monthlyPreviousLoan = value;
  }

  set creditors(double value) {
    _creditors = value;
  }

  set creditorsPreviousLoan(double value) {
    _creditorsPreviousLoan = value;
  }
}


class StockDetails {
  double _stockId = 0.0;
  int _customerId = 0;
  double _finishedGoods = 0.0;
  double _rawMaterial = 0.0;
  double _finishedGoodsPreviousLoan = 0.0;
  double _rawMaterialPreviousLoan = 0.0;

  set stockId(double value) {
    _stockId = value;
  }

  StockDetails();

  double get stockId => _stockId;
  int get customerId => _customerId;
  double get finishedGoods => _finishedGoods;
  double get rawMaterial => _rawMaterial;
  double get finishedGoodsPreviousLoan => _finishedGoodsPreviousLoan;
  double get rawMaterialPreviousLoan => _rawMaterialPreviousLoan;

  set customerId(int value) {
    _customerId = value;
  }

  set finishedGoods(double value) {
    _finishedGoods = value;
  }

  set rawMaterial(double value) {
    _rawMaterial = value;
  }

  set finishedGoodsPreviousLoan(double value) {
    _finishedGoodsPreviousLoan = value;
  }

  set rawMaterialPreviousLoan(double value) {
    _rawMaterialPreviousLoan = value;
  }
}


class OtherIncomeMonthly {

  int _customerId = 0;
  double _agricultureIncome = 0.0;
  double _agricultureIncomePreviousLoan = 0.0;
  double _rentalIncome = 0.0;
  double _rentalIncomePreviousLoan = 0.0;
  double _salaryIncomeFM = 0.0;
  double _salaryIncomeFMPreviousLoan = 0.0;
  double _alliedAgriIncome = 0.0;
  double _alliedAgriIncomePreviousLoan = 0.0;
  double _otherIncome = 0.0;
  double _otherIncomePreviousLoan = 0.0;

  set customerId(int value) {
    _customerId = value;
  }

  OtherIncomeMonthly();

  int get customerId => _customerId;
  double get agricultureIncome => _agricultureIncome;
  double get agricultureIncomePreviousLoan => _agricultureIncomePreviousLoan;
  double get rentalIncome => _rentalIncome;
  double get rentalIncomePreviousLoan => _rentalIncomePreviousLoan;
  double get salaryIncomeFM => _salaryIncomeFM;
  double get salaryIncomeFMPreviousLoan => _salaryIncomeFMPreviousLoan;
  double get alliedAgriIncome => _alliedAgriIncome;
  double get alliedAgriIncomePreviousLoan => _alliedAgriIncomePreviousLoan;
  double get otherIncome => _otherIncome;
  double get otherIncomePreviousLoan => _otherIncomePreviousLoan;

  set agricultureIncome(double value) {
    _agricultureIncome = value;
  }

  set agricultureIncomePreviousLoan(double value) {
    _agricultureIncomePreviousLoan = value;
  }

  set rentalIncome(double value) {
    _rentalIncome = value;
  }

  set rentalIncomePreviousLoan(double value) {
    _rentalIncomePreviousLoan = value;
  }

  set salaryIncomeFM(double value) {
    _salaryIncomeFM = value;
  }

  set salaryIncomeFMPreviousLoan(double value) {
    _salaryIncomeFMPreviousLoan = value;
  }

  set alliedAgriIncome(double value) {
    _alliedAgriIncome = value;
  }

  set alliedAgriIncomePreviousLoan(double value) {
    _alliedAgriIncomePreviousLoan = value;
  }

  set otherIncome(double value) {
    _otherIncome = value;
  }

  set otherIncomePreviousLoan(double value) {
    _otherIncomePreviousLoan = value;
  }
}


class BusinessExpenseDetails {

  int _customerId = 0;
  double _rent = 0.0;
  double _rentPreviousLoan = 0.0;
  double _electricity = 0.0;
  double _electricityPreviousLoan = 0.0;
  double _staffSalary = 0.0;
  double _staffSalaryPreviousLoan = 0.0;
  double _telephoneMobileInternet = 0.0;
  double _telMobileInterPrevLoan = 0.0;
  double _transport = 0.0;
  double _transportPreviousLoan = 0.0;
  double _gasAndWater = 0.0;
  double _gasAndWaterPreviousLoan = 0.0;
  double _maintenance = 0.0;
  double _maintenancePreviousLoan = 0.0;
  double _dieselForGenerator = 0.0;
  double _dieselForGeneratorPrevLoan = 0.0;
  double _marketing = 0.0;
  double _marketingPreviousLoan = 0.0;
  double _labourExpense = 0.0;
  double _labourExpensePreviousLoan = 0.0;
  double _societyBillSecurity = 0.0;
  double _societyBillSecurityPrevLoan = 0.0;
  double _tax = 0.0;
  double _taxPrevLoan = 0.0;
  double _entertainment = 0.0;
  double _entertainmentPreviousLoan = 0.0;
  double _otherBusinessExpense = 0.0;
  double _otherBusinessExpensePrevLoan = 0.0;

  BusinessExpenseDetails();


  set customerId(int value) {
    _customerId = value;
  }

  int get customerId => _customerId;
  double get rent => _rent;
  double get rentPreviousLoan => _rentPreviousLoan;
  double get electricity => _electricity;
  double get electricityPreviousLoan => _electricityPreviousLoan;
  double get staffSalary => _staffSalary;
  double get staffSalaryPreviousLoan => _staffSalaryPreviousLoan;
  double get telephoneMobileInternet => _telephoneMobileInternet;
  double get telMobileInterPrevLoan => _telMobileInterPrevLoan;
  double get transport => _transport;
  double get transportPreviousLoan => _transportPreviousLoan;
  double get gasAndWater => _gasAndWater;
  double get gasAndWaterPreviousLoan => _gasAndWaterPreviousLoan;
  double get maintenance => _maintenance;
  double get maintenancePreviousLoan => _maintenancePreviousLoan;
  double get dieselForGenerator => _dieselForGenerator;
  double get dieselForGeneratorPrevLoan => _dieselForGeneratorPrevLoan;
  double get marketing => _marketing;
  double get marketingPreviousLoan => _marketingPreviousLoan;
  double get labourExpense => _labourExpense;
  double get labourExpensePreviousLoan => _labourExpensePreviousLoan;
  double get societyBillSecurity => _societyBillSecurity;
  double get societyBillSecurityPrevLoan => _societyBillSecurityPrevLoan;
  double get tax => _tax;
  double get taxPrevLoan => _taxPrevLoan;
  double get entertainment => _entertainment;
  double get entertainmentPreviousLoan => _entertainmentPreviousLoan;
  double get otherBusinessExpense => _otherBusinessExpense;
  double get otherBusinessExpensePrevLoan => _otherBusinessExpensePrevLoan;

  set rent(double value) {
    _rent = value;
  }

  set rentPreviousLoan(double value) {
    _rentPreviousLoan = value;
  }

  set electricity(double value) {
    _electricity = value;
  }

  set electricityPreviousLoan(double value) {
    _electricityPreviousLoan = value;
  }

  set staffSalary(double value) {
    _staffSalary = value;
  }

  set staffSalaryPreviousLoan(double value) {
    _staffSalaryPreviousLoan = value;
  }

  set telephoneMobileInternet(double value) {
    _telephoneMobileInternet = value;
  }

  set telMobileInterPrevLoan(double value) {
    _telMobileInterPrevLoan = value;
  }

  set transport(double value) {
    _transport = value;
  }

  set transportPreviousLoan(double value) {
    _transportPreviousLoan = value;
  }

  set gasAndWater(double value) {
    _gasAndWater = value;
  }

  set gasAndWaterPreviousLoan(double value) {
    _gasAndWaterPreviousLoan = value;
  }

  set maintenance(double value) {
    _maintenance = value;
  }

  set maintenancePreviousLoan(double value) {
    _maintenancePreviousLoan = value;
  }

  set dieselForGenerator(double value) {
    _dieselForGenerator = value;
  }

  set dieselForGeneratorPrevLoan(double value) {
    _dieselForGeneratorPrevLoan = value;
  }

  set marketing(double value) {
    _marketing = value;
  }

  set marketingPreviousLoan(double value) {
    _marketingPreviousLoan = value;
  }

  set labourExpense(double value) {
    _labourExpense = value;
  }

  set labourExpensePreviousLoan(double value) {
    _labourExpensePreviousLoan = value;
  }

  set societyBillSecurity(double value) {
    _societyBillSecurity = value;
  }

  set societyBillSecurityPrevLoan(double value) {
    _societyBillSecurityPrevLoan = value;
  }

  set tax(double value) {
    _tax = value;
  }

  set taxPrevLoan(double value) {
    _taxPrevLoan = value;
  }

  set entertainment(double value) {
    _entertainment = value;
  }

  set entertainmentPreviousLoan(double value) {
    _entertainmentPreviousLoan = value;
  }

  set otherBusinessExpense(double value) {
    _otherBusinessExpense = value;
  }

  set otherBusinessExpensePrevLoan(double value) {
    _otherBusinessExpensePrevLoan = value;
  }
}

class PersonalExpenseDetails {

  int _customerId = 0;
  double _houserent = 0.0;
  double _houserentpreviousloan = 0.0;
  double _food = 0.0;
  double _foodpreviousloan = 0.0;
  double _clothing = 0.0;
  double _clothingpreviousloan = 0.0;
  double _educationmonthly = 0.0;
  double _educationmonthlypreviousloan = 0.0;
  double _electricity = 0.0;
  double _electricitypreviousloan = 0.0;
  double _transportconveyance = 0.0;
  double _transportconveyanceprevloan = 0.0;
  double _telmobileinter = 0.0;
  double _telmobileinterprevloan = 0.0;
  double _medical = 0.0;
  double _medicalpreviousloan = 0.0;
  double _entertainment = 0.0;
  double _entertainmentpreviousloan = 0.0;
  double _repairmaintenance = 0.0;
  double _repairmaintenancepreviousloan = 0.0;
  double _maid = 0.0;
  double _maidpreviousloan = 0.0;
  double _housetax = 0.0;
  double _housetaxpreviousloan = 0.0;
  double _anyotherexpense = 0.0;
  double _anyotherexpensepreviousloan = 0.0;

  PersonalExpenseDetails();


  set customerId(int value) {
    _customerId = value;
  }

  int get customerId => _customerId;
  double get houserent => _houserent;
  double get houserentpreviousloan => _houserentpreviousloan;
  double get food => _food;
  double get foodpreviousloan => _foodpreviousloan;
  double get clothing => _clothing;
  double get clothingpreviousloan => _clothingpreviousloan;
  double get educationmonthly => _educationmonthly;
  double get educationmonthlypreviousloan => _educationmonthlypreviousloan;
  double get electricity => _electricity;
  double get electricitypreviousloan => _electricitypreviousloan;
  double get transportconveyance => _transportconveyance;
  double get transportconveyanceprevloan => _transportconveyanceprevloan;
  double get telmobileinter => _telmobileinter;
  double get telmobileinterprevloan => _telmobileinterprevloan;
  double get medical => _medical;
  double get medicalpreviousloan => _medicalpreviousloan;
  double get entertainment => _entertainment;
  double get entertainmentpreviousloan => _entertainmentpreviousloan;
  double get repairmaintenance => _repairmaintenance;
  double get repairmaintenancepreviousloan => _repairmaintenancepreviousloan;
  double get maid => _maid;
  double get maidpreviousloan => _maidpreviousloan;
  double get housetax => _housetax;
  double get housetaxpreviousloan => _housetaxpreviousloan;
  double get anyotherexpense => _anyotherexpense;
  double get anyotherexpensepreviousloan => _anyotherexpensepreviousloan;

  set houserent(double value) {
    _houserent = value;
  }

  set houserentpreviousloan(double value) {
    _houserentpreviousloan = value;
  }

  set food(double value) {
    _food = value;
  }

  set foodpreviousloan(double value) {
    _foodpreviousloan = value;
  }

  set clothing(double value) {
    _clothing = value;
  }

  set clothingpreviousloan(double value) {
    _clothingpreviousloan = value;
  }

  set educationmonthly(double value) {
    _educationmonthly = value;
  }

  set educationmonthlypreviousloan(double value) {
    _educationmonthlypreviousloan = value;
  }

  set electricity(double value) {
    _electricity = value;
  }

  set electricitypreviousloan(double value) {
    _electricitypreviousloan = value;
  }

  set transportconveyance(double value) {
    _transportconveyance = value;
  }

  set transportconveyanceprevloan(double value) {
    _transportconveyanceprevloan = value;
  }

  set telmobileinter(double value) {
    _telmobileinter = value;
  }

  set telmobileinterprevloan(double value) {
    _telmobileinterprevloan = value;
  }

  set medical(double value) {
    _medical = value;
  }

  set medicalpreviousloan(double value) {
    _medicalpreviousloan = value;
  }

  set entertainment(double value) {
    _entertainment = value;
  }

  set entertainmentpreviousloan(double value) {
    _entertainmentpreviousloan = value;
  }

  set repairmaintenance(double value) {
    _repairmaintenance = value;
  }

  set repairmaintenancepreviousloan(double value) {
    _repairmaintenancepreviousloan = value;
  }

  set maid(double value) {
    _maid = value;
  }

  set maidpreviousloan(double value) {
    _maidpreviousloan = value;
  }

  set housetax(double value) {
    _housetax = value;
  }

  set housetaxpreviousloan(double value) {
    _housetaxpreviousloan = value;
  }

  set anyotherexpense(double value) {
    _anyotherexpense = value;
  }

  set anyotherexpensepreviousloan(double value) {
    _anyotherexpensepreviousloan = value;
  }
}




class ExternalLoanDetails {

  int _customerId = 0;
  String _nameofinstitution = "";
  double _loanamount = 0.0;
  double _emi = 0.0;
  double _loanoutstanding = 0.0;
  double _tenor = 0.0;
  double _paidtenor = 0.0;
  double _balancetenor = 0.0;
  String _loantobeclosed = "";
  double _obligate = 0.0;
  double _previousloanobligation = 0.0;


  set customerId(int value) {
    _customerId = value;
  }

  ExternalLoanDetails();


  int get customerId => _customerId;
  String get nameofinstitution => _nameofinstitution;
  double get loanamount => _loanamount;
  double get emi => _emi;
  double get loanoutstanding => _loanoutstanding;
  double get tenor => _tenor;
  double get paidtenor => _paidtenor;
  double get balancetenor => _balancetenor;
  String get loantobeclosed => _loantobeclosed;
  double get obligate => _obligate;
  double get previousloanobligation => _previousloanobligation;

  set nameofinstitution(String value) {
    _nameofinstitution = value;
  }

  set loanamount(double value) {
    _loanamount = value;
  }

  set emi(double value) {
    _emi = value;
  }

  set loanoutstanding(double value) {
    _loanoutstanding = value;
  }

  set tenor(double value) {
    _tenor = value;
  }

  set paidtenor(double value) {
    _paidtenor = value;
  }

  set balancetenor(double value) {
    _balancetenor = value;
  }

  set loantobeclosed(String value) {
    _loantobeclosed = value;
  }

  set obligate(double value) {
    _obligate = value;
  }

  set previousloanobligation(double value) {
    _previousloanobligation = value;
  }
}



class RegularInvestment {

  int _customerId = 0;
  double _lifeinsurance = 0.0;
  double _lifeinsurancepreviousloan = 0.0;
  double _generalinsurance = 0.0;
  double _generalinsurancepreviousloan = 0.0;
  double _dps = 0.0;
  double _dpspreviousloan = 0.0;
  double _grossmargininbusiness = 0.0;
  double _grossmargininbusinessprevloan = 0.0;
  double _monthlycashinhandfrombusiness = 0.0;
  double _cashinhandfrombusiprevloan = 0.0;

  RegularInvestment();


  set customerId(int value) {
    _customerId = value;
  }

  int get customerId => _customerId;
  double get lifeinsurance => _lifeinsurance;
  double get lifeinsurancepreviousloan => _lifeinsurancepreviousloan;
  double get generalinsurance => _generalinsurance;
  double get generalinsurancepreviousloan => _generalinsurancepreviousloan;
  double get dps => _dps;
  double get dpspreviousloan => _dpspreviousloan;
  double get grossmargininbusiness => _grossmargininbusiness;
  double get grossmargininbusinessprevloan => _grossmargininbusinessprevloan;
  double get monthlycashinhandfrombusiness => _monthlycashinhandfrombusiness;
  double get cashinhandfrombusiprevloan => _cashinhandfrombusiprevloan;

  set lifeinsurance(double value) {
    _lifeinsurance = value;
  }

  set lifeinsurancepreviousloan(double value) {
    _lifeinsurancepreviousloan = value;
  }

  set generalinsurance(double value) {
    _generalinsurance = value;
  }

  set generalinsurancepreviousloan(double value) {
    _generalinsurancepreviousloan = value;
  }

  set dps(double value) {
    _dps = value;
  }

  set dpspreviousloan(double value) {
    _dpspreviousloan = value;
  }

  set grossmargininbusiness(double value) {
    _grossmargininbusiness = value;
  }

  set grossmargininbusinessprevloan(double value) {
    _grossmargininbusinessprevloan = value;
  }

  set monthlycashinhandfrombusiness(double value) {
    _monthlycashinhandfrombusiness = value;
  }

  set cashinhandfrombusiprevloan(double value) {
    _cashinhandfrombusiprevloan = value;
  }
}


class QualitativeAspects {
  //double _id = 0.0;
  int _customerId = 0;
  String _promoter = "";
  String _businessActivity = "";
  String _marketAndDemand = "";
  String _recommendation = "";

  QualitativeAspects();


  set customerId(int value) {
    _customerId = value;
  }

  int get customerId => _customerId;
  String get promoter => _promoter;
  String get businessActivity => _businessActivity;
  String get marketAndDemand => _marketAndDemand;
  String get recommendation => _recommendation;

  set promoter(String value) {
    _promoter = value;
  }

  set businessActivity(String value) {
    _businessActivity = value;
  }

  set marketAndDemand(String value) {
    _marketAndDemand = value;
  }

  set recommendation(String value) {
    _recommendation = value;
  }
}


class ManufacturingOption {
  double _id = 0.0;
  double _customerId = 0.0;
  String _typeOfProduct = "";
  double _numberOfUnits = 0.0;
  double _averageSalePricePerUnit = 0.0;
  double _productionCostPerUnit = 0.0;

  ManufacturingOption();

  double get id => _id;
  double get customerId => _customerId;
  String get typeOfProduct => _typeOfProduct;
  double get numberOfUnits => _numberOfUnits;
  double get averageSalePricePerUnit => _averageSalePricePerUnit;
  double get productionCostPerUnit => _productionCostPerUnit;
}

class DebtBurden{
  int customerID = 0;
  int debtburden = 0;
  int debtburdenPreviousLoan = 0;

  DebtBurden(this.customerID, this.debtburden, this.debtburdenPreviousLoan);


}









