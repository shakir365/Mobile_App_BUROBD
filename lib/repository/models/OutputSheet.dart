class AllCashInFlowModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<AllCashInFlowData>? _data =[];

  AllCashInFlowModel(
      {bool? success, String? messageEn, String? messageBn, List<AllCashInFlowData>? data}) {
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
  List<AllCashInFlowData>? get data => _data;
  set data(List<AllCashInFlowData>? data) => _data = data;

  AllCashInFlowModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <AllCashInFlowData>[];
      json['data'].forEach((v) {
        _data!.add(new AllCashInFlowData.fromJson(v));
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

class AllCashInFlowData {
  int? _customerid;
  int? _businessIncomeCashFlow;
  int? _businessIncomePrevCashFlow;
  int? _agricultureIncomeCashFlow;
  int? _agricultureIncomePrevCashFlow;
  int? _rentalIncomeCashFlow;
  int? _rentalIncomePrevCashFlow;
  int? _salaryIncomeCashFlow;
  int? _salaryIncomePrevCashFlow;
  int? _alliedagriIncomeCashFlow;
  int? _alliedagriIncomePrevCashFlow;
  int? _otherIncomeCashFlow;
  int? _otherIncomePrevCashFlow;
  int? _currentTotalCashFlow;
  int? _previousTotalCashFlow;

  AllCashInFlowData(
      {int? customerid,
        int? businessIncomeCashFlow,
        int? businessIncomePrevCashFlow,
        int? agricultureIncomeCashFlow,
        int? agricultureIncomePrevCashFlow,
        int? rentalIncomeCashFlow,
        int? rentalIncomePrevCashFlow,
        int? salaryIncomeCashFlow,
        int? salaryIncomePrevCashFlow,
        int? alliedagriIncomeCashFlow,
        int? alliedagriIncomePrevCashFlow,
        int? otherIncomeCashFlow,
        int? otherIncomePrevCashFlow,
        int? currentTotalCashFlow,
        int? previousTotalCashFlow}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (businessIncomeCashFlow != null) {
      this._businessIncomeCashFlow = businessIncomeCashFlow;
    }
    if (businessIncomePrevCashFlow != null) {
      this._businessIncomePrevCashFlow = businessIncomePrevCashFlow;
    }
    if (agricultureIncomeCashFlow != null) {
      this._agricultureIncomeCashFlow = agricultureIncomeCashFlow;
    }
    if (agricultureIncomePrevCashFlow != null) {
      this._agricultureIncomePrevCashFlow = agricultureIncomePrevCashFlow;
    }
    if (rentalIncomeCashFlow != null) {
      this._rentalIncomeCashFlow = rentalIncomeCashFlow;
    }
    if (rentalIncomePrevCashFlow != null) {
      this._rentalIncomePrevCashFlow = rentalIncomePrevCashFlow;
    }
    if (salaryIncomeCashFlow != null) {
      this._salaryIncomeCashFlow = salaryIncomeCashFlow;
    }
    if (salaryIncomePrevCashFlow != null) {
      this._salaryIncomePrevCashFlow = salaryIncomePrevCashFlow;
    }
    if (alliedagriIncomeCashFlow != null) {
      this._alliedagriIncomeCashFlow = alliedagriIncomeCashFlow;
    }
    if (alliedagriIncomePrevCashFlow != null) {
      this._alliedagriIncomePrevCashFlow = alliedagriIncomePrevCashFlow;
    }
    if (otherIncomeCashFlow != null) {
      this._otherIncomeCashFlow = otherIncomeCashFlow;
    }
    if (otherIncomePrevCashFlow != null) {
      this._otherIncomePrevCashFlow = otherIncomePrevCashFlow;
    }
    if (currentTotalCashFlow != null) {
      this._currentTotalCashFlow = currentTotalCashFlow;
    }
    if (previousTotalCashFlow != null) {
      this._previousTotalCashFlow = previousTotalCashFlow;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get businessIncomeCashFlow => _businessIncomeCashFlow;
  set businessIncomeCashFlow(int? businessIncomeCashFlow) =>
      _businessIncomeCashFlow = businessIncomeCashFlow;
  int? get businessIncomePrevCashFlow => _businessIncomePrevCashFlow;
  set businessIncomePrevCashFlow(int? businessIncomePrevCashFlow) =>
      _businessIncomePrevCashFlow = businessIncomePrevCashFlow;
  int? get agricultureIncomeCashFlow => _agricultureIncomeCashFlow;
  set agricultureIncomeCashFlow(int? agricultureIncomeCashFlow) =>
      _agricultureIncomeCashFlow = agricultureIncomeCashFlow;
  int? get agricultureIncomePrevCashFlow => _agricultureIncomePrevCashFlow;
  set agricultureIncomePrevCashFlow(int? agricultureIncomePrevCashFlow) =>
      _agricultureIncomePrevCashFlow = agricultureIncomePrevCashFlow;
  int? get rentalIncomeCashFlow => _rentalIncomeCashFlow;
  set rentalIncomeCashFlow(int? rentalIncomeCashFlow) =>
      _rentalIncomeCashFlow = rentalIncomeCashFlow;
  int? get rentalIncomePrevCashFlow => _rentalIncomePrevCashFlow;
  set rentalIncomePrevCashFlow(int? rentalIncomePrevCashFlow) =>
      _rentalIncomePrevCashFlow = rentalIncomePrevCashFlow;
  int? get salaryIncomeCashFlow => _salaryIncomeCashFlow;
  set salaryIncomeCashFlow(int? salaryIncomeCashFlow) =>
      _salaryIncomeCashFlow = salaryIncomeCashFlow;
  int? get salaryIncomePrevCashFlow => _salaryIncomePrevCashFlow;
  set salaryIncomePrevCashFlow(int? salaryIncomePrevCashFlow) =>
      _salaryIncomePrevCashFlow = salaryIncomePrevCashFlow;
  int? get alliedagriIncomeCashFlow => _alliedagriIncomeCashFlow;
  set alliedagriIncomeCashFlow(int? alliedagriIncomeCashFlow) =>
      _alliedagriIncomeCashFlow = alliedagriIncomeCashFlow;
  int? get alliedagriIncomePrevCashFlow => _alliedagriIncomePrevCashFlow;
  set alliedagriIncomePrevCashFlow(int? alliedagriIncomePrevCashFlow) =>
      _alliedagriIncomePrevCashFlow = alliedagriIncomePrevCashFlow;
  int? get otherIncomeCashFlow => _otherIncomeCashFlow;
  set otherIncomeCashFlow(int? otherIncomeCashFlow) =>
      _otherIncomeCashFlow = otherIncomeCashFlow;
  int? get otherIncomePrevCashFlow => _otherIncomePrevCashFlow;
  set otherIncomePrevCashFlow(int? otherIncomePrevCashFlow) =>
      _otherIncomePrevCashFlow = otherIncomePrevCashFlow;
  int? get currentTotalCashFlow => _currentTotalCashFlow;
  set currentTotalCashFlow(int? currentTotalCashFlow) =>
      _currentTotalCashFlow = currentTotalCashFlow;
  int? get previousTotalCashFlow => _previousTotalCashFlow;
  set previousTotalCashFlow(int? previousTotalCashFlow) =>
      _previousTotalCashFlow = previousTotalCashFlow;

  AllCashInFlowData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _businessIncomeCashFlow = json['businessIncomeCashFlow'];
    _businessIncomePrevCashFlow = json['businessIncomePrevCashFlow'];
    _agricultureIncomeCashFlow = json['agricultureIncomeCashFlow'];
    _agricultureIncomePrevCashFlow = json['agricultureIncomePrevCashFlow'];
    _rentalIncomeCashFlow = json['rentalIncomeCashFlow'];
    _rentalIncomePrevCashFlow = json['rentalIncomePrevCashFlow'];
    _salaryIncomeCashFlow = json['salaryIncomeCashFlow'];
    _salaryIncomePrevCashFlow = json['salaryIncomePrevCashFlow'];
    _alliedagriIncomeCashFlow = json['alliedagriIncomeCashFlow'];
    _alliedagriIncomePrevCashFlow = json['alliedagriIncomePrevCashFlow'];
    _otherIncomeCashFlow = json['otherIncomeCashFlow'];
    _otherIncomePrevCashFlow = json['otherIncomePrevCashFlow'];
    _currentTotalCashFlow = json['currentTotalCashFlow'];
    _previousTotalCashFlow = json['previousTotalCashFlow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['businessIncomeCashFlow'] = this._businessIncomeCashFlow;
    data['businessIncomePrevCashFlow'] = this._businessIncomePrevCashFlow;
    data['agricultureIncomeCashFlow'] = this._agricultureIncomeCashFlow;
    data['agricultureIncomePrevCashFlow'] = this._agricultureIncomePrevCashFlow;
    data['rentalIncomeCashFlow'] = this._rentalIncomeCashFlow;
    data['rentalIncomePrevCashFlow'] = this._rentalIncomePrevCashFlow;
    data['salaryIncomeCashFlow'] = this._salaryIncomeCashFlow;
    data['salaryIncomePrevCashFlow'] = this._salaryIncomePrevCashFlow;
    data['alliedagriIncomeCashFlow'] = this._alliedagriIncomeCashFlow;
    data['alliedagriIncomePrevCashFlow'] = this._alliedagriIncomePrevCashFlow;
    data['otherIncomeCashFlow'] = this._otherIncomeCashFlow;
    data['otherIncomePrevCashFlow'] = this._otherIncomePrevCashFlow;
    data['currentTotalCashFlow'] = this._currentTotalCashFlow;
    data['previousTotalCashFlow'] = this._previousTotalCashFlow;
    return data;
  }
}




class CashOutFlowModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<CashOutFlowData>? _data = [];

  CashOutFlowModel(
      {bool? success, String? messageEn, String? messageBn, List<CashOutFlowData>? data}) {
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
  List<CashOutFlowData>? get data => _data;
  set data(List<CashOutFlowData>? data) => _data = data;

  CashOutFlowModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <CashOutFlowData>[];
      json['data'].forEach((v) {
        _data!.add(new CashOutFlowData.fromJson(v));
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

class CashOutFlowData {
  int? _customerid;
  int? _cashOutfowPurchases;
  int? _prevCashOutfowPurchases;
  int? _cashOutfowRent;
  int? _prevCashOutfowRent;
  int? _cashOutfowElectricity;
  int? _prevCashOutfowElectricity;
  int? _cashOutfowStaffsalary;
  int? _prevCashOutfowStaffsalary;
  int? _telephonemobileinternet;
  int? _telmobileinterprevloan;
  int? _transport;
  int? _transportpreviousloan;
  int? _gasandwater;
  int? _gasandwaterpreviousloan;
  int? _maintainence;
  int? _maintainencepreviousloan;
  int? _dieselforgenerator;
  int? _dieselforgeneratorprevloan;
  int? _marketing;
  int? _marketingpreviousloan;
  int? _labourexpense;
  int? _labourexpensepreviousloan;
  int? _societybillsecurity;
  int? _societybillsecurityprevloan;
  int? _tax;
  int? _taxprevloan;
  int? _entertainment;
  int? _entertainmentpreviousloan;
  int? _otherbusinessexpense;
  int? _otherbusinessexpenseprevloan;
  int? _currentTotalCashOutflow;
  int? _previousTotalCashOutflow;

  CashOutFlowData(
      {int? customerid,
        int? cashOutfowPurchases,
        int? prevCashOutfowPurchases,
        int? cashOutfowRent,
        int? prevCashOutfowRent,
        int? cashOutfowElectricity,
        int? prevCashOutfowElectricity,
        int? cashOutfowStaffsalary,
        int? prevCashOutfowStaffsalary,
        int? telephonemobileinternet,
        int? telmobileinterprevloan,
        int? transport,
        int? transportpreviousloan,
        int? gasandwater,
        int? gasandwaterpreviousloan,
        int? maintainence,
        int? maintainencepreviousloan,
        int? dieselforgenerator,
        int? dieselforgeneratorprevloan,
        int? marketing,
        int? marketingpreviousloan,
        int? labourexpense,
        int? labourexpensepreviousloan,
        int? societybillsecurity,
        int? societybillsecurityprevloan,
        int? tax,
        int? taxprevloan,
        int? entertainment,
        int? entertainmentpreviousloan,
        int? otherbusinessexpense,
        int? otherbusinessexpenseprevloan,
        int? currentTotalCashOutflow,
        int? previousTotalCashOutflow}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (cashOutfowPurchases != null) {
      this._cashOutfowPurchases = cashOutfowPurchases;
    }
    if (prevCashOutfowPurchases != null) {
      this._prevCashOutfowPurchases = prevCashOutfowPurchases;
    }
    if (cashOutfowRent != null) {
      this._cashOutfowRent = cashOutfowRent;
    }
    if (prevCashOutfowRent != null) {
      this._prevCashOutfowRent = prevCashOutfowRent;
    }
    if (cashOutfowElectricity != null) {
      this._cashOutfowElectricity = cashOutfowElectricity;
    }
    if (prevCashOutfowElectricity != null) {
      this._prevCashOutfowElectricity = prevCashOutfowElectricity;
    }
    if (cashOutfowStaffsalary != null) {
      this._cashOutfowStaffsalary = cashOutfowStaffsalary;
    }
    if (prevCashOutfowStaffsalary != null) {
      this._prevCashOutfowStaffsalary = prevCashOutfowStaffsalary;
    }
    if (telephonemobileinternet != null) {
      this._telephonemobileinternet = telephonemobileinternet;
    }
    if (telmobileinterprevloan != null) {
      this._telmobileinterprevloan = telmobileinterprevloan;
    }
    if (transport != null) {
      this._transport = transport;
    }
    if (transportpreviousloan != null) {
      this._transportpreviousloan = transportpreviousloan;
    }
    if (gasandwater != null) {
      this._gasandwater = gasandwater;
    }
    if (gasandwaterpreviousloan != null) {
      this._gasandwaterpreviousloan = gasandwaterpreviousloan;
    }
    if (maintainence != null) {
      this._maintainence = maintainence;
    }
    if (maintainencepreviousloan != null) {
      this._maintainencepreviousloan = maintainencepreviousloan;
    }
    if (dieselforgenerator != null) {
      this._dieselforgenerator = dieselforgenerator;
    }
    if (dieselforgeneratorprevloan != null) {
      this._dieselforgeneratorprevloan = dieselforgeneratorprevloan;
    }
    if (marketing != null) {
      this._marketing = marketing;
    }
    if (marketingpreviousloan != null) {
      this._marketingpreviousloan = marketingpreviousloan;
    }
    if (labourexpense != null) {
      this._labourexpense = labourexpense;
    }
    if (labourexpensepreviousloan != null) {
      this._labourexpensepreviousloan = labourexpensepreviousloan;
    }
    if (societybillsecurity != null) {
      this._societybillsecurity = societybillsecurity;
    }
    if (societybillsecurityprevloan != null) {
      this._societybillsecurityprevloan = societybillsecurityprevloan;
    }
    if (tax != null) {
      this._tax = tax;
    }
    if (taxprevloan != null) {
      this._taxprevloan = taxprevloan;
    }
    if (entertainment != null) {
      this._entertainment = entertainment;
    }
    if (entertainmentpreviousloan != null) {
      this._entertainmentpreviousloan = entertainmentpreviousloan;
    }
    if (otherbusinessexpense != null) {
      this._otherbusinessexpense = otherbusinessexpense;
    }
    if (otherbusinessexpenseprevloan != null) {
      this._otherbusinessexpenseprevloan = otherbusinessexpenseprevloan;
    }
    if (currentTotalCashOutflow != null) {
      this._currentTotalCashOutflow = currentTotalCashOutflow;
    }
    if (previousTotalCashOutflow != null) {
      this._previousTotalCashOutflow = previousTotalCashOutflow;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get cashOutfowPurchases => _cashOutfowPurchases;
  set cashOutfowPurchases(int? cashOutfowPurchases) =>
      _cashOutfowPurchases = cashOutfowPurchases;
  int? get prevCashOutfowPurchases => _prevCashOutfowPurchases;
  set prevCashOutfowPurchases(int? prevCashOutfowPurchases) =>
      _prevCashOutfowPurchases = prevCashOutfowPurchases;
  int? get cashOutfowRent => _cashOutfowRent;
  set cashOutfowRent(int? cashOutfowRent) => _cashOutfowRent = cashOutfowRent;
  int? get prevCashOutfowRent => _prevCashOutfowRent;
  set prevCashOutfowRent(int? prevCashOutfowRent) =>
      _prevCashOutfowRent = prevCashOutfowRent;
  int? get cashOutfowElectricity => _cashOutfowElectricity;
  set cashOutfowElectricity(int? cashOutfowElectricity) =>
      _cashOutfowElectricity = cashOutfowElectricity;
  int? get prevCashOutfowElectricity => _prevCashOutfowElectricity;
  set prevCashOutfowElectricity(int? prevCashOutfowElectricity) =>
      _prevCashOutfowElectricity = prevCashOutfowElectricity;
  int? get cashOutfowStaffsalary => _cashOutfowStaffsalary;
  set cashOutfowStaffsalary(int? cashOutfowStaffsalary) =>
      _cashOutfowStaffsalary = cashOutfowStaffsalary;
  int? get prevCashOutfowStaffsalary => _prevCashOutfowStaffsalary;
  set prevCashOutfowStaffsalary(int? prevCashOutfowStaffsalary) =>
      _prevCashOutfowStaffsalary = prevCashOutfowStaffsalary;
  int? get telephonemobileinternet => _telephonemobileinternet;
  set telephonemobileinternet(int? telephonemobileinternet) =>
      _telephonemobileinternet = telephonemobileinternet;
  int? get telmobileinterprevloan => _telmobileinterprevloan;
  set telmobileinterprevloan(int? telmobileinterprevloan) =>
      _telmobileinterprevloan = telmobileinterprevloan;
  int? get transport => _transport;
  set transport(int? transport) => _transport = transport;
  int? get transportpreviousloan => _transportpreviousloan;
  set transportpreviousloan(int? transportpreviousloan) =>
      _transportpreviousloan = transportpreviousloan;
  int? get gasandwater => _gasandwater;
  set gasandwater(int? gasandwater) => _gasandwater = gasandwater;
  int? get gasandwaterpreviousloan => _gasandwaterpreviousloan;
  set gasandwaterpreviousloan(int? gasandwaterpreviousloan) =>
      _gasandwaterpreviousloan = gasandwaterpreviousloan;
  int? get maintainence => _maintainence;
  set maintainence(int? maintainence) => _maintainence = maintainence;
  int? get maintainencepreviousloan => _maintainencepreviousloan;
  set maintainencepreviousloan(int? maintainencepreviousloan) =>
      _maintainencepreviousloan = maintainencepreviousloan;
  int? get dieselforgenerator => _dieselforgenerator;
  set dieselforgenerator(int? dieselforgenerator) =>
      _dieselforgenerator = dieselforgenerator;
  int? get dieselforgeneratorprevloan => _dieselforgeneratorprevloan;
  set dieselforgeneratorprevloan(int? dieselforgeneratorprevloan) =>
      _dieselforgeneratorprevloan = dieselforgeneratorprevloan;
  int? get marketing => _marketing;
  set marketing(int? marketing) => _marketing = marketing;
  int? get marketingpreviousloan => _marketingpreviousloan;
  set marketingpreviousloan(int? marketingpreviousloan) =>
      _marketingpreviousloan = marketingpreviousloan;
  int? get labourexpense => _labourexpense;
  set labourexpense(int? labourexpense) => _labourexpense = labourexpense;
  int? get labourexpensepreviousloan => _labourexpensepreviousloan;
  set labourexpensepreviousloan(int? labourexpensepreviousloan) =>
      _labourexpensepreviousloan = labourexpensepreviousloan;
  int? get societybillsecurity => _societybillsecurity;
  set societybillsecurity(int? societybillsecurity) =>
      _societybillsecurity = societybillsecurity;
  int? get societybillsecurityprevloan => _societybillsecurityprevloan;
  set societybillsecurityprevloan(int? societybillsecurityprevloan) =>
      _societybillsecurityprevloan = societybillsecurityprevloan;
  int? get tax => _tax;
  set tax(int? tax) => _tax = tax;
  int? get taxprevloan => _taxprevloan;
  set taxprevloan(int? taxprevloan) => _taxprevloan = taxprevloan;
  int? get entertainment => _entertainment;
  set entertainment(int? entertainment) => _entertainment = entertainment;
  int? get entertainmentpreviousloan => _entertainmentpreviousloan;
  set entertainmentpreviousloan(int? entertainmentpreviousloan) =>
      _entertainmentpreviousloan = entertainmentpreviousloan;
  int? get otherbusinessexpense => _otherbusinessexpense;
  set otherbusinessexpense(int? otherbusinessexpense) =>
      _otherbusinessexpense = otherbusinessexpense;
  int? get otherbusinessexpenseprevloan => _otherbusinessexpenseprevloan;
  set otherbusinessexpenseprevloan(int? otherbusinessexpenseprevloan) =>
      _otherbusinessexpenseprevloan = otherbusinessexpenseprevloan;
  int? get currentTotalCashOutflow => _currentTotalCashOutflow;
  set currentTotalCashOutflow(int? currentTotalCashOutflow) =>
      _currentTotalCashOutflow = currentTotalCashOutflow;
  int? get previousTotalCashOutflow => _previousTotalCashOutflow;
  set previousTotalCashOutflow(int? previousTotalCashOutflow) =>
      _previousTotalCashOutflow = previousTotalCashOutflow;

  CashOutFlowData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _cashOutfowPurchases = json['cashOutfowPurchases'];
    _prevCashOutfowPurchases = json['prevCashOutfowPurchases'];
    _cashOutfowRent = json['cashOutfowRent'];
    _prevCashOutfowRent = json['prevCashOutfowRent'];
    _cashOutfowElectricity = json['cashOutfowElectricity'];
    _prevCashOutfowElectricity = json['prevCashOutfowElectricity'];
    _cashOutfowStaffsalary = json['cashOutfowStaffsalary'];
    _prevCashOutfowStaffsalary = json['prevCashOutfowStaffsalary'];
    _telephonemobileinternet = json['telephonemobileinternet'];
    _telmobileinterprevloan = json['telmobileinterprevloan'];
    _transport = json['transport'];
    _transportpreviousloan = json['transportpreviousloan'];
    _gasandwater = json['gasandwater'];
    _gasandwaterpreviousloan = json['gasandwaterpreviousloan'];
    _maintainence = json['maintainence'];
    _maintainencepreviousloan = json['maintainencepreviousloan'];
    _dieselforgenerator = json['dieselforgenerator'];
    _dieselforgeneratorprevloan = json['dieselforgeneratorprevloan'];
    _marketing = json['marketing'];
    _marketingpreviousloan = json['marketingpreviousloan'];
    _labourexpense = json['labourexpense'];
    _labourexpensepreviousloan = json['labourexpensepreviousloan'];
    _societybillsecurity = json['societybillsecurity'];
    _societybillsecurityprevloan = json['societybillsecurityprevloan'];
    _tax = json['tax'];
    _taxprevloan = json['taxprevloan'];
    _entertainment = json['entertainment'];
    _entertainmentpreviousloan = json['entertainmentpreviousloan'];
    _otherbusinessexpense = json['otherbusinessexpense'];
    _otherbusinessexpenseprevloan = json['otherbusinessexpenseprevloan'];
    _currentTotalCashOutflow = json['currentTotalCashOutflow'];
    _previousTotalCashOutflow = json['previousTotalCashOutflow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['cashOutfowPurchases'] = this._cashOutfowPurchases;
    data['prevCashOutfowPurchases'] = this._prevCashOutfowPurchases;
    data['cashOutfowRent'] = this._cashOutfowRent;
    data['prevCashOutfowRent'] = this._prevCashOutfowRent;
    data['cashOutfowElectricity'] = this._cashOutfowElectricity;
    data['prevCashOutfowElectricity'] = this._prevCashOutfowElectricity;
    data['cashOutfowStaffsalary'] = this._cashOutfowStaffsalary;
    data['prevCashOutfowStaffsalary'] = this._prevCashOutfowStaffsalary;
    data['telephonemobileinternet'] = this._telephonemobileinternet;
    data['telmobileinterprevloan'] = this._telmobileinterprevloan;
    data['transport'] = this._transport;
    data['transportpreviousloan'] = this._transportpreviousloan;
    data['gasandwater'] = this._gasandwater;
    data['gasandwaterpreviousloan'] = this._gasandwaterpreviousloan;
    data['maintainence'] = this._maintainence;
    data['maintainencepreviousloan'] = this._maintainencepreviousloan;
    data['dieselforgenerator'] = this._dieselforgenerator;
    data['dieselforgeneratorprevloan'] = this._dieselforgeneratorprevloan;
    data['marketing'] = this._marketing;
    data['marketingpreviousloan'] = this._marketingpreviousloan;
    data['labourexpense'] = this._labourexpense;
    data['labourexpensepreviousloan'] = this._labourexpensepreviousloan;
    data['societybillsecurity'] = this._societybillsecurity;
    data['societybillsecurityprevloan'] = this._societybillsecurityprevloan;
    data['tax'] = this._tax;
    data['taxprevloan'] = this._taxprevloan;
    data['entertainment'] = this._entertainment;
    data['entertainmentpreviousloan'] = this._entertainmentpreviousloan;
    data['otherbusinessexpense'] = this._otherbusinessexpense;
    data['otherbusinessexpenseprevloan'] = this._otherbusinessexpenseprevloan;
    data['currentTotalCashOutflow'] = this._currentTotalCashOutflow;
    data['previousTotalCashOutflow'] = this._previousTotalCashOutflow;
    return data;
  }
}

class BusinessNetProfitModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<BusinessNetProfitData>? _data;

  BusinessNetProfitModel(
      {bool? success, String? messageEn, String? messageBn, List<BusinessNetProfitData>? data}) {
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
  List<BusinessNetProfitData>? get data => _data;
  set data(List<BusinessNetProfitData>? data) => _data = data;

  BusinessNetProfitModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <BusinessNetProfitData>[];
      json['data'].forEach((v) {
        _data!.add(new BusinessNetProfitData.fromJson(v));
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

class BusinessNetProfitData {
  int? _customerid;
  int? _currentcashflow;
  int? _previouscashflow;

  BusinessNetProfitData({int? customerid, int? currentcashflow, int? previouscashflow}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (currentcashflow != null) {
      this._currentcashflow = currentcashflow;
    }
    if (previouscashflow != null) {
      this._previouscashflow = previouscashflow;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get currentcashflow => _currentcashflow;
  set currentcashflow(int? currentcashflow) =>
      _currentcashflow = currentcashflow;
  int? get previouscashflow => _previouscashflow;
  set previouscashflow(int? previouscashflow) =>
      _previouscashflow = previouscashflow;

  BusinessNetProfitData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _currentcashflow = json['currentcashflow'];
    _previouscashflow = json['previouscashflow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['currentcashflow'] = this._currentcashflow;
    data['previouscashflow'] = this._previouscashflow;
    return data;
  }
}

class NetHouseholdSurplusModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<NetHouseHoldSurplusData>? _data;

  NetHouseholdSurplusModel(
      {bool? success, String? messageEn, String? messageBn, List<NetHouseHoldSurplusData>? data}) {
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
  List<NetHouseHoldSurplusData>? get data => _data;
  set data(List<NetHouseHoldSurplusData>? data) => _data = data;

  NetHouseholdSurplusModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <NetHouseHoldSurplusData>[];
      json['data'].forEach((v) {
        _data!.add(new NetHouseHoldSurplusData.fromJson(v));
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

class NetHouseHoldSurplusData {
  int? _customerid;
  int? _currentcashflow;
  int? _previouscashflow;

  NetHouseHoldSurplusData({int? customerid, int? currentcashflow, int? previouscashflow}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (currentcashflow != null) {
      this._currentcashflow = currentcashflow;
    }
    if (previouscashflow != null) {
      this._previouscashflow = previouscashflow;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get currentcashflow => _currentcashflow;
  set currentcashflow(int? currentcashflow) =>
      _currentcashflow = currentcashflow;
  int? get previouscashflow => _previouscashflow;
  set previouscashflow(int? previouscashflow) =>
      _previouscashflow = previouscashflow;

  NetHouseHoldSurplusData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _currentcashflow = json['currentcashflow'];
    _previouscashflow = json['previouscashflow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['currentcashflow'] = this._currentcashflow;
    data['previouscashflow'] = this._previouscashflow;
    return data;
  }
}

/*class HouseHoldExpensesModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<HouseHoldExpenseData>? _data;

  HouseHoldExpensesModel(
      {bool? success, String? messageEn, String? messageBn, List<HouseHoldExpenseData>? data}) {
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
  List<HouseHoldExpenseData>? get data => _data;
  set data(List<HouseHoldExpenseData>? data) => _data = data;

  HouseHoldExpensesModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <HouseHoldExpenseData>[];
      json['data'].forEach((v) {
        _data!.add(new HouseHoldExpenseData.fromJson(v));
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

class HouseHoldExpenseData {
  int? _customerid;
  int? _houserent;
  int? _houserentpreviousloan;
  int? _food;
  int? _foodpreviousloan;
  int? _clothing;
  int? _clothingpreviousloan;
  int? _educationmonthly;
  int? _educationmonthlypreviousloan;
  int? _electricity;
  int? _electricitypreviousloan;
  int? _transportconveyance;
  int? _transportconveyanceprevloan;
  int? _telmobileinter;
  int? _telmobileinterprevloan;
  int? _medical;
  int? _medicalpreviousloan;
  int? _entertainment;
  int? _entertainmentpreviousloan;
  int? _repairmaintenance;
  int? _repairmaintenancepreviousloan;
  int? _maid;
  int? _maidpreviousloan;
  int? _housetax;
  int? _housetaxpreviousloan;
  int? _anyotherexpense;
  int? _anyotherexpensepreviousloan;

  HouseHoldExpenseData(
      {int? customerid,
        int? houserent,
        int? houserentpreviousloan,
        int? food,
        int? foodpreviousloan,
        int? clothing,
        int? clothingpreviousloan,
        int? educationmonthly,
        int? educationmonthlypreviousloan,
        int? electricity,
        int? electricitypreviousloan,
        int? transportconveyance,
        int? transportconveyanceprevloan,
        int? telmobileinter,
        int? telmobileinterprevloan,
        int? medical,
        int? medicalpreviousloan,
        int? entertainment,
        int? entertainmentpreviousloan,
        int? repairmaintenance,
        int? repairmaintenancepreviousloan,
        int? maid,
        int? maidpreviousloan,
        int? housetax,
        int? housetaxpreviousloan,
        int? anyotherexpense,
        int? anyotherexpensepreviousloan}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (houserent != null) {
      this._houserent = houserent;
    }
    if (houserentpreviousloan != null) {
      this._houserentpreviousloan = houserentpreviousloan;
    }
    if (food != null) {
      this._food = food;
    }
    if (foodpreviousloan != null) {
      this._foodpreviousloan = foodpreviousloan;
    }
    if (clothing != null) {
      this._clothing = clothing;
    }
    if (clothingpreviousloan != null) {
      this._clothingpreviousloan = clothingpreviousloan;
    }
    if (educationmonthly != null) {
      this._educationmonthly = educationmonthly;
    }
    if (educationmonthlypreviousloan != null) {
      this._educationmonthlypreviousloan = educationmonthlypreviousloan;
    }
    if (electricity != null) {
      this._electricity = electricity;
    }
    if (electricitypreviousloan != null) {
      this._electricitypreviousloan = electricitypreviousloan;
    }
    if (transportconveyance != null) {
      this._transportconveyance = transportconveyance;
    }
    if (transportconveyanceprevloan != null) {
      this._transportconveyanceprevloan = transportconveyanceprevloan;
    }
    if (telmobileinter != null) {
      this._telmobileinter = telmobileinter;
    }
    if (telmobileinterprevloan != null) {
      this._telmobileinterprevloan = telmobileinterprevloan;
    }
    if (medical != null) {
      this._medical = medical;
    }
    if (medicalpreviousloan != null) {
      this._medicalpreviousloan = medicalpreviousloan;
    }
    if (entertainment != null) {
      this._entertainment = entertainment;
    }
    if (entertainmentpreviousloan != null) {
      this._entertainmentpreviousloan = entertainmentpreviousloan;
    }
    if (repairmaintenance != null) {
      this._repairmaintenance = repairmaintenance;
    }
    if (repairmaintenancepreviousloan != null) {
      this._repairmaintenancepreviousloan = repairmaintenancepreviousloan;
    }
    if (maid != null) {
      this._maid = maid;
    }
    if (maidpreviousloan != null) {
      this._maidpreviousloan = maidpreviousloan;
    }
    if (housetax != null) {
      this._housetax = housetax;
    }
    if (housetaxpreviousloan != null) {
      this._housetaxpreviousloan = housetaxpreviousloan;
    }
    if (anyotherexpense != null) {
      this._anyotherexpense = anyotherexpense;
    }
    if (anyotherexpensepreviousloan != null) {
      this._anyotherexpensepreviousloan = anyotherexpensepreviousloan;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get houserent => _houserent;
  set houserent(int? houserent) => _houserent = houserent;
  int? get houserentpreviousloan => _houserentpreviousloan;
  set houserentpreviousloan(int? houserentpreviousloan) =>
      _houserentpreviousloan = houserentpreviousloan;
  int? get food => _food;
  set food(int? food) => _food = food;
  int? get foodpreviousloan => _foodpreviousloan;
  set foodpreviousloan(int? foodpreviousloan) =>
      _foodpreviousloan = foodpreviousloan;
  int? get clothing => _clothing;
  set clothing(int? clothing) => _clothing = clothing;
  int? get clothingpreviousloan => _clothingpreviousloan;
  set clothingpreviousloan(int? clothingpreviousloan) =>
      _clothingpreviousloan = clothingpreviousloan;
  int? get educationmonthly => _educationmonthly;
  set educationmonthly(int? educationmonthly) =>
      _educationmonthly = educationmonthly;
  int? get educationmonthlypreviousloan => _educationmonthlypreviousloan;
  set educationmonthlypreviousloan(int? educationmonthlypreviousloan) =>
      _educationmonthlypreviousloan = educationmonthlypreviousloan;
  int? get electricity => _electricity;
  set electricity(int? electricity) => _electricity = electricity;
  int? get electricitypreviousloan => _electricitypreviousloan;
  set electricitypreviousloan(int? electricitypreviousloan) =>
      _electricitypreviousloan = electricitypreviousloan;
  int? get transportconveyance => _transportconveyance;
  set transportconveyance(int? transportconveyance) =>
      _transportconveyance = transportconveyance;
  int? get transportconveyanceprevloan => _transportconveyanceprevloan;
  set transportconveyanceprevloan(int? transportconveyanceprevloan) =>
      _transportconveyanceprevloan = transportconveyanceprevloan;
  int? get telmobileinter => _telmobileinter;
  set telmobileinter(int? telmobileinter) => _telmobileinter = telmobileinter;
  int? get telmobileinterprevloan => _telmobileinterprevloan;
  set telmobileinterprevloan(int? telmobileinterprevloan) =>
      _telmobileinterprevloan = telmobileinterprevloan;
  int? get medical => _medical;
  set medical(int? medical) => _medical = medical;
  int? get medicalpreviousloan => _medicalpreviousloan;
  set medicalpreviousloan(int? medicalpreviousloan) =>
      _medicalpreviousloan = medicalpreviousloan;
  int? get entertainment => _entertainment;
  set entertainment(int? entertainment) => _entertainment = entertainment;
  int? get entertainmentpreviousloan => _entertainmentpreviousloan;
  set entertainmentpreviousloan(int? entertainmentpreviousloan) =>
      _entertainmentpreviousloan = entertainmentpreviousloan;
  int? get repairmaintenance => _repairmaintenance;
  set repairmaintenance(int? repairmaintenance) =>
      _repairmaintenance = repairmaintenance;
  int? get repairmaintenancepreviousloan => _repairmaintenancepreviousloan;
  set repairmaintenancepreviousloan(int? repairmaintenancepreviousloan) =>
      _repairmaintenancepreviousloan = repairmaintenancepreviousloan;
  int? get maid => _maid;
  set maid(int? maid) => _maid = maid;
  int? get maidpreviousloan => _maidpreviousloan;
  set maidpreviousloan(int? maidpreviousloan) =>
      _maidpreviousloan = maidpreviousloan;
  int? get housetax => _housetax;
  set housetax(int? housetax) => _housetax = housetax;
  int? get housetaxpreviousloan => _housetaxpreviousloan;
  set housetaxpreviousloan(int? housetaxpreviousloan) =>
      _housetaxpreviousloan = housetaxpreviousloan;
  int? get anyotherexpense => _anyotherexpense;
  set anyotherexpense(int? anyotherexpense) =>
      _anyotherexpense = anyotherexpense;
  int? get anyotherexpensepreviousloan => _anyotherexpensepreviousloan;
  set anyotherexpensepreviousloan(int? anyotherexpensepreviousloan) =>
      _anyotherexpensepreviousloan = anyotherexpensepreviousloan;

  HouseHoldExpenseData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _houserent = json['houserent'];
    _houserentpreviousloan = json['houserentpreviousloan'];
    _food = json['food'];
    _foodpreviousloan = json['foodpreviousloan'];
    _clothing = json['clothing'];
    _clothingpreviousloan = json['clothingpreviousloan'];
    _educationmonthly = json['educationmonthly'];
    _educationmonthlypreviousloan = json['educationmonthlypreviousloan'];
    _electricity = json['electricity'];
    _electricitypreviousloan = json['electricitypreviousloan'];
    _transportconveyance = json['transportconveyance'];
    _transportconveyanceprevloan = json['transportconveyanceprevloan'];
    _telmobileinter = json['telmobileinter'];
    _telmobileinterprevloan = json['telmobileinterprevloan'];
    _medical = json['medical'];
    _medicalpreviousloan = json['medicalpreviousloan'];
    _entertainment = json['entertainment'];
    _entertainmentpreviousloan = json['entertainmentpreviousloan'];
    _repairmaintenance = json['repairmaintenance'];
    _repairmaintenancepreviousloan = json['repairmaintenancepreviousloan'];
    _maid = json['maid'];
    _maidpreviousloan = json['maidpreviousloan'];
    _housetax = json['housetax'];
    _housetaxpreviousloan = json['housetaxpreviousloan'];
    _anyotherexpense = json['anyotherexpense'];
    _anyotherexpensepreviousloan = json['anyotherexpensepreviousloan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['houserent'] = this._houserent;
    data['houserentpreviousloan'] = this._houserentpreviousloan;
    data['food'] = this._food;
    data['foodpreviousloan'] = this._foodpreviousloan;
    data['clothing'] = this._clothing;
    data['clothingpreviousloan'] = this._clothingpreviousloan;
    data['educationmonthly'] = this._educationmonthly;
    data['educationmonthlypreviousloan'] = this._educationmonthlypreviousloan;
    data['electricity'] = this._electricity;
    data['electricitypreviousloan'] = this._electricitypreviousloan;
    data['transportconveyance'] = this._transportconveyance;
    data['transportconveyanceprevloan'] = this._transportconveyanceprevloan;
    data['telmobileinter'] = this._telmobileinter;
    data['telmobileinterprevloan'] = this._telmobileinterprevloan;
    data['medical'] = this._medical;
    data['medicalpreviousloan'] = this._medicalpreviousloan;
    data['entertainment'] = this._entertainment;
    data['entertainmentpreviousloan'] = this._entertainmentpreviousloan;
    data['repairmaintenance'] = this._repairmaintenance;
    data['repairmaintenancepreviousloan'] = this._repairmaintenancepreviousloan;
    data['maid'] = this._maid;
    data['maidpreviousloan'] = this._maidpreviousloan;
    data['housetax'] = this._housetax;
    data['housetaxpreviousloan'] = this._housetaxpreviousloan;
    data['anyotherexpense'] = this._anyotherexpense;
    data['anyotherexpensepreviousloan'] = this._anyotherexpensepreviousloan;
    return data;
  }
}*/
class HouseHoldExpensesModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<HouseHoldExpensesData>? _data;

  HouseHoldExpensesModel(
      {bool? success, String? messageEn, String? messageBn, List<HouseHoldExpensesData>? data}) {
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
  List<HouseHoldExpensesData>? get data => _data;
  set data(List<HouseHoldExpensesData>? data) => _data = data;

  HouseHoldExpensesModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <HouseHoldExpensesData>[];
      json['data'].forEach((v) {
        _data!.add(new HouseHoldExpensesData.fromJson(v));
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

class HouseHoldExpensesData {
  int? _customerid;
  int? _houserent;
  int? _houserentpreviousloan;
  int? _food;
  int? _foodpreviousloan;
  int? _clothing;
  int? _clothingpreviousloan;
  int? _educationmonthly;
  int? _educationmonthlypreviousloan;
  int? _electricity;
  int? _electricitypreviousloan;
  int? _transportconveyance;
  int? _transportconveyanceprevloan;
  int? _telmobileinter;
  int? _telmobileinterprevloan;
  int? _medical;
  int? _medicalpreviousloan;
  int? _entertainment;
  int? _entertainmentpreviousloan;
  int? _repairmaintenance;
  int? _repairmaintenancepreviousloan;
  int? _maid;
  int? _maidpreviousloan;
  int? _housetax;
  int? _housetaxpreviousloan;
  int? _anyotherexpense;
  int? _anyotherexpensepreviousloan;
  int? _totalHouseholdexpense;
  int? _totalPreviousMonthlyExpenses;

  HouseHoldExpensesData(
      {int? customerid,
        int? houserent,
        int? houserentpreviousloan,
        int? food,
        int? foodpreviousloan,
        int? clothing,
        int? clothingpreviousloan,
        int? educationmonthly,
        int? educationmonthlypreviousloan,
        int? electricity,
        int? electricitypreviousloan,
        int? transportconveyance,
        int? transportconveyanceprevloan,
        int? telmobileinter,
        int? telmobileinterprevloan,
        int? medical,
        int? medicalpreviousloan,
        int? entertainment,
        int? entertainmentpreviousloan,
        int? repairmaintenance,
        int? repairmaintenancepreviousloan,
        int? maid,
        int? maidpreviousloan,
        int? housetax,
        int? housetaxpreviousloan,
        int? anyotherexpense,
        int? anyotherexpensepreviousloan,
        int? totalHouseholdexpense,
        int? totalPreviousMonthlyExpenses}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (houserent != null) {
      this._houserent = houserent;
    }
    if (houserentpreviousloan != null) {
      this._houserentpreviousloan = houserentpreviousloan;
    }
    if (food != null) {
      this._food = food;
    }
    if (foodpreviousloan != null) {
      this._foodpreviousloan = foodpreviousloan;
    }
    if (clothing != null) {
      this._clothing = clothing;
    }
    if (clothingpreviousloan != null) {
      this._clothingpreviousloan = clothingpreviousloan;
    }
    if (educationmonthly != null) {
      this._educationmonthly = educationmonthly;
    }
    if (educationmonthlypreviousloan != null) {
      this._educationmonthlypreviousloan = educationmonthlypreviousloan;
    }
    if (electricity != null) {
      this._electricity = electricity;
    }
    if (electricitypreviousloan != null) {
      this._electricitypreviousloan = electricitypreviousloan;
    }
    if (transportconveyance != null) {
      this._transportconveyance = transportconveyance;
    }
    if (transportconveyanceprevloan != null) {
      this._transportconveyanceprevloan = transportconveyanceprevloan;
    }
    if (telmobileinter != null) {
      this._telmobileinter = telmobileinter;
    }
    if (telmobileinterprevloan != null) {
      this._telmobileinterprevloan = telmobileinterprevloan;
    }
    if (medical != null) {
      this._medical = medical;
    }
    if (medicalpreviousloan != null) {
      this._medicalpreviousloan = medicalpreviousloan;
    }
    if (entertainment != null) {
      this._entertainment = entertainment;
    }
    if (entertainmentpreviousloan != null) {
      this._entertainmentpreviousloan = entertainmentpreviousloan;
    }
    if (repairmaintenance != null) {
      this._repairmaintenance = repairmaintenance;
    }
    if (repairmaintenancepreviousloan != null) {
      this._repairmaintenancepreviousloan = repairmaintenancepreviousloan;
    }
    if (maid != null) {
      this._maid = maid;
    }
    if (maidpreviousloan != null) {
      this._maidpreviousloan = maidpreviousloan;
    }
    if (housetax != null) {
      this._housetax = housetax;
    }
    if (housetaxpreviousloan != null) {
      this._housetaxpreviousloan = housetaxpreviousloan;
    }
    if (anyotherexpense != null) {
      this._anyotherexpense = anyotherexpense;
    }
    if (anyotherexpensepreviousloan != null) {
      this._anyotherexpensepreviousloan = anyotherexpensepreviousloan;
    }
    if (totalHouseholdexpense != null) {
      this._totalHouseholdexpense = totalHouseholdexpense;
    }
    if (totalPreviousMonthlyExpenses != null) {
      this._totalPreviousMonthlyExpenses = totalPreviousMonthlyExpenses;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get houserent => _houserent;
  set houserent(int? houserent) => _houserent = houserent;
  int? get houserentpreviousloan => _houserentpreviousloan;
  set houserentpreviousloan(int? houserentpreviousloan) =>
      _houserentpreviousloan = houserentpreviousloan;
  int? get food => _food;
  set food(int? food) => _food = food;
  int? get foodpreviousloan => _foodpreviousloan;
  set foodpreviousloan(int? foodpreviousloan) =>
      _foodpreviousloan = foodpreviousloan;
  int? get clothing => _clothing;
  set clothing(int? clothing) => _clothing = clothing;
  int? get clothingpreviousloan => _clothingpreviousloan;
  set clothingpreviousloan(int? clothingpreviousloan) =>
      _clothingpreviousloan = clothingpreviousloan;
  int? get educationmonthly => _educationmonthly;
  set educationmonthly(int? educationmonthly) =>
      _educationmonthly = educationmonthly;
  int? get educationmonthlypreviousloan => _educationmonthlypreviousloan;
  set educationmonthlypreviousloan(int? educationmonthlypreviousloan) =>
      _educationmonthlypreviousloan = educationmonthlypreviousloan;
  int? get electricity => _electricity;
  set electricity(int? electricity) => _electricity = electricity;
  int? get electricitypreviousloan => _electricitypreviousloan;
  set electricitypreviousloan(int? electricitypreviousloan) =>
      _electricitypreviousloan = electricitypreviousloan;
  int? get transportconveyance => _transportconveyance;
  set transportconveyance(int? transportconveyance) =>
      _transportconveyance = transportconveyance;
  int? get transportconveyanceprevloan => _transportconveyanceprevloan;
  set transportconveyanceprevloan(int? transportconveyanceprevloan) =>
      _transportconveyanceprevloan = transportconveyanceprevloan;
  int? get telmobileinter => _telmobileinter;
  set telmobileinter(int? telmobileinter) => _telmobileinter = telmobileinter;
  int? get telmobileinterprevloan => _telmobileinterprevloan;
  set telmobileinterprevloan(int? telmobileinterprevloan) =>
      _telmobileinterprevloan = telmobileinterprevloan;
  int? get medical => _medical;
  set medical(int? medical) => _medical = medical;
  int? get medicalpreviousloan => _medicalpreviousloan;
  set medicalpreviousloan(int? medicalpreviousloan) =>
      _medicalpreviousloan = medicalpreviousloan;
  int? get entertainment => _entertainment;
  set entertainment(int? entertainment) => _entertainment = entertainment;
  int? get entertainmentpreviousloan => _entertainmentpreviousloan;
  set entertainmentpreviousloan(int? entertainmentpreviousloan) =>
      _entertainmentpreviousloan = entertainmentpreviousloan;
  int? get repairmaintenance => _repairmaintenance;
  set repairmaintenance(int? repairmaintenance) =>
      _repairmaintenance = repairmaintenance;
  int? get repairmaintenancepreviousloan => _repairmaintenancepreviousloan;
  set repairmaintenancepreviousloan(int? repairmaintenancepreviousloan) =>
      _repairmaintenancepreviousloan = repairmaintenancepreviousloan;
  int? get maid => _maid;
  set maid(int? maid) => _maid = maid;
  int? get maidpreviousloan => _maidpreviousloan;
  set maidpreviousloan(int? maidpreviousloan) =>
      _maidpreviousloan = maidpreviousloan;
  int? get housetax => _housetax;
  set housetax(int? housetax) => _housetax = housetax;
  int? get housetaxpreviousloan => _housetaxpreviousloan;
  set housetaxpreviousloan(int? housetaxpreviousloan) =>
      _housetaxpreviousloan = housetaxpreviousloan;
  int? get anyotherexpense => _anyotherexpense;
  set anyotherexpense(int? anyotherexpense) =>
      _anyotherexpense = anyotherexpense;
  int? get anyotherexpensepreviousloan => _anyotherexpensepreviousloan;
  set anyotherexpensepreviousloan(int? anyotherexpensepreviousloan) =>
      _anyotherexpensepreviousloan = anyotherexpensepreviousloan;
  int? get totalHouseholdexpense => _totalHouseholdexpense;
  set totalHouseholdexpense(int? totalHouseholdexpense) =>
      _totalHouseholdexpense = totalHouseholdexpense;
  int? get totalPreviousMonthlyExpenses => _totalPreviousMonthlyExpenses;
  set totalPreviousMonthlyExpenses(int? totalPreviousMonthlyExpenses) =>
      _totalPreviousMonthlyExpenses = totalPreviousMonthlyExpenses;

  HouseHoldExpensesData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _houserent = json['houserent'];
    _houserentpreviousloan = json['houserentpreviousloan'];
    _food = json['food'];
    _foodpreviousloan = json['foodpreviousloan'];
    _clothing = json['clothing'];
    _clothingpreviousloan = json['clothingpreviousloan'];
    _educationmonthly = json['educationmonthly'];
    _educationmonthlypreviousloan = json['educationmonthlypreviousloan'];
    _electricity = json['electricity'];
    _electricitypreviousloan = json['electricitypreviousloan'];
    _transportconveyance = json['transportconveyance'];
    _transportconveyanceprevloan = json['transportconveyanceprevloan'];
    _telmobileinter = json['telmobileinter'];
    _telmobileinterprevloan = json['telmobileinterprevloan'];
    _medical = json['medical'];
    _medicalpreviousloan = json['medicalpreviousloan'];
    _entertainment = json['entertainment'];
    _entertainmentpreviousloan = json['entertainmentpreviousloan'];
    _repairmaintenance = json['repairmaintenance'];
    _repairmaintenancepreviousloan = json['repairmaintenancepreviousloan'];
    _maid = json['maid'];
    _maidpreviousloan = json['maidpreviousloan'];
    _housetax = json['housetax'];
    _housetaxpreviousloan = json['housetaxpreviousloan'];
    _anyotherexpense = json['anyotherexpense'];
    _anyotherexpensepreviousloan = json['anyotherexpensepreviousloan'];
    _totalHouseholdexpense = json['totalHouseholdexpense'];
    _totalPreviousMonthlyExpenses = json['totalPreviousMonthlyExpenses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['houserent'] = this._houserent;
    data['houserentpreviousloan'] = this._houserentpreviousloan;
    data['food'] = this._food;
    data['foodpreviousloan'] = this._foodpreviousloan;
    data['clothing'] = this._clothing;
    data['clothingpreviousloan'] = this._clothingpreviousloan;
    data['educationmonthly'] = this._educationmonthly;
    data['educationmonthlypreviousloan'] = this._educationmonthlypreviousloan;
    data['electricity'] = this._electricity;
    data['electricitypreviousloan'] = this._electricitypreviousloan;
    data['transportconveyance'] = this._transportconveyance;
    data['transportconveyanceprevloan'] = this._transportconveyanceprevloan;
    data['telmobileinter'] = this._telmobileinter;
    data['telmobileinterprevloan'] = this._telmobileinterprevloan;
    data['medical'] = this._medical;
    data['medicalpreviousloan'] = this._medicalpreviousloan;
    data['entertainment'] = this._entertainment;
    data['entertainmentpreviousloan'] = this._entertainmentpreviousloan;
    data['repairmaintenance'] = this._repairmaintenance;
    data['repairmaintenancepreviousloan'] = this._repairmaintenancepreviousloan;
    data['maid'] = this._maid;
    data['maidpreviousloan'] = this._maidpreviousloan;
    data['housetax'] = this._housetax;
    data['housetaxpreviousloan'] = this._housetaxpreviousloan;
    data['anyotherexpense'] = this._anyotherexpense;
    data['anyotherexpensepreviousloan'] = this._anyotherexpensepreviousloan;
    data['totalHouseholdexpense'] = this._totalHouseholdexpense;
    data['totalPreviousMonthlyExpenses'] = this._totalPreviousMonthlyExpenses;
    return data;
  }
}

/*class RecurringExpenseModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<RecurringExpenseData>? _data;

  RecurringExpenseModel(
      {bool? success, String? messageEn, String? messageBn, List<RecurringExpenseData>? data}) {
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
  List<RecurringExpenseData>? get data => _data;
  set data(List<RecurringExpenseData>? data) => _data = data;

  RecurringExpenseModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <RecurringExpenseData>[];
      json['data'].forEach((v) {
        _data!.add(new RecurringExpenseData.fromJson(v));
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

class RecurringExpenseData {
  int? _customerid;
  int? _lifeinsurance;
  int? _lifeinsurancepreviousloan;
  int? _generalinsurance;
  int? _generalinsurancepreviousloan;
  int? _dps;
  int? _dpspreviousloan;

  RecurringExpenseData(
      {int? customerid,
        int? lifeinsurance,
        int? lifeinsurancepreviousloan,
        int? generalinsurance,
        int? generalinsurancepreviousloan,
        int? dps,
        int? dpspreviousloan}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (lifeinsurance != null) {
      this._lifeinsurance = lifeinsurance;
    }
    if (lifeinsurancepreviousloan != null) {
      this._lifeinsurancepreviousloan = lifeinsurancepreviousloan;
    }
    if (generalinsurance != null) {
      this._generalinsurance = generalinsurance;
    }
    if (generalinsurancepreviousloan != null) {
      this._generalinsurancepreviousloan = generalinsurancepreviousloan;
    }
    if (dps != null) {
      this._dps = dps;
    }
    if (dpspreviousloan != null) {
      this._dpspreviousloan = dpspreviousloan;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get lifeinsurance => _lifeinsurance;
  set lifeinsurance(int? lifeinsurance) => _lifeinsurance = lifeinsurance;
  int? get lifeinsurancepreviousloan => _lifeinsurancepreviousloan;
  set lifeinsurancepreviousloan(int? lifeinsurancepreviousloan) =>
      _lifeinsurancepreviousloan = lifeinsurancepreviousloan;
  int? get generalinsurance => _generalinsurance;
  set generalinsurance(int? generalinsurance) =>
      _generalinsurance = generalinsurance;
  int? get generalinsurancepreviousloan => _generalinsurancepreviousloan;
  set generalinsurancepreviousloan(int? generalinsurancepreviousloan) =>
      _generalinsurancepreviousloan = generalinsurancepreviousloan;
  int? get dps => _dps;
  set dps(int? dps) => _dps = dps;
  int? get dpspreviousloan => _dpspreviousloan;
  set dpspreviousloan(int? dpspreviousloan) =>
      _dpspreviousloan = dpspreviousloan;

  RecurringExpenseData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _lifeinsurance = json['lifeinsurance'];
    _lifeinsurancepreviousloan = json['lifeinsurancepreviousloan'];
    _generalinsurance = json['generalinsurance'];
    _generalinsurancepreviousloan = json['generalinsurancepreviousloan'];
    _dps = json['dps'];
    _dpspreviousloan = json['dpspreviousloan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['lifeinsurance'] = this._lifeinsurance;
    data['lifeinsurancepreviousloan'] = this._lifeinsurancepreviousloan;
    data['generalinsurance'] = this._generalinsurance;
    data['generalinsurancepreviousloan'] = this._generalinsurancepreviousloan;
    data['dps'] = this._dps;
    data['dpspreviousloan'] = this._dpspreviousloan;
    return data;
  }
}*/


class RecurringExpenseModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<RecurringExpenseData>? _data;

  RecurringExpenseModel(
      {bool? success, String? messageEn, String? messageBn, List<RecurringExpenseData>? data}) {
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
  List<RecurringExpenseData>? get data => _data;
  set data(List<RecurringExpenseData>? data) => _data = data;

  RecurringExpenseModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <RecurringExpenseData>[];
      json['data'].forEach((v) {
        _data!.add(new RecurringExpenseData.fromJson(v));
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

class RecurringExpenseData {
  int? _customerid;
  int? _lifeinsurance;
  int? _lifeinsurancepreviousloan;
  int? _generalinsurance;
  int? _generalinsurancepreviousloan;
  int? _dps;
  int? _dpspreviousloan;
  int? _totalOtherRecurringExpense;
  int? _prevTotalOtherRecurringExpense;

  RecurringExpenseData(
      {int? customerid,
        int? lifeinsurance,
        int? lifeinsurancepreviousloan,
        int? generalinsurance,
        int? generalinsurancepreviousloan,
        int? dps,
        int? dpspreviousloan,
        int? totalOtherRecurringExpense,
        int? prevTotalOtherRecurringExpense}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (lifeinsurance != null) {
      this._lifeinsurance = lifeinsurance;
    }
    if (lifeinsurancepreviousloan != null) {
      this._lifeinsurancepreviousloan = lifeinsurancepreviousloan;
    }
    if (generalinsurance != null) {
      this._generalinsurance = generalinsurance;
    }
    if (generalinsurancepreviousloan != null) {
      this._generalinsurancepreviousloan = generalinsurancepreviousloan;
    }
    if (dps != null) {
      this._dps = dps;
    }
    if (dpspreviousloan != null) {
      this._dpspreviousloan = dpspreviousloan;
    }
    if (totalOtherRecurringExpense != null) {
      this._totalOtherRecurringExpense = totalOtherRecurringExpense;
    }
    if (prevTotalOtherRecurringExpense != null) {
      this._prevTotalOtherRecurringExpense = prevTotalOtherRecurringExpense;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get lifeinsurance => _lifeinsurance;
  set lifeinsurance(int? lifeinsurance) => _lifeinsurance = lifeinsurance;
  int? get lifeinsurancepreviousloan => _lifeinsurancepreviousloan;
  set lifeinsurancepreviousloan(int? lifeinsurancepreviousloan) =>
      _lifeinsurancepreviousloan = lifeinsurancepreviousloan;
  int? get generalinsurance => _generalinsurance;
  set generalinsurance(int? generalinsurance) =>
      _generalinsurance = generalinsurance;
  int? get generalinsurancepreviousloan => _generalinsurancepreviousloan;
  set generalinsurancepreviousloan(int? generalinsurancepreviousloan) =>
      _generalinsurancepreviousloan = generalinsurancepreviousloan;
  int? get dps => _dps;
  set dps(int? dps) => _dps = dps;
  int? get dpspreviousloan => _dpspreviousloan;
  set dpspreviousloan(int? dpspreviousloan) =>
      _dpspreviousloan = dpspreviousloan;
  int? get totalOtherRecurringExpense => _totalOtherRecurringExpense;
  set totalOtherRecurringExpense(int? totalOtherRecurringExpense) =>
      _totalOtherRecurringExpense = totalOtherRecurringExpense;
  int? get prevTotalOtherRecurringExpense => _prevTotalOtherRecurringExpense;
  set prevTotalOtherRecurringExpense(int? prevTotalOtherRecurringExpense) =>
      _prevTotalOtherRecurringExpense = prevTotalOtherRecurringExpense;

  RecurringExpenseData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _lifeinsurance = json['lifeinsurance'];
    _lifeinsurancepreviousloan = json['lifeinsurancepreviousloan'];
    _generalinsurance = json['generalinsurance'];
    _generalinsurancepreviousloan = json['generalinsurancepreviousloan'];
    _dps = json['dps'];
    _dpspreviousloan = json['dpspreviousloan'];
    _totalOtherRecurringExpense = json['totalOtherRecurringExpense'];
    _prevTotalOtherRecurringExpense = json['prevTotalOtherRecurringExpense'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['lifeinsurance'] = this._lifeinsurance;
    data['lifeinsurancepreviousloan'] = this._lifeinsurancepreviousloan;
    data['generalinsurance'] = this._generalinsurance;
    data['generalinsurancepreviousloan'] = this._generalinsurancepreviousloan;
    data['dps'] = this._dps;
    data['dpspreviousloan'] = this._dpspreviousloan;
    data['totalOtherRecurringExpense'] = this._totalOtherRecurringExpense;
    data['prevTotalOtherRecurringExpense'] =
        this._prevTotalOtherRecurringExpense;
    return data;
  }
}


/*class LoanEligibilityModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<LoanEligibilityData>? _data;

  LoanEligibilityModel(
      {bool? success, String? messageEn, String? messageBn, List<LoanEligibilityData>? data}) {
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
  List<LoanEligibilityData>? get data => _data;
  set data(List<LoanEligibilityData>? data) => _data = data;

  LoanEligibilityModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <LoanEligibilityData>[];
      json['data'].forEach((v) {
        _data!.add(new LoanEligibilityData.fromJson(v));
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

class LoanEligibilityData {
  int? _customerid;
  int? _currentcashflow;
  int? _previouscashflow;
  int? _debtburden;
  int? _debtburdenpreviousloan;
  int? _eligibleEMIDebtBurden;
  int? _previousEligibleEMIDebtBurden;
  int? _obligate;
  int? _previousloanobligation;
  int? _balanceSurplusfornewloan;
  int? _previousBalSurplusNewloan;
  int? _customeraffordableemi;
  int? _previousloanaffortableemi;
  int? _monthlycashinhandbusi;
  int? _cashinhandbusiprevln;
  int? _eligibleEMI;
  int? _previousLnEligibleEMI;
  int? _averageBankBalanceEMI;
  int? _eligibleLoanAmount;
  int? _eligibleLoanAmountPrevLoan;
  int? _roiproposedpercentage;
  int? _previousloanroiproposed;
  int? _tenureappliedmonths;
  int? _previousloantenureapplied;
  int? _loanappliedamount;
  int? _previousloanamount;
  int? _maxLoanAmount;
  int? _maxLoanAmountPrevLoan;
  int? _loanamountapproved;
  int? _previousloanapprovedamount;

  LoanEligibilityData(
      {int? customerid,
        int? currentcashflow,
        int? previouscashflow,
        int? debtburden,
        int? debtburdenpreviousloan,
        int? eligibleEMIDebtBurden,
        int? previousEligibleEMIDebtBurden,
        int? obligate,
        int? previousloanobligation,
        int? balanceSurplusfornewloan,
        int? previousBalSurplusNewloan,
        int? customeraffordableemi,
        int? previousloanaffortableemi,
        int? monthlycashinhandbusi,
        int? cashinhandbusiprevln,
        int? eligibleEMI,
        int? previousLnEligibleEMI,
        int? averageBankBalanceEMI,
        int? eligibleLoanAmount,
        int? eligibleLoanAmountPrevLoan,
        int? roiproposedpercentage,
        int? previousloanroiproposed,
        int? tenureappliedmonths,
        int? previousloantenureapplied,
        int? loanappliedamount,
        int? previousloanamount,
        int? maxLoanAmount,
        int? maxLoanAmountPrevLoan,
        int? loanamountapproved,
        int? previousloanapprovedamount}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (currentcashflow != null) {
      this._currentcashflow = currentcashflow;
    }
    if (previouscashflow != null) {
      this._previouscashflow = previouscashflow;
    }
    if (debtburden != null) {
      this._debtburden = debtburden;
    }
    if (debtburdenpreviousloan != null) {
      this._debtburdenpreviousloan = debtburdenpreviousloan;
    }
    if (eligibleEMIDebtBurden != null) {
      this._eligibleEMIDebtBurden = eligibleEMIDebtBurden;
    }
    if (previousEligibleEMIDebtBurden != null) {
      this._previousEligibleEMIDebtBurden = previousEligibleEMIDebtBurden;
    }
    if (obligate != null) {
      this._obligate = obligate;
    }
    if (previousloanobligation != null) {
      this._previousloanobligation = previousloanobligation;
    }
    if (balanceSurplusfornewloan != null) {
      this._balanceSurplusfornewloan = balanceSurplusfornewloan;
    }
    if (previousBalSurplusNewloan != null) {
      this._previousBalSurplusNewloan = previousBalSurplusNewloan;
    }
    if (customeraffordableemi != null) {
      this._customeraffordableemi = customeraffordableemi;
    }
    if (previousloanaffortableemi != null) {
      this._previousloanaffortableemi = previousloanaffortableemi;
    }
    if (monthlycashinhandbusi != null) {
      this._monthlycashinhandbusi = monthlycashinhandbusi;
    }
    if (cashinhandbusiprevln != null) {
      this._cashinhandbusiprevln = cashinhandbusiprevln;
    }
    if (eligibleEMI != null) {
      this._eligibleEMI = eligibleEMI;
    }
    if (previousLnEligibleEMI != null) {
      this._previousLnEligibleEMI = previousLnEligibleEMI;
    }
    if (averageBankBalanceEMI != null) {
      this._averageBankBalanceEMI = averageBankBalanceEMI;
    }
    if (eligibleLoanAmount != null) {
      this._eligibleLoanAmount = eligibleLoanAmount;
    }
    if (eligibleLoanAmountPrevLoan != null) {
      this._eligibleLoanAmountPrevLoan = eligibleLoanAmountPrevLoan;
    }
    if (roiproposedpercentage != null) {
      this._roiproposedpercentage = roiproposedpercentage;
    }
    if (previousloanroiproposed != null) {
      this._previousloanroiproposed = previousloanroiproposed;
    }
    if (tenureappliedmonths != null) {
      this._tenureappliedmonths = tenureappliedmonths;
    }
    if (previousloantenureapplied != null) {
      this._previousloantenureapplied = previousloantenureapplied;
    }
    if (loanappliedamount != null) {
      this._loanappliedamount = loanappliedamount;
    }
    if (previousloanamount != null) {
      this._previousloanamount = previousloanamount;
    }
    if (maxLoanAmount != null) {
      this._maxLoanAmount = maxLoanAmount;
    }
    if (maxLoanAmountPrevLoan != null) {
      this._maxLoanAmountPrevLoan = maxLoanAmountPrevLoan;
    }
    if (loanamountapproved != null) {
      this._loanamountapproved = loanamountapproved;
    }
    if (previousloanapprovedamount != null) {
      this._previousloanapprovedamount = previousloanapprovedamount;
    }
  }
  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get currentcashflow => _currentcashflow;
  set currentcashflow(int? currentcashflow) =>
      _currentcashflow = currentcashflow;
  int? get previouscashflow => _previouscashflow;
  set previouscashflow(int? previouscashflow) =>
      _previouscashflow = previouscashflow;
  int? get debtburden => _debtburden;
  set debtburden(int? debtburden) => _debtburden = debtburden;
  int? get debtburdenpreviousloan => _debtburdenpreviousloan;
  set debtburdenpreviousloan(int? debtburdenpreviousloan) =>
      _debtburdenpreviousloan = debtburdenpreviousloan;
  int? get eligibleEMIDebtBurden => _eligibleEMIDebtBurden;
  set eligibleEMIDebtBurden(int? eligibleEMIDebtBurden) =>
      _eligibleEMIDebtBurden = eligibleEMIDebtBurden;
  int? get previousEligibleEMIDebtBurden => _previousEligibleEMIDebtBurden;
  set previousEligibleEMIDebtBurden(int? previousEligibleEMIDebtBurden) =>
      _previousEligibleEMIDebtBurden = previousEligibleEMIDebtBurden;
  int? get obligate => _obligate;
  set obligate(int? obligate) => _obligate = obligate;
  int? get previousloanobligation => _previousloanobligation;
  set previousloanobligation(int? previousloanobligation) =>
      _previousloanobligation = previousloanobligation;
  int? get balanceSurplusfornewloan => _balanceSurplusfornewloan;
  set balanceSurplusfornewloan(int? balanceSurplusfornewloan) =>
      _balanceSurplusfornewloan = balanceSurplusfornewloan;
  int? get previousBalSurplusNewloan => _previousBalSurplusNewloan;
  set previousBalSurplusNewloan(int? previousBalSurplusNewloan) =>
      _previousBalSurplusNewloan = previousBalSurplusNewloan;
  int? get customeraffordableemi => _customeraffordableemi;
  set customeraffordableemi(int? customeraffordableemi) =>
      _customeraffordableemi = customeraffordableemi;
  int? get previousloanaffortableemi => _previousloanaffortableemi;
  set previousloanaffortableemi(int? previousloanaffortableemi) =>
      _previousloanaffortableemi = previousloanaffortableemi;
  int? get monthlycashinhandbusi => _monthlycashinhandbusi;
  set monthlycashinhandbusi(int? monthlycashinhandbusi) =>
      _monthlycashinhandbusi = monthlycashinhandbusi;
  int? get cashinhandbusiprevln => _cashinhandbusiprevln;
  set cashinhandbusiprevln(int? cashinhandbusiprevln) =>
      _cashinhandbusiprevln = cashinhandbusiprevln;
  int? get eligibleEMI => _eligibleEMI;
  set eligibleEMI(int? eligibleEMI) => _eligibleEMI = eligibleEMI;
  int? get previousLnEligibleEMI => _previousLnEligibleEMI;
  set previousLnEligibleEMI(int? previousLnEligibleEMI) =>
      _previousLnEligibleEMI = previousLnEligibleEMI;
  int? get averageBankBalanceEMI => _averageBankBalanceEMI;
  set averageBankBalanceEMI(int? averageBankBalanceEMI) =>
      _averageBankBalanceEMI = averageBankBalanceEMI;
  int? get eligibleLoanAmount => _eligibleLoanAmount;
  set eligibleLoanAmount(int? eligibleLoanAmount) =>
      _eligibleLoanAmount = eligibleLoanAmount;
  int? get eligibleLoanAmountPrevLoan => _eligibleLoanAmountPrevLoan;
  set eligibleLoanAmountPrevLoan(int? eligibleLoanAmountPrevLoan) =>
      _eligibleLoanAmountPrevLoan = eligibleLoanAmountPrevLoan;
  int? get roiproposedpercentage => _roiproposedpercentage;
  set roiproposedpercentage(int? roiproposedpercentage) =>
      _roiproposedpercentage = roiproposedpercentage;
  int? get previousloanroiproposed => _previousloanroiproposed;
  set previousloanroiproposed(int? previousloanroiproposed) =>
      _previousloanroiproposed = previousloanroiproposed;
  int? get tenureappliedmonths => _tenureappliedmonths;
  set tenureappliedmonths(int? tenureappliedmonths) =>
      _tenureappliedmonths = tenureappliedmonths;
  int? get previousloantenureapplied => _previousloantenureapplied;
  set previousloantenureapplied(int? previousloantenureapplied) =>
      _previousloantenureapplied = previousloantenureapplied;
  int? get loanappliedamount => _loanappliedamount;
  set loanappliedamount(int? loanappliedamount) =>
      _loanappliedamount = loanappliedamount;
  int? get previousloanamount => _previousloanamount;
  set previousloanamount(int? previousloanamount) =>
      _previousloanamount = previousloanamount;
  int? get maxLoanAmount => _maxLoanAmount;
  set maxLoanAmount(int? maxLoanAmount) => _maxLoanAmount = maxLoanAmount;
  int? get maxLoanAmountPrevLoan => _maxLoanAmountPrevLoan;
  set maxLoanAmountPrevLoan(int? maxLoanAmountPrevLoan) =>
      _maxLoanAmountPrevLoan = maxLoanAmountPrevLoan;
  int? get loanamountapproved => _loanamountapproved;
  set loanamountapproved(int? loanamountapproved) =>
      _loanamountapproved = loanamountapproved;
  int? get previousloanapprovedamount => _previousloanapprovedamount;
  set previousloanapprovedamount(int? previousloanapprovedamount) =>
      _previousloanapprovedamount = previousloanapprovedamount;

  LoanEligibilityData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _currentcashflow = json['currentcashflow'];
    _previouscashflow = json['previouscashflow'];
    _debtburden = json['debtburden'];
    _debtburdenpreviousloan = json['debtburdenpreviousloan'];
    _eligibleEMIDebtBurden = json['eligibleEMIDebtBurden'];
    _previousEligibleEMIDebtBurden = json['previousEligibleEMIDebtBurden'];
    _obligate = json['obligate'];
    _previousloanobligation = json['previousloanobligation'];
    _balanceSurplusfornewloan = json['balanceSurplusfornewloan'];
    _previousBalSurplusNewloan = json['previousBalSurplusNewloan'];
    _customeraffordableemi = json['customeraffordableemi'];
    _previousloanaffortableemi = json['previousloanaffortableemi'];
    _monthlycashinhandbusi = json['monthlycashinhandbusi'];
    _cashinhandbusiprevln = json['cashinhandbusiprevln'];
    _eligibleEMI = json['eligibleEMI'];
    _previousLnEligibleEMI = json['previousLnEligibleEMI'];
    _averageBankBalanceEMI = json['averageBankBalanceEMI'];
    _eligibleLoanAmount = json['eligibleLoanAmount'];
    _eligibleLoanAmountPrevLoan = json['eligibleLoanAmountPrevLoan'];
    _roiproposedpercentage = json['roiproposedpercentage'];
    _previousloanroiproposed = json['previousloanroiproposed'];
    _tenureappliedmonths = json['tenureappliedmonths'];
    _previousloantenureapplied = json['previousloantenureapplied'];
    _loanappliedamount = json['loanappliedamount'];
    _previousloanamount = json['previousloanamount'];
    _maxLoanAmount = json['maxLoanAmount'];
    _maxLoanAmountPrevLoan = json['maxLoanAmountPrevLoan'];
    _loanamountapproved = json['loanamountapproved'];
    _previousloanapprovedamount = json['previousloanapprovedamount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['currentcashflow'] = this._currentcashflow;
    data['previouscashflow'] = this._previouscashflow;
    data['debtburden'] = this._debtburden;
    data['debtburdenpreviousloan'] = this._debtburdenpreviousloan;
    data['eligibleEMIDebtBurden'] = this._eligibleEMIDebtBurden;
    data['previousEligibleEMIDebtBurden'] = this._previousEligibleEMIDebtBurden;
    data['obligate'] = this._obligate;
    data['previousloanobligation'] = this._previousloanobligation;
    data['balanceSurplusfornewloan'] = this._balanceSurplusfornewloan;
    data['previousBalSurplusNewloan'] = this._previousBalSurplusNewloan;
    data['customeraffordableemi'] = this._customeraffordableemi;
    data['previousloanaffortableemi'] = this._previousloanaffortableemi;
    data['monthlycashinhandbusi'] = this._monthlycashinhandbusi;
    data['cashinhandbusiprevln'] = this._cashinhandbusiprevln;
    data['eligibleEMI'] = this._eligibleEMI;
    data['previousLnEligibleEMI'] = this._previousLnEligibleEMI;
    data['averageBankBalanceEMI'] = this._averageBankBalanceEMI;
    data['eligibleLoanAmount'] = this._eligibleLoanAmount;
    data['eligibleLoanAmountPrevLoan'] = this._eligibleLoanAmountPrevLoan;
    data['roiproposedpercentage'] = this._roiproposedpercentage;
    data['previousloanroiproposed'] = this._previousloanroiproposed;
    data['tenureappliedmonths'] = this._tenureappliedmonths;
    data['previousloantenureapplied'] = this._previousloantenureapplied;
    data['loanappliedamount'] = this._loanappliedamount;
    data['previousloanamount'] = this._previousloanamount;
    data['maxLoanAmount'] = this._maxLoanAmount;
    data['maxLoanAmountPrevLoan'] = this._maxLoanAmountPrevLoan;
    data['loanamountapproved'] = this._loanamountapproved;
    data['previousloanapprovedamount'] = this._previousloanapprovedamount;
    return data;
  }
}*/

class LoanEligibilityModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<LoanEligibilityData>? _data;

  LoanEligibilityModel(
      {bool? success, String? messageEn, String? messageBn, List<LoanEligibilityData>? data}) {
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
  List<LoanEligibilityData>? get data => _data;
  set data(List<LoanEligibilityData>? data) => _data = data;

  LoanEligibilityModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <LoanEligibilityData>[];
      json['data'].forEach((v) {
        _data!.add(new LoanEligibilityData.fromJson(v));
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

class LoanEligibilityData {
  int? _customerid;
  int? _currentMonthlySurplus;
  int? _previousMonthlySurplus;
  int? _debtburden;
  int? _debtburdenpreviousloan;
  int? _eligibleEMIDebtBurden;
  int? _previousEligibleEMIDebtBurden;
  int? _obligate;
  int? _previousloanobligation;
  int? _balanceSurplusfornewloan;
  int? _previousBalSurplusNewloan;
  int? _customeraffordableemi;
  int? _previousloanaffortableemi;
  int? _monthlycashinhandbusi;
  int? _cashinhandbusiprevln;
  int? _eligibleEMI;
  int? _previousLnEligibleEMI;
  dynamic? _averageBankBalanceEMI;
  dynamic? _previousAverageBankBalanceEMI;



  int? _eligibleLoanAmount;
  int? _eligibleLoanAmountPrevLoan;
  int? _roiproposedpercentage;
  int? _previousloanroiproposed;
  int? _tenureappliedmonths;
  int? _previousloantenureapplied;
  int? _loanappliedamount;
  int? _previousloanamount;
  int? _maxLoanAmount;
  int? _maxLoanAmountPrevLoan;
  int? _loanamountapproved;
  int? _previousloanapprovedamount;

  LoanEligibilityData(
      {int? customerid,
        int? currentMonthlySurplus,
        int? previousMonthlySurplus,
        int? debtburden,
        int? debtburdenpreviousloan,
        int? eligibleEMIDebtBurden,
        int? previousEligibleEMIDebtBurden,
        int? obligate,
        int? previousloanobligation,
        int? balanceSurplusfornewloan,
        int? previousBalSurplusNewloan,
        int? customeraffordableemi,
        int? previousloanaffortableemi,
        int? monthlycashinhandbusi,
        int? cashinhandbusiprevln,
        int? eligibleEMI,
        int? previousLnEligibleEMI,
        dynamic? averageBankBalanceEMI,
        dynamic? previousAverageBankBalanceEMI,
        int? eligibleLoanAmount,
        int? eligibleLoanAmountPrevLoan,
        int? roiproposedpercentage,
        int? previousloanroiproposed,
        int? tenureappliedmonths,
        int? previousloantenureapplied,
        int? loanappliedamount,
        int? previousloanamount,
        int? maxLoanAmount,
        int? maxLoanAmountPrevLoan,
        int? loanamountapproved,
        int? previousloanapprovedamount}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (currentMonthlySurplus != null) {
      this._currentMonthlySurplus = currentMonthlySurplus;
    }
    if (previousMonthlySurplus != null) {
      this._previousMonthlySurplus = previousMonthlySurplus;
    }
    if (debtburden != null) {
      this._debtburden = debtburden;
    }
    if (debtburdenpreviousloan != null) {
      this._debtburdenpreviousloan = debtburdenpreviousloan;
    }
    if (eligibleEMIDebtBurden != null) {
      this._eligibleEMIDebtBurden = eligibleEMIDebtBurden;
    }
    if (previousEligibleEMIDebtBurden != null) {
      this._previousEligibleEMIDebtBurden = previousEligibleEMIDebtBurden;
    }
    if (obligate != null) {
      this._obligate = obligate;
    }
    if (previousloanobligation != null) {
      this._previousloanobligation = previousloanobligation;
    }
    if (balanceSurplusfornewloan != null) {
      this._balanceSurplusfornewloan = balanceSurplusfornewloan;
    }
    if (previousBalSurplusNewloan != null) {
      this._previousBalSurplusNewloan = previousBalSurplusNewloan;
    }
    if (customeraffordableemi != null) {
      this._customeraffordableemi = customeraffordableemi;
    }
    if (previousloanaffortableemi != null) {
      this._previousloanaffortableemi = previousloanaffortableemi;
    }
    if (monthlycashinhandbusi != null) {
      this._monthlycashinhandbusi = monthlycashinhandbusi;
    }
    if (cashinhandbusiprevln != null) {
      this._cashinhandbusiprevln = cashinhandbusiprevln;
    }
    if (eligibleEMI != null) {
      this._eligibleEMI = eligibleEMI;
    }
    if (previousLnEligibleEMI != null) {
      this._previousLnEligibleEMI = previousLnEligibleEMI;
    }


    if (averageBankBalanceEMI != null) {
      this._averageBankBalanceEMI = averageBankBalanceEMI;
    }

    if ( previousAverageBankBalanceEMI != null) {
      this._previousAverageBankBalanceEMI = previousAverageBankBalanceEMI;
    }
    if (eligibleLoanAmount != null) {
      this._eligibleLoanAmount = eligibleLoanAmount;
    }
    if (eligibleLoanAmountPrevLoan != null) {
      this._eligibleLoanAmountPrevLoan = eligibleLoanAmountPrevLoan;
    }
    if (roiproposedpercentage != null) {
      this._roiproposedpercentage = roiproposedpercentage;
    }
    if (previousloanroiproposed != null) {
      this._previousloanroiproposed = previousloanroiproposed;
    }
    if (tenureappliedmonths != null) {
      this._tenureappliedmonths = tenureappliedmonths;
    }
    if (previousloantenureapplied != null) {
      this._previousloantenureapplied = previousloantenureapplied;
    }
    if (loanappliedamount != null) {
      this._loanappliedamount = loanappliedamount;
    }
    if (previousloanamount != null) {
      this._previousloanamount = previousloanamount;
    }
    if (maxLoanAmount != null) {
      this._maxLoanAmount = maxLoanAmount;
    }
    if (maxLoanAmountPrevLoan != null) {
      this._maxLoanAmountPrevLoan = maxLoanAmountPrevLoan;
    }
    if (loanamountapproved != null) {
      this._loanamountapproved = loanamountapproved;
    }
    if (previousloanapprovedamount != null) {
      this._previousloanapprovedamount = previousloanapprovedamount;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get currentMonthlySurplus => _currentMonthlySurplus;
  set currentMonthlySurplus(int? currentMonthlySurplus) =>
      _currentMonthlySurplus = currentMonthlySurplus;
  int? get previousMonthlySurplus => _previousMonthlySurplus;
  set previousMonthlySurplus(int? previousMonthlySurplus) =>
      _previousMonthlySurplus = previousMonthlySurplus;
  int? get debtburden => _debtburden;
  set debtburden(int? debtburden) => _debtburden = debtburden;
  int? get debtburdenpreviousloan => _debtburdenpreviousloan;
  set debtburdenpreviousloan(int? debtburdenpreviousloan) =>
      _debtburdenpreviousloan = debtburdenpreviousloan;
  int? get eligibleEMIDebtBurden => _eligibleEMIDebtBurden;
  set eligibleEMIDebtBurden(int? eligibleEMIDebtBurden) =>
      _eligibleEMIDebtBurden = eligibleEMIDebtBurden;
  int? get previousEligibleEMIDebtBurden => _previousEligibleEMIDebtBurden;
  set previousEligibleEMIDebtBurden(int? previousEligibleEMIDebtBurden) =>
      _previousEligibleEMIDebtBurden = previousEligibleEMIDebtBurden;
  int? get obligate => _obligate;
  set obligate(int? obligate) => _obligate = obligate;
  int? get previousloanobligation => _previousloanobligation;
  set previousloanobligation(int? previousloanobligation) =>
      _previousloanobligation = previousloanobligation;
  int? get balanceSurplusfornewloan => _balanceSurplusfornewloan;
  set balanceSurplusfornewloan(int? balanceSurplusfornewloan) =>
      _balanceSurplusfornewloan = balanceSurplusfornewloan;
  int? get previousBalSurplusNewloan => _previousBalSurplusNewloan;
  set previousBalSurplusNewloan(int? previousBalSurplusNewloan) =>
      _previousBalSurplusNewloan = previousBalSurplusNewloan;
  int? get customeraffordableemi => _customeraffordableemi;
  set customeraffordableemi(int? customeraffordableemi) =>
      _customeraffordableemi = customeraffordableemi;
  int? get previousloanaffortableemi => _previousloanaffortableemi;
  set previousloanaffortableemi(int? previousloanaffortableemi) =>
      _previousloanaffortableemi = previousloanaffortableemi;
  int? get monthlycashinhandbusi => _monthlycashinhandbusi;
  set monthlycashinhandbusi(int? monthlycashinhandbusi) =>
      _monthlycashinhandbusi = monthlycashinhandbusi;
  int? get cashinhandbusiprevln => _cashinhandbusiprevln;
  set cashinhandbusiprevln(int? cashinhandbusiprevln) =>
      _cashinhandbusiprevln = cashinhandbusiprevln;
  int? get eligibleEMI => _eligibleEMI;
  set eligibleEMI(int? eligibleEMI) => _eligibleEMI = eligibleEMI;
  int? get previousLnEligibleEMI => _previousLnEligibleEMI;
  set previousLnEligibleEMI(int? previousLnEligibleEMI) =>
      _previousLnEligibleEMI = previousLnEligibleEMI;
  dynamic? get averageBankBalanceEMI => _averageBankBalanceEMI;
  set averageBankBalanceEMI(dynamic? averageBankBalanceEMI) =>
      _averageBankBalanceEMI = averageBankBalanceEMI;
  dynamic? get previousAverageBankBalanceEMI => _previousAverageBankBalanceEMI;
  set previousAverageBankBalanceEMI(dynamic? value) {
    _previousAverageBankBalanceEMI = value;
  }
  int? get eligibleLoanAmount => _eligibleLoanAmount;
  set eligibleLoanAmount(int? eligibleLoanAmount) =>
      _eligibleLoanAmount = eligibleLoanAmount;
  int? get eligibleLoanAmountPrevLoan => _eligibleLoanAmountPrevLoan;
  set eligibleLoanAmountPrevLoan(int? eligibleLoanAmountPrevLoan) =>
      _eligibleLoanAmountPrevLoan = eligibleLoanAmountPrevLoan;
  int? get roiproposedpercentage => _roiproposedpercentage;
  set roiproposedpercentage(int? roiproposedpercentage) =>
      _roiproposedpercentage = roiproposedpercentage;
  int? get previousloanroiproposed => _previousloanroiproposed;
  set previousloanroiproposed(int? previousloanroiproposed) =>
      _previousloanroiproposed = previousloanroiproposed;
  int? get tenureappliedmonths => _tenureappliedmonths;
  set tenureappliedmonths(int? tenureappliedmonths) =>
      _tenureappliedmonths = tenureappliedmonths;
  int? get previousloantenureapplied => _previousloantenureapplied;
  set previousloantenureapplied(int? previousloantenureapplied) =>
      _previousloantenureapplied = previousloantenureapplied;
  int? get loanappliedamount => _loanappliedamount;
  set loanappliedamount(int? loanappliedamount) =>
      _loanappliedamount = loanappliedamount;
  int? get previousloanamount => _previousloanamount;
  set previousloanamount(int? previousloanamount) =>
      _previousloanamount = previousloanamount;
  int? get maxLoanAmount => _maxLoanAmount;
  set maxLoanAmount(int? maxLoanAmount) => _maxLoanAmount = maxLoanAmount;
  int? get maxLoanAmountPrevLoan => _maxLoanAmountPrevLoan;
  set maxLoanAmountPrevLoan(int? maxLoanAmountPrevLoan) =>
      _maxLoanAmountPrevLoan = maxLoanAmountPrevLoan;
  int? get loanamountapproved => _loanamountapproved;
  set loanamountapproved(int? loanamountapproved) =>
      _loanamountapproved = loanamountapproved;
  int? get previousloanapprovedamount => _previousloanapprovedamount;
  set previousloanapprovedamount(int? previousloanapprovedamount) =>
      _previousloanapprovedamount = previousloanapprovedamount;

  LoanEligibilityData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _currentMonthlySurplus = json['currentMonthlySurplus'];
    _previousMonthlySurplus = json['previousMonthlySurplus'];
    _debtburden = json['debtburden'];
    _debtburdenpreviousloan = json['debtburdenpreviousloan'];
    _eligibleEMIDebtBurden = json['eligibleEMIDebtBurden'];
    _previousEligibleEMIDebtBurden = json['previousEligibleEMIDebtBurden'];
    _obligate = json['obligate'];
    _previousloanobligation = json['previousloanobligation'];
    _balanceSurplusfornewloan = json['balanceSurplusfornewloan'];
    _previousBalSurplusNewloan = json['previousBalSurplusNewloan'];
    _customeraffordableemi = json['customeraffordableemi'];
    _previousloanaffortableemi = json['previousloanaffortableemi'];
    _monthlycashinhandbusi = json['monthlycashinhandbusi'];
    _cashinhandbusiprevln = json['cashinhandbusiprevln'];
    _eligibleEMI = json['eligibleEMI'];
    _previousLnEligibleEMI = json['previousLnEligibleEMI'];
    _averageBankBalanceEMI = json['averageBankBalanceEMI'];
    _previousAverageBankBalanceEMI = json['previousAverageBankBalanceEMI'];
    _eligibleLoanAmount = json['eligibleLoanAmount'];
    _eligibleLoanAmountPrevLoan = json['eligibleLoanAmountPrevLoan'];
    _roiproposedpercentage = json['roiproposedpercentage'];
    _previousloanroiproposed = json['previousloanroiproposed'];
    _tenureappliedmonths = json['tenureappliedmonths'];
    _previousloantenureapplied = json['previousloantenureapplied'];
    _loanappliedamount = json['loanappliedamount'];
    _previousloanamount = json['previousloanamount'];
    _maxLoanAmount = json['maxLoanAmount'];
    _maxLoanAmountPrevLoan = json['maxLoanAmountPrevLoan'];
    _loanamountapproved = json['loanamountapproved'];
    _previousloanapprovedamount = json['previousloanapprovedamount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['currentMonthlySurplus'] = this._currentMonthlySurplus;
    data['previousMonthlySurplus'] = this._previousMonthlySurplus;
    data['debtburden'] = this._debtburden;
    data['debtburdenpreviousloan'] = this._debtburdenpreviousloan;
    data['eligibleEMIDebtBurden'] = this._eligibleEMIDebtBurden;
    data['previousEligibleEMIDebtBurden'] = this._previousEligibleEMIDebtBurden;
    data['obligate'] = this._obligate;
    data['previousloanobligation'] = this._previousloanobligation;
    data['balanceSurplusfornewloan'] = this._balanceSurplusfornewloan;
    data['previousBalSurplusNewloan'] = this._previousBalSurplusNewloan;
    data['customeraffordableemi'] = this._customeraffordableemi;
    data['previousloanaffortableemi'] = this._previousloanaffortableemi;
    data['monthlycashinhandbusi'] = this._monthlycashinhandbusi;
    data['cashinhandbusiprevln'] = this._cashinhandbusiprevln;
    data['eligibleEMI'] = this._eligibleEMI;
    data['previousLnEligibleEMI'] = this._previousLnEligibleEMI;
    data['averageBankBalanceEMI'] = this._averageBankBalanceEMI;
    data['eligibleLoanAmount'] = this._eligibleLoanAmount;
    data['eligibleLoanAmountPrevLoan'] = this._eligibleLoanAmountPrevLoan;
    data['roiproposedpercentage'] = this._roiproposedpercentage;
    data['previousloanroiproposed'] = this._previousloanroiproposed;
    data['tenureappliedmonths'] = this._tenureappliedmonths;
    data['previousloantenureapplied'] = this._previousloantenureapplied;
    data['loanappliedamount'] = this._loanappliedamount;
    data['previousloanamount'] = this._previousloanamount;
    data['maxLoanAmount'] = this._maxLoanAmount;
    data['maxLoanAmountPrevLoan'] = this._maxLoanAmountPrevLoan;
    data['loanamountapproved'] = this._loanamountapproved;
    data['previousloanapprovedamount'] = this._previousloanapprovedamount;
    return data;
  }
}

/*class LoanEligibilityModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<LoanEligibilityData>? _data;

  LoanEligibilityModel(
      {bool? success, String? messageEn, String? messageBn, List<LoanEligibilityData>? data}) {
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
  List<LoanEligibilityData>? get data => _data;
  set data(List<LoanEligibilityData>? data) => _data = data;

  LoanEligibilityModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <LoanEligibilityData>[];
      json['data'].forEach((v) {
        _data!.add(new LoanEligibilityData.fromJson(v));
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

class LoanEligibilityData {
  int? _customerid;
  int? _currentMonthlySurplus;
  int? _previousMonthlySurplus;
  int? _debtburden;
  int? _debtburdenpreviousloan;
  int? _eligibleEMIDebtBurden;
  int? _previousEligibleEMIDebtBurden;
  int? _obligate;
  int? _previousloanobligation;
  int? _balanceSurplusfornewloan;
  int? _previousBalSurplusNewloan;
  int? _customeraffordableemi;
  int? _previousloanaffortableemi;
  int? _monthlycashinhandbusi;
  int? _cashinhandbusiprevln;
  int? _eligibleEMI;
  int? _previousLnEligibleEMI;
  dynamic? _averageBankBalanceEMI;
  int? _eligibleLoanAmount;
  int? _eligibleLoanAmountPrevLoan;
  int? _roiproposedpercentage;
  int? _previousloanroiproposed;
  int? _tenureappliedmonths;
  int? _previousloantenureapplied;
  int? _loanappliedamount;
  int? _previousloanamount;
  int? _maxLoanAmount;
  int? _maxLoanAmountPrevLoan;
  int? _loanamountapproved;
  int? _previousloanapprovedamount;

  LoanEligibilityData(
      {int? customerid,
        int? currentMonthlySurplus,
        int? previousMonthlySurplus,
        int? debtburden,
        int? debtburdenpreviousloan,
        int? eligibleEMIDebtBurden,
        int? previousEligibleEMIDebtBurden,
        int? obligate,
        int? previousloanobligation,
        int? balanceSurplusfornewloan,
        int? previousBalSurplusNewloan,
        int? customeraffordableemi,
        int? previousloanaffortableemi,
        int? monthlycashinhandbusi,
        int? cashinhandbusiprevln,
        int? eligibleEMI,
        int? previousLnEligibleEMI,
        dynamic? averageBankBalanceEMI,
        int? eligibleLoanAmount,
        int? eligibleLoanAmountPrevLoan,
        int? roiproposedpercentage,
        int? previousloanroiproposed,
        int? tenureappliedmonths,
        int? previousloantenureapplied,
        int? loanappliedamount,
        int? previousloanamount,
        int? maxLoanAmount,
        int? maxLoanAmountPrevLoan,
        int? loanamountapproved,
        int? previousloanapprovedamount}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (currentMonthlySurplus != null) {
      this._currentMonthlySurplus = currentMonthlySurplus;
    }
    if (previousMonthlySurplus != null) {
      this._previousMonthlySurplus = previousMonthlySurplus;
    }
    if (debtburden != null) {
      this._debtburden = debtburden;
    }
    if (debtburdenpreviousloan != null) {
      this._debtburdenpreviousloan = debtburdenpreviousloan;
    }
    if (eligibleEMIDebtBurden != null) {
      this._eligibleEMIDebtBurden = eligibleEMIDebtBurden;
    }
    if (previousEligibleEMIDebtBurden != null) {
      this._previousEligibleEMIDebtBurden = previousEligibleEMIDebtBurden;
    }
    if (obligate != null) {
      this._obligate = obligate;
    }
    if (previousloanobligation != null) {
      this._previousloanobligation = previousloanobligation;
    }
    if (balanceSurplusfornewloan != null) {
      this._balanceSurplusfornewloan = balanceSurplusfornewloan;
    }
    if (previousBalSurplusNewloan != null) {
      this._previousBalSurplusNewloan = previousBalSurplusNewloan;
    }
    if (customeraffordableemi != null) {
      this._customeraffordableemi = customeraffordableemi;
    }
    if (previousloanaffortableemi != null) {
      this._previousloanaffortableemi = previousloanaffortableemi;
    }
    if (monthlycashinhandbusi != null) {
      this._monthlycashinhandbusi = monthlycashinhandbusi;
    }
    if (cashinhandbusiprevln != null) {
      this._cashinhandbusiprevln = cashinhandbusiprevln;
    }
    if (eligibleEMI != null) {
      this._eligibleEMI = eligibleEMI;
    }
    if (previousLnEligibleEMI != null) {
      this._previousLnEligibleEMI = previousLnEligibleEMI;
    }
    if (averageBankBalanceEMI != null) {
      this._averageBankBalanceEMI = averageBankBalanceEMI;
    }
    if (eligibleLoanAmount != null) {
      this._eligibleLoanAmount = eligibleLoanAmount;
    }
    if (eligibleLoanAmountPrevLoan != null) {
      this._eligibleLoanAmountPrevLoan = eligibleLoanAmountPrevLoan;
    }
    if (roiproposedpercentage != null) {
      this._roiproposedpercentage = roiproposedpercentage;
    }
    if (previousloanroiproposed != null) {
      this._previousloanroiproposed = previousloanroiproposed;
    }
    if (tenureappliedmonths != null) {
      this._tenureappliedmonths = tenureappliedmonths;
    }
    if (previousloantenureapplied != null) {
      this._previousloantenureapplied = previousloantenureapplied;
    }
    if (loanappliedamount != null) {
      this._loanappliedamount = loanappliedamount;
    }
    if (previousloanamount != null) {
      this._previousloanamount = previousloanamount;
    }
    if (maxLoanAmount != null) {
      this._maxLoanAmount = maxLoanAmount;
    }
    if (maxLoanAmountPrevLoan != null) {
      this._maxLoanAmountPrevLoan = maxLoanAmountPrevLoan;
    }
    if (loanamountapproved != null) {
      this._loanamountapproved = loanamountapproved;
    }
    if (previousloanapprovedamount != null) {
      this._previousloanapprovedamount = previousloanapprovedamount;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get currentMonthlySurplus => _currentMonthlySurplus;
  set currentMonthlySurplus(int? currentMonthlySurplus) =>
      _currentMonthlySurplus = currentMonthlySurplus;
  int? get previousMonthlySurplus => _previousMonthlySurplus;
  set previousMonthlySurplus(int? previousMonthlySurplus) =>
      _previousMonthlySurplus = previousMonthlySurplus;
  int? get debtburden => _debtburden;
  set debtburden(int? debtburden) => _debtburden = debtburden;
  int? get debtburdenpreviousloan => _debtburdenpreviousloan;
  set debtburdenpreviousloan(int? debtburdenpreviousloan) =>
      _debtburdenpreviousloan = debtburdenpreviousloan;
  int? get eligibleEMIDebtBurden => _eligibleEMIDebtBurden;
  set eligibleEMIDebtBurden(int? eligibleEMIDebtBurden) =>
      _eligibleEMIDebtBurden = eligibleEMIDebtBurden;
  int? get previousEligibleEMIDebtBurden => _previousEligibleEMIDebtBurden;
  set previousEligibleEMIDebtBurden(int? previousEligibleEMIDebtBurden) =>
      _previousEligibleEMIDebtBurden = previousEligibleEMIDebtBurden;
  int? get obligate => _obligate;
  set obligate(int? obligate) => _obligate = obligate;
  int? get previousloanobligation => _previousloanobligation;
  set previousloanobligation(int? previousloanobligation) =>
      _previousloanobligation = previousloanobligation;
  int? get balanceSurplusfornewloan => _balanceSurplusfornewloan;
  set balanceSurplusfornewloan(int? balanceSurplusfornewloan) =>
      _balanceSurplusfornewloan = balanceSurplusfornewloan;
  int? get previousBalSurplusNewloan => _previousBalSurplusNewloan;
  set previousBalSurplusNewloan(int? previousBalSurplusNewloan) =>
      _previousBalSurplusNewloan = previousBalSurplusNewloan;
  int? get customeraffordableemi => _customeraffordableemi;
  set customeraffordableemi(int? customeraffordableemi) =>
      _customeraffordableemi = customeraffordableemi;
  int? get previousloanaffortableemi => _previousloanaffortableemi;
  set previousloanaffortableemi(int? previousloanaffortableemi) =>
      _previousloanaffortableemi = previousloanaffortableemi;
  int? get monthlycashinhandbusi => _monthlycashinhandbusi;
  set monthlycashinhandbusi(int? monthlycashinhandbusi) =>
      _monthlycashinhandbusi = monthlycashinhandbusi;
  int? get cashinhandbusiprevln => _cashinhandbusiprevln;
  set cashinhandbusiprevln(int? cashinhandbusiprevln) =>
      _cashinhandbusiprevln = cashinhandbusiprevln;
  int? get eligibleEMI => _eligibleEMI;
  set eligibleEMI(int? eligibleEMI) => _eligibleEMI = eligibleEMI;
  int? get previousLnEligibleEMI => _previousLnEligibleEMI;
  set previousLnEligibleEMI(int? previousLnEligibleEMI) =>
      _previousLnEligibleEMI = previousLnEligibleEMI;
  dynamic? get averageBankBalanceEMI => _averageBankBalanceEMI;
  set averageBankBalanceEMI(dynamic? averageBankBalanceEMI) =>
      _averageBankBalanceEMI = averageBankBalanceEMI;
  int? get eligibleLoanAmount => _eligibleLoanAmount;
  set eligibleLoanAmount(int? eligibleLoanAmount) =>
      _eligibleLoanAmount = eligibleLoanAmount;
  int? get eligibleLoanAmountPrevLoan => _eligibleLoanAmountPrevLoan;
  set eligibleLoanAmountPrevLoan(int? eligibleLoanAmountPrevLoan) =>
      _eligibleLoanAmountPrevLoan = eligibleLoanAmountPrevLoan;
  int? get roiproposedpercentage => _roiproposedpercentage;
  set roiproposedpercentage(int? roiproposedpercentage) =>
      _roiproposedpercentage = roiproposedpercentage;
  int? get previousloanroiproposed => _previousloanroiproposed;
  set previousloanroiproposed(int? previousloanroiproposed) =>
      _previousloanroiproposed = previousloanroiproposed;
  int? get tenureappliedmonths => _tenureappliedmonths;
  set tenureappliedmonths(int? tenureappliedmonths) =>
      _tenureappliedmonths = tenureappliedmonths;
  int? get previousloantenureapplied => _previousloantenureapplied;
  set previousloantenureapplied(int? previousloantenureapplied) =>
      _previousloantenureapplied = previousloantenureapplied;
  int? get loanappliedamount => _loanappliedamount;
  set loanappliedamount(int? loanappliedamount) =>
      _loanappliedamount = loanappliedamount;
  int? get previousloanamount => _previousloanamount;
  set previousloanamount(int? previousloanamount) =>
      _previousloanamount = previousloanamount;
  int? get maxLoanAmount => _maxLoanAmount;
  set maxLoanAmount(int? maxLoanAmount) => _maxLoanAmount = maxLoanAmount;
  int? get maxLoanAmountPrevLoan => _maxLoanAmountPrevLoan;
  set maxLoanAmountPrevLoan(int? maxLoanAmountPrevLoan) =>
      _maxLoanAmountPrevLoan = maxLoanAmountPrevLoan;
  int? get loanamountapproved => _loanamountapproved;
  set loanamountapproved(int? loanamountapproved) =>
      _loanamountapproved = loanamountapproved;
  int? get previousloanapprovedamount => _previousloanapprovedamount;
  set previousloanapprovedamount(int? previousloanapprovedamount) =>
      _previousloanapprovedamount = previousloanapprovedamount;

  LoanEligibilityData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _currentMonthlySurplus = json['currentMonthlySurplus'];
    _previousMonthlySurplus = json['previousMonthlySurplus'];
    _debtburden = json['debtburden'];
    _debtburdenpreviousloan = json['debtburdenpreviousloan'];
    _eligibleEMIDebtBurden = json['eligibleEMIDebtBurden'];
    _previousEligibleEMIDebtBurden = json['previousEligibleEMIDebtBurden'];
    _obligate = json['obligate'];
    _previousloanobligation = json['previousloanobligation'];
    _balanceSurplusfornewloan = json['balanceSurplusfornewloan'];
    _previousBalSurplusNewloan = json['previousBalSurplusNewloan'];
    _customeraffordableemi = json['customeraffordableemi'];
    _previousloanaffortableemi = json['previousloanaffortableemi'];
    _monthlycashinhandbusi = json['monthlycashinhandbusi'];
    _cashinhandbusiprevln = json['cashinhandbusiprevln'];
    _eligibleEMI = json['eligibleEMI'];
    _previousLnEligibleEMI = json['previousLnEligibleEMI'];
    _averageBankBalanceEMI = json['averageBankBalanceEMI'];
    _eligibleLoanAmount = json['eligibleLoanAmount'];
    _eligibleLoanAmountPrevLoan = json['eligibleLoanAmountPrevLoan'];
    _roiproposedpercentage = json['roiproposedpercentage'];
    _previousloanroiproposed = json['previousloanroiproposed'];
    _tenureappliedmonths = json['tenureappliedmonths'];
    _previousloantenureapplied = json['previousloantenureapplied'];
    _loanappliedamount = json['loanappliedamount'];
    _previousloanamount = json['previousloanamount'];
    _maxLoanAmount = json['maxLoanAmount'];
    _maxLoanAmountPrevLoan = json['maxLoanAmountPrevLoan'];
    _loanamountapproved = json['loanamountapproved'];
    _previousloanapprovedamount = json['previousloanapprovedamount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['currentMonthlySurplus'] = this._currentMonthlySurplus;
    data['previousMonthlySurplus'] = this._previousMonthlySurplus;
    data['debtburden'] = this._debtburden;
    data['debtburdenpreviousloan'] = this._debtburdenpreviousloan;
    data['eligibleEMIDebtBurden'] = this._eligibleEMIDebtBurden;
    data['previousEligibleEMIDebtBurden'] = this._previousEligibleEMIDebtBurden;
    data['obligate'] = this._obligate;
    data['previousloanobligation'] = this._previousloanobligation;
    data['balanceSurplusfornewloan'] = this._balanceSurplusfornewloan;
    data['previousBalSurplusNewloan'] = this._previousBalSurplusNewloan;
    data['customeraffordableemi'] = this._customeraffordableemi;
    data['previousloanaffortableemi'] = this._previousloanaffortableemi;
    data['monthlycashinhandbusi'] = this._monthlycashinhandbusi;
    data['cashinhandbusiprevln'] = this._cashinhandbusiprevln;
    data['eligibleEMI'] = this._eligibleEMI;
    data['previousLnEligibleEMI'] = this._previousLnEligibleEMI;
    data['averageBankBalanceEMI'] = this._averageBankBalanceEMI;
    data['eligibleLoanAmount'] = this._eligibleLoanAmount;
    data['eligibleLoanAmountPrevLoan'] = this._eligibleLoanAmountPrevLoan;
    data['roiproposedpercentage'] = this._roiproposedpercentage;
    data['previousloanroiproposed'] = this._previousloanroiproposed;
    data['tenureappliedmonths'] = this._tenureappliedmonths;
    data['previousloantenureapplied'] = this._previousloantenureapplied;
    data['loanappliedamount'] = this._loanappliedamount;
    data['previousloanamount'] = this._previousloanamount;
    data['maxLoanAmount'] = this._maxLoanAmount;
    data['maxLoanAmountPrevLoan'] = this._maxLoanAmountPrevLoan;
    data['loanamountapproved'] = this._loanamountapproved;
    data['previousloanapprovedamount'] = this._previousloanapprovedamount;
    return data;
  }
}*/


/*
class TotalMonthlySurplusModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<TotalMonthlySurplusData>? _data;

  TotalMonthlySurplusModel(
      {bool? success, String? messageEn, String? messageBn, List<TotalMonthlySurplusData>? data}) {
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
  List<TotalMonthlySurplusData>? get data => _data;
  set data(List<TotalMonthlySurplusData>? data) => _data = data;

  TotalMonthlySurplusModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <TotalMonthlySurplusData>[];
      json['data'].forEach((v) {
        _data!.add(new TotalMonthlySurplusData.fromJson(v));
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


class TotalMonthlySurplusData {
  int? _customerid;
  int? _currentcashflow;
  int? _previouscashflow;

  TotalMonthlySurplusData({int? customerid, int? currentcashflow, int? previouscashflow}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (currentcashflow != null) {
      this._currentcashflow = currentcashflow;
    }
    if (previouscashflow != null) {
      this._previouscashflow = previouscashflow;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get currentcashflow => _currentcashflow;
  set currentcashflow(int? currentcashflow) =>
      _currentcashflow = currentcashflow;
  int? get previouscashflow => _previouscashflow;
  set previouscashflow(int? previouscashflow) =>
      _previouscashflow = previouscashflow;

  TotalMonthlySurplusData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _currentcashflow = json['currentCashFlow'];
    _previouscashflow = json['previousCashFlow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['currentCashFlow'] = this._currentcashflow;
    data['currentCashFlow'] = this._previouscashflow;
    return data;
  }
}*/



class TotalMonthlySurplusModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<TotalMonthlySurplusData>? _data;

  TotalMonthlySurplusModel(
      {bool? success, String? messageEn, String? messageBn, List<TotalMonthlySurplusData>? data}) {
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
  List<TotalMonthlySurplusData>? get data => _data;
  set data(List<TotalMonthlySurplusData>? data) => _data = data;

  TotalMonthlySurplusModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <TotalMonthlySurplusData>[];
      json['data'].forEach((v) {
        _data!.add(new TotalMonthlySurplusData.fromJson(v));
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

class TotalMonthlySurplusData {
  int? _customerid;
  int? _currentMonthlySurplus;
  int? _previousMonthlySurplus;

  TotalMonthlySurplusData(
      {int? customerid,
        int? currentMonthlySurplus,
        int? previousMonthlySurplus}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (currentMonthlySurplus != null) {
      this._currentMonthlySurplus = currentMonthlySurplus;
    }
    if (previousMonthlySurplus != null) {
      this._previousMonthlySurplus = previousMonthlySurplus;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get currentMonthlySurplus => _currentMonthlySurplus;
  set currentMonthlySurplus(int? currentMonthlySurplus) =>
      _currentMonthlySurplus = currentMonthlySurplus;
  int? get previousMonthlySurplus => _previousMonthlySurplus;
  set previousMonthlySurplus(int? previousMonthlySurplus) =>
      _previousMonthlySurplus = previousMonthlySurplus;

  TotalMonthlySurplusData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _currentMonthlySurplus = json['currentMonthlySurplus'];
    _previousMonthlySurplus = json['previousMonthlySurplus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['currentMonthlySurplus'] = this._currentMonthlySurplus;
    data['previousMonthlySurplus'] = this._previousMonthlySurplus;
    return data;
  }
}




class FrequencyModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<FrequencyData>? _data;

  FrequencyModel(
      {bool? success, String? messageEn, String? messageBn, List<FrequencyData>? data}) {
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
  List<FrequencyData>? get data => _data;
  set data(List<FrequencyData>? data) => _data = data;

  FrequencyModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <FrequencyData>[];
      json['data'].forEach((v) {
        _data!.add(new FrequencyData.fromJson(v));
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

class FrequencyData {
  int? _customerid;
  int? _salesDaily;
  int? _salesWeekly;
  int? _salesMonthly;
  int? _purchaseDaily;
  int? _purchaseWeekly;
  int? _purchaseMonthly;
  int? _totalMonthlyPurchase;

  FrequencyData(
      {int? customerid,
        int? salesDaily,
        int? salesWeekly,
        int? salesMonthly,
        int? purchaseDaily,
        int? purchaseWeekly,
        int? purchaseMonthly,
        int? totalMonthlyPurchase}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (salesDaily != null) {
      this._salesDaily = salesDaily;
    }
    if (salesWeekly != null) {
      this._salesWeekly = salesWeekly;
    }
    if (salesMonthly != null) {
      this._salesMonthly = salesMonthly;
    }
    if (purchaseDaily != null) {
      this._purchaseDaily = purchaseDaily;
    }
    if (purchaseWeekly != null) {
      this._purchaseWeekly = purchaseWeekly;
    }
    if (purchaseMonthly != null) {
      this._purchaseMonthly = purchaseMonthly;
    }
    if (totalMonthlyPurchase != null) {
      this._totalMonthlyPurchase = totalMonthlyPurchase;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get salesDaily => _salesDaily;
  set salesDaily(int? salesDaily) => _salesDaily = salesDaily;
  int? get salesWeekly => _salesWeekly;
  set salesWeekly(int? salesWeekly) => _salesWeekly = salesWeekly;
  int? get salesMonthly => _salesMonthly;
  set salesMonthly(int? salesMonthly) => _salesMonthly = salesMonthly;
  int? get purchaseDaily => _purchaseDaily;
  set purchaseDaily(int? purchaseDaily) => _purchaseDaily = purchaseDaily;
  int? get purchaseWeekly => _purchaseWeekly;
  set purchaseWeekly(int? purchaseWeekly) => _purchaseWeekly = purchaseWeekly;
  int? get purchaseMonthly => _purchaseMonthly;
  set purchaseMonthly(int? purchaseMonthly) =>
      _purchaseMonthly = purchaseMonthly;
  int? get totalMonthlyPurchase => _totalMonthlyPurchase;
  set totalMonthlyPurchase(int? totalMonthlyPurchase) =>
      _totalMonthlyPurchase = totalMonthlyPurchase;

  FrequencyData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _salesDaily = json['salesDaily'];
    _salesWeekly = json['salesWeekly'];
    _salesMonthly = json['salesMonthly'];
    _purchaseDaily = json['purchaseDaily'];
    _purchaseWeekly = json['purchaseWeekly'];
    _purchaseMonthly = json['purchaseMonthly'];
    _totalMonthlyPurchase = json['totalMonthlyPurchase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['salesDaily'] = this._salesDaily;
    data['salesWeekly'] = this._salesWeekly;
    data['salesMonthly'] = this._salesMonthly;
    data['purchaseDaily'] = this._purchaseDaily;
    data['purchaseWeekly'] = this._purchaseWeekly;
    data['purchaseMonthly'] = this._purchaseMonthly;
    data['totalMonthlyPurchase'] = this._totalMonthlyPurchase;
    return data;
  }
}



class SeasonalityModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<SeasonalityData>? _data;

  SeasonalityModel(
      {bool? success, String? messageEn, String? messageBn, List<SeasonalityData>? data}) {
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
  List<SeasonalityData>? get data => _data;
  set data(List<SeasonalityData>? data) => _data = data;

  SeasonalityModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <SeasonalityData>[];
      json['data'].forEach((v) {
        _data!.add(new SeasonalityData.fromJson(v));
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

class SeasonalityData {
  int? _customerid;
  int? _low;
  int? _lowmonth;
  int? _lowtotalsales;
  int? _high;
  int? _highmonth;
  int? _hightotalsales;
  int? _normal;
  int? _normalmonth;
  int? _normaltotalsales;
  int? _totalmonth;
  int? _totalsales;
  int? _average;

  SeasonalityData(
      {int? customerid,
        int? low,
        int? lowmonth,
        int? lowtotalsales,
        int? high,
        int? highmonth,
        int? hightotalsales,
        int? normal,
        int? normalmonth,
        int? normaltotalsales,
        int? totalmonth,
        int? totalsales,
        int? average}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (low != null) {
      this._low = low;
    }
    if (lowmonth != null) {
      this._lowmonth = lowmonth;
    }
    if (lowtotalsales != null) {
      this._lowtotalsales = lowtotalsales;
    }
    if (high != null) {
      this._high = high;
    }
    if (highmonth != null) {
      this._highmonth = highmonth;
    }
    if (hightotalsales != null) {
      this._hightotalsales = hightotalsales;
    }
    if (normal != null) {
      this._normal = normal;
    }
    if (normalmonth != null) {
      this._normalmonth = normalmonth;
    }
    if (normaltotalsales != null) {
      this._normaltotalsales = normaltotalsales;
    }
    if (totalmonth != null) {
      this._totalmonth = totalmonth;
    }
    if (totalsales != null) {
      this._totalsales = totalsales;
    }
    if (average != null) {
      this._average = average;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get low => _low;
  set low(int? low) => _low = low;
  int? get lowmonth => _lowmonth;
  set lowmonth(int? lowmonth) => _lowmonth = lowmonth;
  int? get lowtotalsales => _lowtotalsales;
  set lowtotalsales(int? lowtotalsales) => _lowtotalsales = lowtotalsales;
  int? get high => _high;
  set high(int? high) => _high = high;
  int? get highmonth => _highmonth;
  set highmonth(int? highmonth) => _highmonth = highmonth;
  int? get hightotalsales => _hightotalsales;
  set hightotalsales(int? hightotalsales) => _hightotalsales = hightotalsales;
  int? get normal => _normal;
  set normal(int? normal) => _normal = normal;
  int? get normalmonth => _normalmonth;
  set normalmonth(int? normalmonth) => _normalmonth = normalmonth;
  int? get normaltotalsales => _normaltotalsales;
  set normaltotalsales(int? normaltotalsales) =>
      _normaltotalsales = normaltotalsales;
  int? get totalmonth => _totalmonth;
  set totalmonth(int? totalmonth) => _totalmonth = totalmonth;
  int? get totalsales => _totalsales;
  set totalsales(int? totalsales) => _totalsales = totalsales;
  int? get average => _average;
  set average(int? average) => _average = average;

  SeasonalityData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _low = json['low'];
    _lowmonth = json['lowmonth'];
    _lowtotalsales = json['lowtotalsales'];
    _high = json['high'];
    _highmonth = json['highmonth'];
    _hightotalsales = json['hightotalsales'];
    _normal = json['normal'];
    _normalmonth = json['normalmonth'];
    _normaltotalsales = json['normaltotalsales'];
    _totalmonth = json['totalmonth'];
    _totalsales = json['totalsales'];
    _average = json['average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['low'] = this._low;
    data['lowmonth'] = this._lowmonth;
    data['lowtotalsales'] = this._lowtotalsales;
    data['high'] = this._high;
    data['highmonth'] = this._highmonth;
    data['hightotalsales'] = this._hightotalsales;
    data['normal'] = this._normal;
    data['normalmonth'] = this._normalmonth;
    data['normaltotalsales'] = this._normaltotalsales;
    data['totalmonth'] = this._totalmonth;
    data['totalsales'] = this._totalsales;
    data['average'] = this._average;
    return data;
  }
}




class WorkingCapitalModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<WorkingCapitalData>? _data;

  WorkingCapitalModel(
      {bool? success, String? messageEn, String? messageBn, List<WorkingCapitalData>? data}) {
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
  List<WorkingCapitalData>? get data => _data;
  set data(List<WorkingCapitalData>? data) => _data = data;

  WorkingCapitalModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <WorkingCapitalData>[];
      json['data'].forEach((v) {
        _data!.add(new WorkingCapitalData.fromJson(v));
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

class WorkingCapitalData {
  int? _customerId;
  int? _debtorsCurrentLoan;
  int? _stockCurrentLoan;
  int? _creditorsCurrentLoan;
  int? _netWorkingCapitalCycle;
  int? _debtorsPreviousLoan;
  int? _stockPreviousLoan;
  int? _creditorsPreviousLoan;
  int? _netCapitalCyPreviousLoan;

  WorkingCapitalData(
      {int? customerId,
        int? debtorsCurrentLoan,
        int? stockCurrentLoan,
        int? creditorsCurrentLoan,
        int? netWorkingCapitalCycle,
        int? debtorsPreviousLoan,
        int? stockPreviousLoan,
        int? creditorsPreviousLoan,
        int? netCapitalCyPreviousLoan}) {
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (debtorsCurrentLoan != null) {
      this._debtorsCurrentLoan = debtorsCurrentLoan;
    }
    if (stockCurrentLoan != null) {
      this._stockCurrentLoan = stockCurrentLoan;
    }
    if (creditorsCurrentLoan != null) {
      this._creditorsCurrentLoan = creditorsCurrentLoan;
    }
    if (netWorkingCapitalCycle != null) {
      this._netWorkingCapitalCycle = netWorkingCapitalCycle;
    }
    if (debtorsPreviousLoan != null) {
      this._debtorsPreviousLoan = debtorsPreviousLoan;
    }
    if (stockPreviousLoan != null) {
      this._stockPreviousLoan = stockPreviousLoan;
    }
    if (creditorsPreviousLoan != null) {
      this._creditorsPreviousLoan = creditorsPreviousLoan;
    }
    if (netCapitalCyPreviousLoan != null) {
      this._netCapitalCyPreviousLoan = netCapitalCyPreviousLoan;
    }
  }

  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  int? get debtorsCurrentLoan => _debtorsCurrentLoan;
  set debtorsCurrentLoan(int? debtorsCurrentLoan) =>
      _debtorsCurrentLoan = debtorsCurrentLoan;
  int? get stockCurrentLoan => _stockCurrentLoan;
  set stockCurrentLoan(int? stockCurrentLoan) =>
      _stockCurrentLoan = stockCurrentLoan;
  int? get creditorsCurrentLoan => _creditorsCurrentLoan;
  set creditorsCurrentLoan(int? creditorsCurrentLoan) =>
      _creditorsCurrentLoan = creditorsCurrentLoan;
  int? get netWorkingCapitalCycle => _netWorkingCapitalCycle;
  set netWorkingCapitalCycle(int? netWorkingCapitalCycle) =>
      _netWorkingCapitalCycle = netWorkingCapitalCycle;
  int? get debtorsPreviousLoan => _debtorsPreviousLoan;
  set debtorsPreviousLoan(int? debtorsPreviousLoan) =>
      _debtorsPreviousLoan = debtorsPreviousLoan;
  int? get stockPreviousLoan => _stockPreviousLoan;
  set stockPreviousLoan(int? stockPreviousLoan) =>
      _stockPreviousLoan = stockPreviousLoan;
  int? get creditorsPreviousLoan => _creditorsPreviousLoan;
  set creditorsPreviousLoan(int? creditorsPreviousLoan) =>
      _creditorsPreviousLoan = creditorsPreviousLoan;
  int? get netCapitalCyPreviousLoan => _netCapitalCyPreviousLoan;
  set netCapitalCyPreviousLoan(int? netCapitalCyPreviousLoan) =>
      _netCapitalCyPreviousLoan = netCapitalCyPreviousLoan;

  WorkingCapitalData.fromJson(Map<String, dynamic> json) {
    _customerId = json['customerId'];
    _debtorsCurrentLoan = json['debtorsCurrentLoan'];
    _stockCurrentLoan = json['stockCurrentLoan'];
    _creditorsCurrentLoan = json['creditorsCurrentLoan'];
    _netWorkingCapitalCycle = json['netWorkingCapitalCycle'];
    _debtorsPreviousLoan = json['debtorsPreviousLoan'];
    _stockPreviousLoan = json['stockPreviousLoan'];
    _creditorsPreviousLoan = json['creditorsPreviousLoan'];
    _netCapitalCyPreviousLoan = json['netCapitalCyPreviousLoan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this._customerId;
    data['debtorsCurrentLoan'] = this._debtorsCurrentLoan;
    data['stockCurrentLoan'] = this._stockCurrentLoan;
    data['creditorsCurrentLoan'] = this._creditorsCurrentLoan;
    data['netWorkingCapitalCycle'] = this._netWorkingCapitalCycle;
    data['debtorsPreviousLoan'] = this._debtorsPreviousLoan;
    data['stockPreviousLoan'] = this._stockPreviousLoan;
    data['creditorsPreviousLoan'] = this._creditorsPreviousLoan;
    data['netCapitalCyPreviousLoan'] = this._netCapitalCyPreviousLoan;
    return data;
  }
}

class WorkingCapitalRequirementModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<WorkingCapitalRequirementData>? _data;

  WorkingCapitalRequirementModel(
      {bool? success, String? messageEn, String? messageBn, List<WorkingCapitalRequirementData>? data}) {
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
  List<WorkingCapitalRequirementData>? get data => _data;
  set data(List<WorkingCapitalRequirementData>? data) => _data = data;

  WorkingCapitalRequirementModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <WorkingCapitalRequirementData>[];
      json['data'].forEach((v) {
        _data!.add(new WorkingCapitalRequirementData.fromJson(v));
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

class WorkingCapitalRequirementData {
  int? _customerId;
  int? _salesGrowthCurrentLoan;
  int? _salesGrowthPreviousLoan;
  int? _salesCurrentLoan;
  int? _salesPreviousLoan;
  int? _wccCurrentLoan;
  int? _wccPreviousLoan;
  int? _wcCurrentLoanCalculation;
  int? _wcPreviousLoanCalculation;
  int? _currentLoanWorkingCapital;
  int? _previousLoanWorkingCapital;
  int? _currentAdditionalWCapital;
  int? _previousAdditionalWCapital;

  WorkingCapitalRequirementData(
      {int? customerId,
        int? salesGrowthCurrentLoan,
        int? salesGrowthPreviousLoan,
        int? salesCurrentLoan,
        int? salesPreviousLoan,
        int? wccCurrentLoan,
        int? wccPreviousLoan,
        int? wcCurrentLoanCalculation,
        int? wcPreviousLoanCalculation,
        int? currentLoanWorkingCapital,
        int? previousLoanWorkingCapital,
        int? currentAdditionalWCapital,
        int? previousAdditionalWCapital}) {
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (salesGrowthCurrentLoan != null) {
      this._salesGrowthCurrentLoan = salesGrowthCurrentLoan;
    }
    if (salesGrowthPreviousLoan != null) {
      this._salesGrowthPreviousLoan = salesGrowthPreviousLoan;
    }
    if (salesCurrentLoan != null) {
      this._salesCurrentLoan = salesCurrentLoan;
    }
    if (salesPreviousLoan != null) {
      this._salesPreviousLoan = salesPreviousLoan;
    }
    if (wccCurrentLoan != null) {
      this._wccCurrentLoan = wccCurrentLoan;
    }
    if (wccPreviousLoan != null) {
      this._wccPreviousLoan = wccPreviousLoan;
    }
    if (wcCurrentLoanCalculation != null) {
      this._wcCurrentLoanCalculation = wcCurrentLoanCalculation;
    }
    if (wcPreviousLoanCalculation != null) {
      this._wcPreviousLoanCalculation = wcPreviousLoanCalculation;
    }
    if (currentLoanWorkingCapital != null) {
      this._currentLoanWorkingCapital = currentLoanWorkingCapital;
    }
    if (previousLoanWorkingCapital != null) {
      this._previousLoanWorkingCapital = previousLoanWorkingCapital;
    }
    if (currentAdditionalWCapital != null) {
      this._currentAdditionalWCapital = currentAdditionalWCapital;
    }
    if (previousAdditionalWCapital != null) {
      this._previousAdditionalWCapital = previousAdditionalWCapital;
    }
  }

  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  int? get salesGrowthCurrentLoan => _salesGrowthCurrentLoan;
  set salesGrowthCurrentLoan(int? salesGrowthCurrentLoan) =>
      _salesGrowthCurrentLoan = salesGrowthCurrentLoan;
  int? get salesGrowthPreviousLoan => _salesGrowthPreviousLoan;
  set salesGrowthPreviousLoan(int? salesGrowthPreviousLoan) =>
      _salesGrowthPreviousLoan = salesGrowthPreviousLoan;
  int? get salesCurrentLoan => _salesCurrentLoan;
  set salesCurrentLoan(int? salesCurrentLoan) =>
      _salesCurrentLoan = salesCurrentLoan;
  int? get salesPreviousLoan => _salesPreviousLoan;
  set salesPreviousLoan(int? salesPreviousLoan) =>
      _salesPreviousLoan = salesPreviousLoan;
  int? get wccCurrentLoan => _wccCurrentLoan;
  set wccCurrentLoan(int? wccCurrentLoan) => _wccCurrentLoan = wccCurrentLoan;
  int? get wccPreviousLoan => _wccPreviousLoan;
  set wccPreviousLoan(int? wccPreviousLoan) =>
      _wccPreviousLoan = wccPreviousLoan;
  int? get wcCurrentLoanCalculation => _wcCurrentLoanCalculation;
  set wcCurrentLoanCalculation(int? wcCurrentLoanCalculation) =>
      _wcCurrentLoanCalculation = wcCurrentLoanCalculation;
  int? get wcPreviousLoanCalculation => _wcPreviousLoanCalculation;
  set wcPreviousLoanCalculation(int? wcPreviousLoanCalculation) =>
      _wcPreviousLoanCalculation = wcPreviousLoanCalculation;
  int? get currentLoanWorkingCapital => _currentLoanWorkingCapital;
  set currentLoanWorkingCapital(int? currentLoanWorkingCapital) =>
      _currentLoanWorkingCapital = currentLoanWorkingCapital;
  int? get previousLoanWorkingCapital => _previousLoanWorkingCapital;
  set previousLoanWorkingCapital(int? previousLoanWorkingCapital) =>
      _previousLoanWorkingCapital = previousLoanWorkingCapital;
  int? get currentAdditionalWCapital => _currentAdditionalWCapital;
  set currentAdditionalWCapital(int? currentAdditionalWCapital) =>
      _currentAdditionalWCapital = currentAdditionalWCapital;
  int? get previousAdditionalWCapital => _previousAdditionalWCapital;
  set previousAdditionalWCapital(int? previousAdditionalWCapital) =>
      _previousAdditionalWCapital = previousAdditionalWCapital;

  WorkingCapitalRequirementData.fromJson(Map<String, dynamic> json) {
    _customerId = json['customerId'];
    _salesGrowthCurrentLoan = json['salesGrowthCurrentLoan'];
    _salesGrowthPreviousLoan = json['salesGrowthPreviousLoan'];
    _salesCurrentLoan = json['salesCurrentLoan'];
    _salesPreviousLoan = json['salesPreviousLoan'];
    _wccCurrentLoan = json['wccCurrentLoan'];
    _wccPreviousLoan = json['wccPreviousLoan'];
    _wcCurrentLoanCalculation = json['wcCurrentLoanCalculation'];
    _wcPreviousLoanCalculation = json['wcPreviousLoanCalculation'];
    _currentLoanWorkingCapital = json['currentLoanWorkingCapital'];
    _previousLoanWorkingCapital = json['previousLoanWorkingCapital'];
    _currentAdditionalWCapital = json['currentAdditionalWCapital'];
    _previousAdditionalWCapital = json['previousAdditionalWCapital'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this._customerId;
    data['salesGrowthCurrentLoan'] = this._salesGrowthCurrentLoan;
    data['salesGrowthPreviousLoan'] = this._salesGrowthPreviousLoan;
    data['salesCurrentLoan'] = this._salesCurrentLoan;
    data['salesPreviousLoan'] = this._salesPreviousLoan;
    data['wccCurrentLoan'] = this._wccCurrentLoan;
    data['wccPreviousLoan'] = this._wccPreviousLoan;
    data['wcCurrentLoanCalculation'] = this._wcCurrentLoanCalculation;
    data['wcPreviousLoanCalculation'] = this._wcPreviousLoanCalculation;
    data['currentLoanWorkingCapital'] = this._currentLoanWorkingCapital;
    data['previousLoanWorkingCapital'] = this._previousLoanWorkingCapital;
    data['currentAdditionalWCapital'] = this._currentAdditionalWCapital;
    data['previousAdditionalWCapital'] = this._previousAdditionalWCapital;
    return data;
  }
}

class MarginModel {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<MarginData>? _data;

  MarginModel(
      {bool? success, String? messageEn, String? messageBn, List<MarginData>? data}) {
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
  List<MarginData>? get data => _data;
  set data(List<MarginData>? data) => _data = data;

  MarginModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <MarginData>[];
      json['data'].forEach((v) {
        _data!.add(new MarginData.fromJson(v));
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

class MarginData {
  int? _customerId;
  int? _gpAcutalMargin;
  int? _gpStatedMargin;
  dynamic? _gpProductMargin;
  int? _gpPreviousLoanMargin;
  int? _npAcutalMargin;
  int? _npPreviousLoanMargin;

  MarginData(
      {int? customerId,
        int? gpAcutalMargin,
        int? gpStatedMargin,
        int? gpProductMargin,
        int? gpPreviousLoanMargin,
        int? npAcutalMargin,
        int? npPreviousLoanMargin}) {
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (gpAcutalMargin != null) {
      this._gpAcutalMargin = gpAcutalMargin;
    }
    if (gpStatedMargin != null) {
      this._gpStatedMargin = gpStatedMargin;
    }
    if (gpProductMargin != null) {
      this._gpProductMargin = gpProductMargin;
    }
    if (gpPreviousLoanMargin != null) {
      this._gpPreviousLoanMargin = gpPreviousLoanMargin;
    }
    if (npAcutalMargin != null) {
      this._npAcutalMargin = npAcutalMargin;
    }
    if (npPreviousLoanMargin != null) {
      this._npPreviousLoanMargin = npPreviousLoanMargin;
    }
  }

  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  int? get gpAcutalMargin => _gpAcutalMargin;
  set gpAcutalMargin(int? gpAcutalMargin) => _gpAcutalMargin = gpAcutalMargin;
  int? get gpStatedMargin => _gpStatedMargin;
  set gpStatedMargin(int? gpStatedMargin) => _gpStatedMargin = gpStatedMargin;
  dynamic? get gpProductMargin => _gpProductMargin;
  set gpProductMargin(dynamic? gpProductMargin) =>
      _gpProductMargin = gpProductMargin;
  int? get gpPreviousLoanMargin => _gpPreviousLoanMargin;
  set gpPreviousLoanMargin(int? gpPreviousLoanMargin) =>
      _gpPreviousLoanMargin = gpPreviousLoanMargin;
  int? get npAcutalMargin => _npAcutalMargin;
  set npAcutalMargin(int? npAcutalMargin) => _npAcutalMargin = npAcutalMargin;
  int? get npPreviousLoanMargin => _npPreviousLoanMargin;
  set npPreviousLoanMargin(int? npPreviousLoanMargin) =>
      _npPreviousLoanMargin = npPreviousLoanMargin;

  MarginData.fromJson(Map<String, dynamic> json) {
    _customerId = json['customerId'];
    _gpAcutalMargin = json['gpAcutalMargin'];
    _gpStatedMargin = json['gpStatedMargin'];
    _gpProductMargin = json['gpProductMargin'];
    _gpPreviousLoanMargin = json['gpPreviousLoanMargin'];
    _npAcutalMargin = json['npAcutalMargin'];
    _npPreviousLoanMargin = json['npPreviousLoanMargin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this._customerId;
    data['gpAcutalMargin'] = this._gpAcutalMargin;
    data['gpStatedMargin'] = this._gpStatedMargin;
    data['gpProductMargin'] = this._gpProductMargin;
    data['gpPreviousLoanMargin'] = this._gpPreviousLoanMargin;
    data['npAcutalMargin'] = this._npAcutalMargin;
    data['npPreviousLoanMargin'] = this._npPreviousLoanMargin;
    return data;
  }
}







