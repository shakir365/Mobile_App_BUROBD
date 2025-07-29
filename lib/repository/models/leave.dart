class DivisionLeave {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<DivisionLeaveData>? _data =[];

  DivisionLeave(
      {bool? success, String? messageEn, String? messageBn, List<DivisionLeaveData>? data}) {
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
  List<DivisionLeaveData>? get data => _data;
  set data(List<DivisionLeaveData>? data) => _data = data;

  DivisionLeave.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <DivisionLeaveData>[];
      json['data'].forEach((v) {
        _data!.add(new DivisionLeaveData.fromJson(v));
      });
    }
  }

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }*/
}



class DivisionLeaveData {
  final int? id;
  final String? divisionCode;
  final String? divisionName;

  DivisionLeaveData({
    required this.id,
    required this.divisionCode,
    required this.divisionName}
    );


 factory DivisionLeaveData.fromJson(Map<String, dynamic> json) {


   return  DivisionLeaveData(
      id: json['id'],
      divisionCode: json['divisionCode'],
      divisionName: json['divisionName'] ,



    );



  }

 /* static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }*/

  /*static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  };*/

  static List<DivisionLeaveData> fromJsonList(List list) {
    return list.map((item) => DivisionLeaveData.fromJson(item)).toList();
  }

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['divisionCode'] = this._divisionCode;
    data['divisionName'] = this._divisionName;
    return data;
  }*/


  bool isEqual(DivisionLeaveData model) {
    return this.id == model.id;
  }
}

class DistrictLeave {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<DistrictLeaveData>? _data = [];

  DistrictLeave(
      {bool? success, String? messageEn, String? messageBn, List<DistrictLeaveData>? data}) {
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
  List<DistrictLeaveData>? get data => _data;
  set data(List<DistrictLeaveData>? data) => _data = data;

  DistrictLeave.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <DistrictLeaveData>[];
      json['data'].forEach((v) {
        _data!.add(new DistrictLeaveData.fromJson(v));
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

class DistrictLeaveData {
  int? _id;
  String? _districtName;
  String? _districtCode;
  int? _divisionId;

  DistrictLeaveData({int? id, String? districtName, String? districtCode, int? divisionId}) {
    if (id != null) {
      this._id = id;
    }
    if (districtName != null) {
      this._districtName = districtName;
    }
    if (districtCode != null) {
      this._districtCode = districtCode;
    }
    if (divisionId != null) {
      this._divisionId = divisionId;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get districtName => _districtName;
  set districtName(String? districtName) => _districtName = districtName;
  String? get districtCode => _districtCode;
  set districtCode(String? districtCode) => _districtCode = districtCode;
  int? get divisionId => _divisionId;
  set divisionId(int? divisionId) => _divisionId = divisionId;

  DistrictLeaveData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _districtName = json['districtName'];
    _districtCode = json['districtCode'];
    _divisionId = json['divisionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['districtName'] = this._districtName;
    data['districtCode'] = this._districtCode;
    data['divisionId'] = this._divisionId;
    return data;
  }
}



class LeaveCountry {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<LeaveCountryData>? _data;

  LeaveCountry(
      {bool? success, String? messageEn, String? messageBn, List<LeaveCountryData>? data}) {
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
  List<LeaveCountryData>? get data => _data;
  set data(List<LeaveCountryData>? data) => _data = data;

  LeaveCountry.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <LeaveCountryData>[];
      json['data'].forEach((v) {
        _data!.add(new LeaveCountryData.fromJson(v));
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

class LeaveCountryData {
  String? _countryCode;
  String? _countryName;
  String? _nationality;
  int? _countryId;

  LeaveCountryData(
      {String? countryCode,
        String? countryName,
        String? nationality,
        int? countryId}) {
    if (countryCode != null) {
      this._countryCode = countryCode;
    }
    if (countryName != null) {
      this._countryName = countryName;
    }
    if (nationality != null) {
      this._nationality = nationality;
    }
    if (countryId != null) {
      this._countryId = countryId;
    }
  }

  String? get countryCode => _countryCode;
  set countryCode(String? countryCode) => _countryCode = countryCode;
  String? get countryName => _countryName;
  set countryName(String? countryName) => _countryName = countryName;
  String? get nationality => _nationality;
  set nationality(String? nationality) => _nationality = nationality;
  int? get countryId => _countryId;
  set countryId(int? countryId) => _countryId = countryId;

  LeaveCountryData.fromJson(Map<String, dynamic> json) {
    _countryCode = json['countryCode'];
    _countryName = json['countryName'];
    _nationality = json['nationality'];
    _countryId = json['countryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryCode'] = this._countryCode;
    data['countryName'] = this._countryName;
    data['nationality'] = this._nationality;
    data['countryId'] = this._countryId;
    return data;
  }
}



class FileUploadModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  int? _statusCode;
  Data? _data;

  FileUploadModel(
      {bool? success,
        String? messageEn,
        String? messageBn,
        int? statusCode,
        Data? data}) {
    if (success != null) {
      this._success = success;
    }
    if (messageEn != null) {
      this._messageEn = messageEn;
    }
    if (messageBn != null) {
      this._messageBn = messageBn;
    }
    if (statusCode != null) {
      this._statusCode = statusCode;
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
  int? get statusCode => _statusCode;
  set statusCode(int? statusCode) => _statusCode = statusCode;
  Data? get data => _data;
  set data(Data? data) => _data = data;

  FileUploadModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    data['statusCode'] = this._statusCode;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  int? _fileId;

  Data({int? fileId}) {
    if (fileId != null) {
      this._fileId = fileId;
    }
  }

  int? get fileId => _fileId;
  set fileId(int? fileId) => _fileId = fileId;

  Data.fromJson(Map<String, dynamic> json) {
    _fileId = json['fileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileId'] = this._fileId;
    return data;
  }
}


/*class FileDownloadModel {
  String? _fileName;
  String? _fileType;
  String? _fileData;

  FileDownloadModel({String? fileName, String? fileType, String? fileData}) {
    if (fileName != null) {
      this._fileName = fileName;
    }
    if (fileType != null) {
      this._fileType = fileType;
    }
    if (fileData != null) {
      this._fileData = fileData;
    }
  }

  String? get fileName => _fileName;
  set fileName(String? fileName) => _fileName = fileName;
  String? get fileType => _fileType;
  set fileType(String? fileType) => _fileType = fileType;
  String? get fileData => _fileData;
  set fileData(String? fileData) => _fileData = fileData;

  FileDownloadModel.fromJson(Map<String, dynamic> json) {
    _fileName = json['fileName'];
    _fileType = json['fileType'];
    _fileData = json['fileData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this._fileName;
    data['fileType'] = this._fileType;
    data['fileData'] = this._fileData;
    return data;
  }
}*/


class FileDownloadModel {
  bool? _success;
  String? _fileType;
  List<FileData>? _fileData;

  FileDownloadModel(
      {bool? success, String? fileType, List<FileData>? fileData}) {
    if (success != null) {
      this._success = success;
    }
    if (fileType != null) {
      this._fileType = fileType;
    }
    if (fileData != null) {
      this._fileData = fileData;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get fileType => _fileType;
  set fileType(String? fileType) => _fileType = fileType;
  List<FileData>? get fileData => _fileData;
  set fileData(List<FileData>? fileData) => _fileData = fileData;

  FileDownloadModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _fileType = json['fileType'];
    if (json['fileData'] != null) {
      _fileData = <FileData>[];
      json['fileData'].forEach((v) {
        _fileData!.add(new FileData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['fileType'] = this._fileType;
    if (this._fileData != null) {
      data['fileData'] = this._fileData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FileData {
  String? _fileName;
  int? _attachmentId;
  String? _fileContentBase64;

  FileData({String? fileName, int? attachmentId, String? fileContentBase64}) {
    if (fileName != null) {
      this._fileName = fileName;
    }
    if (attachmentId != null) {
      this._attachmentId = attachmentId;
    }
    if (fileContentBase64 != null) {
      this._fileContentBase64 = fileContentBase64;
    }
  }

  String? get fileName => _fileName;
  set fileName(String? fileName) => _fileName = fileName;
  int? get attachmentId => _attachmentId;
  set attachmentId(int? attachmentId) => _attachmentId = attachmentId;
  String? get fileContentBase64 => _fileContentBase64;
  set fileContentBase64(String? fileContentBase64) =>
      _fileContentBase64 = fileContentBase64;

  FileData.fromJson(Map<String, dynamic> json) {
    _fileName = json['fileName'];
    _attachmentId = json['attachmentId'];
    _fileContentBase64 = json['fileContentBase64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this._fileName;
    data['attachmentId'] = this._attachmentId;
    data['fileContentBase64'] = this._fileContentBase64;
    return data;
  }
}
