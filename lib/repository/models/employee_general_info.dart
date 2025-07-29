/*class EmpGeneralInfoListModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<EmployeeGeneralInfoData>? _data = [];

  EmpGeneralInfoListModel(
      {bool? success, String? messageEn, String? messageBn, List<EmployeeGeneralInfoData>? data}) {
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
  List<EmployeeGeneralInfoData>? get data => _data;
  set data(List<EmployeeGeneralInfoData>? data) => _data = data;

  EmpGeneralInfoListModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <EmployeeGeneralInfoData>[];
      json['data'].forEach((v) {
        _data!.add(new EmployeeGeneralInfoData.fromJson(v));
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

class EmployeeGeneralInfoData {
  int? _employeeID;
  String? _employeeCode;
  String? _employeeName;
  String? _mobile;
  String? _fatherName;
  String? _motherName;
  String? _telephone;
  String? _email;
  String? _nationalID;
  String? _thanaName;
  String? _districtName;
  String? _permanentAddress;
  String? _presentAddress;
  String? _departmentName;
  String? _gradeName;
  String? _designationName;
  String? _siteCode;
  String? _siteName;
  String? _zoneCode;
  String? _zoneName;
  String? _locationCode;
  String? _locationName;
  String? _companyDivisionCode;
  String? _companyDivisionName;
  int? _basicSalary;
  String? _nextIncrementDate;
  String? _degreeName;
  String? _liabilityFriendlyName;
  String? _employeeNameNativeLang;
  String? _incharge;
  String? _latLng;
  bool? _viewRestricted;

  EmployeeGeneralInfoData(
      {int? employeeID,
        String? employeeCode,
        String? employeeName,
        String? mobile,
        String? fatherName,
        String? motherName,
        String? telephone,
        String? email,
        String? nationalID,
        String? thanaName,
        String? districtName,
        String? permanentAddress,
        String? presentAddress,
        String? departmentName,
        String? gradeName,
        String? designationName,
        String? siteCode,
        String? siteName,
        String? zoneCode,
        String? zoneName,
        String? locationCode,
        String? locationName,
        String? companyDivisionCode,
        String? companyDivisionName,
        int? basicSalary,
        String? nextIncrementDate,
        String? degreeName,
        String? liabilityFriendlyName,
        String? employeeNameNativeLang,
        String? incharge,
        String? latLng,
        bool? viewRestricted}) {
    if (employeeID != null) {
      this._employeeID = employeeID;
    }
    if (employeeCode != null) {
      this._employeeCode = employeeCode;
    }
    if (employeeName != null) {
      this._employeeName = employeeName;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (fatherName != null) {
      this._fatherName = fatherName;
    }
    if (motherName != null) {
      this._motherName = motherName;
    }
    if (telephone != null) {
      this._telephone = telephone;
    }
    if (email != null) {
      this._email = email;
    }
    if (nationalID != null) {
      this._nationalID = nationalID;
    }
    if (thanaName != null) {
      this._thanaName = thanaName;
    }
    if (districtName != null) {
      this._districtName = districtName;
    }
    if (permanentAddress != null) {
      this._permanentAddress = permanentAddress;
    }
    if (presentAddress != null) {
      this._presentAddress = presentAddress;
    }
    if (departmentName != null) {
      this._departmentName = departmentName;
    }
    if (gradeName != null) {
      this._gradeName = gradeName;
    }
    if (designationName != null) {
      this._designationName = designationName;
    }
    if (siteCode != null) {
      this._siteCode = siteCode;
    }
    if (siteName != null) {
      this._siteName = siteName;
    }
    if (zoneCode != null) {
      this._zoneCode = zoneCode;
    }
    if (zoneName != null) {
      this._zoneName = zoneName;
    }
    if (locationCode != null) {
      this._locationCode = locationCode;
    }
    if (locationName != null) {
      this._locationName = locationName;
    }
    if (companyDivisionCode != null) {
      this._companyDivisionCode = companyDivisionCode;
    }
    if (companyDivisionName != null) {
      this._companyDivisionName = companyDivisionName;
    }
    if (basicSalary != null) {
      this._basicSalary = basicSalary;
    }
    if (nextIncrementDate != null) {
      this._nextIncrementDate = nextIncrementDate;
    }
    if (degreeName != null) {
      this._degreeName = degreeName;
    }
    if (liabilityFriendlyName != null) {
      this._liabilityFriendlyName = liabilityFriendlyName;
    }
    if (employeeNameNativeLang != null) {
      this._employeeNameNativeLang = employeeNameNativeLang;
    }
    if (incharge != null) {
      this._incharge = incharge;
    }
    if (latLng != null) {
      this._latLng = latLng;
    }
    if (viewRestricted != null) {
      this._viewRestricted = viewRestricted;
    }
  }

  int? get employeeID => _employeeID;
  set employeeID(int? employeeID) => _employeeID = employeeID;
  String? get employeeCode => _employeeCode;
  set employeeCode(String? employeeCode) => _employeeCode = employeeCode;
  String? get employeeName => _employeeName;
  set employeeName(String? employeeName) => _employeeName = employeeName;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get fatherName => _fatherName;
  set fatherName(String? fatherName) => _fatherName = fatherName;
  String? get motherName => _motherName;
  set motherName(String? motherName) => _motherName = motherName;
  String? get telephone => _telephone;
  set telephone(String? telephone) => _telephone = telephone;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get nationalID => _nationalID;
  set nationalID(String? nationalID) => _nationalID = nationalID;
  String? get thanaName => _thanaName;
  set thanaName(String? thanaName) => _thanaName = thanaName;
  String? get districtName => _districtName;
  set districtName(String? districtName) => _districtName = districtName;
  String? get permanentAddress => _permanentAddress;
  set permanentAddress(String? permanentAddress) =>
      _permanentAddress = permanentAddress;
  String? get presentAddress => _presentAddress;
  set presentAddress(String? presentAddress) =>
      _presentAddress = presentAddress;
  String? get departmentName => _departmentName;
  set departmentName(String? departmentName) =>
      _departmentName = departmentName;
  String? get gradeName => _gradeName;
  set gradeName(String? gradeName) => _gradeName = gradeName;
  String? get designationName => _designationName;
  set designationName(String? designationName) =>
      _designationName = designationName;
  String? get siteCode => _siteCode;
  set siteCode(String? siteCode) => _siteCode = siteCode;
  String? get siteName => _siteName;
  set siteName(String? siteName) => _siteName = siteName;
  String? get zoneCode => _zoneCode;
  set zoneCode(String? zoneCode) => _zoneCode = zoneCode;
  String? get zoneName => _zoneName;
  set zoneName(String? zoneName) => _zoneName = zoneName;
  String? get locationCode => _locationCode;
  set locationCode(String? locationCode) => _locationCode = locationCode;
  String? get locationName => _locationName;
  set locationName(String? locationName) => _locationName = locationName;
  String? get companyDivisionCode => _companyDivisionCode;
  set companyDivisionCode(String? companyDivisionCode) =>
      _companyDivisionCode = companyDivisionCode;
  String? get companyDivisionName => _companyDivisionName;
  set companyDivisionName(String? companyDivisionName) =>
      _companyDivisionName = companyDivisionName;
  int? get basicSalary => _basicSalary;
  set basicSalary(int? basicSalary) => _basicSalary = basicSalary;
  String? get nextIncrementDate => _nextIncrementDate;
  set nextIncrementDate(String? nextIncrementDate) =>
      _nextIncrementDate = nextIncrementDate;
  String? get degreeName => _degreeName;
  set degreeName(String? degreeName) => _degreeName = degreeName;
  String? get liabilityFriendlyName => _liabilityFriendlyName;
  set liabilityFriendlyName(String? liabilityFriendlyName) =>
      _liabilityFriendlyName = liabilityFriendlyName;
  String? get employeeNameNativeLang => _employeeNameNativeLang;
  set employeeNameNativeLang(String? employeeNameNativeLang) =>
      _employeeNameNativeLang = employeeNameNativeLang;
  String? get incharge => _incharge;
  set incharge(String? incharge) => _incharge = incharge;
  String? get latLng => _latLng;
  set latLng(String? latLng) => _latLng = latLng;
  bool? get viewRestricted => _viewRestricted;
  set viewRestricted(bool? viewRestricted) => _viewRestricted = viewRestricted;

  EmployeeGeneralInfoData.fromJson(Map<String, dynamic> json) {
    _employeeID = json['employeeID'];
    _employeeCode = json['employeeCode'];
    _employeeName = json['employeeName'];
    _mobile = json['mobile'];
    _fatherName = json['fatherName'];
    _motherName = json['motherName'];
    _telephone = json['telephone'];
    _email = json['email'];
    _nationalID = json['nationalID'];
    _thanaName = json['thanaName'];
    _districtName = json['districtName'];
    _permanentAddress = json['permanentAddress'];
    _presentAddress = json['presentAddress'];
    _departmentName = json['departmentName'];
    _gradeName = json['gradeName'];
    _designationName = json['designationName'];
    _siteCode = json['siteCode'];
    _siteName = json['siteName'];
    _zoneCode = json['zoneCode'];
    _zoneName = json['zoneName'];
    _locationCode = json['locationCode'];
    _locationName = json['locationName'];
    _companyDivisionCode = json['companyDivisionCode'];
    _companyDivisionName = json['companyDivisionName'];
    _basicSalary = json['basicSalary'];
    _nextIncrementDate = json['nextIncrementDate'];
    _degreeName = json['degreeName'];
    _liabilityFriendlyName = json['liabilityFriendlyName'];
    _employeeNameNativeLang = json['employeeNameNativeLang'];
    _incharge = json['incharge'];
    _latLng = json['latLng'];
    _viewRestricted = json['viewRestricted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeID'] = this._employeeID;
    data['employeeCode'] = this._employeeCode;
    data['employeeName'] = this._employeeName;
    data['mobile'] = this._mobile;
    data['fatherName'] = this._fatherName;
    data['motherName'] = this._motherName;
    data['telephone'] = this._telephone;
    data['email'] = this._email;
    data['nationalID'] = this._nationalID;
    data['thanaName'] = this._thanaName;
    data['districtName'] = this._districtName;
    data['permanentAddress'] = this._permanentAddress;
    data['presentAddress'] = this._presentAddress;
    data['departmentName'] = this._departmentName;
    data['gradeName'] = this._gradeName;
    data['designationName'] = this._designationName;
    data['siteCode'] = this._siteCode;
    data['siteName'] = this._siteName;
    data['zoneCode'] = this._zoneCode;
    data['zoneName'] = this._zoneName;
    data['locationCode'] = this._locationCode;
    data['locationName'] = this._locationName;
    data['companyDivisionCode'] = this._companyDivisionCode;
    data['companyDivisionName'] = this._companyDivisionName;
    data['basicSalary'] = this._basicSalary;
    data['nextIncrementDate'] = this._nextIncrementDate;
    data['degreeName'] = this._degreeName;
    data['liabilityFriendlyName'] = this._liabilityFriendlyName;
    data['employeeNameNativeLang'] = this._employeeNameNativeLang;
    data['incharge'] = this._incharge;
    data['latLng'] = this._latLng;
    data['viewRestricted'] = this._viewRestricted;
    return data;
  }
}*/



class EmpGeneralInfoListModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<EmployeeGeneralInfoData>? _data =[];

  EmpGeneralInfoListModel(
      {bool? success, String? messageEn, String? messageBn, List<EmployeeGeneralInfoData>? data}) {
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
  List<EmployeeGeneralInfoData>? get data => _data;
  set data(List<EmployeeGeneralInfoData>? data) => _data = data;

  EmpGeneralInfoListModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <EmployeeGeneralInfoData>[];
      json['data'].forEach((v) {
        _data!.add(new EmployeeGeneralInfoData.fromJson(v));
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

class EmployeeGeneralInfoData {
  int? _employeeID;
  String? _employeeCode;
  String? _employeeName;
  String? _selFMOBILE;
  String? _corporatEMOBILE;
  String? _fatherName;
  String? _motherName;
  String? _telephone;
  String? _email;
  String? _nationalID;
  String? _thanaName;
  String? _districtName;
  String? _permanentAddress;
  String? _presentAddress;
  String? _departmentName;
  String? _gradeName;
  String? _designationName;
  String? _siteCode;
  String? _siteName;
  String? _zoneCode;
  String? _zoneName;
  String? _locationCode;
  String? _locationName;
  String? _companyDivisionCode;
  String? _companyDivisionName;
  int? _basicSalary;
  String? _nextIncrementDate;
  String? _degreeName;
  String? _liabilityFriendlyName;
  String? _employeeNameNativeLang;
  String? _incharge;
  String? _emplatlang;
  int? _viewRestricted;
  String? _bloodGroup;
  String? _age;
  String? _serviceAge;
  String? _workstatioNTENURE;
  String? _zonETENURE;
  String? _currentBranchDistance;
  String? _currenTSITELATLANG;
  String? _employeeStatus;

  EmployeeGeneralInfoData(
      {int? employeeID,
        String? employeeCode,
        String? employeeName,
        String? selFMOBILE,
        String? corporatEMOBILE,
        String? fatherName,
        String? motherName,
        Null? telephone,
        String? email,
        String? nationalID,
        String? thanaName,
        String? districtName,
        String? permanentAddress,
        Null? presentAddress,
        String? departmentName,
        String? gradeName,
        String? designationName,
        String? siteCode,
        String? siteName,
        String? zoneCode,
        String? zoneName,
        String? locationCode,
        String? locationName,
        String? companyDivisionCode,
        String? companyDivisionName,
        int? basicSalary,
        String? nextIncrementDate,
        String? degreeName,
        String? liabilityFriendlyName,
        String? employeeNameNativeLang,
        String? incharge,
        String? emplatlang,
        int? viewRestricted,
        String? bloodGroup,
        String? age,
        String? serviceAge,
        String? workstatioNTENURE,
        String? zonETENURE,
        String? currentBranchDistance,
        String? currenTSITELATLANG,
        String? employeeStatus}) {
    if (employeeID != null) {
      this._employeeID = employeeID;
    }
    if (employeeCode != null) {
      this._employeeCode = employeeCode;
    }
    if (employeeName != null) {
      this._employeeName = employeeName;
    }
    if (selFMOBILE != null) {
      this._selFMOBILE = selFMOBILE;
    }
    if (corporatEMOBILE != null) {
      this._corporatEMOBILE = corporatEMOBILE;
    }
    if (fatherName != null) {
      this._fatherName = fatherName;
    }
    if (motherName != null) {
      this._motherName = motherName;
    }
    if (telephone != null) {
      this._telephone = telephone;
    }
    if (email != null) {
      this._email = email;
    }
    if (nationalID != null) {
      this._nationalID = nationalID;
    }
    if (thanaName != null) {
      this._thanaName = thanaName;
    }
    if (districtName != null) {
      this._districtName = districtName;
    }
    if (permanentAddress != null) {
      this._permanentAddress = permanentAddress;
    }
    if (presentAddress != null) {
      this._presentAddress = presentAddress;
    }
    if (departmentName != null) {
      this._departmentName = departmentName;
    }
    if (gradeName != null) {
      this._gradeName = gradeName;
    }
    if (designationName != null) {
      this._designationName = designationName;
    }
    if (siteCode != null) {
      this._siteCode = siteCode;
    }
    if (siteName != null) {
      this._siteName = siteName;
    }
    if (zoneCode != null) {
      this._zoneCode = zoneCode;
    }
    if (zoneName != null) {
      this._zoneName = zoneName;
    }
    if (locationCode != null) {
      this._locationCode = locationCode;
    }
    if (locationName != null) {
      this._locationName = locationName;
    }
    if (companyDivisionCode != null) {
      this._companyDivisionCode = companyDivisionCode;
    }
    if (companyDivisionName != null) {
      this._companyDivisionName = companyDivisionName;
    }
    if (basicSalary != null) {
      this._basicSalary = basicSalary;
    }
    if (nextIncrementDate != null) {
      this._nextIncrementDate = nextIncrementDate;
    }
    if (degreeName != null) {
      this._degreeName = degreeName;
    }
    if (liabilityFriendlyName != null) {
      this._liabilityFriendlyName = liabilityFriendlyName;
    }
    if (employeeNameNativeLang != null) {
      this._employeeNameNativeLang = employeeNameNativeLang;
    }
    if (incharge != null) {
      this._incharge = incharge;
    }
    if (emplatlang != null) {
      this._emplatlang = emplatlang;
    }
    if (viewRestricted != null) {
      this._viewRestricted = viewRestricted;
    }
    if (bloodGroup != null) {
      this._bloodGroup = bloodGroup;
    }
    if (age != null) {
      this._age = age;
    }
    if (serviceAge != null) {
      this._serviceAge = serviceAge;
    }
    if (workstatioNTENURE != null) {
      this._workstatioNTENURE = workstatioNTENURE;
    }
    if (zonETENURE != null) {
      this._zonETENURE = zonETENURE;
    }
    if (currentBranchDistance != null) {
      this._currentBranchDistance = currentBranchDistance;
    }
    if (currenTSITELATLANG != null) {
      this._currenTSITELATLANG = currenTSITELATLANG;
    }
    if (employeeStatus != null) {
      this._employeeStatus = employeeStatus;
    }
  }

  int? get employeeID => _employeeID;
  set employeeID(int? employeeID) => _employeeID = employeeID;
  String? get employeeCode => _employeeCode;
  set employeeCode(String? employeeCode) => _employeeCode = employeeCode;
  String? get employeeName => _employeeName;
  set employeeName(String? employeeName) => _employeeName = employeeName;
  String? get selFMOBILE => _selFMOBILE;
  set selFMOBILE(String? selFMOBILE) => _selFMOBILE = selFMOBILE;
  String? get corporatEMOBILE => _corporatEMOBILE;
  set corporatEMOBILE(String? corporatEMOBILE) =>
      _corporatEMOBILE = corporatEMOBILE;
  String? get fatherName => _fatherName;
  set fatherName(String? fatherName) => _fatherName = fatherName;
  String? get motherName => _motherName;
  set motherName(String? motherName) => _motherName = motherName;
  String? get telephone => _telephone;
  set telephone(String? telephone) => _telephone = telephone;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get nationalID => _nationalID;
  set nationalID(String? nationalID) => _nationalID = nationalID;
  String? get thanaName => _thanaName;
  set thanaName(String? thanaName) => _thanaName = thanaName;
  String? get districtName => _districtName;
  set districtName(String? districtName) => _districtName = districtName;
  String? get permanentAddress => _permanentAddress;
  set permanentAddress(String? permanentAddress) =>
      _permanentAddress = permanentAddress;
  String? get presentAddress => _presentAddress;
  set presentAddress(String? presentAddress) => _presentAddress = presentAddress;
  String? get departmentName => _departmentName;
  set departmentName(String? departmentName) =>
      _departmentName = departmentName;
  String? get gradeName => _gradeName;
  set gradeName(String? gradeName) => _gradeName = gradeName;
  String? get designationName => _designationName;
  set designationName(String? designationName) =>
      _designationName = designationName;
  String? get siteCode => _siteCode;
  set siteCode(String? siteCode) => _siteCode = siteCode;
  String? get siteName => _siteName;
  set siteName(String? siteName) => _siteName = siteName;
  String? get zoneCode => _zoneCode;
  set zoneCode(String? zoneCode) => _zoneCode = zoneCode;
  String? get zoneName => _zoneName;
  set zoneName(String? zoneName) => _zoneName = zoneName;
  String? get locationCode => _locationCode;
  set locationCode(String? locationCode) => _locationCode = locationCode;
  String? get locationName => _locationName;
  set locationName(String? locationName) => _locationName = locationName;
  String? get companyDivisionCode => _companyDivisionCode;
  set companyDivisionCode(String? companyDivisionCode) =>
      _companyDivisionCode = companyDivisionCode;
  String? get companyDivisionName => _companyDivisionName;
  set companyDivisionName(String? companyDivisionName) =>
      _companyDivisionName = companyDivisionName;
  int? get basicSalary => _basicSalary;
  set basicSalary(int? basicSalary) => _basicSalary = basicSalary;
  String? get nextIncrementDate => _nextIncrementDate;
  set nextIncrementDate(String? nextIncrementDate) =>
      _nextIncrementDate = nextIncrementDate;
  String? get degreeName => _degreeName;
  set degreeName(String? degreeName) => _degreeName = degreeName;
  String? get liabilityFriendlyName => _liabilityFriendlyName;
  set liabilityFriendlyName(String? liabilityFriendlyName) =>
      _liabilityFriendlyName = liabilityFriendlyName;
  String? get employeeNameNativeLang => _employeeNameNativeLang;
  set employeeNameNativeLang(String? employeeNameNativeLang) =>
      _employeeNameNativeLang = employeeNameNativeLang;
  String? get incharge => _incharge;
  set incharge(String? incharge) => _incharge = incharge;
  String? get emplatlang => _emplatlang;
  set emplatlang(String? emplatlang) => _emplatlang = emplatlang;
  int? get viewRestricted => _viewRestricted;
  set viewRestricted(int? viewRestricted) => _viewRestricted = viewRestricted;
  String? get bloodGroup => _bloodGroup;
  set bloodGroup(String? bloodGroup) => _bloodGroup = bloodGroup;
  String? get age => _age;
  set age(String? age) => _age = age;
  String? get serviceAge => _serviceAge;
  set serviceAge(String? serviceAge) => _serviceAge = serviceAge;
  String? get workstatioNTENURE => _workstatioNTENURE;
  set workstatioNTENURE(String? workstatioNTENURE) =>
      _workstatioNTENURE = workstatioNTENURE;
  String? get zonETENURE => _zonETENURE;
  set zonETENURE(String? zonETENURE) => _zonETENURE = zonETENURE;
  String? get currentBranchDistance => _currentBranchDistance;
  set currentBranchDistance(String? currentBranchDistance) =>
      _currentBranchDistance = currentBranchDistance;
  String? get currenTSITELATLANG => _currenTSITELATLANG;
  set currenTSITELATLANG(String? currenTSITELATLANG) =>
      _currenTSITELATLANG = currenTSITELATLANG;
  String? get employeeStatus => _employeeStatus;
  set employeeStatus(String? employeeStatus) =>
      _employeeStatus = employeeStatus;

  EmployeeGeneralInfoData.fromJson(Map<String, dynamic> json) {
    _employeeID = json['employeeID'];
    _employeeCode = json['employeeCode'];
    _employeeName = json['employeeName'];
    _selFMOBILE = json['selF_MOBILE'];
    _corporatEMOBILE = json['corporatE_MOBILE'];
    _fatherName = json['fatherName'];
    _motherName = json['motherName'];
    _telephone = json['telephone'];
    _email = json['email'];
    _nationalID = json['nationalID'];
    _thanaName = json['thanaName'];
    _districtName = json['districtName'];
    _permanentAddress = json['permanentAddress'];
    _presentAddress = json['presentAddress'];
    _departmentName = json['departmentName'];
    _gradeName = json['gradeName'];
    _designationName = json['designationName'];
    _siteCode = json['siteCode'];
    _siteName = json['siteName'];
    _zoneCode = json['zoneCode'];
    _zoneName = json['zoneName'];
    _locationCode = json['locationCode'];
    _locationName = json['locationName'];
    _companyDivisionCode = json['companyDivisionCode'];
    _companyDivisionName = json['companyDivisionName'];
    _basicSalary = json['basicSalary'];
    _nextIncrementDate = json['nextIncrementDate'];
    _degreeName = json['degreeName'];
    _liabilityFriendlyName = json['liabilityFriendlyName'];
    _employeeNameNativeLang = json['employeeNameNativeLang'];
    _incharge = json['incharge'];
    _emplatlang = json['emplatlang'];
    _viewRestricted = json['viewRestricted'];
    _bloodGroup = json['bloodGroup'];
    _age = json['age'];
    _serviceAge = json['serviceAge'];
    _workstatioNTENURE = json['workstatioN_TENURE'];
    _zonETENURE = json['zonE_TENURE'];
    _currentBranchDistance = json['currentBranchDistance'];
    _currenTSITELATLANG = json['currenT_SITE_LATLANG'];
    _employeeStatus = json['employeeStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeID'] = this._employeeID;
    data['employeeCode'] = this._employeeCode;
    data['employeeName'] = this._employeeName;
    data['selF_MOBILE'] = this._selFMOBILE;
    data['corporatE_MOBILE'] = this._corporatEMOBILE;
    data['fatherName'] = this._fatherName;
    data['motherName'] = this._motherName;
    data['telephone'] = this._telephone;
    data['email'] = this._email;
    data['nationalID'] = this._nationalID;
    data['thanaName'] = this._thanaName;
    data['districtName'] = this._districtName;
    data['permanentAddress'] = this._permanentAddress;
    data['presentAddress'] = this._presentAddress;
    data['departmentName'] = this._departmentName;
    data['gradeName'] = this._gradeName;
    data['designationName'] = this._designationName;
    data['siteCode'] = this._siteCode;
    data['siteName'] = this._siteName;
    data['zoneCode'] = this._zoneCode;
    data['zoneName'] = this._zoneName;
    data['locationCode'] = this._locationCode;
    data['locationName'] = this._locationName;
    data['companyDivisionCode'] = this._companyDivisionCode;
    data['companyDivisionName'] = this._companyDivisionName;
    data['basicSalary'] = this._basicSalary;
    data['nextIncrementDate'] = this._nextIncrementDate;
    data['degreeName'] = this._degreeName;
    data['liabilityFriendlyName'] = this._liabilityFriendlyName;
    data['employeeNameNativeLang'] = this._employeeNameNativeLang;
    data['incharge'] = this._incharge;
    data['emplatlang'] = this._emplatlang;
    data['viewRestricted'] = this._viewRestricted;
    data['bloodGroup'] = this._bloodGroup;
    data['age'] = this._age;
    data['serviceAge'] = this._serviceAge;
    data['workstatioN_TENURE'] = this._workstatioNTENURE;
    data['zonE_TENURE'] = this._zonETENURE;
    data['currentBranchDistance'] = this._currentBranchDistance;
    data['currenT_SITE_LATLANG'] = this._currenTSITELATLANG;
    data['employeeStatus'] = this._employeeStatus;
    return data;
  }
}



class GeneralInfoSearchFilterModel {
  String? _employeeCode;
  int? _pageNumber;
  int? _pageSize;



  int? _employeeType;
  int? _departmentID;
  int? _locationID;
  int? _siteID;
  String? _companyCode;
  int? _designationID;
  int? _gradeID;
  String? _costCenterCode;
  int? _functionID;
  int? _zoneID;
  int? _divisionLocationID;
  String? _bloodGroup;
  String? _gender;
  String? _districtName;
  int? _thanaID;
  int? _serviceAgeFrom;
  int? _serviceAgeTo;
  int? _empAgeFrom;
  int? _empAgeTo;
  String? _siteCode;
  String? _siteName;
  String? _employeeName;
  int? _liabilityID;
  String? _religion;
  int? _addLiabilityID;
  DateTime? _addLiabilityDateFrom;
  DateTime? _addLiabilityDateTo;
  String? _mobile;
  int? _companyDivisionID;
  String? _jobStatus;

  GeneralInfoSearchFilterModel({
    String? employeeCode,
    int? pageNumber,
    int? pageSize,
    int? employeeType,
    int? departmentID,
    int? locationID,
    int? siteID,
    String? companyCode,
    int? designationID,
    int? gradeID,
    String? costCenterCode,
    int? functionID,
    int? zoneID,
    int? divisionLocationID,
    String? bloodGroup,
    String? gender,
    String? districtName,
    int? thanaID,
    int? serviceAgeFrom,
    int? serviceAgeTo,
    int? empAgeFrom,
    int? empAgeTo,
    String? siteCode,
    String? siteName,
    String? employeeName,
    int? liabilityID,
    String? religion,
    int? addLiabilityID,
    DateTime? addLiabilityDateFrom,
    DateTime? addLiabilityDateTo,
    String? mobile,
    int? companyDivisionID,
    String? jobStatus,
  })  : _employeeCode = employeeCode,
        _pageNumber = pageNumber,
        _pageSize = pageSize,
        _employeeType = employeeType,
        _departmentID = departmentID,
        _locationID = locationID,
        _siteID = siteID,
        _companyCode = companyCode,
        _designationID = designationID,
        _gradeID = gradeID,
        _costCenterCode = costCenterCode,
        _functionID = functionID,
        _zoneID = zoneID,
        _divisionLocationID = divisionLocationID,
        _bloodGroup = bloodGroup,
        _gender = gender,
        _districtName = districtName,
        _thanaID = thanaID,
        _serviceAgeFrom = serviceAgeFrom,
        _serviceAgeTo = serviceAgeTo,
        _empAgeFrom = empAgeFrom,
        _empAgeTo = empAgeTo,
        _siteCode = siteCode,
        _siteName = siteName,
        _employeeName = employeeName,
        _liabilityID = liabilityID,
        _religion = religion,
        _addLiabilityID = addLiabilityID,
        _addLiabilityDateFrom = addLiabilityDateFrom,
        _addLiabilityDateTo = addLiabilityDateTo,
        _mobile = mobile,
        _companyDivisionID = companyDivisionID,
        _jobStatus = jobStatus;

  // Getters & Setters
  String? get employeeCode => _employeeCode;
  set employeeCode(String? value) => _employeeCode = value;

  int? get employeeType => _employeeType;
  set employeeType(int? value) => _employeeType = value;

  int? get departmentID => _departmentID;
  set departmentID(int? value) => _departmentID = value;

  int? get locationID => _locationID;
  set locationID(int? value) => _locationID = value;

  int? get siteID => _siteID;
  set siteID(int? value) => _siteID = value;

  String? get companyCode => _companyCode;
  set companyCode(String? value) => _companyCode = value;

  int? get designationID => _designationID;
  set designationID(int? value) => _designationID = value;

  int? get gradeID => _gradeID;
  set gradeID(int? value) => _gradeID = value;

  String? get costCenterCode => _costCenterCode;
  set costCenterCode(String? value) => _costCenterCode = value;

  int? get functionID => _functionID;
  set functionID(int? value) => _functionID = value;

  int? get zoneID => _zoneID;
  set zoneID(int? value) => _zoneID = value;

  int? get divisionLocationID => _divisionLocationID;
  set divisionLocationID(int? value) => _divisionLocationID = value;

  String? get bloodGroup => _bloodGroup;
  set bloodGroup(String? value) => _bloodGroup = value;

  String? get gender => _gender;
  set gender(String? value) => _gender = value;

  String? get districtName => _districtName;
  set districtName(String? value) => _districtName = value;

  int? get thanaID => _thanaID;
  set thanaID(int? value) => _thanaID = value;

  int? get serviceAgeFrom => _serviceAgeFrom;
  set serviceAgeFrom(int? value) => _serviceAgeFrom = value;

  int? get serviceAgeTo => _serviceAgeTo;
  set serviceAgeTo(int? value) => _serviceAgeTo = value;

  int? get empAgeFrom => _empAgeFrom;
  set empAgeFrom(int? value) => _empAgeFrom = value;

  int? get empAgeTo => _empAgeTo;
  set empAgeTo(int? value) => _empAgeTo = value;

  String? get siteCode => _siteCode;
  set siteCode(String? value) => _siteCode = value;

  String? get siteName => _siteName;
  set siteName(String? value) => _siteName = value;

  String? get employeeName => _employeeName;
  set employeeName(String? value) => _employeeName = value;

  int? get liabilityID => _liabilityID;
  set liabilityID(int? value) => _liabilityID = value;

  String? get religion => _religion;
  set religion(String? value) => _religion = value;

  int? get addLiabilityID => _addLiabilityID;
  set addLiabilityID(int? value) => _addLiabilityID = value;

  DateTime? get addLiabilityDateFrom => _addLiabilityDateFrom;
  set addLiabilityDateFrom(DateTime? value) => _addLiabilityDateFrom = value;

  DateTime? get addLiabilityDateTo => _addLiabilityDateTo;
  set addLiabilityDateTo(DateTime? value) => _addLiabilityDateTo = value;

  String? get mobile => _mobile;
  set mobile(String? value) => _mobile = value;

  int? get companyDivisionID => _companyDivisionID;
  set companyDivisionID(int? value) => _companyDivisionID = value;

  String? get jobStatus => _jobStatus;
  set jobStatus(String? value) => _jobStatus = value;

  int? get pageSize => _pageSize;

  set pageSize(int? value) {
    _pageSize = value;
  }


  int? get pageNumber => _pageNumber;

  set pageNumber(int? value) {
    _pageNumber = value;
  }
}


