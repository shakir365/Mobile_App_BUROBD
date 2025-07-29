class CustomerListModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<CustomerListData>? _data = [];

  CustomerListModel(
      {bool? success, String? messageEn, String? messageBn, List<CustomerListData>? data}) {
    if (success != null) {
      this._success = success;
    }
    if (messageEn != null) {
      this._messageEn = messageEn;
    }
    if (messageBn != null) {
      this._messageBn = messageBn;
    }
    if (data != null) {
      this._data = data;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get messageEn => _messageEn;
  set messageEn(String? messageEn) => _messageEn = messageEn;
  String? get messageBn => _messageBn;
  set messageBn(String? messageBn) => _messageBn = messageBn;
  List<CustomerListData>? get data => _data;
  set data(List<CustomerListData>? data) => _data = data;

  CustomerListModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <CustomerListData>[];
      json['data'].forEach((v) {
        _data!.add(new CustomerListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerListData {
  int? _customerId;
  String? _customerName;
  String? _dateOfBirth;
  String? _housePincode;
  int? _familyMembersCount;
  int? _earningMembersCount;
  int? _residenceStayVintage;
  int? _vintageWithBuroMonths;
  int? _currentSavingsAmount;
  int? _peakSavingsAmountLast12Months;
  int? _existingLoanAmount;
  int? _peakDPDLast12Months;
  int? _previousLoanCustomerStatus;
  int? _previousLoanSavingAmount;
  int? _previousLoanAmount;
  int? _previousLoanRepaymentBehaviour;
  int? _previousLoanPeakDPD;
  String? _memberId;
  int? _customerStatus;
  int? _gender;
  int? _maritalStatus;
  int? _qualification;
  int? _residenceOwnership;
  int? _repaymentBehavior;

  CustomerListData(
      {int? customerId,
        String? customerName,
        String? dateOfBirth,
        String? housePincode,
        int? familyMembersCount,
        int? earningMembersCount,
        int? residenceStayVintage,
        int? vintageWithBuroMonths,
        int? currentSavingsAmount,
        int? peakSavingsAmountLast12Months,
        int? existingLoanAmount,
        int? peakDPDLast12Months,
        int? previousLoanCustomerStatus,
        int? previousLoanSavingAmount,
        int? previousLoanAmount,
        int? previousLoanRepaymentBehaviour,
        int? previousLoanPeakDPD,
        String? memberId,
        int? customerStatus,
        int? gender,
        int? maritalStatus,
        int? qualification,
        int? residenceOwnership,
        int? repaymentBehavior}) {
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (customerName != null) {
      this._customerName = customerName;
    }
    if (dateOfBirth != null) {
      this._dateOfBirth = dateOfBirth;
    }
    if (housePincode != null) {
      this._housePincode = housePincode;
    }
    if (familyMembersCount != null) {
      this._familyMembersCount = familyMembersCount;
    }
    if (earningMembersCount != null) {
      this._earningMembersCount = earningMembersCount;
    }
    if (residenceStayVintage != null) {
      this._residenceStayVintage = residenceStayVintage;
    }
    if (vintageWithBuroMonths != null) {
      this._vintageWithBuroMonths = vintageWithBuroMonths;
    }
    if (currentSavingsAmount != null) {
      this._currentSavingsAmount = currentSavingsAmount;
    }
    if (peakSavingsAmountLast12Months != null) {
      this._peakSavingsAmountLast12Months = peakSavingsAmountLast12Months;
    }
    if (existingLoanAmount != null) {
      this._existingLoanAmount = existingLoanAmount;
    }
    if (peakDPDLast12Months != null) {
      this._peakDPDLast12Months = peakDPDLast12Months;
    }
    if (previousLoanCustomerStatus != null) {
      this._previousLoanCustomerStatus = previousLoanCustomerStatus;
    }
    if (previousLoanSavingAmount != null) {
      this._previousLoanSavingAmount = previousLoanSavingAmount;
    }
    if (previousLoanAmount != null) {
      this._previousLoanAmount = previousLoanAmount;
    }
    if (previousLoanRepaymentBehaviour != null) {
      this._previousLoanRepaymentBehaviour = previousLoanRepaymentBehaviour;
    }
    if (previousLoanPeakDPD != null) {
      this._previousLoanPeakDPD = previousLoanPeakDPD;
    }
    if (memberId != null) {
      this._memberId = memberId;
    }
    if (customerStatus != null) {
      this._customerStatus = customerStatus;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (maritalStatus != null) {
      this._maritalStatus = maritalStatus;
    }
    if (qualification != null) {
      this._qualification = qualification;
    }
    if (residenceOwnership != null) {
      this._residenceOwnership = residenceOwnership;
    }
    if (repaymentBehavior != null) {
      this._repaymentBehavior = repaymentBehavior;
    }
  }

  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  String? get customerName => _customerName;
  set customerName(String? customerName) => _customerName = customerName;
  String? get dateOfBirth => _dateOfBirth;
  set dateOfBirth(String? dateOfBirth) => _dateOfBirth = dateOfBirth;
  String? get housePincode => _housePincode;
  set housePincode(String? housePincode) => _housePincode = housePincode;
  int? get familyMembersCount => _familyMembersCount;
  set familyMembersCount(int? familyMembersCount) =>
      _familyMembersCount = familyMembersCount;
  int? get earningMembersCount => _earningMembersCount;
  set earningMembersCount(int? earningMembersCount) =>
      _earningMembersCount = earningMembersCount;
  int? get residenceStayVintage => _residenceStayVintage;
  set residenceStayVintage(int? residenceStayVintage) =>
      _residenceStayVintage = residenceStayVintage;
  int? get vintageWithBuroMonths => _vintageWithBuroMonths;
  set vintageWithBuroMonths(int? vintageWithBuroMonths) =>
      _vintageWithBuroMonths = vintageWithBuroMonths;
  int? get currentSavingsAmount => _currentSavingsAmount;
  set currentSavingsAmount(int? currentSavingsAmount) =>
      _currentSavingsAmount = currentSavingsAmount;
  int? get peakSavingsAmountLast12Months => _peakSavingsAmountLast12Months;
  set peakSavingsAmountLast12Months(int? peakSavingsAmountLast12Months) =>
      _peakSavingsAmountLast12Months = peakSavingsAmountLast12Months;
  int? get existingLoanAmount => _existingLoanAmount;
  set existingLoanAmount(int? existingLoanAmount) =>
      _existingLoanAmount = existingLoanAmount;
  int? get peakDPDLast12Months => _peakDPDLast12Months;
  set peakDPDLast12Months(int? peakDPDLast12Months) =>
      _peakDPDLast12Months = peakDPDLast12Months;
  int? get previousLoanCustomerStatus => _previousLoanCustomerStatus;
  set previousLoanCustomerStatus(int? previousLoanCustomerStatus) =>
      _previousLoanCustomerStatus = previousLoanCustomerStatus;
  int? get previousLoanSavingAmount => _previousLoanSavingAmount;
  set previousLoanSavingAmount(int? previousLoanSavingAmount) =>
      _previousLoanSavingAmount = previousLoanSavingAmount;
  int? get previousLoanAmount => _previousLoanAmount;
  set previousLoanAmount(int? previousLoanAmount) =>
      _previousLoanAmount = previousLoanAmount;
  int? get previousLoanRepaymentBehaviour => _previousLoanRepaymentBehaviour;
  set previousLoanRepaymentBehaviour(int? previousLoanRepaymentBehaviour) =>
      _previousLoanRepaymentBehaviour = previousLoanRepaymentBehaviour;
  int? get previousLoanPeakDPD => _previousLoanPeakDPD;
  set previousLoanPeakDPD(int? previousLoanPeakDPD) =>
      _previousLoanPeakDPD = previousLoanPeakDPD;
  String? get memberId => _memberId;
  set memberId(String? memberId) => _memberId = memberId;
  int? get customerStatus => _customerStatus;
  set customerStatus(int? customerStatus) => _customerStatus = customerStatus;
  int? get gender => _gender;
  set gender(int? gender) => _gender = gender;
  int? get maritalStatus => _maritalStatus;
  set maritalStatus(int? maritalStatus) => _maritalStatus = maritalStatus;
  int? get qualification => _qualification;
  set qualification(int? qualification) => _qualification = qualification;
  int? get residenceOwnership => _residenceOwnership;
  set residenceOwnership(int? residenceOwnership) =>
      _residenceOwnership = residenceOwnership;
  int? get repaymentBehavior => _repaymentBehavior;
  set repaymentBehavior(int? repaymentBehavior) =>
      _repaymentBehavior = repaymentBehavior;

  CustomerListData.fromJson(Map<String, dynamic> json) {
    _customerId = json['customerId'];
    _customerName = json['customerName'];
    _dateOfBirth = json['dateOfBirth'];
    _housePincode = json['housePincode'];
    _familyMembersCount = json['familyMembersCount'];
    _earningMembersCount = json['earningMembersCount'];
    _residenceStayVintage = json['residenceStayVintage'];
    _vintageWithBuroMonths = json['vintageWithBuroMonths'];
    _currentSavingsAmount = json['currentSavingsAmount'];
    _peakSavingsAmountLast12Months = json['peakSavingsAmountLast12Months'];
    _existingLoanAmount = json['existingLoanAmount'];
    _peakDPDLast12Months = json['peakDPDLast12Months'];
    _previousLoanCustomerStatus = json['previousLoanCustomerStatus'];
    _previousLoanSavingAmount = json['previousLoanSavingAmount'];
    _previousLoanAmount = json['previousLoanAmount'];
    _previousLoanRepaymentBehaviour = json['previousLoanRepaymentBehaviour'];
    _previousLoanPeakDPD = json['previousLoanPeakDPD'];
    _memberId = json['memberId'];
    _customerStatus = json['customerStatus'];
    _gender = json['gender'];
    _maritalStatus = json['maritalStatus'];
    _qualification = json['qualification'];
    _residenceOwnership = json['residenceOwnership'];
    _repaymentBehavior = json['repaymentBehavior'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this._customerId;
    data['customerName'] = this._customerName;
    data['dateOfBirth'] = this._dateOfBirth;
    data['housePincode'] = this._housePincode;
    data['familyMembersCount'] = this._familyMembersCount;
    data['earningMembersCount'] = this._earningMembersCount;
    data['residenceStayVintage'] = this._residenceStayVintage;
    data['vintageWithBuroMonths'] = this._vintageWithBuroMonths;
    data['currentSavingsAmount'] = this._currentSavingsAmount;
    data['peakSavingsAmountLast12Months'] = this._peakSavingsAmountLast12Months;
    data['existingLoanAmount'] = this._existingLoanAmount;
    data['peakDPDLast12Months'] = this._peakDPDLast12Months;
    data['previousLoanCustomerStatus'] = this._previousLoanCustomerStatus;
    data['previousLoanSavingAmount'] = this._previousLoanSavingAmount;
    data['previousLoanAmount'] = this._previousLoanAmount;
    data['previousLoanRepaymentBehaviour'] =
        this._previousLoanRepaymentBehaviour;
    data['previousLoanPeakDPD'] = this._previousLoanPeakDPD;
    data['memberId'] = this._memberId;
    data['customerStatus'] = this._customerStatus;
    data['gender'] = this._gender;
    data['maritalStatus'] = this._maritalStatus;
    data['qualification'] = this._qualification;
    data['residenceOwnership'] = this._residenceOwnership;
    data['repaymentBehavior'] = this._repaymentBehavior;
    return data;
  }
}

class NextCustomerID {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<Data>? _data;

  NextCustomerID(
      {bool? success, String? messageEn, String? messageBn, List<Data>? data}) {
    if (success != null) {
      this._success = success;
    }
    if (messageEn != null) {
      this._messageEn = messageEn;
    }
    if (messageBn != null) {
      this._messageBn = messageBn;
    }
    if (data != null) {
      this._data = data;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get messageEn => _messageEn;
  set messageEn(String? messageEn) => _messageEn = messageEn;
  String? get messageBn => _messageBn;
  set messageBn(String? messageBn) => _messageBn = messageBn;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  NextCustomerID.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? _id;

  Data({int? id}) {
    if (id != null) {
      this._id = id;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    return data;
  }
}
/*
class ExistingCustomerInfo {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ExistingCustomerInfoData>? _data;

  ExistingCustomerInfo(
      {bool? success, String? messageEn, String? messageBn, List<ExistingCustomerInfoData>? data}) {
    if (success != null) {
      this._success = success;
    }
    if (messageEn != null) {
      this._messageEn = messageEn;
    }
    if (messageBn != null) {
      this._messageBn = messageBn;
    }
    if (data != null) {
      this._data = data;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get messageEn => _messageEn;
  set messageEn(String? messageEn) => _messageEn = messageEn;
  String? get messageBn => _messageBn;
  set messageBn(String? messageBn) => _messageBn = messageBn;
  List<ExistingCustomerInfoData>? get data => _data;
  set data(List<ExistingCustomerInfoData>? data) => _data = data;

  ExistingCustomerInfo.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ExistingCustomerInfoData>[];
      json['data'].forEach((v) {
        _data!.add(new ExistingCustomerInfoData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExistingCustomerInfoData {
  String? _branchCode;
  String? _loaneeCode;
  String? _firstName;
  String? _memberStatus;
  String? _gender;
  String? _birthDate;
  String? _maritalStatus;
  String? _education;
  int? _earningMember;
  double? _totalCurrBalance;

  ExistingCustomerInfoData(
      {String? branchCode,
        String? loaneeCode,
        String? firstName,
        String? memberStatus,
        String? gender,
        String? birthDate,
        String? maritalStatus,
        String? education,
        int? earningMember,
        double? totalCurrBalance}) {
    if (branchCode != null) {
      this._branchCode = branchCode;
    }
    if (loaneeCode != null) {
      this._loaneeCode = loaneeCode;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (memberStatus != null) {
      this._memberStatus = memberStatus;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (birthDate != null) {
      this._birthDate = birthDate;
    }
    if (maritalStatus != null) {
      this._maritalStatus = maritalStatus;
    }
    if (education != null) {
      this._education = education;
    }
    if (earningMember != null) {
      this._earningMember = earningMember;
    }
    if (totalCurrBalance != null) {
      this._totalCurrBalance = totalCurrBalance;
    }
  }

  String? get branchCode => _branchCode;
  set branchCode(String? branchCode) => _branchCode = branchCode;
  String? get loaneeCode => _loaneeCode;
  set loaneeCode(String? loaneeCode) => _loaneeCode = loaneeCode;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get memberStatus => _memberStatus;
  set memberStatus(String? memberStatus) => _memberStatus = memberStatus;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get birthDate => _birthDate;
  set birthDate(String? birthDate) => _birthDate = birthDate;
  String? get maritalStatus => _maritalStatus;
  set maritalStatus(String? maritalStatus) => _maritalStatus = maritalStatus;
  String? get education => _education;
  set education(String? education) => _education = education;
  int? get earningMember => _earningMember;
  set earningMember(int? earningMember) => _earningMember = earningMember;
  double? get totalCurrBalance => _totalCurrBalance;
  set totalCurrBalance(double? totalCurrBalance) =>
      _totalCurrBalance = totalCurrBalance;

  ExistingCustomerInfoData.fromJson(Map<String, dynamic> json) {
    _branchCode = json['branchCode'];
    _loaneeCode = json['loaneeCode'];
    _firstName = json['firstName'];
    _memberStatus = json['memberStatus'];
    _gender = json['gender'];
    _birthDate = json['birthDate'];
    _maritalStatus = json['maritalStatus'];
    _education = json['education'];
    _earningMember = json['earningMember'];
    _totalCurrBalance = json['total_Curr_Balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchCode'] = this._branchCode;
    data['loaneeCode'] = this._loaneeCode;
    data['firstName'] = this._firstName;
    data['memberStatus'] = this._memberStatus;
    data['gender'] = this._gender;
    data['birthDate'] = this._birthDate;
    data['maritalStatus'] = this._maritalStatus;
    data['education'] = this._education;
    data['earningMember'] = this._earningMember;
    data['total_Curr_Balance'] = this._totalCurrBalance;
    return data;
  }
}*/

class ExistingCustomerInfo {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ExistingCustomerInfoData>? _data;

  ExistingCustomerInfo(
      {bool? success, String? messageEn, String? messageBn, List<ExistingCustomerInfoData>? data}) {
    if (success != null) {
      this._success = success;
    }
    if (messageEn != null) {
      this._messageEn = messageEn;
    }
    if (messageBn != null) {
      this._messageBn = messageBn;
    }
    if (data != null) {
      this._data = data;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get messageEn => _messageEn;
  set messageEn(String? messageEn) => _messageEn = messageEn;
  String? get messageBn => _messageBn;
  set messageBn(String? messageBn) => _messageBn = messageBn;
  List<ExistingCustomerInfoData>? get data => _data;
  set data(List<ExistingCustomerInfoData>? data) => _data = data;

  ExistingCustomerInfo.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ExistingCustomerInfoData>[];
      json['data'].forEach((v) {
        _data!.add(new ExistingCustomerInfoData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExistingCustomerInfoData {
  String? _branchCode;
  String? _loaneeCode;
  String? _custName;
  int? _memberStatus;
  String? _gender;
  String? _birthDate;
  String? _maritalStatus;
  int? _education;
  int? _earningMember;
  dynamic? _totalCurrBalance;
  dynamic? _lastLoanSavBal;
  dynamic? _dpd;
  dynamic? _maximumBalance;
  dynamic? _principalLoan;

  ExistingCustomerInfoData(
      {String? branchCode,
        String? loaneeCode,
        String? custName,
        int? memberStatus,
        String? gender,
        String? birthDate,
        String? maritalStatus,
        int? education,
        int? earningMember,
        dynamic? totalCurrBalance,
        dynamic? lastLoanSavBal,
        dynamic? dpd,
        dynamic? maximumBalance,
        dynamic? principalLoan}) {
    if (branchCode != null) {
      this._branchCode = branchCode;
    }
    if (loaneeCode != null) {
      this._loaneeCode = loaneeCode;
    }
    if (custName != null) {
      this._custName = custName;
    }
    if (memberStatus != null) {
      this._memberStatus = memberStatus;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (birthDate != null) {
      this._birthDate = birthDate;
    }
    if (maritalStatus != null) {
      this._maritalStatus = maritalStatus;
    }
    if (education != null) {
      this._education = education;
    }
    if (earningMember != null) {
      this._earningMember = earningMember;
    }
    if (totalCurrBalance != null) {
      this._totalCurrBalance = totalCurrBalance;
    }
    if (lastLoanSavBal != null) {
      this._lastLoanSavBal = lastLoanSavBal;
    }
    if (dpd != null) {
      this._dpd = dpd;
    }
    if (maximumBalance != null) {
      this._maximumBalance = maximumBalance;
    }
    if (principalLoan != null) {
      this._principalLoan = principalLoan;
    }
  }

  String? get branchCode => _branchCode;
  set branchCode(String? branchCode) => _branchCode = branchCode;
  String? get loaneeCode => _loaneeCode;
  set loaneeCode(String? loaneeCode) => _loaneeCode = loaneeCode;
  String? get custName => _custName;
  set custName(String? custName) => _custName = custName;
  int? get memberStatus => _memberStatus;
  set memberStatus(int? memberStatus) => _memberStatus = memberStatus;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get birthDate => _birthDate;
  set birthDate(String? birthDate) => _birthDate = birthDate;
  String? get maritalStatus => _maritalStatus;
  set maritalStatus(String? maritalStatus) => _maritalStatus = maritalStatus;
  int? get education => _education;
  set education(int? education) => _education = education;
  int? get earningMember => _earningMember;
  set earningMember(int? earningMember) => _earningMember = earningMember;
  dynamic? get totalCurrBalance => _totalCurrBalance;
  set totalCurrBalance(dynamic? totalCurrBalance) =>
      _totalCurrBalance = totalCurrBalance;
  dynamic? get lastLoanSavBal => _lastLoanSavBal;
  set lastLoanSavBal(dynamic? lastLoanSavBal) => _lastLoanSavBal = lastLoanSavBal;
  dynamic? get dpd => _dpd;
  set dpd(dynamic? dpd) => _dpd = dpd;
  dynamic? get maximumBalance => _maximumBalance;
  set maximumBalance(dynamic? maximumBalance) => _maximumBalance = maximumBalance;
  dynamic? get principalLoan => _principalLoan;
  set principalLoan(dynamic? principalLoan) => _principalLoan = principalLoan;

  ExistingCustomerInfoData.fromJson(Map<String, dynamic> json) {
    _branchCode = json['branchCode'];
    _loaneeCode = json['loaneeCode'];
    _custName = json['custName'];
    _memberStatus = json['memberStatus'];
    _gender = json['gender'];
    _birthDate = json['birthDate'];
    _maritalStatus = json['maritalStatus'];
    _education = json['education'];
    _earningMember = json['earningMember'];
    _totalCurrBalance = json['total_Curr_Balance'];
    _lastLoanSavBal = json['lastLoanSavBal'];
    _dpd = json['dpd'];
    _maximumBalance = json['maximum_balance'];
    _principalLoan = json['principalLoan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchCode'] = this._branchCode;
    data['loaneeCode'] = this._loaneeCode;
    data['custName'] = this._custName;
    data['memberStatus'] = this._memberStatus;
    data['gender'] = this._gender;
    data['birthDate'] = this._birthDate;
    data['maritalStatus'] = this._maritalStatus;
    data['education'] = this._education;
    data['earningMember'] = this._earningMember;
    data['total_Curr_Balance'] = this._totalCurrBalance;
    data['lastLoanSavBal'] = this._lastLoanSavBal;
    data['dpd'] = this._dpd;
    data['maximum_balance'] = this._maximumBalance;
    data['principalLoan'] = this._principalLoan;
    return data;
  }
}




