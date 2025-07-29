class ApaEmployeeList {
  late bool _success;
  late String _messageEn;
  late String _messageBn;
   List<EmployeeListData> _data = [];

  ApaEmployeeList(
      {required bool? success, required String? messageEn,required String? messageBn,required List<EmployeeListData>? data}) {
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
  set success(bool? success) => _success = success!;
  String? get messageEn => _messageEn;
  set messageEn(String? messageEn) => _messageEn = messageEn!;
  String? get messageBn => _messageBn;
  set messageBn(String? messageBn) => _messageBn = messageBn!;
  List<EmployeeListData>? get data => _data;
  set data(List<EmployeeListData>? data) => _data = data!;

  ApaEmployeeList.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <EmployeeListData>[];
      json['data'].forEach((v) {
        _data!.add(new EmployeeListData.fromJson(v));
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

class EmployeeListData {
  late String? _employeePin;
  late String? _employeeName;
  late String? _qsetName;
  late String? _designationName;
  late String? _siteName;
  late String? _joiningDate;
  late int? _qSetID;
  late int? _fiscalYear;
  late int? _qAssignID;
  late int? _qLastHistoryID;
  late int? _priority;

  EmployeeListData(
      {String? employeePin,
        String? employeeName,
        String? qsetName,
        String? designationName,
        String? siteName,
        String? joiningDate,
        int? qSetID,
        int? fiscalYear,
        int? qAssignID,
        int? qLastHistoryID,
        int? priority}) {
    if (employeePin != null) {
      this._employeePin = employeePin;
    }
    if (employeeName != null) {
      this._employeeName = employeeName;
    }
    if (qsetName != null) {
      this._qsetName = qsetName;
    }
    if (designationName != null) {
      this._designationName = designationName;
    }
    if (siteName != null) {
      this._siteName = siteName;
    }
    if (joiningDate != null) {
      this._joiningDate = joiningDate;
    }
    if (qSetID != null) {
      this._qSetID = qSetID;
    }
    if (fiscalYear != null) {
      this._fiscalYear = fiscalYear;
    }
    if (qAssignID != null) {
      this._qAssignID = qAssignID;
    }
    if (qLastHistoryID != null) {
      this._qLastHistoryID = qLastHistoryID;
    }
    if (priority != null) {
      this._priority = priority;
    }
  }

  String? get employeePin => _employeePin;
  set employeePin(String? employeePin) => _employeePin = employeePin;
  String? get employeeName => _employeeName;
  set employeeName(String? employeeName) => _employeeName = employeeName;
  String? get qsetName => _qsetName;
  set qsetName(String? qsetName) => _qsetName = qsetName;
  String? get designationName => _designationName;
  set designationName(String? designationName) =>
      _designationName = designationName;
  String? get siteName => _siteName;
  set siteName(String? siteName) => _siteName = siteName;
  String? get joiningDate => _joiningDate;
  set joiningDate(String? joiningDate) => _joiningDate = joiningDate;
  int? get qSetID => _qSetID;
  set qSetID(int? qSetID) => _qSetID = qSetID;
  int? get fiscalYear => _fiscalYear;
  set fiscalYear(int? fiscalYear) => _fiscalYear = fiscalYear;
  int? get qAssignID => _qAssignID;
  set qAssignID(int? qAssignID) => _qAssignID = qAssignID;
  int? get qLastHistoryID => _qLastHistoryID;
  set qLastHistoryID(int? qLastHistoryID) => _qLastHistoryID = qLastHistoryID;
  int? get priority => _priority;
  set priority(int? priority) => _priority = priority;

  EmployeeListData.fromJson(Map<String, dynamic> json) {
    _employeePin = json['employeePin'];
    _employeeName = json['employeeName'];
    _qsetName = json['qsetName'];
    _designationName = json['designationName'];
    _siteName = json['siteName'];
    _joiningDate = json['joiningDate'];
    _qSetID = json['qSetID'];
    _fiscalYear = json['fiscalYear'];
    _qAssignID = json['qAssignID'];
    _qLastHistoryID = json['qLastHistoryID'];
    _priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeePin'] = this._employeePin;
    data['employeeName'] = this._employeeName;
    data['qsetName'] = this._qsetName;
    data['designationName'] = this._designationName;
    data['siteName'] = this._siteName;
    data['joiningDate'] = this._joiningDate;
    data['qSetID'] = this._qSetID;
    data['fiscalYear'] = this._fiscalYear;
    data['qAssignID'] = this._qAssignID;
    data['qLastHistoryID'] = this._qLastHistoryID;
    data['priority'] = this._priority;
    return data;
  }
}


class ApaEmpBasicinfo {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<BasicInfoData>? _data = [];

  ApaEmpBasicinfo(
      {bool? success, String? messageEn, String? messageBn, List<BasicInfoData>? data}) {
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
  List<BasicInfoData>? get data => _data;
  set data(List<BasicInfoData>? data) => _data = data;

  ApaEmpBasicinfo.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <BasicInfoData>[];
      json['data'].forEach((v) {
        _data!.add(new BasicInfoData.fromJson(v));
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
class BasicInfoData {
  int? _empCode;
  int? _empId;
  String? _empName;
  String? _joinigDate;
  String? _email;
  String? _designation;
  String? _department;
  String? _sitename;
  int? _receiverempId;
  int? _senderempId;
  int? _qassignId;
  String? _lastincrementdate;
  String? _event;
  String? _qsetName;
  String? _degreeName;

  Data(
      {int? empCode,
        int? empId,
        String? empName,
        String? joinigDate,
        String? email,
        String? designation,
        String? department,
        String? sitename,
        int? receiverempId,
        int? senderempId,
        int? qassignId,
        String? lastincrementdate,
        String? event,
        String? qsetName,
        String? degreeName}) {
    if (empCode != null) {
      this._empCode = empCode;
    }
    if (empId != null) {
      this._empId = empId;
    }
    if (empName != null) {
      this._empName = empName;
    }
    if (joinigDate != null) {
      this._joinigDate = joinigDate;
    }
    if (email != null) {
      this._email = email;
    }
    if (designation != null) {
      this._designation = designation;
    }
    if (department != null) {
      this._department = department;
    }
    if (sitename != null) {
      this._sitename = sitename;
    }
    if (receiverempId != null) {
      this._receiverempId = receiverempId;
    }
    if (senderempId != null) {
      this._senderempId = senderempId;
    }
    if (qassignId != null) {
      this._qassignId = qassignId;
    }
    if (lastincrementdate != null) {
      this._lastincrementdate = lastincrementdate;
    }
    if (event != null) {
      this._event = event;
    }
    if (qsetName != null) {
      this._qsetName = qsetName;
    }
    if (degreeName != null) {
      this._degreeName = degreeName;
    }
  }

  int? get empCode => _empCode;
  set empCode(int? empCode) => _empCode = empCode;
  int? get empId => _empId;
  set empId(int? empId) => _empId = empId;
  String? get empName => _empName;
  set empName(String? empName) => _empName = empName;
  String? get joinigDate => _joinigDate;
  set joinigDate(String? joinigDate) => _joinigDate = joinigDate;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get designation => _designation;
  set designation(String? designation) => _designation = designation;
  String? get department => _department;
  set department(String? department) => _department = department;
  String? get sitename => _sitename;
  set sitename(String? sitename) => _sitename = sitename;
  int? get receiverempId => _receiverempId;
  set receiverempId(int? receiverempId) => _receiverempId = receiverempId;
  int? get senderempId => _senderempId;
  set senderempId(int? senderempId) => _senderempId = senderempId;
  int? get qassignId => _qassignId;
  set qassignId(int? qassignId) => _qassignId = qassignId;
  String? get lastincrementdate => _lastincrementdate;
  set lastincrementdate(String? lastincrementdate) =>
      _lastincrementdate = lastincrementdate;
  String? get event => _event;
  set event(String? event) => _event = event;
  String? get qsetName => _qsetName;
  set qsetName(String? qsetName) => _qsetName = qsetName;
  String? get degreeName => _degreeName;
  set degreeName(String? degreeName) => _degreeName = degreeName;

  BasicInfoData.fromJson(Map<String, dynamic> json) {
    _empCode = json['empCode'];
    _empId = json['empId'];
    _empName = json['empName'];
    _joinigDate = json['joinigDate'];
    _email = json['email'];
    _designation = json['designation'];
    _department = json['department'];
    _sitename = json['sitename'];
    _receiverempId = json['receiverempId'];
    _senderempId = json['senderempId'];
    _qassignId = json['qassignId'];
    _lastincrementdate = json['lastincrementdate'];
    _event = json['event'];
    _qsetName = json['qsetName'];
    _degreeName = json['degreeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empCode'] = this._empCode;
    data['empId'] = this._empId;
    data['empName'] = this._empName;
    data['joinigDate'] = this._joinigDate;
    data['email'] = this._email;
    data['designation'] = this._designation;
    data['department'] = this._department;
    data['sitename'] = this._sitename;
    data['receiverempId'] = this._receiverempId;
    data['senderempId'] = this._senderempId;
    data['qassignId'] = this._qassignId;
    data['lastincrementdate'] = this._lastincrementdate;
    data['event'] = this._event;
    data['qsetName'] = this._qsetName;
    data['degreeName'] = this._degreeName;
    return data;
  }
}


// class ApaEmpScore {
//   bool? _success;
//   String? _messageEn;
//   String? _messageBn;
//   List<EmpScoreData>? _data = [];
//
//   ApaEmpScore(
//       {bool? success, String? messageEn, String? messageBn, List<EmpScoreData>? data}) {
//     if (success != null) {
//       this._success = success;
//     }
//     if (messageEn != null) {
//       this._messageEn = messageEn;
//     }
//     if (messageBn != null) {
//       this._messageBn = messageBn;
//     }
//     if (data != null) {
//       this._data = data;
//     }
//   }
//
//   bool? get success => _success;
//   set success(bool? success) => _success = success;
//   String? get messageEn => _messageEn;
//   set messageEn(String? messageEn) => _messageEn = messageEn;
//   String? get messageBn => _messageBn;
//   set messageBn(String? messageBn) => _messageBn = messageBn;
//   List<EmpScoreData>? get data => _data;
//   set data(List<EmpScoreData>? data) => _data = data;
//
//   ApaEmpScore.fromJson(Map<String, dynamic> json) {
//     _success = json['success'];
//     _messageEn = json['messageEn'];
//     _messageBn = json['messageBn'];
//     if (json['data'] != null) {
//       _data = [];
//       json['data'].forEach((v) {
//         _data!.add(new EmpScoreData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this._success;
//     data['messageEn'] = this._messageEn;
//     data['messageBn'] = this._messageBn;
//     if (this._data != null) {
//       data['data'] = this._data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
// class EmpScoreData {
//   int? _orderwith;
//   int? _qSetId;
//   int? _quesionId;
//   int? _outofscore;
//   String? _title;
//   String? _description;
//   String? _ev1Score;
//   String? _ev2Score;
//   String? _ev3Score;
//   String? _ev4Score;
//   String? _ev5Score;
//   String? _ev6Score;
//   String? _ev7Score;
//   String? _ev8Score;
//   String? _ev9Score;
//   String? _ev10Score;
//
//   EmpScoreData(
//       {int? orderwith,
//         int? qSetId,
//         int? quesionId,
//         int? outofscore,
//         String? title,
//         String? description,
//         String? ev1Score,
//         String? ev2Score,
//         String? ev3Score,
//         String? ev4Score,
//         String? ev5Score,
//         String? ev6Score,
//         String? ev7Score,
//         String? ev8Score,
//         String? ev9Score,
//         String? ev10Score}) {
//     if (orderwith != null) {
//       this._orderwith = orderwith;
//     }
//     if (qSetId != null) {
//       this._qSetId = qSetId;
//     }
//     if (quesionId != null) {
//       this._quesionId = quesionId;
//     }
//     if (outofscore != null) {
//       this._outofscore = outofscore;
//     }
//     if (title != null) {
//       this._title = title;
//     }
//     if (description != null) {
//       this._description = description;
//     }
//     if (ev1Score != null) {
//       this._ev1Score = ev1Score;
//     }
//     if (ev2Score != null) {
//       this._ev2Score = ev2Score;
//     }
//     if (ev3Score != null) {
//       this._ev3Score = ev3Score;
//     }
//     if (ev4Score != null) {
//       this._ev4Score = ev4Score;
//     }
//     if (ev5Score != null) {
//       this._ev5Score = ev5Score;
//     }
//     if (ev6Score != null) {
//       this._ev6Score = ev6Score;
//     }
//     if (ev7Score != null) {
//       this._ev7Score = ev7Score;
//     }
//     if (ev8Score != null) {
//       this._ev8Score = ev8Score;
//     }
//     if (ev9Score != null) {
//       this._ev9Score = ev9Score;
//     }
//     if (ev10Score != null) {
//       this._ev10Score = ev10Score;
//     }
//   }
//
//   int? get orderwith => _orderwith;
//   set orderwith(int? orderwith) => _orderwith = orderwith;
//   int? get qSetId => _qSetId;
//   set qSetId(int? qSetId) => _qSetId = qSetId;
//   int? get quesionId => _quesionId;
//   set quesionId(int? quesionId) => _quesionId = quesionId;
//   int? get outofscore => _outofscore;
//   set outofscore(int? outofscore) => _outofscore = outofscore;
//   String? get title => _title;
//   set title(String? title) => _title = title;
//   String? get description => _description;
//   set description(String? description) => _description = description;
//   String? get ev1Score => _ev1Score;
//   set ev1Score(String? ev1Score) => _ev1Score = ev1Score;
//   String? get ev2Score => _ev2Score;
//   set ev2Score(String? ev2Score) => _ev2Score = ev2Score;
//   String? get ev3Score => _ev3Score;
//   set ev3Score(String? ev3Score) => _ev3Score = ev3Score;
//   String? get ev4Score => _ev4Score;
//   set ev4Score(String? ev4Score) => _ev4Score = ev4Score;
//   String? get ev5Score => _ev5Score;
//   set ev5Score(String? ev5Score) => _ev5Score = ev5Score;
//   String? get ev6Score => _ev6Score;
//   set ev6Score(String? ev6Score) => _ev6Score = ev6Score;
//   String? get ev7Score => _ev7Score;
//   set ev7Score(String? ev7Score) => _ev7Score = ev7Score;
//   String? get ev8Score => _ev8Score;
//   set ev8Score(String? ev8Score) => _ev8Score = ev8Score;
//   String? get ev9Score => _ev9Score;
//   set ev9Score(String? ev9Score) => _ev9Score = ev9Score;
//   String? get ev10Score => _ev10Score;
//   set ev10Score(String? ev10Score) => _ev10Score = ev10Score;
//
//   EmpScoreData.fromJson(Map<String, dynamic> json) {
//     _orderwith = json['orderwith'];
//     _qSetId = json['qSetId'];
//     _quesionId = json['quesionId'];
//     _outofscore = json['outofscore'];
//     _title = json['title'];
//     _description = json['description'];
//     _ev1Score = json['ev1Score'];
//     _ev2Score = json['ev2Score'];
//     _ev3Score = json['ev3Score'];
//     _ev4Score = json['ev4Score'];
//     _ev5Score = json['ev5Score'];
//     _ev6Score = json['ev6Score'];
//     _ev7Score = json['ev7Score'];
//     _ev8Score = json['ev8Score'];
//     _ev9Score = json['ev9Score'];
//     _ev10Score = json['ev10Score'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['orderwith'] = this._orderwith;
//     data['qSetId'] = this._qSetId;
//     data['quesionId'] = this._quesionId;
//     data['outofscore'] = this._outofscore;
//     data['title'] = this._title;
//     data['description'] = this._description;
//     data['ev1Score'] = this._ev1Score;
//     data['ev2Score'] = this._ev2Score;
//     data['ev3Score'] = this._ev3Score;
//     data['ev4Score'] = this._ev4Score;
//     data['ev5Score'] = this._ev5Score;
//     data['ev6Score'] = this._ev6Score;
//     data['ev7Score'] = this._ev7Score;
//     data['ev8Score'] = this._ev8Score;
//     data['ev9Score'] = this._ev9Score;
//     data['ev10Score'] = this._ev10Score;
//     return data;
//   }
// }





class ApaEmpScore {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<EmpScoreData>? _data;

  ApaEmpScore(
      {bool? success, String? messageEn, String? messageBn, List<EmpScoreData>? data}) {
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
  List<EmpScoreData>? get data => _data;
  set data(List<EmpScoreData>? data) => _data = data;

  ApaEmpScore.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data!.add(new EmpScoreData.fromJson(v));
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

class EmpScoreData {
  int? _orderwith;
  int? _qSetId;
  int? _quesionId;
  int? _outofscore;
  String? _title;
  String? _description;
  num? _evScore1;
  num? _evScore2;
  int? _evScore3;
  int? _evScore4;
  num? _evScore5;
  num? _evScore6;
  int? _evScore7;
  int? _evScore8;
  int? _evScore9;
  int? _evScore10;

  EmpScoreData(
      {int? orderwith,
        int? qSetId,
        int? quesionId,
        int? outofscore,
        String? title,
        String? description,
        num? evScore1,
        num? evScore2,
        int? evScore3,
        int? evScore4,
        num? evScore5,
        num? evScore6,
        int? evScore7,
        int? evScore8,
        int? evScore9,
        int? evScore10}) {
    if (orderwith != null) {
      this._orderwith = orderwith;
    }
    if (qSetId != null) {
      this._qSetId = qSetId;
    }
    if (quesionId != null) {
      this._quesionId = quesionId;
    }
    if (outofscore != null) {
      this._outofscore = outofscore;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (evScore1 != null) {
      this._evScore1 = evScore1;
    }
    if (evScore2 != null) {
      this._evScore2 = evScore2;
    }
    if (evScore3 != null) {
      this._evScore3 = evScore3;
    }
    if (evScore4 != null) {
      this._evScore4 = evScore4;
    }
    if (evScore5 != null) {
      this._evScore5 = evScore5;
    }
    if (evScore6 != null) {
      this._evScore6 = evScore6;
    }
    if (evScore7 != null) {
      this._evScore7 = evScore7;
    }
    if (evScore8 != null) {
      this._evScore8 = evScore8;
    }
    if (evScore9 != null) {
      this._evScore9 = evScore9;
    }
    if (evScore10 != null) {
      this._evScore10 = evScore10;
    }
  }

  int? get orderwith => _orderwith;
  set orderwith(int? orderwith) => _orderwith = orderwith;
  int? get qSetId => _qSetId;
  set qSetId(int? qSetId) => _qSetId = qSetId;
  int? get quesionId => _quesionId;
  set quesionId(int? quesionId) => _quesionId = quesionId;
  int? get outofscore => _outofscore;
  set outofscore(int? outofscore) => _outofscore = outofscore;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  num? get evScore1 => _evScore1;
  set evScore1(num? evScore1) => _evScore1 = evScore1;
  num? get evScore2 => _evScore2;
  set evScore2(num? evScore2) => _evScore2 = evScore2;
  int? get evScore3 => _evScore3;
  set evScore3(int? evScore3) => _evScore3 = evScore3;
  int? get evScore4 => _evScore4;
  set evScore4(int? evScore4) => _evScore4 = evScore4;
  num? get evScore5 => _evScore5;
  set evScore5(num? evScore5) => _evScore5 = evScore5;
  num? get evScore6 => _evScore6;
  set evScore6(num? evScore6) => _evScore6 = evScore6;
  int? get evScore7 => _evScore7;
  set evScore7(int? evScore7) => _evScore7 = evScore7;
  int? get evScore8 => _evScore8;
  set evScore8(int? evScore8) => _evScore8 = evScore8;
  int? get evScore9 => _evScore9;
  set evScore9(int? evScore9) => _evScore9 = evScore9;
  int? get evScore10 => _evScore10;
  set evScore10(int? evScore10) => _evScore10 = evScore10;

  EmpScoreData.fromJson(Map<String, dynamic> json) {
    _orderwith = json['orderwith'];
    _qSetId = json['qSetId'];
    _quesionId = json['quesionId'];
    _outofscore = json['outofscore'];
    _title = json['title'];
    _description = json['description'];
    _evScore1 = json['evScore1'];
    _evScore2 = json['evScore2'];
    _evScore3 = json['evScore3'];
    _evScore4 = json['evScore4'];
    _evScore5 = json['evScore5'];
    _evScore6 = json['evScore6'];
    _evScore7 = json['evScore7'];
    _evScore8 = json['evScore8'];
    _evScore9 = json['evScore9'];
    _evScore10 = json['evScore10'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderwith'] = this._orderwith;
    data['qSetId'] = this._qSetId;
    data['quesionId'] = this._quesionId;
    data['outofscore'] = this._outofscore;
    data['title'] = this._title;
    data['description'] = this._description;
    data['evScore1'] = this._evScore1;
    data['evScore2'] = this._evScore2;
    data['evScore3'] = this._evScore3;
    data['evScore4'] = this._evScore4;
    data['evScore5'] = this._evScore5;
    data['evScore6'] = this._evScore6;
    data['evScore7'] = this._evScore7;
    data['evScore8'] = this._evScore8;
    data['evScore9'] = this._evScore9;
    data['evScore10'] = this._evScore10;
    return data;
  }
}

class GetEmpScore{

  late int qassignId;
  late int quesionSetId ;
  late int fiscalyear ;

  GetEmpScore(this.qassignId, this.quesionSetId, this.fiscalyear);
}
class ApaSupervisorComment {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<SuperCommentData>? _data;

  ApaSupervisorComment(
      {bool? success, String? messageEn, String? messageBn, List<SuperCommentData>? data}) {
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
  List<SuperCommentData>? get data => _data;
  set data(List<SuperCommentData>? data) => _data = data;

  ApaSupervisorComment.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <SuperCommentData>[];
      json['data'].forEach((v) {
        _data!.add(new SuperCommentData.fromJson(v));
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
class SuperCommentData {
  int? _historyId;
  String? _userComment;

  SuperCommentData({int? historyId, String? userComment}) {
    if (historyId != null) {
      this._historyId = historyId;
    }
    if (userComment != null) {
      this._userComment = userComment;
    }
  }

  int? get historyId => _historyId;
  set historyId(int? historyId) => _historyId = historyId;
  String? get userComment => _userComment;
  set userComment(String? userComment) => _userComment = userComment;

  SuperCommentData.fromJson(Map<String, dynamic> json) {
    _historyId = json['historyId'];
    _userComment = json['userComment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['historyId'] = this._historyId;
    data['userComment'] = this._userComment;
    return data;
  }
}
class EmpTargetScore {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<EmpTargetData>? _data;

  EmpTargetScore(
      {bool? success, String? messageEn, String? messageBn, List<EmpTargetData>? data}) {
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
  List<EmpTargetData>? get data => _data;
  set data(List<EmpTargetData>? data) => _data = data;

  EmpTargetScore.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <EmpTargetData>[];
      json['data'].forEach((v) {
        _data!.add(new EmpTargetData.fromJson(v));
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

class EmpTargetData {
  int? _atargetId;
  int? _aorderWith;
  String? _aDescriptionBn;
  int? _atarget;
  num? _aqthTarget;
  num? _aEarned;
  int? _aparcentage;
  num? _ascore;
  int? _aisrequired;

  EmpTargetData(
      {int? atargetId,
        int? aorderWith,
        String? aDescriptionBn,
        int? atarget,
        int? aqthTarget,
        int? aEarned,
        int? aparcentage,
        num? ascore,
        int? aisrequired}) {
    if (atargetId != null) {
      this._atargetId = atargetId;
    }
    if (aorderWith != null) {
      this._aorderWith = aorderWith;
    }
    if (aDescriptionBn != null) {
      this._aDescriptionBn = aDescriptionBn;
    }
    if (atarget != null) {
      this._atarget = atarget;
    }
    if (aqthTarget != null) {
      this._aqthTarget = aqthTarget;
    }
    if (aEarned != null) {
      this._aEarned = aEarned;
    }
    if (aparcentage != null) {
      this._aparcentage = aparcentage;
    }
    if (ascore != null) {
      this._ascore = ascore;
    }
    if (aisrequired != null) {
      this._aisrequired = aisrequired;
    }
  }

  int? get atargetId => _atargetId;
  set atargetId(int? atargetId) => _atargetId = atargetId;
  int? get aorderWith => _aorderWith;
  set aorderWith(int? aorderWith) => _aorderWith = aorderWith;
  String? get aDescriptionBn => _aDescriptionBn;
  set aDescriptionBn(String? aDescriptionBn) =>
      _aDescriptionBn = aDescriptionBn;
  int? get atarget => _atarget;
  set atarget(int? atarget) => _atarget = atarget;
  num? get aqthTarget => _aqthTarget;
  set aqthTarget(num? aqthTarget) => _aqthTarget = aqthTarget;
  num? get aEarned => _aEarned;
  set aEarned(num? aEarned) => _aEarned = aEarned;
  int? get aparcentage => _aparcentage;
  set aparcentage(int? aparcentage) => _aparcentage = aparcentage;
  num? get ascore => _ascore;
  set ascore(num? ascore) => _ascore = ascore;
  int? get aisrequired => _aisrequired;
  set aisrequired(int? aisrequired) => _aisrequired = aisrequired;

  EmpTargetData.fromJson(Map<String, dynamic> json) {
    _atargetId = json['atargetId'];
    _aorderWith = json['aorderWith'];
    _aDescriptionBn = json['aDescriptionBn'];
    _atarget = json['atarget'];
    _aqthTarget = json['aqthTarget'];
    _aEarned = json['aEarned'];
    _aparcentage = json['aparcentage'];
    _ascore = json['ascore'];
    _aisrequired = json['aisrequired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['atargetId'] = this._atargetId;
    data['aorderWith'] = this._aorderWith;
    data['aDescriptionBn'] = this._aDescriptionBn;
    data['atarget'] = this._atarget;
    data['aqthTarget'] = this._aqthTarget;
    data['aEarned'] = this._aEarned;
    data['aparcentage'] = this._aparcentage;
    data['ascore'] = this._ascore;
    data['aisrequired'] = this._aisrequired;
    return data;
  }
}

class EmpLeaveHistory {
  late bool _success;
  late String _messageEn;
  late String _messageBn;
  List<LeaveHistoryData> _data = [];

  EmpLeaveHistory(
      {required bool success, required String messageEn, required String messageBn, required List<LeaveHistoryData> data}) {
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
  List<LeaveHistoryData> get data => _data;
  set data(List<LeaveHistoryData> data) => _data = data;

  EmpLeaveHistory.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(new LeaveHistoryData.fromJson(v));
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
class LeaveHistoryData {
 late  int _historyId;
 late String? _leaveComments;
 late  String? _reasonforleave;
  late String? _duration;
  late String? _daterange;

  LeaveHistoryData(
      { required int historyId,
        required String? leaveComments,
        required String? reasonforleave,
        required String? duration,
        required String? daterange}) {
    this._historyId = historyId;
    this._leaveComments = leaveComments;
    this._reasonforleave = reasonforleave;
    this._duration = duration;
    this._daterange = daterange;
  }

  int get historyId => _historyId;
  set historyId(int historyId) => _historyId = historyId;
 String? get leaveComments => _leaveComments;
  set leaveComments(String? leaveComments) => _leaveComments = leaveComments;
 String? get reasonforleave => _reasonforleave;
  set reasonforleave(String? reasonforleave) => _reasonforleave = reasonforleave;
 String? get duration => _duration;
  set duration(String? duration) => _duration = duration;
 String? get daterange => _daterange;
  set daterange(String? daterange) => _daterange = daterange;

  LeaveHistoryData.fromJson(Map<String, dynamic> json) {
    _historyId = json['historyId'];
    _leaveComments = json['leaveComments'];
    _reasonforleave = json['reasonforleave'];
    _duration = json['duration'];
    _daterange = json['daterange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['historyId'] = this._historyId;
    data['leaveComments'] = this._leaveComments;
    data['reasonforleave'] = this._reasonforleave;
    data['duration'] = this._duration;
    data['daterange'] = this._daterange;
    return data;
  }
}
class EmpCommentHistory {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<CommentHisData>? _data;

  EmpCommentHistory(
      {bool? success, String? messageEn, String? messageBn, List<CommentHisData>? data}) {
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
  List<CommentHisData>? get data => _data;
  set data(List<CommentHisData>? data) => _data = data;

  EmpCommentHistory.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <CommentHisData>[];
      json['data'].forEach((v) {
        _data!.add(new CommentHisData.fromJson(v));
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
class CommentHisData {
  int? _historyId;
  int? _priority;
  String? _commenttitle;
  String? _comments;

  Data(
      {int? historyId, int? priority, String? commenttitle, String? comments}) {
    if (historyId != null) {
      this._historyId = historyId;
    }
    if (priority != null) {
      this._priority = priority;
    }
    if (commenttitle != null) {
      this._commenttitle = commenttitle;
    }
    if (comments != null) {
      this._comments = comments;
    }
  }

  int? get historyId => _historyId;
  set historyId(int? historyId) => _historyId = historyId;
  int? get priority => _priority;
  set priority(int? priority) => _priority = priority;
  String? get commenttitle => _commenttitle;
  set commenttitle(String? commenttitle) => _commenttitle = commenttitle;
  String? get comments => _comments;
  set comments(String? comments) => _comments = comments;

  CommentHisData.fromJson(Map<String, dynamic> json) {
    _historyId = json['historyId'];
    _priority = json['priority'];
    _commenttitle = json['commenttitle'];
    _comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['historyId'] = this._historyId;
    data['priority'] = this._priority;
    data['commenttitle'] = this._commenttitle;
    data['comments'] = this._comments;
    return data;
  }
}
class EmpRecomHistory {
 late bool _success;
 late String _messageEn;
 late String _messageBn;
 late List<RecomHisData> _data;

  EmpRecomHistory(
      {required bool success, required String messageEn, required String messageBn, required List<RecomHisData> data}) {
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
  List<RecomHisData> get data => _data;
  set data(List<RecomHisData> data) => _data = data;

  EmpRecomHistory.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(new RecomHisData.fromJson(v));
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
class RecomHisData {
  late int _recomId;
  late String? _lockedRecomId;
  late String? _recomDescriptionBn;
  late int _isMendatory;
  late int _commentMendatory;
  late String? _datatype;
  late int _orderwith;
  late String? _ev1Score;
  late String? _ev2Score;
  late String? _ev3Score;
  late String? _ev4Score;
  late String? _ev5Score;
  late String? _ev6Score;
  late String? _ev7Score;
  late String? _ev8Score;
  late String? _ev9Score;
  late String? _ev10Score;

  RecomHisData(
      {required int recomId,
        required  String lockedRecomId,
        required String recomDescriptionBn,
        required int isMendatory,
        required int commentMendatory,
        required Null datatype,
        required int orderwith,
        required String ev1Score,
        required String ev2Score,
        required String ev3Score,
        required String ev4Score,
        required String ev5Score,
        required String ev6Score,
        required Null ev7Score,
        required Null ev8Score,
        required Null ev9Score,
        required Null ev10Score}) {
    this._recomId = recomId;
    this._lockedRecomId = lockedRecomId;
    this._recomDescriptionBn = recomDescriptionBn;
    this._isMendatory = isMendatory;
    this._commentMendatory = commentMendatory;
    this._datatype = datatype;
    this._orderwith = orderwith;
    this._ev1Score = ev1Score;
    this._ev2Score = ev2Score;
    this._ev3Score = ev3Score;
    this._ev4Score = ev4Score;
    this._ev5Score = ev5Score;
    this._ev6Score = ev6Score;
    this._ev7Score = ev7Score;
    this._ev8Score = ev8Score;
    this._ev9Score = ev9Score;
    this._ev10Score = ev10Score;
  }

  int get recomId => _recomId;
  set recomId(int recomId) => _recomId = recomId;
  String? get lockedRecomId => _lockedRecomId;
  set lockedRecomId(String? lockedRecomId) => _lockedRecomId = lockedRecomId;
  String? get recomDescriptionBn => _recomDescriptionBn;
  set recomDescriptionBn(String? recomDescriptionBn) =>
      _recomDescriptionBn = recomDescriptionBn;
  int get isMendatory => _isMendatory;
  set isMendatory(int isMendatory) => _isMendatory = isMendatory;
  int get commentMendatory => _commentMendatory;
  set commentMendatory(int commentMendatory) =>
      _commentMendatory = commentMendatory;
  String? get datatype => _datatype;
  set datatype(String? datatype) => _datatype = datatype;
  int get orderwith => _orderwith;
  set orderwith(int orderwith) => _orderwith = orderwith;
  String? get ev1Score => _ev1Score;
  set ev1Score(String? ev1Score) => _ev1Score = ev1Score;
  String? get ev2Score => _ev2Score;
  set ev2Score(String? ev2Score) => _ev2Score = ev2Score;
  String? get ev3Score => _ev3Score;
  set ev3Score(String? ev3Score) => _ev3Score = ev3Score;
  String? get ev4Score => _ev4Score;
  set ev4Score(String? ev4Score) => _ev4Score = ev4Score;
  String? get ev5Score => _ev5Score;
  set ev5Score(String? ev5Score) => _ev5Score = ev5Score;
  String? get ev6Score => _ev6Score;
  set ev6Score(String? ev6Score) => _ev6Score = ev6Score;
  String? get ev7Score => _ev7Score;
  set ev7Score(String? ev7Score) => _ev7Score = ev7Score;
  String? get ev8Score => _ev8Score;
  set ev8Score(String? ev8Score) => _ev8Score = ev8Score;
  String? get ev9Score => _ev9Score;
  set ev9Score(String? ev9Score) => _ev9Score = ev9Score;
  String? get ev10Score => _ev10Score;
  set ev10Score(String? ev10Score) => _ev10Score = ev10Score;

  RecomHisData.fromJson(Map<String, dynamic> json) {
    _recomId = json['recomId'];
    _lockedRecomId = json['locked_Recom_Id'];
    _recomDescriptionBn = json['recomDescription_bn'];
    _isMendatory = json['isMendatory'];
    _commentMendatory = json['commentMendatory'];
    _datatype = json['datatype'];
    _orderwith = json['orderwith'];
    _ev1Score = json['ev1_Score'];
    _ev2Score = json['ev2_Score'];
    _ev3Score = json['ev3_Score'];
    _ev4Score = json['ev4_Score'];
    _ev5Score = json['ev5_Score'];
    _ev6Score = json['ev6_Score'];
    _ev7Score = json['ev7_Score'];
    _ev8Score = json['ev8_Score'];
    _ev9Score = json['ev9_Score'];
    _ev10Score = json['ev10_Score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recomId'] = this._recomId;
    data['locked_Recom_Id'] = this._lockedRecomId;
    data['recomDescription_bn'] = this._recomDescriptionBn;
    data['isMendatory'] = this._isMendatory;
    data['commentMendatory'] = this._commentMendatory;
    data['datatype'] = this._datatype;
    data['orderwith'] = this._orderwith;
    data['ev1_Score'] = this._ev1Score;
    data['ev2_Score'] = this._ev2Score;
    data['ev3_Score'] = this._ev3Score;
    data['ev4_Score'] = this._ev4Score;
    data['ev5_Score'] = this._ev5Score;
    data['ev6_Score'] = this._ev6Score;
    data['ev7_Score'] = this._ev7Score;
    data['ev8_Score'] = this._ev8Score;
    data['ev9_Score'] = this._ev9Score;
    data['ev10_Score'] = this._ev10Score;
    return data;
  }
}

class EmpMenuInformation {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<EmpMenuInfoData>? _data;

  EmpMenuInformation(
      {bool? success, String? messageEn, String? messageBn, List<EmpMenuInfoData>? data}) {
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
  List<EmpMenuInfoData>? get data => _data;
  set data(List<EmpMenuInfoData>? data) => _data = data;

  EmpMenuInformation.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <EmpMenuInfoData>[];
      json['data'].forEach((v) {
        _data!.add(new EmpMenuInfoData.fromJson(v));
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
class EmpMenuInfoData {
  String? _empCode;
  int? _empID;
  String? _empName;
  String? _joinigdate;
  String? _designation;
  String? _department;
  String? _sitename;
  int? _receiverempId;
  int? _senderempId;
  int? _qassignId;
  String? _lastincrementdate;
  String? _setname;
  String? _receivercode;
  String? _receivername;
  int? _questionactive;
  int? _recomactive;
  int? _recomhractive;
  int? _questiontrgactive;
  int? _leavehisactive;
  int? _deciplinaryrecord;
  int? _generalcomments;
  int? _questioninputactive;
  int? _recominputactive;
  int? _questiontrginputactive;
  int? _recomhrinputactive;
  int? _leavehistinput;
  int? _asupercomhistinput;
  int? _sendbkbt;
  int? _priorotyno;

  EmpMenuInfoData(
      {String? empCode,
        int? empID,
        String? empName,
        String? joinigdate,
        String? designation,
        String? department,
        String? sitename,
        int? receiverempId,
        int? senderempId,
        int? qassignId,
        String? lastincrementdate,
        String? setname,
        String? receivercode,
        String? receivername,
        int? questionactive,
        int? recomactive,
        int? recomhractive,
        int? questiontrgactive,
        int? leavehisactive,
        int? deciplinaryrecord,
        int? generalcomments,
        int? questioninputactive,
        int? recominputactive,
        int? questiontrginputactive,
        int? recomhrinputactive,
        int? leavehistinput,
        int? asupercomhistinput,
        int? sendbkbt,
        int? priorotyno}) {
    if (empCode != null) {
      this._empCode = empCode;
    }
    if (empID != null) {
      this._empID = empID;
    }
    if (empName != null) {
      this._empName = empName;
    }
    if (joinigdate != null) {
      this._joinigdate = joinigdate;
    }
    if (designation != null) {
      this._designation = designation;
    }
    if (department != null) {
      this._department = department;
    }
    if (sitename != null) {
      this._sitename = sitename;
    }
    if (receiverempId != null) {
      this._receiverempId = receiverempId;
    }
    if (senderempId != null) {
      this._senderempId = senderempId;
    }
    if (qassignId != null) {
      this._qassignId = qassignId;
    }
    if (lastincrementdate != null) {
      this._lastincrementdate = lastincrementdate;
    }
    if (setname != null) {
      this._setname = setname;
    }
    if (receivercode != null) {
      this._receivercode = receivercode;
    }
    if (receivername != null) {
      this._receivername = receivername;
    }
    if (questionactive != null) {
      this._questionactive = questionactive;
    }
    if (recomactive != null) {
      this._recomactive = recomactive;
    }
    if (recomhractive != null) {
      this._recomhractive = recomhractive;
    }
    if (questiontrgactive != null) {
      this._questiontrgactive = questiontrgactive;
    }
    if (leavehisactive != null) {
      this._leavehisactive = leavehisactive;
    }
    if (deciplinaryrecord != null) {
      this._deciplinaryrecord = deciplinaryrecord;
    }
    if (generalcomments != null) {
      this._generalcomments = generalcomments;
    }
    if (questioninputactive != null) {
      this._questioninputactive = questioninputactive;
    }
    if (recominputactive != null) {
      this._recominputactive = recominputactive;
    }
    if (questiontrginputactive != null) {
      this._questiontrginputactive = questiontrginputactive;
    }
    if (recomhrinputactive != null) {
      this._recomhrinputactive = recomhrinputactive;
    }
    if (leavehistinput != null) {
      this._leavehistinput = leavehistinput;
    }
    if (asupercomhistinput != null) {
      this._asupercomhistinput = asupercomhistinput;
    }
    if (sendbkbt != null) {
      this._sendbkbt = sendbkbt;
    }
    if (priorotyno != null) {
      this._priorotyno = priorotyno;
    }
  }

  String? get empCode => _empCode;
  set empCode(String? empCode) => _empCode = empCode;
  int? get empID => _empID;
  set empID(int? empID) => _empID = empID;
  String? get empName => _empName;
  set empName(String? empName) => _empName = empName;
  String? get joinigdate => _joinigdate;
  set joinigdate(String? joinigdate) => _joinigdate = joinigdate;
  String? get designation => _designation;
  set designation(String? designation) => _designation = designation;
  String? get department => _department;
  set department(String? department) => _department = department;
  String? get sitename => _sitename;
  set sitename(String? sitename) => _sitename = sitename;
  int? get receiverempId => _receiverempId;
  set receiverempId(int? receiverempId) => _receiverempId = receiverempId;
  int? get senderempId => _senderempId;
  set senderempId(int? senderempId) => _senderempId = senderempId;
  int? get qassignId => _qassignId;
  set qassignId(int? qassignId) => _qassignId = qassignId;
  String? get lastincrementdate => _lastincrementdate;
  set lastincrementdate(String? lastincrementdate) =>
      _lastincrementdate = lastincrementdate;
  String? get setname => _setname;
  set setname(String? setname) => _setname = setname;
  String? get receivercode => _receivercode;
  set receivercode(String? receivercode) => _receivercode = receivercode;
  String? get receivername => _receivername;
  set receivername(String? receivername) => _receivername = receivername;
  int? get questionactive => _questionactive;
  set questionactive(int? questionactive) => _questionactive = questionactive;
  int? get recomactive => _recomactive;
  set recomactive(int? recomactive) => _recomactive = recomactive;
  int? get recomhractive => _recomhractive;
  set recomhractive(int? recomhractive) => _recomhractive = recomhractive;
  int? get questiontrgactive => _questiontrgactive;
  set questiontrgactive(int? questiontrgactive) =>
      _questiontrgactive = questiontrgactive;
  int? get leavehisactive => _leavehisactive;
  set leavehisactive(int? leavehisactive) => _leavehisactive = leavehisactive;
  int? get deciplinaryrecord => _deciplinaryrecord;
  set deciplinaryrecord(int? deciplinaryrecord) =>
      _deciplinaryrecord = deciplinaryrecord;
  int? get generalcomments => _generalcomments;
  set generalcomments(int? generalcomments) =>
      _generalcomments = generalcomments;
  int? get questioninputactive => _questioninputactive;
  set questioninputactive(int? questioninputactive) =>
      _questioninputactive = questioninputactive;
  int? get recominputactive => _recominputactive;
  set recominputactive(int? recominputactive) =>
      _recominputactive = recominputactive;
  int? get questiontrginputactive => _questiontrginputactive;
  set questiontrginputactive(int? questiontrginputactive) =>
      _questiontrginputactive = questiontrginputactive;
  int? get recomhrinputactive => _recomhrinputactive;
  set recomhrinputactive(int? recomhrinputactive) =>
      _recomhrinputactive = recomhrinputactive;
  int? get leavehistinput => _leavehistinput;
  set leavehistinput(int? leavehistinput) => _leavehistinput = leavehistinput;
  int? get asupercomhistinput => _asupercomhistinput;
  set asupercomhistinput(int? asupercomhistinput) =>
      _asupercomhistinput = asupercomhistinput;
  int? get sendbkbt => _sendbkbt;
  set sendbkbt(int? sendbkbt) => _sendbkbt = sendbkbt;
  int? get priorotyno => _priorotyno;
  set priorotyno(int? priorotyno) => _priorotyno = priorotyno;

  EmpMenuInfoData.fromJson(Map<String, dynamic> json) {
    _empCode = json['empCode'];
    _empID = json['empID'];
    _empName = json['empName'];
    _joinigdate = json['joinigdate'];
    _designation = json['designation'];
    _department = json['department'];
    _sitename = json['sitename'];
    _receiverempId = json['receiverempId'];
    _senderempId = json['senderempId'];
    _qassignId = json['qassignId'];
    _lastincrementdate = json['lastincrementdate'];
    _setname = json['setname'];
    _receivercode = json['receivercode'];
    _receivername = json['receivername'];
    _questionactive = json['questionactive'];
    _recomactive = json['recomactive'];
    _recomhractive = json['recomhractive'];
    _questiontrgactive = json['questiontrgactive'];
    _leavehisactive = json['leavehisactive'];
    _deciplinaryrecord = json['deciplinaryrecord'];
    _generalcomments = json['generalcomments'];
    _questioninputactive = json['questioninputactive'];
    _recominputactive = json['recominputactive'];
    _questiontrginputactive = json['questiontrginputactive'];
    _recomhrinputactive = json['recomhrinputactive'];
    _leavehistinput = json['leavehistinput'];
    _asupercomhistinput = json['asupercomhistinput'];
    _sendbkbt = json['sendbkbt'];
    _priorotyno = json['priorotyno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empCode'] = this._empCode;
    data['empID'] = this._empID;
    data['empName'] = this._empName;
    data['joinigdate'] = this._joinigdate;
    data['designation'] = this._designation;
    data['department'] = this._department;
    data['sitename'] = this._sitename;
    data['receiverempId'] = this._receiverempId;
    data['senderempId'] = this._senderempId;
    data['qassignId'] = this._qassignId;
    data['lastincrementdate'] = this._lastincrementdate;
    data['setname'] = this._setname;
    data['receivercode'] = this._receivercode;
    data['receivername'] = this._receivername;
    data['questionactive'] = this._questionactive;
    data['recomactive'] = this._recomactive;
    data['recomhractive'] = this._recomhractive;
    data['questiontrgactive'] = this._questiontrgactive;
    data['leavehisactive'] = this._leavehisactive;
    data['deciplinaryrecord'] = this._deciplinaryrecord;
    data['generalcomments'] = this._generalcomments;
    data['questioninputactive'] = this._questioninputactive;
    data['recominputactive'] = this._recominputactive;
    data['questiontrginputactive'] = this._questiontrginputactive;
    data['recomhrinputactive'] = this._recomhrinputactive;
    data['leavehistinput'] = this._leavehistinput;
    data['asupercomhistinput'] = this._asupercomhistinput;
    data['sendbkbt'] = this._sendbkbt;
    data['priorotyno'] = this._priorotyno;
    return data;
  }
}


class GetMenuInfo{

  late int receiverId;
  late int employeeId ;
  late int fiscalyear ;

  GetMenuInfo(this.receiverId, this.employeeId, this.fiscalyear);


}
class GetApprovalPathInfo{

  late int _questionsetId;
  late int _priorityNo ;
  late String _empCode ;

  int get questionsetId => _questionsetId;

  set questionsetId(int value) {
    _questionsetId = value;
  }

  String get empCode => _empCode;

  set empCode(String value) {
    _empCode = value;
  }

  int get priorityNo => _priorityNo;

  set priorityNo(int value) {
    _priorityNo = value;
  }


}
class EmpScoreDataView {
  int? _orderwith;
  int? _qSetId;
  int? _quesionId;
  int? _outofscore;
  String? _title;
  String? _description;
  String? _ev1Score;
  String? _ev2Score;
  String? _ev3Score;
  String? _ev4Score;
  String? _ev5Score;
  String? _ev6Score;
  String? _ev7Score;
  String? _ev8Score;
  String? _ev9Score;
  String? _ev10Score;
  String? _total;

  EmpScoreData(
      {int? orderwith,
        int? qSetId,
        int? quesionId,
        int? outofscore,
        String? title,
        String? description,
        String? ev1Score,
        String? ev2Score,
        String? ev3Score,
        String? ev4Score,
        String? ev5Score,
        String? ev6Score,
        String? ev7Score,
        String? ev8Score,
        String? ev9Score,
        String? ev10Score,
        String? total
      }) {
    if (orderwith != null) {
      this._orderwith = orderwith;
    }
    if (qSetId != null) {
      this._qSetId = qSetId;
    }
    if (quesionId != null) {
      this._quesionId = quesionId;
    }
    if (outofscore != null) {
      this._outofscore = outofscore;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (ev1Score != null) {
      this._ev1Score = ev1Score;
    }
    if (ev2Score != null) {
      this._ev2Score = ev2Score;
    }
    if (ev3Score != null) {
      this._ev3Score = ev3Score;
    }
    if (ev4Score != null) {
      this._ev4Score = ev4Score;
    }
    if (ev5Score != null) {
      this._ev5Score = ev5Score;
    }
    if (ev6Score != null) {
      this._ev6Score = ev6Score;
    }
    if (ev7Score != null) {
      this._ev7Score = ev7Score;
    }
    if (ev8Score != null) {
      this._ev8Score = ev8Score;
    }
    if (ev9Score != null) {
      this._ev9Score = ev9Score;
    }
    if (ev10Score != null) {
      this._ev10Score = ev10Score;
    }
    if (_total != null) {
      this._total = _total;
    }
  }

  int? get orderwith => _orderwith;
  set orderwith(int? orderwith) => _orderwith = orderwith;
  int? get qSetId => _qSetId;
  set qSetId(int? qSetId) => _qSetId = qSetId;
  int? get quesionId => _quesionId;
  set quesionId(int? quesionId) => _quesionId = quesionId;
  int? get outofscore => _outofscore;
  set outofscore(int? outofscore) => _outofscore = outofscore;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get ev1Score => _ev1Score;
  set ev1Score(String? ev1Score) => _ev1Score = ev1Score;
  String? get ev2Score => _ev2Score;
  set ev2Score(String? ev2Score) => _ev2Score = ev2Score;
  String? get ev3Score => _ev3Score;
  set ev3Score(String? ev3Score) => _ev3Score = ev3Score;
  String? get ev4Score => _ev4Score;
  set ev4Score(String? ev4Score) => _ev4Score = ev4Score;
  String? get ev5Score => _ev5Score;
  set ev5Score(String? ev5Score) => _ev5Score = ev5Score;
  String? get ev6Score => _ev6Score;
  set ev6Score(String? ev6Score) => _ev6Score = ev6Score;
  String? get ev7Score => _ev7Score;
  set ev7Score(String? ev7Score) => _ev7Score = ev7Score;
  String? get ev8Score => _ev8Score;
  set ev8Score(String? ev8Score) => _ev8Score = ev8Score;
  String? get ev9Score => _ev9Score;
  set ev9Score(String? ev9Score) => _ev9Score = ev9Score;
  String? get ev10Score => _ev10Score;
  set ev10Score(String? ev10Score) => _ev10Score = ev10Score;
   String? get total => _total;
  set total(String? total) => _total = total;

  EmpScoreDataView.fromJson(Map<String, dynamic> json) {
    _orderwith = json['orderwith'];
    _qSetId = json['qSetId'];
    _quesionId = json['quesionId'];
    _outofscore = json['outofscore'];
    _title = json['title'];
    _description = json['description'];
    _ev1Score = json['ev1Score'];
    _ev2Score = json['ev2Score'];
    _ev3Score = json['ev3Score'];
    _ev4Score = json['ev4Score'];
    _ev5Score = json['ev5Score'];
    _ev6Score = json['ev6Score'];
    _ev7Score = json['ev7Score'];
    _ev8Score = json['ev8Score'];
    _ev9Score = json['ev9Score'];
    _ev10Score = json['ev10Score'];
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderwith'] = this._orderwith;
    data['qSetId'] = this._qSetId;
    data['quesionId'] = this._quesionId;
    data['outofscore'] = this._outofscore;
    data['title'] = this._title;
    data['description'] = this._description;
    data['ev1Score'] = this._ev1Score;
    data['ev2Score'] = this._ev2Score;
    data['ev3Score'] = this._ev3Score;
    data['ev4Score'] = this._ev4Score;
    data['ev5Score'] = this._ev5Score;
    data['ev6Score'] = this._ev6Score;
    data['ev7Score'] = this._ev7Score;
    data['ev8Score'] = this._ev8Score;
    data['ev9Score'] = this._ev9Score;
    data['ev10Score'] = this._ev10Score;
    return data;
  }
}
class ApaApprovalPathInfo {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ApaApprovalInfoData>? _data;

  ApaApprovalPathInfo(
      {bool? success, String? messageEn, String? messageBn, List<ApaApprovalInfoData>? data}) {
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
  List<ApaApprovalInfoData>? get data => _data;
  set data(List<ApaApprovalInfoData>? data) => _data = data;

  ApaApprovalPathInfo.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ApaApprovalInfoData>[];
      json['data'].forEach((v) {
        _data!.add(new ApaApprovalInfoData.fromJson(v));
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
class ApaApprovalInfoData {
  int? _empID;
  String? _empCode;
  String? _empName;
  String? _email;
  String? _designation;
  String? _gradename;
  String? _liabilityfriendlyname;
  String? _liabilityname;
  int? _liablilitynatureid;
  String? _sitecode;
  String? _sitename;

  ApaApprovalInfoData(
      {int? empID,
        String? empCode,
        String? empName,
        String? email,
        String? designation,
        String? gradename,
        String? liabilityfriendlyname,
        String? liabilityname,
        int? liablilitynatureid,
        String? sitecode,
        String? sitename}) {
    if (empID != null) {
      this._empID = empID;
    }
    if (empCode != null) {
      this._empCode = empCode;
    }
    if (empName != null) {
      this._empName = empName;
    }
    if (email != null) {
      this._email = email;
    }
    if (designation != null) {
      this._designation = designation;
    }
    if (gradename != null) {
      this._gradename = gradename;
    }
    if (liabilityfriendlyname != null) {
      this._liabilityfriendlyname = liabilityfriendlyname;
    }
    if (liabilityname != null) {
      this._liabilityname = liabilityname;
    }
    if (liablilitynatureid != null) {
      this._liablilitynatureid = liablilitynatureid;
    }
    if (sitecode != null) {
      this._sitecode = sitecode;
    }
    if (sitename != null) {
      this._sitename = sitename;
    }
  }

  int? get empID => _empID;
  set empID(int? empID) => _empID = empID;
  String? get empCode => _empCode;
  set empCode(String? empCode) => _empCode = empCode;
  String? get empName => _empName;
  set empName(String? empName) => _empName = empName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get designation => _designation;
  set designation(String? designation) => _designation = designation;
  String? get gradename => _gradename;
  set gradename(String? gradename) => _gradename = gradename;
  String? get liabilityfriendlyname => _liabilityfriendlyname;
  set liabilityfriendlyname(String? liabilityfriendlyname) =>
      _liabilityfriendlyname = liabilityfriendlyname;
  String? get liabilityname => _liabilityname;
  set liabilityname(String? liabilityname) => _liabilityname = liabilityname;
  int? get liablilitynatureid => _liablilitynatureid;
  set liablilitynatureid(int? liablilitynatureid) =>
      _liablilitynatureid = liablilitynatureid;
  String? get sitecode => _sitecode;
  set sitecode(String? sitecode) => _sitecode = sitecode;
  String? get sitename => _sitename;
  set sitename(String? sitename) => _sitename = sitename;

  ApaApprovalInfoData.fromJson(Map<String, dynamic> json) {
    _empID = json['empID'];
    _empCode = json['empCode'];
    _empName = json['empName'];
    _email = json['email'];
    _designation = json['designation'];
    _gradename = json['gradename'];
    _liabilityfriendlyname = json['liabilityfriendlyname'];
    _liabilityname = json['liabilityname'];
    _liablilitynatureid = json['liablilitynatureid'];
    _sitecode = json['sitecode'];
    _sitename = json['sitename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empID'] = this._empID;
    data['empCode'] = this._empCode;
    data['empName'] = this._empName;
    data['email'] = this._email;
    data['designation'] = this._designation;
    data['gradename'] = this._gradename;
    data['liabilityfriendlyname'] = this._liabilityfriendlyname;
    data['liabilityname'] = this._liabilityname;
    data['liablilitynatureid'] = this._liablilitynatureid;
    data['sitecode'] = this._sitecode;
    data['sitename'] = this._sitename;
    return data;
  }
}
class ApaNextPathHistory {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ApaNextPathHistoryData>? _data;

  ApaNextPathHistory(
      {bool? success, String? messageEn, String? messageBn, List<ApaNextPathHistoryData>? data}) {
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
  List<ApaNextPathHistoryData>? get data => _data;
  set data(List<ApaNextPathHistoryData>? data) => _data = data;

  ApaNextPathHistory.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ApaNextPathHistoryData>[];
      json['data'].forEach((v) {
        _data!.add(new ApaNextPathHistoryData.fromJson(v));
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
class ApaNextPathHistoryData {
  int? _pathhistoryid;

  ApaNextPathHistoryData({int? pathhistoryid}) {
    if (pathhistoryid != null) {
      this._pathhistoryid = pathhistoryid;
    }
  }

  int? get pathhistoryid => _pathhistoryid;
  set pathhistoryid(int? pathhistoryid) => _pathhistoryid = pathhistoryid;

  ApaNextPathHistoryData.fromJson(Map<String, dynamic> json) {
    _pathhistoryid = json['pathhistoryid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pathhistoryid'] = this._pathhistoryid;
    return data;
  }
}
class ApaHrRecomScore {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ApaHrRecomScoreData>? _data;

  ApaHrRecomScore(
      {bool? success, String? messageEn, String? messageBn, List<ApaHrRecomScoreData>? data}) {
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
  List<ApaHrRecomScoreData>? get data => _data;
  set data(List<ApaHrRecomScoreData>? data) => _data = data;

  ApaHrRecomScore.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ApaHrRecomScoreData>[];
      json['data'].forEach((v) {
        _data!.add(new ApaHrRecomScoreData.fromJson(v));
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
class ApaHrRecomScoreData {
  num? _trscoresum;
  num? _trscoreavg;
  num? _scoresum;
  num? _scoreavg;
  num? _hroutofscore;
  num? _hrscoreavg;

  ApaHrRecomScoreData(
      { num? trscoresum,
        num? trscoreavg,
        num? scoresum,
        num? scoreavg,
        num? hroutofscore,
        num? hrscoreavg}) {
    if (trscoresum != null) {
      this._trscoresum = trscoresum;
    }
    if (trscoreavg != null) {
      this._trscoreavg = trscoreavg;
    }
    if (scoresum != null) {
      this._scoresum = scoresum;
    }
    if (scoreavg != null) {
      this._scoreavg = scoreavg;
    }
    if (hroutofscore != null) {
      this._hroutofscore = hroutofscore;
    }
    if (hrscoreavg != null) {
      this._hrscoreavg = hrscoreavg;
    }
  }

  num? get trscoresum => _trscoresum;
  set trscoresum( num? trscoresum) => _trscoresum = trscoresum;
  num? get trscoreavg => _trscoreavg;
  set trscoreavg( num? trscoreavg) => _trscoreavg = trscoreavg;
  num? get scoresum => _scoresum;
  set scoresum( num? scoresum) => _scoresum = scoresum;
  num? get scoreavg => _scoreavg;
  set scoreavg( num? scoreavg) => _scoreavg = scoreavg;
  num? get hroutofscore => _hroutofscore;
  set hroutofscore( num? hroutofscore) => _hroutofscore = hroutofscore;
  num? get hrscoreavg => _hrscoreavg;
  set hrscoreavg( num? hrscoreavg) => _hrscoreavg = hrscoreavg;

  ApaHrRecomScoreData.fromJson(Map<String, dynamic> json) {
    _trscoresum = json['trscoresum'];
    _trscoreavg = json['trscoreavg'];
    _scoresum = json['scoresum'];
    _scoreavg = json['scoreavg'];
    _hroutofscore = json['hroutofscore'];
    _hrscoreavg = json['hrscoreavg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trscoresum'] = this._trscoresum;
    data['trscoreavg'] = this._trscoreavg;
    data['scoresum'] = this._scoresum;
    data['scoreavg'] = this._scoreavg;
    data['hroutofscore'] = this._hroutofscore;
    data['hrscoreavg'] = this._hrscoreavg;
    return data;
  }
}
class ApaSubmit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  late var _data;

  ApaSubmit({bool? success, String? messageEn, String? messageBn, String? data}) {
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
  String? get data => _data;
  set data(String? data) => _data = data;

  ApaSubmit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    _data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    data['data'] = this._data;
    return data;
  }
}
class SubmitGeneralCommentModel{

 late String _employeeCode;
 late int _assignId;
 late int _historyId;
 late String _senderCode;
 late String _receiverEmpCode;
 late int _qsetId;
 late int _priorityNo;
 late String _comment;

 SubmitGeneralCommentModel(
      this._employeeCode,
      this._assignId,
      this._historyId,
      this._senderCode,
      this._receiverEmpCode,
      this._qsetId,
     this._priorityNo,
      this._comment);

 String get employeeCode => _employeeCode;

  set employeeCode(String value) {
    _employeeCode = value;
  }

 String get comment => _comment;

  set comment(String value) {
    _comment = value;
  }

  int get priorityNo => _priorityNo;

  set priorityNo(int value) {
    _priorityNo = value;
  }

  int get qsetId => _qsetId;

  set qsetId(int value) {
    _qsetId = value;
  }

  String get receiverEmpCode => _receiverEmpCode;

  set receiverEmpCode(String value) {
    _receiverEmpCode = value;
  }

  String get senderCode => _senderCode;

  set senderCode(String value) {
    _senderCode = value;
  }

  int get historyId => _historyId;

  set historyId(int value) {
    _historyId = value;
  }

  int get assignId => _assignId;

  set assignId(int value) {
    _assignId = value;
  }
}
// {
// "historyId": 0,
// "reason": "string",
// "duration": "string",
// "range": "string",
// "comments": "string"
// }


class SubmitLeaveInfo{
late int  historyId;
late String reason ;
late String duration;
late String range ;
late String comments ;

SubmitLeaveInfo(
    this.historyId, this.reason, this.duration, this.range, this.comments);

}
class SubmitSuperComment{
  late int  historyId;
  late String comment ;


  SubmitSuperComment(
      this.historyId, this.comment);

}
// {
// "historyid": 0,
// "questionId": 0,
// "comments": "string"
// }
class SubmitHrScore{
  late int  historyId;
  late int questionId ;
  late String comment;

  SubmitHrScore(this.historyId, this.questionId, this.comment);
}
// {
// "historyId": 0,
// "scorequestionId": 0,
// "score": 0
// }
class SubmitScoreItem{
  late int  _historyId;
  late int _scorequestionId ;
  late int _score;

  int get historyId => _historyId;

  set historyId(int value) {
    _historyId = value;
  }

  //SubmitScoreItem(this._historyId, this._scorequestionId, this._score);

  int get scorequestionId => _scorequestionId;

  set scorequestionId(int value) {
    _scorequestionId = value;
  }

  int get score => _score;

  set score(int value) {
    _score = value;
  }
}

// {
// "historyId": 0,
// "questionId": 0,
// "score": 0,
// "target": 0,
// "earned": 0,
// "percentage": 0
// }

class SubmitTargetScoreItem{
  late int  _historyId;
   int _questionId = 0;

  int get historyId => _historyId;

  set historyId(int value) {
    _historyId = value;
  }

  late num _score;
  late num  _target;
   num _earned = 0;
  late num _percentage;

  int get questionId => _questionId;

  set questionId(int value) {
    _questionId = value;
  }

  num get score => _score;

  set score(num value) {
    _score = value;
  }

  num get target => _target;

  set target(num value) {
    _target = value;
  }

  num get earned => _earned;

  set earned(num value) {
    _earned = value;
  }

  num get percentage => _percentage;

  set percentage(num value) {
    _percentage = value;
  }
}


// {
// "historyId": 0,
// "recomId": 0,
// "recomscore": 0,
// "recomcomments": "string"
// }


class SubmitRecommendationItem{
  late int  _historyId;
  late int _recomId;
  late int _recomscore;
  late int  _recomcomments;
}


// "qassignId": 3957,
// "isTargetActive": -1,
// "qSetId": 101

class GetHrScore{
  late int qassignId;
  late int isTargetActive;
  late int qSetId;

  GetHrScore(this.qassignId, this.isTargetActive, this.qSetId);
}

class hrScoreModel {

  late num _sumScore;
  late num _avgScore;

  hrScoreModel(this._sumScore,
      this._avgScore); //hrScoreModel({required this.sumScore, required this.avgScore});


  num get sumScore => _sumScore;

  set sumScore(num value) {
    _sumScore = value;
  }

  num get avgScore => _avgScore;

  set avgScore(num value) {
    _avgScore = value;
  }
}


// {
// "historyId": 0,
// "recomId": 0,
// "recomscore": 0,
// "recomcomments": "string"
// }

class SubmitRecomItem{
  late int  _historyId;
  late int _recomId;
  late int _recomscore ;
  late String _recomcomments = '';

  int get historyId => _historyId;

  set historyId(int value) {
    _historyId = value;
  }

  int get recomId => _recomId;

  set recomId(int value) {
    _recomId = value;
  }

  int get recomscore => _recomscore;

  set recomscore(int value) {
    _recomscore = value;
  }

  String get recomcomments => _recomcomments;

  set recomcomments(String value) {
    _recomcomments = value;
  }

  SubmitRecomItem(
       this._recomId, this._recomscore, this._recomcomments);
}


class ApaEmployeeInfo {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<EmployeeInfoData>? _data;

  ApaEmployeeInfo(
      {bool? success, String? messageEn, String? messageBn, List<EmployeeInfoData>? data}) {
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
  List<EmployeeInfoData>? get data => _data;
  set data(List<EmployeeInfoData>? data) => _data = data;

  ApaEmployeeInfo.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <EmployeeInfoData>[];
      json['data'].forEach((v) {
        _data!.add(new EmployeeInfoData.fromJson(v));
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

class EmployeeInfoData {
  int? _employeeID;
  String? _employeeCode;
  String? _employeeName;
  String? _designationName;
  String? _gender;

  EmployeeInfoData(
      {int? employeeID,
        String? employeeCode,
        String? employeeName,
        String? designationName,
        String? gender}) {
    if (employeeID != null) {
      this._employeeID = employeeID;
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
    if (gender != null) {
      this._gender = gender;
    }
  }

  int? get employeeID => _employeeID;
  set employeeID(int? employeeID) => _employeeID = employeeID;
  String? get employeeCode => _employeeCode;
  set employeeCode(String? employeeCode) => _employeeCode = employeeCode;
  String? get employeeName => _employeeName;
  set employeeName(String? employeeName) => _employeeName = employeeName;
  String? get designationName => _designationName;
  set designationName(String? designationName) =>
      _designationName = designationName;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;

  EmployeeInfoData.fromJson(Map<String, dynamic> json) {
    _employeeID = json['employeeID'];
    _employeeCode = json['employeeCode'];
    _employeeName = json['employeeName'];
    _designationName = json['designationName'];
    _gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeID'] = this._employeeID;
    data['employeeCode'] = this._employeeCode;
    data['employeeName'] = this._employeeName;
    data['designationName'] = this._designationName;
    data['gender'] = this._gender;
    return data;
  }
}




class Designation {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
 late List<DesignationData> _data;

  Designation(
      {bool? success, String? messageEn, String? messageBn, required List<DesignationData> data}) {
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
  List<DesignationData> get data => _data;
  set data(List<DesignationData> data) => _data = data;

  Designation.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <DesignationData>[];
      json['data'].forEach((v) {
        _data!.add(new DesignationData.fromJson(v));
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

class DesignationData {
  int? _id;
  String? _dasignationCode;
  String? _dasignationName;

  DesignationData({int? id, String? dasignationCode, String? dasignationName}) {
    if (id != null) {
      this._id = id;
    }
    if (dasignationCode != null) {
      this._dasignationCode = dasignationCode;
    }
    if (dasignationName != null) {
      this._dasignationName = dasignationName;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get dasignationCode => _dasignationCode;
  set dasignationCode(String? dasignationCode) =>
      _dasignationCode = dasignationCode;
  String? get dasignationName => _dasignationName;
  set dasignationName(String? dasignationName) =>
      _dasignationName = dasignationName;

  DesignationData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dasignationCode = json['dasignationCode'];
    _dasignationName = json['dasignationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['dasignationCode'] = this._dasignationCode;
    data['dasignationName'] = this._dasignationName;
    return data;
  }
}


class Zone {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  late List<ZoneData> _data;

  Zone(
      {bool? success, String? messageEn, String? messageBn, List<ZoneData>? data}) {
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
  List<ZoneData> get data => _data;
  set data(List<ZoneData> data) => _data = data;

  Zone.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ZoneData>[];
      json['data'].forEach((v) {
        _data!.add(new ZoneData.fromJson(v));
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

class ZoneData {
  int? _id;
  String? _zoneCode;
  String? _zoneName;

  ZoneData({int? id, String? zoneCode, String? zoneName}) {
    if (id != null) {
      this._id = id;
    }
    if (zoneCode != null) {
      this._zoneCode = zoneCode;
    }
    if (zoneName != null) {
      this._zoneName = zoneName;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get zoneCode => _zoneCode;
  set zoneCode(String? zoneCode) => _zoneCode = zoneCode;
  String? get zoneName => _zoneName;
  set zoneName(String? zoneName) => _zoneName = zoneName;

  ZoneData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _zoneCode = json['zoneCode'];
    _zoneName = json['zoneName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['zoneCode'] = this._zoneCode;
    data['zoneName'] = this._zoneName;
    return data;
  }
}



class Grade {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
 late List<GradeData> _data;

  Grade(
      {bool? success, String? messageEn, String? messageBn, List<GradeData>? data}) {
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
  List<GradeData> get data => _data;
  set data(List<GradeData> data) => _data = data;

  Grade.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <GradeData>[];
      json['data'].forEach((v) {
        _data!.add(new GradeData.fromJson(v));
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

class GradeData {
  int? _id;
  String? _gradeCode;
  String? _gradeName;

  GradeData({int? id, String? gradeCode, String? gradeName}) {
    if (id != null) {
      this._id = id;
    }
    if (gradeCode != null) {
      this._gradeCode = gradeCode;
    }
    if (gradeName != null) {
      this._gradeName = gradeName;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get gradeCode => _gradeCode;
  set gradeCode(String? gradeCode) => _gradeCode = gradeCode;
  String? get gradeName => _gradeName;
  set gradeName(String? gradeName) => _gradeName = gradeName;

  GradeData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _gradeCode = json['gradeCode'];
    _gradeName = json['gradeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['gradeCode'] = this._gradeCode;
    data['gradeName'] = this._gradeName;
    return data;
  }
}


class Liability {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
 late List<LiabilityData> _data;

  Liability(
      {bool? success, String? messageEn, String? messageBn, List<LiabilityData>? data}) {
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
  List<LiabilityData> get data => _data;
  set data(List<LiabilityData> data) => _data = data;

  Liability.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <LiabilityData>[];
      json['data'].forEach((v) {
        _data!.add(new LiabilityData.fromJson(v));
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

class LiabilityData {
  int? _id;
  String? _liabilityCode;
  String? _liabilityName;

  LiabilityData({int? id, String? liabilityCode, String? liabilityName}) {
    if (id != null) {
      this._id = id;
    }
    if (liabilityCode != null) {
      this._liabilityCode = liabilityCode;
    }
    if (liabilityName != null) {
      this._liabilityName = liabilityName;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get liabilityCode => _liabilityCode;
  set liabilityCode(String? liabilityCode) => _liabilityCode = liabilityCode;
  String? get liabilityName => _liabilityName;
  set liabilityName(String? liabilityName) => _liabilityName = liabilityName;

  LiabilityData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _liabilityCode = json['liabilityCode'];
    _liabilityName = json['liabilityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['liabilityCode'] = this._liabilityCode;
    data['liabilityName'] = this._liabilityName;
    return data;
  }
}



class FiscalYear {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  late List<FiscalYearData> _data;

  FiscalYear(
      {bool? success, String? messageEn, String? messageBn, List<FiscalYearData>? data}) {
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
  List<FiscalYearData> get data => _data;
  set data(List<FiscalYearData> data) => _data = data;

  FiscalYear.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <FiscalYearData>[];
      json['data'].forEach((v) {
        _data!.add(new FiscalYearData.fromJson(v));
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

class FiscalYearData {
  int? _fiscalYear;
  String? _dateFrom;
  String? _dateTo;
  int? _active;

  FiscalYearData({int? fiscalYear, String? dateFrom, String? dateTo, int? active}) {
    if (fiscalYear != null) {
      this._fiscalYear = fiscalYear;
    }
    if (dateFrom != null) {
      this._dateFrom = dateFrom;
    }
    if (dateTo != null) {
      this._dateTo = dateTo;
    }
    if (active != null) {
      this._active = active;
    }
  }

  int? get fiscalYear => _fiscalYear;
  set fiscalYear(int? fiscalYear) => _fiscalYear = fiscalYear;
  String? get dateFrom => _dateFrom;
  set dateFrom(String? dateFrom) => _dateFrom = dateFrom;
  String? get dateTo => _dateTo;
  set dateTo(String? dateTo) => _dateTo = dateTo;
  int? get active => _active;
  set active(int? active) => _active = active;

  FiscalYearData.fromJson(Map<String, dynamic> json) {
    _fiscalYear = json['fiscalYear'];
    _dateFrom = json['dateFrom'];
    _dateTo = json['dateTo'];
    _active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fiscalYear'] = this._fiscalYear;
    data['dateFrom'] = this._dateFrom;
    data['dateTo'] = this._dateTo;
    data['active'] = this._active;
    return data;
  }
}


class SearchFilter{

  int? _designationId;
  int? _zoneId;
  int? _statusId;
  int? _gradeId;
  int? _liabilityId;
  int? _branchId;
  int? _fiscalYear;
  int? _departmentId;
  int? _divisionId;
  int? _areaId;
  int? _recomId;
  int? _recomCount;





  int? get divisionId => _divisionId;

  set divisionId(int? value) {
    _divisionId = value;
  }
  int? get designationId => _designationId;

  set designationId(int? value) {
    _designationId = value;
  }
  int? get departmentId => _departmentId;

  set departmentId(int? value) {
    _departmentId = value;
  }

  SearchFilter(this._designationId,this._departmentId, this._zoneId, this._statusId, this._gradeId,
      this._liabilityId, this._branchId, this._fiscalYear,this._divisionId,this._areaId, this._recomId,this._recomCount);

  int? get zoneId => _zoneId;

  set zoneId(int? value) {
    _zoneId = value;
  }

  int? get statusId => _statusId;

  set statusId(int? value) {
    _statusId = value;
  }

  int? get gradeId => _gradeId;

  set gradeId(int? value) {
    _gradeId = value;
  }

  int? get liabilityId => _liabilityId;

  set liabilityId(int? value) {
    _liabilityId = value;
  }

  int? get branchId => _branchId;

  set branchId(int? value) {
    _branchId = value;
  }

  int? get fiscalYear => _fiscalYear;

  set fiscalYear(int? value) {
    _fiscalYear = value;
  }

  int? get areaId => _areaId;

  set areaId(int? value) {
    _areaId = value;
  }

  int? get recomId => _recomId;

  set recomId(int? value) {
    _recomId = value;
  }

  int? get recomCount => _recomCount;

  set recomCount(int? value) {
    _recomCount = value;
  }
}



class ApprovalPathSet {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ApprovalPathData>? _data;

  ApprovalPathSet(
      {bool? success, String? messageEn, String? messageBn, List<ApprovalPathData>? data}) {
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
  List<ApprovalPathData>? get data => _data;
  set data(List<ApprovalPathData>? data) => _data = data;

  ApprovalPathSet.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ApprovalPathData>[];
      json['data'].forEach((v) {
        _data!.add(new ApprovalPathData.fromJson(v));
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

class ApprovalPathData {
  int? _questionSetId;
  int? _priorotyNo;
  int? _stepFinalL;
  int? _liabilityNatureId;
  String? _pathkeyRemarks;
  int? _generalcomments;
  int? _recominputactive;
  String? _comtitle;

  ApprovalPathData(
      {int? questionSetId,
        int? priorotyNo,
        int? stepFinalL,
        int? liabilityNatureId,
        String? pathkeyRemarks,
        int? generalcomments,
        int? recominputactive,
        String? comtitle}) {
    if (questionSetId != null) {
      this._questionSetId = questionSetId;
    }
    if (priorotyNo != null) {
      this._priorotyNo = priorotyNo;
    }
    if (stepFinalL != null) {
      this._stepFinalL = stepFinalL;
    }
    if (liabilityNatureId != null) {
      this._liabilityNatureId = liabilityNatureId;
    }
    if (pathkeyRemarks != null) {
      this._pathkeyRemarks = pathkeyRemarks;
    }
    if (generalcomments != null) {
      this._generalcomments = generalcomments;
    }
    if (recominputactive != null) {
      this._recominputactive = recominputactive;
    }
    if (comtitle != null) {
      this._comtitle = comtitle;
    }
  }

  int? get questionSetId => _questionSetId;
  set questionSetId(int? questionSetId) => _questionSetId = questionSetId;
  int? get priorotyNo => _priorotyNo;
  set priorotyNo(int? priorotyNo) => _priorotyNo = priorotyNo;
  int? get stepFinalL => _stepFinalL;
  set stepFinalL(int? stepFinalL) => _stepFinalL = stepFinalL;
  int? get liabilityNatureId => _liabilityNatureId;
  set liabilityNatureId(int? liabilityNatureId) =>
      _liabilityNatureId = liabilityNatureId;
  String? get pathkeyRemarks => _pathkeyRemarks;
  set pathkeyRemarks(String? pathkeyRemarks) =>
      _pathkeyRemarks = pathkeyRemarks;
  int? get generalcomments => _generalcomments;
  set generalcomments(int? generalcomments) =>
      _generalcomments = generalcomments;
  int? get recominputactive => _recominputactive;
  set recominputactive(int? recominputactive) =>
      _recominputactive = recominputactive;
  String? get comtitle => _comtitle;
  set comtitle(String? comtitle) => _comtitle = comtitle;

  ApprovalPathData.fromJson(Map<String, dynamic> json) {
    _questionSetId = json['questionSetId'];
    _priorotyNo = json['priorotyNo'];
    _stepFinalL = json['stepFinalL'];
    _liabilityNatureId = json['liability_nature_id'];
    _pathkeyRemarks = json['pathkey_remarks'];
    _generalcomments = json['generalcomments'];
    _recominputactive = json['recominputactive'];
    _comtitle = json['comtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionSetId'] = this._questionSetId;
    data['priorotyNo'] = this._priorotyNo;
    data['stepFinalL'] = this._stepFinalL;
    data['liability_nature_id'] = this._liabilityNatureId;
    data['pathkey_remarks'] = this._pathkeyRemarks;
    data['generalcomments'] = this._generalcomments;
    data['recominputactive'] = this._recominputactive;
    data['comtitle'] = this._comtitle;
    return data;
  }
}

class Department {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<DepartmentData>? _data;

  Department(
      {bool? success, String? messageEn, String? messageBn, List<DepartmentData>? data}) {
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
  List<DepartmentData>? get data => _data;
  set data(List<DepartmentData>? data) => _data = data;

  Department.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <DepartmentData>[];
      json['data'].forEach((v) {
        _data!.add(new DepartmentData.fromJson(v));
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

class DepartmentData {
  int? _id;
  String? _departmentCode;
  String? _departmentName;

  DepartmentData({int? id, String? departmentCode, String? departmentName}) {
    if (id != null) {
      this._id = id;
    }
    if (departmentCode != null) {
      this._departmentCode = departmentCode;
    }
    if (departmentName != null) {
      this._departmentName = departmentName;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get departmentCode => _departmentCode;
  set departmentCode(String? departmentCode) =>
      _departmentCode = departmentCode;
  String? get departmentName => _departmentName;
  set departmentName(String? departmentName) =>
      _departmentName = departmentName;

  DepartmentData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _departmentCode = json['departmentCode'];
    _departmentName = json['departmentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['departmentCode'] = this._departmentCode;
    data['departmentName'] = this._departmentName;
    return data;
  }
}


class Division {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<DivisionData>? _data;

  Division(
      {bool? success, String? messageEn, String? messageBn, List<DivisionData>? data}) {
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
  List<DivisionData>? get data => _data;
  set data(List<DivisionData>? data) => _data = data;

  Division.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <DivisionData>[];
      json['data'].forEach((v) {
        _data!.add(new DivisionData.fromJson(v));
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

class DivisionData {
  int? _id;
  String? _divisionCode;
  String? _divisionName;

  DivisionData({int? id, String? divisionCode, String? divisionName}) {
    if (id != null) {
      this._id = id;
    }
    if (divisionCode != null) {
      this._divisionCode = divisionCode;
    }
    if (divisionName != null) {
      this._divisionName = divisionName;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get divisionCode => _divisionCode;
  set divisionCode(String? divisionCode) => _divisionCode = divisionCode;
  String? get divisionName => _divisionName;
  set divisionName(String? divisionName) => _divisionName = divisionName;

  DivisionData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _divisionCode = json['divisionCode'];
    _divisionName = json['divisionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['divisionCode'] = this._divisionCode;
    data['divisionName'] = this._divisionName;
    return data;
  }
}


class RecommendationList {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<RecomListData>? _data;

  RecommendationList(
      {bool? success, String? messageEn, String? messageBn, List<RecomListData>? data}) {
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
  List<RecomListData>? get data => _data;
  set data(List<RecomListData>? data) => _data = data;

  RecommendationList.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <RecomListData>[];
      json['data'].forEach((v) {
        _data!.add(new RecomListData.fromJson(v));
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

class RecomListData {
  int? _recomId;
  String? _recommendation;

  RecomListData({int? recomId, String? recommendation}) {
    if (recomId != null) {
      this._recomId = recomId;
    }
    if (recommendation != null) {
      this._recommendation = recommendation;
    }
  }

  int? get recomId => _recomId;
  set recomId(int? recomId) => _recomId = recomId;
  String? get recommendation => _recommendation;
  set recommendation(String? recommendation) =>
      _recommendation = recommendation;

  RecomListData.fromJson(Map<String, dynamic> json) {
    _recomId = json['recomId'];
    _recommendation = json['recommendation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recomId'] = this._recomId;
    data['recommendation'] = this._recommendation;
    return data;
  }
}



class AreaList {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<AreaListData>? _data;

  AreaList(
      {bool? success, String? messageEn, String? messageBn, List<AreaListData>? data}) {
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
  List<AreaListData>? get data => _data;
  set data(List<AreaListData>? data) => _data = data;

  AreaList.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <AreaListData>[];
      json['data'].forEach((v) {
        _data!.add(new AreaListData.fromJson(v));
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

class AreaListData {
  int? _id;
  String? _areaCode;
  String? _areaName;

  AreaListData({int? id, String? areaCode, String? areaName}) {
    if (id != null) {
      this._id = id;
    }
    if (areaCode != null) {
      this._areaCode = areaCode;
    }
    if (areaName != null) {
      this._areaName = areaName;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get areaCode => _areaCode;
  set areaCode(String? areaCode) => _areaCode = areaCode;
  String? get areaName => _areaName;
  set areaName(String? areaName) => _areaName = areaName;

  AreaListData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _areaCode = json['areaCode'];
    _areaName = json['areaName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['areaCode'] = this._areaCode;
    data['areaName'] = this._areaName;
    return data;
  }
}
























