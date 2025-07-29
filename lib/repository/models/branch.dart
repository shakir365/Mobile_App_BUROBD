



class Branch {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
   List<BranchData> _data = [];

  Branch(
      {bool? success, String? messageEn, String? messageBn, List<BranchData>? data}) {
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
  List<BranchData> get data => _data;
  set data(List<BranchData> data) => _data = data;

  Branch.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <BranchData>[];
      json['data'].forEach((v) {
        _data!.add(new BranchData.fromJson(v));
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

class BranchData {
  int? _branchID;
  String? _branchCode;
  String? _branchName;

  BranchData({int? branchID, String? branchCode, String? branchName}) {
    if (branchID != null) {
      this._branchID = branchID;
    }
    if (branchCode != null) {
      this._branchCode = branchCode;
    }
    if (branchName != null) {
      this._branchName = branchName;
    }
  }

  int? get branchID => _branchID;
  set branchID(int? branchID) => _branchID = branchID;
  String? get branchCode => _branchCode;
  set branchCode(String? branchCode) => _branchCode = branchCode;
  String? get branchName => _branchName;
  set branchName(String? branchName) => _branchName = branchName;

  BranchData.fromJson(Map<String, dynamic> json) {
    _branchID = json['branchID'];
    _branchCode = json['branchCode'];
    _branchName = json['branchName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchID'] = this._branchID;
    data['branchCode'] = this._branchCode;
    data['branchName'] = this._branchName;
    return data;
  }
}

class Item{
  late String id ;
  late String name;



  Item(this.id, this.name);

  Item.fromMap(Map<String, dynamic> res)
      : id = res["id"] ,
        name = res["name"];


  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name': name,

    };
  }
}

