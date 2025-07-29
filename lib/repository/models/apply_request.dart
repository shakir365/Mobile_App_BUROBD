class ApplyRequest{
   late int id ;
   late String startDate;
   late String startTime;
   late String endDate;
   late String endTime;
   late String fromBranch;
   late String fromOther;
   late String toBranch;
   late String toOther;
   late String reason;
   late String transport;
   late String transportFare;
   late String morning;
   late String afternoon;
   late String night;
   late String hotel;
   late String dailyAllowance;
   late String specialAllowance;
   late int planId;
   late String planName;
   late int morningPlaceId;
   late int eveningPlaceID;
   late int nightPlaceID;
   late int hotelPlaceID;
   late int dailyAllowanceIsCheck;
   late int specialAllowanceIsCheck;


  /* "morningPlaceID INTEGER NOT NULL ,"
   "eveningPlaceID INTEGER NOT NULL ,"
   "nightPlaceID INTEGER NOT NULL ,"
   "hotelPlaceID INTEGER NOT NULL ,"
   "dailyAllowance INTEGER NOT NULL ,"
   "specialAllowance INTEGER NOT NULL ,*/

  /* ApplyRequest(this.id, this.startDate, this.startTime, this.endDate,
      this.endTime, this.fromBranch,this.fromOther,
       this.toBranch,this.toOther, this.reason, this.transport,
       this.transportFare,this.morning,this.afternoon,this.night,
       this.hotel,this.dailyAllowance,this.specialAllowance,
       this.planId,this.planName,this.morningPlaceId);*/

   ApplyRequest(
      this.id,
      this.startDate,
      this.startTime,
      this.endDate,
      this.endTime,
      this.fromBranch,
      this.fromOther,
      this.toBranch,
      this.toOther,
      this.reason,
      this.transport,
      this.transportFare,
      this.morning,
      this.afternoon,
      this.night,
      this.hotel,
      this.dailyAllowance,
      this.specialAllowance,
      this.planId,
      this.planName,
      this.morningPlaceId,
      this.eveningPlaceID,
      this.nightPlaceID,
      this.hotelPlaceID,
      this.dailyAllowanceIsCheck,
      this.specialAllowanceIsCheck);

  ApplyRequest.fromMap(Map<String, dynamic> res)
      : id = res["id"] ,
        startDate = res["startDate"],
        endDate = res["endDate"];



  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'startDate': startDate,
      'startTime': startTime,
      'endDate': endDate,
      'endTime': endTime,
      'fromBranch': fromBranch,
      'fromOther': fromOther,
      'toBranch': toBranch,
      'toOther': toOther,
      'reason': reason,
      'transport': transport,
      'transportFare':transportFare,
      'morning':morning,
      'afternoon':afternoon,
      'night':night,
      'hotel':hotel,
      'dailyAllowance':dailyAllowance,
      'specialAllowance':specialAllowance,
      'planId':planId,
      'planName':planName,
      'morningPlaceID':morningPlaceId,
      'eveningPlaceID':eveningPlaceID,
      'nightPlaceID':nightPlaceID,
      'hotelPlaceID':hotelPlaceID,
      'dailyAllowanceIsCheck':dailyAllowanceIsCheck,
      'specialAllowanceIsCheck':specialAllowanceIsCheck
    };
  }
}