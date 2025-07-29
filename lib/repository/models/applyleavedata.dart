class ApplyleaveData {
  int? leavetypeId;
  String? reason;
  String? beginDate;
  String? endDate;
  
  int? countryID;
  int? divisionID;
  String? destination;
  int? districtID;

  ApplyleaveData(
      {this.leavetypeId,
      this.reason,
      this.beginDate,
      this.endDate,
      this.countryID,
      this.divisionID,
      this.destination,
      this.districtID});

  ApplyleaveData.fromJson(Map<String, dynamic> json) {
    leavetypeId = json['leavetypeId'];
    reason = json['Reason'];
    beginDate = json['beginDate'];
    endDate = json['endDate'];
    countryID = json['countryID'];
    divisionID = json['divisionID'];
    destination = json['destination'];
    districtID = json['districtID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leavetypeId'] = this.leavetypeId;
    data['Reason'] = this.reason;
    data['beginDate'] = this.beginDate;
    data['endDate'] = this.endDate;
    data['countryID'] = this.countryID;
    data['divisionID'] = this.divisionID;
    data['destination'] = this.destination;
    data['districtID'] = this.districtID;
    return data;
  }
}