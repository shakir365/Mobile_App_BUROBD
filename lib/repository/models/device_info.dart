class DeviceInfo {
  int _id;
  String _employeeCode;

  int _isLoggedIn;
  String _deviceType;
  String _deviceOS;
  String _fcmAndroid;
  String _fcmIos;

  // Constructor
  DeviceInfo({
    required int id,
    required String employeeCode,
    required int isLoggedIn,
    required String deviceType,
    required String deviceOS,
    required String fcmAndroid,
    required String fcmIos,
  })  : _id = id,
        _employeeCode = employeeCode,
        _isLoggedIn = isLoggedIn,
        _deviceType = deviceType,
        _deviceOS = deviceOS,
        _fcmAndroid = fcmAndroid,
        _fcmIos = fcmIos;

  // Getters
  int get id => _id;
  String get employeeCode => _employeeCode;
  int get isLoggedIn => _isLoggedIn;
  String get deviceType => _deviceType;
  String get deviceOS => _deviceOS;
  String get fcmAndroid => _fcmAndroid;
  String get fcmIos => _fcmIos;

  // Setters
  set id(int value) => _id = value;
  set employeeCode(String value) => _employeeCode = value;
  set isLoggedIn(int value) => _isLoggedIn = value;
  set deviceType(String value) => _deviceType = value;
  set deviceOS(String value) => _deviceOS = value;
  set fcmAndroid(String value) => _fcmAndroid = value;
  set fcmIos(String value) => _fcmIos = value;

  // Factory constructor for JSON deserialization
  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      id: json['id'] as int,
      employeeCode: json['employeeCode'] as String,
      isLoggedIn: json['isLoggedIn'] as int,
      deviceType: json['deviceType'] as String,
      deviceOS: json['deviceOS'] as String,
      fcmAndroid: json['fcmAndroid'] as String,
      fcmIos: json['fcmIos'] as String,
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'employeeCode': _employeeCode,
      'isLoggedIn': _isLoggedIn,
      'deviceType': _deviceType,
      'deviceOS': _deviceOS,
      'fcmAndroid': _fcmAndroid,
      'fcmIos': _fcmIos,
    };
  }
}