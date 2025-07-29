class BreakFastBill {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<BreakFastBillData>? _data = [];

  BreakFastBill(
      {bool? success, String? messageEn, String? messageBn, List<BreakFastBillData>? data}) {
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
  List<BreakFastBillData>? get data => _data;
  set data(List<BreakFastBillData>? data) => _data = data;

  BreakFastBill.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <BreakFastBillData>[];
      json['data'].forEach((v) {
        _data!.add(new BreakFastBillData.fromJson(v));
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

class BreakFastBillData {
  int? _billId;
  int? _gradeId;
  String? _billInSlot;
  int? _billingPlaceId;
  int? _billingAmount;
  String? _placeName;



  BreakFastBillData(
      {int? billId,
        int? gradeId,
        String? billInSlot,
        int? billingPlaceId,
        int? billingAmount,
        String? placeName

      }) {
    if (billId != null) {
      this._billId = billId;
    }
    if (gradeId != null) {
      this._gradeId = gradeId;
    }
    if (billInSlot != null) {
      this._billInSlot = billInSlot;
    }
    if (billingPlaceId != null) {
      this._billingPlaceId = billingPlaceId;
    }
    if (billingAmount != null) {
      this._billingAmount = billingAmount;
    }
    if (_placeName != null) {
      this._placeName = placeName;
    }
  }

  int? get billId => _billId;
  set billId(int? billId) => _billId = billId;
  int? get gradeId => _gradeId;
  set gradeId(int? gradeId) => _gradeId = gradeId;
  String? get billInSlot => _billInSlot;
  set billInSlot(String? billInSlot) => _billInSlot = billInSlot;
  int? get billingPlaceId => _billingPlaceId;
  set billingPlaceId(int? billingPlaceId) => _billingPlaceId = billingPlaceId;
  int? get billingAmount => _billingAmount;
  set billingAmount(int? billingAmount) => _billingAmount = billingAmount;
  String? get placeName => _placeName;

  set placeName(String? value) {
    _placeName = value;
  }

  BreakFastBillData.fromJson(Map<String, dynamic> json) {
    _billId = json['billId'];
    _gradeId = json['gradeId'];
    _billInSlot = json['billInSlot'];
    _billingPlaceId = json['billingPlaceId'];
    _billingAmount = json['billingAmount'];
    _placeName = json['placeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billId'] = this._billId;
    data['gradeId'] = this._gradeId;
    data['billInSlot'] = this._billInSlot;
    data['billingPlaceId'] = this._billingPlaceId;
    data['billingAmount'] = this._billingAmount;
    data['placeName'] = this._placeName;
    return data;
  }
}

class LunchNDinnerBill {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<LunchNDinnerData>? _data;

  LunchNDinnerBill(
      {bool? success, String? messageEn, String? messageBn, List<LunchNDinnerData>? data}) {
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
  List<LunchNDinnerData>? get data => _data;
  set data(List<LunchNDinnerData>? data) => _data = data;

  LunchNDinnerBill.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <LunchNDinnerData>[];
      json['data'].forEach((v) {
        _data!.add(new LunchNDinnerData.fromJson(v));
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

class LunchNDinnerData {
  int? _billID;
  int? _gradeID;
  int? _billPlaceID;
  int? _billingAmount;
  String? _billingTime;
  String? _placeName;



  LunchNDinnerData(
      {int? billID,
        int? gradeID,
        int? billPlaceID,
        int? billingAmount,
        String? billingTime,
        String? placeName

      }) {
    if (billID != null) {
      this._billID = billID;
    }
    if (gradeID != null) {
      this._gradeID = gradeID;
    }
    if (billPlaceID != null) {
      this._billPlaceID = billPlaceID;
    }
    if (billingAmount != null) {
      this._billingAmount = billingAmount;
    }
    if (billingTime != null) {
      this._billingTime = billingTime;
    }
    if (placeName != null) {
      this._placeName = placeName;
    }
  }

  int? get billID => _billID;
  set billID(int? billID) => _billID = billID;
  int? get gradeID => _gradeID;
  set gradeID(int? gradeID) => _gradeID = gradeID;
  int? get billPlaceID => _billPlaceID;
  set billPlaceID(int? billPlaceID) => _billPlaceID = billPlaceID;
  int? get billingAmount => _billingAmount;
  set billingAmount(int? billingAmount) => _billingAmount = billingAmount;
  String? get billingTime => _billingTime;
  set billingTime(String? billingTime) => _billingTime = billingTime;
  String? get placeName => _placeName;

  set placeName(String? value) {
    _placeName = value;
  }
  LunchNDinnerData.fromJson(Map<String, dynamic> json) {
    _billID = json['billID'];
    _gradeID = json['gradeID'];
    _billPlaceID = json['billPlaceID'];
    _billingAmount = json['billingAmount'];
    _billingTime = json['billingTime'];
    _placeName = json['placeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billID'] = this._billID;
    data['gradeID'] = this._gradeID;
    data['billPlaceID'] = this._billPlaceID;
    data['billingAmount'] = this._billingAmount;
    data['billingTime'] = this._billingTime;
    data['placeName'] = this._placeName;
    return data;
  }
}


class ResidenceBill {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ResidenceData>? _data;

  ResidenceBill(
      {bool? success, String? messageEn, String? messageBn, List<ResidenceData>? data}) {
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
  List<ResidenceData>? get data => _data;
  set data(List<ResidenceData>? data) => _data = data;

  ResidenceBill.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ResidenceData>[];
      json['data'].forEach((v) {
        _data!.add(new ResidenceData.fromJson(v));
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

class ResidenceData {
  int? _billID;
  int? _gradeID;
  String? _billingTime;
  int? _placeTypeID;
  int? _billingAmount;
  String? _placeName;



  ResidenceData(
      {int? billID,
        int? gradeID,
        String? billingTime,
        int? placeTypeID,
        int? billingAmount,
        String? placeName
      }) {
    if (billID != null) {
      this._billID = billID;
    }
    if (gradeID != null) {
      this._gradeID = gradeID;
    }
    if (billingTime != null) {
      this._billingTime = billingTime;
    }
    if (placeTypeID != null) {
      this._placeTypeID = placeTypeID;
    }
    if (billingAmount != null) {
      this._billingAmount = billingAmount;
    }

    if (placeName != null) {
      this._placeName = placeName;
    }
  }

  int? get billID => _billID;
  set billID(int? billID) => _billID = billID;
  int? get gradeID => _gradeID;
  set gradeID(int? gradeID) => _gradeID = gradeID;
  String? get billingTime => _billingTime;
  set billingTime(String? billingTime) => _billingTime = billingTime;
  int? get placeTypeID => _placeTypeID;
  set placeTypeID(int? placeTypeID) => _placeTypeID = placeTypeID;
  int? get billingAmount => _billingAmount;
  set billingAmount(int? billingAmount) => _billingAmount = billingAmount;

  String? get placeName => _placeName;

  set placeName(String? value) {
    _placeName = value;
  }

  ResidenceData.fromJson(Map<String, dynamic> json) {
    _billID = json['billID'];
    _gradeID = json['gradeID'];
    _billingTime = json['billingTime'];
    _placeTypeID = json['placeTypeID'];
    _billingAmount = json['billingAmount'];
    _placeName = json['placeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billID'] = this._billID;
    data['gradeID'] = this._gradeID;
    data['billingTime'] = this._billingTime;
    data['placeTypeID'] = this._placeTypeID;
    data['billingAmount'] = this._billingAmount;
    data['placeName'] = this._placeName;
    return data;
  }
}



class DailyNSpecialBill {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<DailyNSpecialData>? _data;

  DailyNSpecialBill(
      {bool? success, String? messageEn, String? messageBn, List<DailyNSpecialData>? data}) {
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
  List<DailyNSpecialData>? get data => _data;
  set data(List<DailyNSpecialData>? data) => _data = data;

  DailyNSpecialBill.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <DailyNSpecialData>[];
      json['data'].forEach((v) {
        _data!.add(new DailyNSpecialData.fromJson(v));
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

class DailyNSpecialData {
  int? _billID;
  int? _gradeID;
  int? _specialAllowance;
  int? _dailyAllowance;

  DailyNSpecialData(
      {int? billID, int? gradeID, int? specialAllowance, int? dailyAllowance}) {
    if (billID != null) {
      this._billID = billID;
    }
    if (gradeID != null) {
      this._gradeID = gradeID;
    }
    if (specialAllowance != null) {
      this._specialAllowance = specialAllowance;
    }
    if (dailyAllowance != null) {
      this._dailyAllowance = dailyAllowance;
    }
  }

  int? get billID => _billID;
  set billID(int? billID) => _billID = billID;
  int? get gradeID => _gradeID;
  set gradeID(int? gradeID) => _gradeID = gradeID;
  int? get specialAllowance => _specialAllowance;
  set specialAllowance(int? specialAllowance) =>
      _specialAllowance = specialAllowance;
  int? get dailyAllowance => _dailyAllowance;
  set dailyAllowance(int? dailyAllowance) => _dailyAllowance = dailyAllowance;

  DailyNSpecialData.fromJson(Map<String, dynamic> json) {
    _billID = json['billID'];
    _gradeID = json['gradeID'];
    _specialAllowance = json['specialAllowance'];
    _dailyAllowance = json['dailyAllowance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billID'] = this._billID;
    data['gradeID'] = this._gradeID;
    data['specialAllowance'] = this._specialAllowance;
    data['dailyAllowance'] = this._dailyAllowance;
    return data;
  }
}






