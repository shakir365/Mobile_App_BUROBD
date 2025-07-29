import 'dart:convert';

TestData countryFromJson(String str) => TestData.fromJson(json.decode(str));

String countryToJson(TestData data) => json.encode(data.toJson());

class TestData {
  String employeeCode;
  String employeeName;
  String employeeId;
  String departmentId;
  String leaveTypeId;
  String leaveTypeName;
  String eligible;
  String parking;
  String taken;
  String remaining;
  String elqId;
  String lcdetailsId;

  TestData(
      {
      required this.employeeCode,
      required this.employeeName,
      required this.employeeId,
      required this.departmentId,
      required this.leaveTypeId,
      required this.leaveTypeName,
      required this.eligible,
      required this.parking,
      required this.taken,
      required this.remaining,
      required this.elqId,
      required this.lcdetailsId
      
      
      });

  factory TestData.fromJson(Map<String, dynamic> json) => TestData(
      employeeCode: json['employeeCode'],
      employeeName: json['employeeName'],
      employeeId: json['employeeId'],
      departmentId:json['departmentId'],
      leaveTypeId:json['leaveTypeId'],
      leaveTypeName:json['leaveTypeName'],
      eligible:json['eligible'],
      parking:json['parking'],
      taken:json['taken'],
      remaining:json['remaining'],
      elqId:json['elqId'],
      lcdetailsId:json['lcdetailsId']






      
      
      
      
      );

  Map<String, dynamic> toJson() => {
        // "countryCode": countryCode,
        // "countryName": countryName,
        // "nationality": nationality,


      "employeeCode": employeeCode,
      "employeeName": employeeName,
      "employeeId": employeeId,
      "departmentId":departmentId,
      "leaveTypeId":leaveTypeId,
      "leaveTypeName":leaveTypeName,
      "eligible":eligible,
      "parking":parking,
      "taken":taken,
      "remaining":remaining,
      "elqId":elqId,
      "lcdetailsId":lcdetailsId




      };
}
