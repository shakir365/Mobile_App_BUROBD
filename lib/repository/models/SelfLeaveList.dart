class SelfLeaveList {
  String? applicant;
  String? designation;
  String? workStation;
  String? applieddate;
  String? duration;
  String? comments;
  String? leavetypeName;
  int? remaining;
  int? requestId;
  List<ApprovalActivitiesList>? approvalActivitiesList = [];

  SelfLeaveList(
      {this.applicant,
      this.designation,
      this.workStation,
      this.applieddate,
      this.duration,
      this.comments,
      this.leavetypeName,
      this.remaining,
      this.requestId,
      this.approvalActivitiesList});

  SelfLeaveList.fromJson(Map<String, dynamic> json) {
    applicant = json['applicant'];
    designation = json['designation'];
    workStation = json['workStation'];
    applieddate = json['applieddate'];
    duration = json['duration'];
    comments = json['comments'];
    leavetypeName = json['leavetypeName'];
    remaining = json['remaining'];
    requestId = json['requestId'];
    if (json['approvalActivitiesList'] != null) {
      approvalActivitiesList = <ApprovalActivitiesList>[];
      json['approvalActivitiesList'].forEach((v) {
        approvalActivitiesList!.add(new ApprovalActivitiesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> SelfLeaveList = new Map<String, dynamic>();
    SelfLeaveList['applicant'] = this.applicant;
    SelfLeaveList['designation'] = this.designation;
    SelfLeaveList['workStation'] = this.workStation;
    SelfLeaveList['applieddate'] = this.applieddate;
    SelfLeaveList['duration'] = this.duration;
    SelfLeaveList['comments'] = this.comments;
    SelfLeaveList['leavetypeName'] = this.leavetypeName;
    SelfLeaveList['remaining'] = this.remaining;
    SelfLeaveList['requestId'] = this.requestId;
    if (this.approvalActivitiesList != null) {
      SelfLeaveList['approvalActivitiesList'] =
          this.approvalActivitiesList!.map((v) => v.toJson()).toList();
    }
    return SelfLeaveList;
  }
}

class ApprovalActivitiesList {
  int? leaveactivityid;
  String? activityfriendlyname;

  ApprovalActivitiesList({this.leaveactivityid, this.activityfriendlyname});

  ApprovalActivitiesList.fromJson(Map<String, dynamic> json) {
    leaveactivityid = json['leaveactivityid'];
    activityfriendlyname = json['activityfriendlyname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> SelfLeaveList = new Map<String, dynamic>();
    SelfLeaveList['leaveactivityid'] = this.leaveactivityid;
    SelfLeaveList['activityfriendlyname'] = this.activityfriendlyname;
    return SelfLeaveList;
  }
}