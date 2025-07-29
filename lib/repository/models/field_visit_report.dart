class FieldVisitReport {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<FieldVisitReportData>? _data;

  FieldVisitReport(
      {bool? success, String? messageEn, String? messageBn, List<FieldVisitReportData>? data}) {
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
  List<FieldVisitReportData>? get data => _data;
  set data(List<FieldVisitReportData>? data) => _data = data;

  FieldVisitReport.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <FieldVisitReportData>[];
      json['data'].forEach((v) {
        _data!.add(new FieldVisitReportData.fromJson(v));
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

class FieldVisitReportData {
  int? _planId;
  int? _employeeId;
  String? _employeeCode;
  String? _employeeName;
  String? _designationName;
  String? _siteName;
  String? _siteCode;
  String? _startDate;
  String? _endDate;
  String? _places;
  String? _requestHolder;
  String? _activityName;
  bool? _ableToCancel;
  String? _reason;
  int? _receiverEmpId;

  FieldVisitReportData(
      {int? planId,
        int? employeeId,
        String? employeeCode,
        String? employeeName,
        String? designationName,
        String? siteName,
        String? siteCode,
        String? startDate,
        String? endDate,
        String? places,
        String? requestHolder,
        String? activityName,
        bool? ableToCancel,
        String? reason,
        int? receiverEmpId}) {
    if (planId != null) {
      this._planId = planId;
    }
    if (employeeId != null) {
      this._employeeId = employeeId;
    }
    if (employeeCode != null) {
      this._employeeCode = employeeCode;
    }
    if (employeeName != null) {
      this._employeeName = employeeName;
    }
    if (designationName != null) {
      this._designationName = designationName;
    }
    if (siteName != null) {
      this._siteName = siteName;
    }
    if (siteCode != null) {
      this._siteCode = siteCode;
    }
    if (startDate != null) {
      this._startDate = startDate;
    }
    if (endDate != null) {
      this._endDate = endDate;
    }
    if (places != null) {
      this._places = places;
    }
    if (requestHolder != null) {
      this._requestHolder = requestHolder;
    }
    if (activityName != null) {
      this._activityName = activityName;
    }
    if (ableToCancel != null) {
      this._ableToCancel = ableToCancel;
    }
    if (reason != null) {
      this._reason = reason;
    }
    if (receiverEmpId != null) {
      this._receiverEmpId = receiverEmpId;
    }
  }

  int? get planId => _planId;
  set planId(int? planId) => _planId = planId;
  int? get employeeId => _employeeId;
  set employeeId(int? employeeId) => _employeeId = employeeId;
  String? get employeeCode => _employeeCode;
  set employeeCode(String? employeeCode) => _employeeCode = employeeCode;
  String? get employeeName => _employeeName;
  set employeeName(String? employeeName) => _employeeName = employeeName;
  String? get designationName => _designationName;
  set designationName(String? designationName) =>
      _designationName = designationName;
  String? get siteName => _siteName;
  set siteName(String? siteName) => _siteName = siteName;
  String? get siteCode => _siteCode;
  set siteCode(String? siteCode) => _siteCode = siteCode;
  String? get startDate => _startDate;
  set startDate(String? startDate) => _startDate = startDate;
  String? get endDate => _endDate;
  set endDate(String? endDate) => _endDate = endDate;
  String? get places => _places;
  set places(String? places) => _places = places;
  String? get requestHolder => _requestHolder;
  set requestHolder(String? requestHolder) => _requestHolder = requestHolder;
  String? get activityName => _activityName;
  set activityName(String? activityName) => _activityName = activityName;
  bool? get ableToCancel => _ableToCancel;
  set ableToCancel(bool? ableToCancel) => _ableToCancel = ableToCancel;
  String? get reason => _reason;
  set reason(String? reason) => _reason = reason;
  int? get receiverEmpId => _receiverEmpId;
  set receiverEmpId(int? receiverEmpId) => _receiverEmpId = receiverEmpId;

  FieldVisitReportData.fromJson(Map<String, dynamic> json) {
    _planId = json['planId'];
    _employeeId = json['employeeId'];
    _employeeCode = json['employeeCode'];
    _employeeName = json['employeeName'];
    _designationName = json['designationName'];
    _siteName = json['siteName'];
    _siteCode = json['siteCode'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _places = json['places'];
    _requestHolder = json['requestHolder'];
    _activityName = json['activityName'];
    _ableToCancel = json['ableToCancel'];
    _reason = json['reason'];
    _receiverEmpId = json['receiverEmpId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['planId'] = this._planId;
    data['employeeId'] = this._employeeId;
    data['employeeCode'] = this._employeeCode;
    data['employeeName'] = this._employeeName;
    data['designationName'] = this._designationName;
    data['siteName'] = this._siteName;
    data['siteCode'] = this._siteCode;
    data['startDate'] = this._startDate;
    data['endDate'] = this._endDate;
    data['places'] = this._places;
    data['requestHolder'] = this._requestHolder;
    data['activityName'] = this._activityName;
    data['ableToCancel'] = this._ableToCancel;
    data['reason'] = this._reason;
    data['receiverEmpId'] = this._receiverEmpId;
    return data;
  }
}
