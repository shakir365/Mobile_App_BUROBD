class SelfMyRequest {
  late bool _success;
  late String _messageEn;
  late String _messageBn;
  late List<SelfMyRequestData> _data =[];

  SelfMyRequest(
      {required bool success, required String messageEn, required String messageBn, required List<SelfMyRequestData> data}) {
    this._success = success;
    this._messageEn = messageEn;
    this._messageBn = messageBn;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  String get messageEn => _messageEn;
  set messageEn(String messageEn) => _messageEn = messageEn;
  String get messageBn => _messageBn;
  set messageBn(String messageBn) => _messageBn = messageBn;
  List<SelfMyRequestData> get data => _data;
  set data(List<SelfMyRequestData> data) => _data = data;

  SelfMyRequest.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(new SelfMyRequestData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SelfMyRequestData {
  late int _requestId;
  late String _applieddate;
  late String _duration;
  late String _workStation;
  late String? _requestHolder;
  late String _approvalStatus;
  late bool _ableToCancel;

  Data(
      {required int requestId,
        required String applieddate,
        required String duration,
        required String workStation,
        required String? requestHolder,
        required String approvalStatus,
        required bool ableToCancel}) 
        
  {
    this._requestId = requestId;
    this._applieddate = applieddate;
    this._duration = duration;
    this._workStation = workStation;
    this._requestHolder = requestHolder;
    this._approvalStatus = approvalStatus;
    this._ableToCancel = ableToCancel;
  }

  int get requestId => _requestId;
  set requestId(int requestId) => _requestId = requestId;
  String get applieddate => _applieddate;
  set applieddate(String applieddate) => _applieddate = applieddate;
  String get duration => _duration;
  set duration(String duration) => _duration = duration;
  String get workStation => _workStation;
  set workStation(String workStation) => _workStation = workStation;
  String? get requestHolder => _requestHolder;
  set requestHolder(String? requestHolder) => _requestHolder = requestHolder;
  String get approvalStatus => _approvalStatus;
  set approvalStatus(String approvalStatus) => _approvalStatus = approvalStatus;
  bool get ableToCancel => _ableToCancel;
  set ableToCancel(bool ableToCancel) => _ableToCancel = ableToCancel;

  SelfMyRequestData.fromJson(Map<String, dynamic> json) {
    _requestId = json['requestId'];
    _applieddate = json['applieddate'];
    _duration = json['duration'];
    _workStation = json['workStation'];
    _requestHolder = json['requestHolder'];
    _approvalStatus = json['approvalStatus'];
    _ableToCancel = json['ableToCancel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestId'] = this._requestId;
    data['applieddate'] = this._applieddate;
    data['duration'] = this._duration;
    data['workStation'] = this._workStation;
    data['requestHolder'] = this._requestHolder;
    data['approvalStatus'] = this._approvalStatus;
    data['ableToCancel'] = this._ableToCancel;
    return data;
  }
}

