class RemainingLeaveInfo {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<RemainingLeaveInfoData>? _data = [];

  RemainingLeaveInfo(
      {bool? success, String? messageEn, String? messageBn, List<RemainingLeaveInfoData>? data}) {
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
  List<RemainingLeaveInfoData>? get data => _data;
  set data(List<RemainingLeaveInfoData>? data) => _data = data;

  RemainingLeaveInfo.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <RemainingLeaveInfoData>[];
      json['data'].forEach((v) {
        _data!.add(new RemainingLeaveInfoData.fromJson(v));
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

class RemainingLeaveInfoData {
  String? _employeeCode;
  String? _employeeName;
  int? _employeeId;
  int? _departmentId;
  int? _leaveTypeId;
  String? _leaveTypeName;
  dynamic _eligible;
  dynamic _parking;
  dynamic _taken;
  dynamic _remaining;
  int? _elqId;
  int? _lcdetailsId;

  RemainingLeaveInfoData(
      {String? employeeCode,
        String? employeeName,
        int? employeeId,
        int? departmentId,
        int? leaveTypeId,
        String? leaveTypeName,
        dynamic eligible,
        dynamic parking,
        dynamic taken,
        dynamic remaining,
        int? elqId,
        int? lcdetailsId}) {
    if (employeeCode != null) {
      this._employeeCode = employeeCode;
    }
    if (employeeName != null) {
      this._employeeName = employeeName;
    }
    if (employeeId != null) {
      this._employeeId = employeeId;
    }
    if (departmentId != null) {
      this._departmentId = departmentId;
    }
    if (leaveTypeId != null) {
      this._leaveTypeId = leaveTypeId;
    }
    if (leaveTypeName != null) {
      this._leaveTypeName = leaveTypeName;
    }
    if (eligible != null) {
      this._eligible = eligible;
    }
    if (parking != null) {
      this._parking = parking;
    }
    if (taken != null) {
      this._taken = taken;
    }
    if (remaining != null) {
      this._remaining = remaining;
    }
    if (elqId != null) {
      this._elqId = elqId;
    }
    if (lcdetailsId != null) {
      this._lcdetailsId = lcdetailsId;
    }
  }

  String? get employeeCode => _employeeCode;
  set employeeCode(String? employeeCode) => _employeeCode = employeeCode;
  String? get employeeName => _employeeName;
  set employeeName(String? employeeName) => _employeeName = employeeName;
  int? get employeeId => _employeeId;
  set employeeId(int? employeeId) => _employeeId = employeeId;
  int? get departmentId => _departmentId;
  set departmentId(int? departmentId) => _departmentId = departmentId;
  int? get leaveTypeId => _leaveTypeId;
  set leaveTypeId(int? leaveTypeId) => _leaveTypeId = leaveTypeId;
  String? get leaveTypeName => _leaveTypeName;
  set leaveTypeName(String? leaveTypeName) => _leaveTypeName = leaveTypeName;
  dynamic get eligible => _eligible;
  set eligible(dynamic eligible) => _eligible = eligible;
  dynamic get parking => _parking;
  set parking(dynamic parking) => _parking = parking;
  dynamic get taken => _taken;
  set taken(dynamic taken) => _taken = taken;
  dynamic get remaining => _remaining;
  set remaining(dynamic remaining) => _remaining = remaining;
  int? get elqId => _elqId;
  set elqId(int? elqId) => _elqId = elqId;
  int? get lcdetailsId => _lcdetailsId;
  set lcdetailsId(int? lcdetailsId) => _lcdetailsId = lcdetailsId;

  RemainingLeaveInfoData.fromJson(Map<String, dynamic> json) {
    _employeeCode = json['employeeCode'];
    _employeeName = json['employeeName'];
    _employeeId = json['employeeId'];
    _departmentId = json['departmentId'];
    _leaveTypeId = json['leaveTypeId'];
    _leaveTypeName = json['leaveTypeName'];
    _eligible = json['eligible'];
    _parking = json['parking'];
    _taken = json['taken'];
    _remaining = json['remaining'];
    _elqId = json['elqId'];
    _lcdetailsId = json['lcdetailsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeCode'] = this._employeeCode;
    data['employeeName'] = this._employeeName;
    data['employeeId'] = this._employeeId;
    data['departmentId'] = this._departmentId;
    data['leaveTypeId'] = this._leaveTypeId;
    data['leaveTypeName'] = this._leaveTypeName;
    data['eligible'] = this._eligible;
    data['parking'] = this._parking;
    data['taken'] = this._taken;
    data['remaining'] = this._remaining;
    data['elqId'] = this._elqId;
    data['lcdetailsId'] = this._lcdetailsId;
    return data;
  }
}
