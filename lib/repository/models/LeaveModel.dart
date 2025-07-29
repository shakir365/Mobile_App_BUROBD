import 'package:meta/meta.dart';
import 'dart:convert';

List<LeaveModel> LeaveModelFromJson(String str) =>
    List<LeaveModel>.from(json.decode(str).map((x) => LeaveModel.fromJson(x)));

// String LeaveModelToJson(List<LeaveModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
String LeaveModelToJson(LeaveModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

class LeaveModel {
  LeaveModel(
      {
        // required this.id,
      required this.leave_type,   // "leavetypeId": 106,
      required this.leave_fromDate,//"beginDate": "2022-03-24",
      required this.leave_toDate,// "endDate": "2022-03-25",
      // required this.leave_totalDuration,
      required this.leave_reasonForLeave,  //"Reason": "API",

      required this.leave_addressAll, // "destination": "Home",
      required this.country_id,      // "countryID": 16,
      required this.division_id,  // "divisionID": 1,
      required this.district_id,  // "districtID": 41
      // required this.city_id

      });

  // int id;
  int leave_type;
  String leave_fromDate;
  String leave_toDate;

  // String leave_totalDuration;

  String leave_reasonForLeave;
  String leave_addressAll;
  int country_id;
  int division_id;
  int district_id;
  // String city_id;

  factory LeaveModel.fromJson(Map<String, dynamic> json) => LeaveModel(
      // id: json["id"],
      leave_type: json["leave_type"],
      leave_fromDate: json["leave_fromDate"],
      leave_toDate: json["leave_toDate"],
      // leave_totalDuration: json["leave_totalDuration"],
      leave_reasonForLeave: json["leave_reasonForLeave"],
      leave_addressAll: json["leave_addressAll"],
      country_id: json["country_id"],
      division_id: json["division_id"],
      district_id: json["district_id"],
      // city_id: json["city_id"]
      );

  Map<String, dynamic> toJson() => {
        "leave_type": leave_type,
        "leave_fromDate": leave_fromDate,
        "leave_toDate": leave_toDate,
        // "leave_totalDuration": leave_totalDuration,
        "leave_reasonForLeave": leave_reasonForLeave,
        "leave_addressAll": leave_addressAll,
        "country_id": country_id,
        "division_id": division_id,
        "district_id": district_id,
        // "city_id": city_id
      };
}












class LeaveApproveList {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ApproveLeaveData> _data = [];
  LeaveApproveList(      {bool? success, String? messageEn, String? messageBn, List<ApproveLeaveData>? data}) {
    if (success != null) {
      this._success = success;
    }    if (messageEn != null) {
      this._messageEn = messageEn;
    }    if (messageBn != null) {
      this._messageBn = messageBn;
    }    if (data != null) {
      this._data = data;
    }  }
  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get messageEn => _messageEn;
  set messageEn(String? messageEn) => _messageEn = messageEn;
  String? get messageBn => _messageBn;
  set messageBn(String? messageBn) => _messageBn = messageBn;
  List<ApproveLeaveData> get data => _data;
  set data(List<ApproveLeaveData> data) => _data = data;
  LeaveApproveList.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ApproveLeaveData>[];      json['data'].forEach((v) {
        _data.add(new ApproveLeaveData.fromJson(v));
      });    }  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }    return data;
  }
}
class ApproveLeaveData {
  String? _applicant;
  String? _designation;
  String? _workStation;
  String? _applieddate;
  String? _duration;
  String? _comments;
  String? _leavetypeName;
  int? _remaining;
  int? _requestId;
  int? _attachmentInfoId;



  List<ApprovalActivitiesList>? _approvalActivitiesList;
  ApproveLeaveData(      {String? applicant,
    String? designation,
    String? workStation,
    String? applieddate,
    String? duration,
    String? comments,
    String? leavetypeName,
    int? remaining,
    int? requestId,
    int? attachmentInfoId,
    List<ApprovalActivitiesList>? approvalActivitiesList}) {
    if (applicant != null) {
      this._applicant = applicant;
    }    if (designation != null) {
      this._designation = designation;
    }    if (workStation != null) {
      this._workStation = workStation;
    }    if (applieddate != null) {
      this._applieddate = applieddate;
    }    if (duration != null) {
      this._duration = duration;
    }    if (comments != null) {
      this._comments = comments;
    }    if (leavetypeName != null) {
      this._leavetypeName = leavetypeName;
    }    if (remaining != null) {
      this._remaining = remaining;
    }    if (requestId != null) {
      this._requestId = requestId;
    }

    if (attachmentInfoId != null) {
      this._attachmentInfoId = attachmentInfoId;
    }

    if (approvalActivitiesList != null) {
      this._approvalActivitiesList = approvalActivitiesList;
    }  }
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

  int? get attachmentInfoId => _attachmentInfoId;

  set attachmentInfoId(int? value) =>_attachmentInfoId = value;

  List<ApprovalActivitiesList>? get approvalActivitiesList =>
      _approvalActivitiesList;  set approvalActivitiesList(
      List<ApprovalActivitiesList>? approvalActivitiesList) =>
      _approvalActivitiesList = approvalActivitiesList;
  ApproveLeaveData.fromJson(Map<String, dynamic> json) {
    _applicant = json['applicant'];
    _designation = json['designation'];
    _workStation = json['workStation'];
    _applieddate = json['applieddate'];
    _duration = json['duration'];
    _comments = json['comments'];
    _leavetypeName = json['leavetypeName'];
    _remaining = json['remaining'];
    _requestId = json['requestId'];
    _attachmentInfoId = json['attachmentInfoId'];
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
    data['attachmentInfoId'] = this._attachmentInfoId;
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


class PendingLeaveData {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<PendingLeaveApprovalData> _data = [];

  PendingLeaveData(
      {bool? success, String? messageEn, String? messageBn, List<PendingLeaveApprovalData>? data}) {
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
  List<PendingLeaveApprovalData> get data => _data;
  set data(List<PendingLeaveApprovalData> data) => _data = data;

  PendingLeaveData.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <PendingLeaveApprovalData>[];
      json['data'].forEach((v) {
        _data.add(new PendingLeaveApprovalData.fromJson(v));
      });
    }else {
      _data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    } else {
      data['data'];
    }
    return data;
  }
}
class PendingLeaveApprovalData {
  String? _applicant;
  String? _designation;
  String? _workStation;
  String? _applieddate;
  String? _duration;
  String? _comments;
  String? _leavetypeName;
  int? _remaining;
  int? _requestId;
  String? _applicationHolder;
  List<PendingApprovalActivitiesList>? _approvalActivitiesList;

  PendingLeaveApprovalData(
      {String? applicant,
        String? designation,
        String? workStation,
        String? applieddate,
        String? duration,
        String? comments,
        String? leavetypeName,
        int? remaining,
        int? requestId,
        String? applicationHolder,
        List<PendingApprovalActivitiesList>? approvalActivitiesList}) {
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
    if (applicationHolder != null) {
      this._applicationHolder = applicationHolder;
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
  String? get applicationHolder => _applicationHolder;
  set applicationHolder(String? applicationHolder) =>
      _applicationHolder = applicationHolder;
  List<PendingApprovalActivitiesList>? get approvalActivitiesList =>
      _approvalActivitiesList;
  set approvalActivitiesList(
      List<PendingApprovalActivitiesList>? approvalActivitiesList) =>
      _approvalActivitiesList = approvalActivitiesList;

  PendingLeaveApprovalData.fromJson(Map<String, dynamic> json) {
    _applicant = json['applicant'];
    _designation = json['designation'];
    _workStation = json['workStation'];
    _applieddate = json['applieddate'];
    _duration = json['duration'];
    _comments = json['comments'];
    _leavetypeName = json['leavetypeName'];
    _remaining = json['remaining'];
    _requestId = json['requestId'];
    _applicationHolder = json['applicationHolder'];
    if (json['approvalActivitiesList'] != null) {
      _approvalActivitiesList = <PendingApprovalActivitiesList>[];
      json['approvalActivitiesList'].forEach((v) {
        _approvalActivitiesList!.add(new PendingApprovalActivitiesList.fromJson(v));
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
    data['applicationHolder'] = this._applicationHolder;
    if (this._approvalActivitiesList != null) {
      data['approvalActivitiesList'] =
          this._approvalActivitiesList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class PendingApprovalActivitiesList {
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

  PendingApprovalActivitiesList.fromJson(Map<String, dynamic> json) {
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

class LeaveHistoryModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<LeaveHistoryModelData> _data = [];
  int? _status;

  LeaveHistoryModel(
      {bool? success,
        String? messageEn,
        String? messageBn,
        List<LeaveHistoryModelData>? data,
        int? status}) {
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
    if (status != null) {
      this._status = status;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get messageEn => _messageEn;
  set messageEn(String? messageEn) => _messageEn = messageEn;
  String? get messageBn => _messageBn;
  set messageBn(String? messageBn) => _messageBn = messageBn;
  List<LeaveHistoryModelData> get data => _data;
  set data(List<LeaveHistoryModelData> data) => _data = data;
  int? get status => _status;
  set status(int? status) => _status = status;

  LeaveHistoryModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <LeaveHistoryModelData>[];
      json['data'].forEach((v) {
        _data.add(new LeaveHistoryModelData.fromJson(v));
      });
    } else {
      _data = [];
    }
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    } else {
      data['data'] = [];
    }
    data['status'] = this._status;
    return data;
  }
}

class LeaveHistoryModelData {
  String? _employeeID;
  String? _applicant;
  String? _gradeName;
  String? _designationName;
  String? _siteName;
  String? _leavetypeName;
  String? _appliedDate;
  String? _duration;
  String? _mailingAddress;
  String? _leaveRequestComments;
  String? _leaveRequestID;
  String? _leaveTypeID;
  String? _receivedUserID;
  String? _requestStatus;
  String? _remaining;

  LeaveHistoryModelData(
      {String? employeeID,
        String? applicant,
        String? gradeName,
        String? designationName,
        String? siteName,
        String? leavetypeName,
        String? appliedDate,
        String? duration,
        String? mailingAddress,
        String? leaveRequestComments,
        String? leaveRequestID,
        String? leaveTypeID,
        String? receivedUserID,
        String? requestStatus,
        String? remaining}) {
    if (employeeID != null) {
      this._employeeID = employeeID;
    }
    if (applicant != null) {
      this._applicant = applicant;
    }
    if (gradeName != null) {
      this._gradeName = gradeName;
    }
    if (designationName != null) {
      this._designationName = designationName;
    }
    if (siteName != null) {
      this._siteName = siteName;
    }
    if (leavetypeName != null) {
      this._leavetypeName = leavetypeName;
    }
    if (appliedDate != null) {
      this._appliedDate = appliedDate;
    }
    if (duration != null) {
      this._duration = duration;
    }
    if (mailingAddress != null) {
      this._mailingAddress = mailingAddress;
    }
    if (leaveRequestComments != null) {
      this._leaveRequestComments = leaveRequestComments;
    }
    if (leaveRequestID != null) {
      this._leaveRequestID = leaveRequestID;
    }
    if (leaveTypeID != null) {
      this._leaveTypeID = leaveTypeID;
    }
    if (receivedUserID != null) {
      this._receivedUserID = receivedUserID;
    }
    if (requestStatus != null) {
      this._requestStatus = requestStatus;
    }
    if (remaining != null) {
      this._remaining = remaining;
    }
  }

  String? get employeeID => _employeeID;
  set employeeID(String? employeeID) => _employeeID = employeeID;
  String? get applicant => _applicant;
  set applicant(String? applicant) => _applicant = applicant;
  String? get gradeName => _gradeName;
  set gradeName(String? gradeName) => _gradeName = gradeName;
  String? get designationName => _designationName;
  set designationName(String? designationName) =>
      _designationName = designationName;
  String? get siteName => _siteName;
  set siteName(String? siteName) => _siteName = siteName;
  String? get leavetypeName => _leavetypeName;
  set leavetypeName(String? leavetypeName) => _leavetypeName = leavetypeName;
  String? get appliedDate => _appliedDate;
  set appliedDate(String? appliedDate) => _appliedDate = appliedDate;
  String? get duration => _duration;
  set duration(String? duration) => _duration = duration;
  String? get mailingAddress => _mailingAddress;
  set mailingAddress(String? mailingAddress) =>
      _mailingAddress = mailingAddress;
  String? get leaveRequestComments => _leaveRequestComments;
  set leaveRequestComments(String? leaveRequestComments) =>
      _leaveRequestComments = leaveRequestComments;
  String? get leaveRequestID => _leaveRequestID;
  set leaveRequestID(String? leaveRequestID) =>
      _leaveRequestID = leaveRequestID;
  String? get leaveTypeID => _leaveTypeID;
  set leaveTypeID(String? leaveTypeID) => _leaveTypeID = leaveTypeID;
  String? get receivedUserID => _receivedUserID;
  set receivedUserID(String? receivedUserID) =>
      _receivedUserID = receivedUserID;
  String? get requestStatus => _requestStatus;
  set requestStatus(String? requestStatus) => _requestStatus = requestStatus;
  String? get remaining => _remaining;
  set remaining(String? remaining) => _remaining = remaining;

  LeaveHistoryModelData.fromJson(Map<String, dynamic> json) {
    _employeeID = json['employeeID'];
    _applicant = json['applicant'];
    _gradeName = json['gradeName'];
    _designationName = json['designationName'];
    _siteName = json['siteName'];
    _leavetypeName = json['leavetypeName'];
    _appliedDate = json['appliedDate'];
    _duration = json['duration'];
    _mailingAddress = json['mailingAddress'];
    _leaveRequestComments = json['leaveRequestComments'];
    _leaveRequestID = json['leaveRequestID'];
    _leaveTypeID = json['leaveTypeID'];
    _receivedUserID = json['receivedUserID'];
    _requestStatus = json['requestStatus'];
    _remaining = json['remaining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeID'] = this._employeeID;
    data['applicant'] = this._applicant;
    data['gradeName'] = this._gradeName;
    data['designationName'] = this._designationName;
    data['siteName'] = this._siteName;
    data['leavetypeName'] = this._leavetypeName;
    data['appliedDate'] = this._appliedDate;
    data['duration'] = this._duration;
    data['mailingAddress'] = this._mailingAddress;
    data['leaveRequestComments'] = this._leaveRequestComments;
    data['leaveRequestID'] = this._leaveRequestID;
    data['leaveTypeID'] = this._leaveTypeID;
    data['receivedUserID'] = this._receivedUserID;
    data['requestStatus'] = this._requestStatus;
    data['remaining'] = this._remaining;
    return data;
  }
}




