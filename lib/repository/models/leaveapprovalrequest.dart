class ApprovalRequestForLeave {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<Data>? _data = [];

  ApprovalRequestForLeave(
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

  ApprovalRequestForLeave.fromJson(Map<String, dynamic> json) {
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
  String? _applicant;
  String? _designation;
  String? _workStation;
  String? _applieddate;
  String? _duration;
  String? _comments;
  String? _leavetypeName;
  int? _remaining;
  int? _requestId;
  List<ApprovalActivitiesList>? _approvalActivitiesList;

  Data(
      {String? applicant,
        String? designation,
        String? workStation,
        String? applieddate,
        String? duration,
        String? comments,
        String? leavetypeName,
        int? remaining,
        int? requestId,
        List<ApprovalActivitiesList>? approvalActivitiesList}) {
    if (applicant != null) {
      this._applicant = applicant;
    }
    if (designation != null) {
      this._designation = designation;
    }
    if (workStation != null) {
      this._workStation = workStation;
    }
    if (applieddate != null) {
      this._applieddate = applieddate;
    }
    if (duration != null) {
      this._duration = duration;
    }
    if (comments != null) {
      this._comments = comments;
    }
    if (leavetypeName != null) {
      this._leavetypeName = leavetypeName;
    }
    if (remaining != null) {
      this._remaining = remaining;
    }
    if (requestId != null) {
      this._requestId = requestId;
    }
    if (approvalActivitiesList != null) {
      this._approvalActivitiesList = approvalActivitiesList;
    }
  }

  String? get applicant => _applicant;
  set applicant(String? applicant) => _applicant = applicant;
  String? get designation => _designation;
  set designation(String? designation) => _designation = designation;
  String? get workStation => _workStation;
  set workStation(String? workStation) => _workStation = workStation;
  String? get applieddate => _applieddate;
  set applieddate(String? applieddate) => _applieddate = applieddate;
  String? get duration => _duration;
  set duration(String? duration) => _duration = duration;
  String? get comments => _comments;
  set comments(String? comments) => _comments = comments;
  String? get leavetypeName => _leavetypeName;
  set leavetypeName(String? leavetypeName) => _leavetypeName = leavetypeName;
  int? get remaining => _remaining;
  set remaining(int? remaining) => _remaining = remaining;
  int? get requestId => _requestId;
  set requestId(int? requestId) => _requestId = requestId;
  List<ApprovalActivitiesList>? get approvalActivitiesList =>
      _approvalActivitiesList;
  set approvalActivitiesList(
      List<ApprovalActivitiesList>? approvalActivitiesList) =>
      _approvalActivitiesList = approvalActivitiesList;

  Data.fromJson(Map<String, dynamic> json) {
    _applicant = json['applicant'];
    _designation = json['designation'];
    _workStation = json['workStation'];
    _applieddate = json['applieddate'];
    _duration = json['duration'];
    _comments = json['comments'];
    _leavetypeName = json['leavetypeName'];
    _remaining = json['remaining'];
    _requestId = json['requestId'];
    if (json['approvalActivitiesList'] != null) {
      _approvalActivitiesList = <ApprovalActivitiesList>[];
      json['approvalActivitiesList'].forEach((v) {
        _approvalActivitiesList!.add(new ApprovalActivitiesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicant'] = this._applicant;
    data['designation'] = this._designation;
    data['workStation'] = this._workStation;
    data['applieddate'] = this._applieddate;
    data['duration'] = this._duration;
    data['comments'] = this._comments;
    data['leavetypeName'] = this._leavetypeName;
    data['remaining'] = this._remaining;
    data['requestId'] = this._requestId;
    if (this._approvalActivitiesList != null) {
      data['approvalActivitiesList'] =
          this._approvalActivitiesList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApprovalActivitiesList {
  int? _leaveactivityid;
  String? _activityfriendlyname;

  ApprovalActivitiesList({int? leaveactivityid, String? activityfriendlyname}) {
    if (leaveactivityid != null) {
      this._leaveactivityid = leaveactivityid;
    }
    if (activityfriendlyname != null) {
      this._activityfriendlyname = activityfriendlyname;
    }
  }

  int? get leaveactivityid => _leaveactivityid;
  set leaveactivityid(int? leaveactivityid) =>
      _leaveactivityid = leaveactivityid;
  String? get activityfriendlyname => _activityfriendlyname;
  set activityfriendlyname(String? activityfriendlyname) =>
      _activityfriendlyname = activityfriendlyname;

  ApprovalActivitiesList.fromJson(Map<String, dynamic> json) {
    _leaveactivityid = json['leaveactivityid'];
    _activityfriendlyname = json['activityfriendlyname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaveactivityid'] = this._leaveactivityid;
    data['activityfriendlyname'] = this._activityfriendlyname;
    return data;
  }
}


