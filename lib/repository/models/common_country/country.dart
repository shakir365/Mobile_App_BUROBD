import 'dart:convert';
MycountryModel countryFromJson(String str) => MycountryModel.fromJson(json.decode(str));

String countryToJson(MycountryModel data) => json.encode(data.toJson());

class MycountryModel {
  String countryCode;
  String countryName;
  String nationality;

  MycountryModel(
    {
      required this.countryCode,
      required  this.countryName,
      required  this.nationality
    
    });

  factory MycountryModel.fromJson(Map<String, dynamic> json) =>
   MycountryModel(
    countryCode : json['countryCode'],
    countryName : json['countryName'],
    nationality : json['nationality']
   );

  Map<String, dynamic> toJson()=> {
    "countryCode": countryCode, "countryName": countryName, "nationality": nationality
    };

  
}


