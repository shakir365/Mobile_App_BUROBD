import 'dart:math';

class QualitativeAspectsEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<QualitativeAspectsData> _data = [];

  QualitativeAspectsEdit(
      {bool? success, String? messageEn, String? messageBn, List<QualitativeAspectsData>? data}) {
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
  List<QualitativeAspectsData> get data => _data;
  set data(List<QualitativeAspectsData> data) => _data = data;

  QualitativeAspectsEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <QualitativeAspectsData>[];
      json['data'].forEach((v) {
        _data!.add(new QualitativeAspectsData.fromJson(v));
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

class QualitativeAspectsData {
  int? _id;
  int? _customerId;
  String? _promoter;
  String? _businessActivity;
  String? _marketAndDemand;
  String? _recommendation;

  QualitativeAspectsData(
      {int? id,
        int? customerId,
        String? promoter,
        String? businessActivity,
        String? marketAndDemand,
        String? recommendation}) {
    if (id != null) {
      this._id = id;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (promoter != null) {
      this._promoter = promoter;
    }
    if (businessActivity != null) {
      this._businessActivity = businessActivity;
    }
    if (marketAndDemand != null) {
      this._marketAndDemand = marketAndDemand;
    }
    if (recommendation != null) {
      this._recommendation = recommendation;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  String? get promoter => _promoter;
  set promoter(String? promoter) => _promoter = promoter;
  String? get businessActivity => _businessActivity;
  set businessActivity(String? businessActivity) =>
      _businessActivity = businessActivity;
  String? get marketAndDemand => _marketAndDemand;
  set marketAndDemand(String? marketAndDemand) =>
      _marketAndDemand = marketAndDemand;
  String? get recommendation => _recommendation;
  set recommendation(String? recommendation) =>
      _recommendation = recommendation;

  QualitativeAspectsData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _customerId = json['customerId'];
    _promoter = json['promoter'];
    _businessActivity = json['businessActivity'];
    _marketAndDemand = json['marketAndDemand'];
    _recommendation = json['recommendation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['customerId'] = this._customerId;
    data['promoter'] = this._promoter;
    data['businessActivity'] = this._businessActivity;
    data['marketAndDemand'] = this._marketAndDemand;
    data['recommendation'] = this._recommendation;
    return data;
  }
}

class ManufecturingOptionTwoEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ManufecturingOptiontwoData> _data = [];

  ManufecturingOptionTwoEdit(
      {bool? success, String? messageEn, String? messageBn, List<ManufecturingOptiontwoData>? data}) {
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
  List<ManufecturingOptiontwoData> get data => _data;
  set data(List<ManufecturingOptiontwoData> data) => _data = data;

  ManufecturingOptionTwoEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ManufecturingOptiontwoData>[];
      json['data'].forEach((v) {
        _data!.add(new ManufecturingOptiontwoData.fromJson(v));
      });
    } else {
      _data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    } else {
      data['data'] = [];
    }
    return data;
  }
}

class ManufecturingOptiontwoData {
  int? _id;
  int? _customerId;
  int? _materialCost;
  int? _otherCashCost;
  int? _averageSalesPerMonth;
  int? _debtBurden;
  int? _debtBurdenPreviousLoan;

  ManufecturingOptiontwoData(
      {int? id,
        int? customerId,
        int? materialCost,
        int? otherCashCost,
        int? averageSalesPerMonth,
        int? debtBurden,
        int? debtBurdenPreviousLoan}) {
    if (id != null) {
      this._id = id;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (materialCost != null) {
      this._materialCost = materialCost;
    }
    if (otherCashCost != null) {
      this._otherCashCost = otherCashCost;
    }
    if (averageSalesPerMonth != null) {
      this._averageSalesPerMonth = averageSalesPerMonth;
    }
    if (debtBurden != null) {
      this._debtBurden = debtBurden;
    }
    if (debtBurdenPreviousLoan != null) {
      this._debtBurdenPreviousLoan = debtBurdenPreviousLoan;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  int? get materialCost => _materialCost;
  set materialCost(int? materialCost) => _materialCost = materialCost;
  int? get otherCashCost => _otherCashCost;
  set otherCashCost(int? otherCashCost) => _otherCashCost = otherCashCost;
  int? get averageSalesPerMonth => _averageSalesPerMonth;
  set averageSalesPerMonth(int? averageSalesPerMonth) =>
      _averageSalesPerMonth = averageSalesPerMonth;
  int? get debtBurden => _debtBurden;
  set debtBurden(int? debtBurden) => _debtBurden = debtBurden;
  int? get debtBurdenPreviousLoan => _debtBurdenPreviousLoan;
  set debtBurdenPreviousLoan(int? debtBurdenPreviousLoan) =>
      _debtBurdenPreviousLoan = debtBurdenPreviousLoan;

  ManufecturingOptiontwoData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _customerId = json['customerId'];
    _materialCost = json['materialCost'];
    _otherCashCost = json['otherCashCost'];
    _averageSalesPerMonth = json['averageSalesPerMonth'];
    _debtBurden = json['debtBurden'];
    _debtBurdenPreviousLoan = json['debtBurdenPreviousLoan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['customerId'] = this._customerId;
    data['materialCost'] = this._materialCost;
    data['otherCashCost'] = this._otherCashCost;
    data['averageSalesPerMonth'] = this._averageSalesPerMonth;
    data['debtBurden'] = this._debtBurden;
    data['debtBurdenPreviousLoan'] = this._debtBurdenPreviousLoan;
    return data;
  }
}


class ManufecturingOptionOneEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ManufecturingOptionOneData> _data = [];

  ManufecturingOptionOneEdit(
      {bool? success, String? messageEn, String? messageBn, List<ManufecturingOptionOneData>? data}) {
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
  List<ManufecturingOptionOneData> get data => _data;
  set data(List<ManufecturingOptionOneData> data) => _data = data;

  ManufecturingOptionOneEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ManufecturingOptionOneData>[];
      json['data'].forEach((v) {
        _data!.add(new ManufecturingOptionOneData.fromJson(v));
      });
    } else {
      _data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    } else {
      this._data = [];
    }
    return data;
  }
}

class ManufecturingOptionOneData {
  int? _id;
  int? _customerId;
  String? _typeOfProduct;
  int? _numberOfUnits;
  int? _averageSalePricePerUnit;
  int? _productionCostPerUnit;

  ManufecturingOptionOneData(
      {int? id,
        int? customerId,
        String? typeOfProduct,
        int? numberOfUnits,
        int? averageSalePricePerUnit,
        int? productionCostPerUnit}) {
    if (id != null) {
      this._id = id;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (typeOfProduct != null) {
      this._typeOfProduct = typeOfProduct;
    }
    if (numberOfUnits != null) {
      this._numberOfUnits = numberOfUnits;
    }
    if (averageSalePricePerUnit != null) {
      this._averageSalePricePerUnit = averageSalePricePerUnit;
    }
    if (productionCostPerUnit != null) {
      this._productionCostPerUnit = productionCostPerUnit;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  String? get typeOfProduct => _typeOfProduct;
  set typeOfProduct(String? typeOfProduct) => _typeOfProduct = typeOfProduct;
  int? get numberOfUnits => _numberOfUnits;
  set numberOfUnits(int? numberOfUnits) => _numberOfUnits = numberOfUnits;
  int? get averageSalePricePerUnit => _averageSalePricePerUnit;
  set averageSalePricePerUnit(int? averageSalePricePerUnit) =>
      _averageSalePricePerUnit = averageSalePricePerUnit;
  int? get productionCostPerUnit => _productionCostPerUnit;
  set productionCostPerUnit(int? productionCostPerUnit) =>
      _productionCostPerUnit = productionCostPerUnit;

  ManufecturingOptionOneData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _customerId = json['customerId'];
    _typeOfProduct = json['typeOfProduct'];
    _numberOfUnits = json['numberOfUnits'];
    _averageSalePricePerUnit = json['averageSalePricePerUnit'];
    _productionCostPerUnit = json['productionCostPerUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['customerId'] = this._customerId;
    data['typeOfProduct'] = this._typeOfProduct;
    data['numberOfUnits'] = this._numberOfUnits;
    data['averageSalePricePerUnit'] = this._averageSalePricePerUnit;
    data['productionCostPerUnit'] = this._productionCostPerUnit;
    return data;
  }
}


class ProductPurchasePriceEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ProductPurchasePriceData> _data = [];

  ProductPurchasePriceEdit(
      {bool? success, String? messageEn, String? messageBn, List<ProductPurchasePriceData>? data}) {
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
  List<ProductPurchasePriceData> get data => _data;
  set data(List<ProductPurchasePriceData> data) => _data = data;

  ProductPurchasePriceEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ProductPurchasePriceData>[];
      json['data'].forEach((v) {
        _data!.add(new ProductPurchasePriceData.fromJson(v));
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

class ProductPurchasePriceData {
  int? _proId;
  int? _customerId;
  String? _typeOfProduct;
  dynamic? _numberOfUnits;
  dynamic? _averagePricePerUnit;

  ProductPurchasePriceData(
      {int? proId,
        int? customerId,
        String? typeOfProduct,
        int? numberOfUnits,
        int? averagePricePerUnit}) {
    if (proId != null) {
      this._proId = proId;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (typeOfProduct != null) {
      this._typeOfProduct = typeOfProduct;
    }
    if (numberOfUnits != null) {
      this._numberOfUnits = numberOfUnits;
    }
    if (averagePricePerUnit != null) {
      this._averagePricePerUnit = averagePricePerUnit;
    }
  }

  int? get proId => _proId;
  set proId(int? proId) => _proId = proId;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  String? get typeOfProduct => _typeOfProduct;
  set typeOfProduct(String? typeOfProduct) => _typeOfProduct = typeOfProduct;
  dynamic? get numberOfUnits => _numberOfUnits;
  set numberOfUnits(dynamic? numberOfUnits) => _numberOfUnits = numberOfUnits;
  dynamic? get averagePricePerUnit => _averagePricePerUnit;
  set averagePricePerUnit(dynamic? averagePricePerUnit) =>
      _averagePricePerUnit = averagePricePerUnit;

  ProductPurchasePriceData.fromJson(Map<String, dynamic> json) {
    _proId = json['proId'];
    _customerId = json['customerId'];
    _typeOfProduct = json['typeOfProduct'];
    _numberOfUnits = json['numberOfUnits'];
    _averagePricePerUnit = json['averagePricePerUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proId'] = this._proId;
    data['customerId'] = this._customerId;
    data['typeOfProduct'] = this._typeOfProduct;
    data['numberOfUnits'] = this._numberOfUnits;
    data['averagePricePerUnit'] = this._averagePricePerUnit;
    return data;
  }
}

class ProductSalePriceEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ProductSalePriceData> _data = [];

  ProductSalePriceEdit(
      {bool? success, String? messageEn, String? messageBn, List<ProductSalePriceData>? data}) {
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
  List<ProductSalePriceData> get data => _data;
  set data(List<ProductSalePriceData> data) => _data = data;

  ProductSalePriceEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ProductSalePriceData>[];
      json['data'].forEach((v) {
        _data!.add(new ProductSalePriceData.fromJson(v));
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

class ProductSalePriceData {
  int? _proId;
  int? _customerId;
  String? _typeOfProduct;
  int? _numberOfUnits;
  int? _averagePricePerUnit;

  ProductSalePriceData(
      {int? proId,
        int? customerId,
        String? typeOfProduct,
        int? numberOfUnits,
        int? averagePricePerUnit}) {
    if (proId != null) {
      this._proId = proId;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (typeOfProduct != null) {
      this._typeOfProduct = typeOfProduct;
    }
    if (numberOfUnits != null) {
      this._numberOfUnits = numberOfUnits;
    }
    if (averagePricePerUnit != null) {
      this._averagePricePerUnit = averagePricePerUnit;
    }
  }

  int? get proId => _proId;
  set proId(int? proId) => _proId = proId;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  String? get typeOfProduct => _typeOfProduct;
  set typeOfProduct(String? typeOfProduct) => _typeOfProduct = typeOfProduct;
  int? get numberOfUnits => _numberOfUnits;
  set numberOfUnits(int? numberOfUnits) => _numberOfUnits = numberOfUnits;
  int? get averagePricePerUnit => _averagePricePerUnit;
  set averagePricePerUnit(int? averagePricePerUnit) =>
      _averagePricePerUnit = averagePricePerUnit;

  ProductSalePriceData.fromJson(Map<String, dynamic> json) {
    _proId = json['proId'];
    _customerId = json['customerId'];
    _typeOfProduct = json['typeOfProduct'];
    _numberOfUnits = json['numberOfUnits'];
    _averagePricePerUnit = json['averagePricePerUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proId'] = this._proId;
    data['customerId'] = this._customerId;
    data['typeOfProduct'] = this._typeOfProduct;
    data['numberOfUnits'] = this._numberOfUnits;
    data['averagePricePerUnit'] = this._averagePricePerUnit;
    return data;
  }
}


class RegularInvestmentEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<RegularInvestmentData> _data = [];

  RegularInvestmentEdit(
      {bool? success, String? messageEn, String? messageBn, List<RegularInvestmentData>? data}) {
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
  List<RegularInvestmentData> get data => _data;
  set data(List<RegularInvestmentData> data) => _data = data;

  RegularInvestmentEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <RegularInvestmentData>[];
      json['data'].forEach((v) {
        _data!.add(new RegularInvestmentData.fromJson(v));
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

class RegularInvestmentData {
  int? _regularid;
  int? _customerid;
  int? _lifeinsurance;
  int? _lifeinsurancepreviousloan;
  int? _generalinsurance;
  int? _generalinsurancepreviousloan;
  int? _dps;
  int? _dpspreviousloan;
  int? _grossmargininbusiness;
  int? _grossmargininbusinessprevloan;
  int? _monthlycashinhandfrombusiness;
  int? _cashinhandfrombusiprevloan;

  RegularInvestmentData(
      {int? regularid,
        int? customerid,
        int? lifeinsurance,
        int? lifeinsurancepreviousloan,
        int? generalinsurance,
        int? generalinsurancepreviousloan,
        int? dps,
        int? dpspreviousloan,
        int? grossmargininbusiness,
        int? grossmargininbusinessprevloan,
        int? monthlycashinhandfrombusiness,
        int? cashinhandfrombusiprevloan}) {
    if (regularid != null) {
      this._regularid = regularid;
    }
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
    if (grossmargininbusiness != null) {
      this._grossmargininbusiness = grossmargininbusiness;
    }
    if (grossmargininbusinessprevloan != null) {
      this._grossmargininbusinessprevloan = grossmargininbusinessprevloan;
    }
    if (monthlycashinhandfrombusiness != null) {
      this._monthlycashinhandfrombusiness = monthlycashinhandfrombusiness;
    }
    if (cashinhandfrombusiprevloan != null) {
      this._cashinhandfrombusiprevloan = cashinhandfrombusiprevloan;
    }
  }

  int? get regularid => _regularid;
  set regularid(int? regularid) => _regularid = regularid;
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
  int? get grossmargininbusiness => _grossmargininbusiness;
  set grossmargininbusiness(int? grossmargininbusiness) =>
      _grossmargininbusiness = grossmargininbusiness;
  int? get grossmargininbusinessprevloan => _grossmargininbusinessprevloan;
  set grossmargininbusinessprevloan(int? grossmargininbusinessprevloan) =>
      _grossmargininbusinessprevloan = grossmargininbusinessprevloan;
  int? get monthlycashinhandfrombusiness => _monthlycashinhandfrombusiness;
  set monthlycashinhandfrombusiness(int? monthlycashinhandfrombusiness) =>
      _monthlycashinhandfrombusiness = monthlycashinhandfrombusiness;
  int? get cashinhandfrombusiprevloan => _cashinhandfrombusiprevloan;
  set cashinhandfrombusiprevloan(int? cashinhandfrombusiprevloan) =>
      _cashinhandfrombusiprevloan = cashinhandfrombusiprevloan;

  RegularInvestmentData.fromJson(Map<String, dynamic> json) {
    _regularid = json['regularid'];
    _customerid = json['customerid'];
    _lifeinsurance = json['lifeinsurance'];
    _lifeinsurancepreviousloan = json['lifeinsurancepreviousloan'];
    _generalinsurance = json['generalinsurance'];
    _generalinsurancepreviousloan = json['generalinsurancepreviousloan'];
    _dps = json['dps'];
    _dpspreviousloan = json['dpspreviousloan'];
    _grossmargininbusiness = json['grossmargininbusiness'];
    _grossmargininbusinessprevloan = json['grossmargininbusinessprevloan'];
    _monthlycashinhandfrombusiness = json['monthlycashinhandfrombusiness'];
    _cashinhandfrombusiprevloan = json['cashinhandfrombusiprevloan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regularid'] = this._regularid;
    data['customerid'] = this._customerid;
    data['lifeinsurance'] = this._lifeinsurance;
    data['lifeinsurancepreviousloan'] = this._lifeinsurancepreviousloan;
    data['generalinsurance'] = this._generalinsurance;
    data['generalinsurancepreviousloan'] = this._generalinsurancepreviousloan;
    data['dps'] = this._dps;
    data['dpspreviousloan'] = this._dpspreviousloan;
    data['grossmargininbusiness'] = this._grossmargininbusiness;
    data['grossmargininbusinessprevloan'] = this._grossmargininbusinessprevloan;
    data['monthlycashinhandfrombusiness'] = this._monthlycashinhandfrombusiness;
    data['cashinhandfrombusiprevloan'] = this._cashinhandfrombusiprevloan;
    return data;
  }
}


class ExistingLoanEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ExistingLoanEditData> _data = [];

  ExistingLoanEdit(
      {bool? success, String? messageEn, String? messageBn, List<ExistingLoanEditData>? data}) {
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
  List<ExistingLoanEditData> get data => _data;
  set data(List<ExistingLoanEditData> data) => _data = data;

  ExistingLoanEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ExistingLoanEditData>[];
      json['data'].forEach((v) {
        _data!.add(new ExistingLoanEditData.fromJson(v));
      });
    } else {
      _data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['messageEn'] = this._messageEn;
    data['messageBn'] = this._messageBn;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    } else {
      this._data = [];
    }
    return data;
  }
}

class ExistingLoanEditData {
  int? _exloanid;
  int? _customerid;
  String? _nameofinstitution;
  int? _loanamount;
  int? _emi;
  int? _loanoutstanding;
  int? _tenor;
  int? _paidtenor;
  int? _balancetenor;
  String? _loantobeclosed;
  int? _obligate;
  int? _previousloanobligation;

  ExistingLoanEditData(
      {int? exloanid,
        int? customerid,
        String? nameofinstitution,
        int? loanamount,
        int? emi,
        int? loanoutstanding,
        int? tenor,
        int? paidtenor,
        int? balancetenor,
        String? loantobeclosed,
        int? obligate,
        int? previousloanobligation}) {
    if (exloanid != null) {
      this._exloanid = exloanid;
    }
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (nameofinstitution != null) {
      this._nameofinstitution = nameofinstitution;
    }
    if (loanamount != null) {
      this._loanamount = loanamount;
    }
    if (emi != null) {
      this._emi = emi;
    }
    if (loanoutstanding != null) {
      this._loanoutstanding = loanoutstanding;
    }
    if (tenor != null) {
      this._tenor = tenor;
    }
    if (paidtenor != null) {
      this._paidtenor = paidtenor;
    }
    if (balancetenor != null) {
      this._balancetenor = balancetenor;
    }
    if (loantobeclosed != null) {
      this._loantobeclosed = loantobeclosed;
    }
    if (obligate != null) {
      this._obligate = obligate;
    }
    if (previousloanobligation != null) {
      this._previousloanobligation = previousloanobligation;
    }
  }

  int? get exloanid => _exloanid;
  set exloanid(int? exloanid) => _exloanid = exloanid;
  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  String? get nameofinstitution => _nameofinstitution;
  set nameofinstitution(String? nameofinstitution) =>
      _nameofinstitution = nameofinstitution;
  int? get loanamount => _loanamount;
  set loanamount(int? loanamount) => _loanamount = loanamount;
  int? get emi => _emi;
  set emi(int? emi) => _emi = emi;
  int? get loanoutstanding => _loanoutstanding;
  set loanoutstanding(int? loanoutstanding) =>
      _loanoutstanding = loanoutstanding;
  int? get tenor => _tenor;
  set tenor(int? tenor) => _tenor = tenor;
  int? get paidtenor => _paidtenor;
  set paidtenor(int? paidtenor) => _paidtenor = paidtenor;
  int? get balancetenor => _balancetenor;
  set balancetenor(int? balancetenor) => _balancetenor = balancetenor;
  String? get loantobeclosed => _loantobeclosed;
  set loantobeclosed(String? loantobeclosed) =>
      _loantobeclosed = loantobeclosed;
  int? get obligate => _obligate;
  set obligate(int? obligate) => _obligate = obligate;
  int? get previousloanobligation => _previousloanobligation;
  set previousloanobligation(int? previousloanobligation) =>
      _previousloanobligation = previousloanobligation;

  ExistingLoanEditData.fromJson(Map<String, dynamic> json) {
    _exloanid = json['exloanid'];
    _customerid = json['customerid'];
    _nameofinstitution = json['nameofinstitution'];
    _loanamount = json['loanamount'];
    _emi = json['emi'];
    _loanoutstanding = json['loanoutstanding'];
    _tenor = json['tenor'];
    _paidtenor = json['paidtenor'];
    _balancetenor = json['balancetenor'];
    _loantobeclosed = json['loantobeclosed'];
    _obligate = json['obligate'];
    _previousloanobligation = json['previousloanobligation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exloanid'] = this._exloanid;
    data['customerid'] = this._customerid;
    data['nameofinstitution'] = this._nameofinstitution;
    data['loanamount'] = this._loanamount;
    data['emi'] = this._emi;
    data['loanoutstanding'] = this._loanoutstanding;
    data['tenor'] = this._tenor;
    data['paidtenor'] = this._paidtenor;
    data['balancetenor'] = this._balancetenor;
    data['loantobeclosed'] = this._loantobeclosed;
    data['obligate'] = this._obligate;
    data['previousloanobligation'] = this._previousloanobligation;
    return data;
  }
}

class PersonalExpenseMonthlyEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<PersonalExpesneMonthlyEditData> _data = [];

  PersonalExpenseMonthlyEdit(
      {bool? success, String? messageEn, String? messageBn, List<PersonalExpesneMonthlyEditData>? data}) {
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
  List<PersonalExpesneMonthlyEditData> get data => _data;
  set data(List<PersonalExpesneMonthlyEditData> data) => _data = data;

  PersonalExpenseMonthlyEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <PersonalExpesneMonthlyEditData>[];
      json['data'].forEach((v) {
        _data!.add(new PersonalExpesneMonthlyEditData.fromJson(v));
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

class PersonalExpesneMonthlyEditData {
  int? _personalexpid;
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

  PersonalExpesneMonthlyEditData(
      {int? personalexpid,
        int? customerid,
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
    if (personalexpid != null) {
      this._personalexpid = personalexpid;
    }
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

  int? get personalexpid => _personalexpid;
  set personalexpid(int? personalexpid) => _personalexpid = personalexpid;
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

  PersonalExpesneMonthlyEditData.fromJson(Map<String, dynamic> json) {
    _personalexpid = json['personalexpid'];
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
    data['personalexpid'] = this._personalexpid;
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
}

class BusinessExpenseMonthlyEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<BusinessExpenseMonthlyData> _data = [];

  BusinessExpenseMonthlyEdit(
      {bool? success, String? messageEn, String? messageBn, List<BusinessExpenseMonthlyData>? data}) {
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
  List<BusinessExpenseMonthlyData> get data => _data;
  set data(List<BusinessExpenseMonthlyData> data) => _data = data;

  BusinessExpenseMonthlyEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <BusinessExpenseMonthlyData>[];
      json['data'].forEach((v) {
        _data!.add(new BusinessExpenseMonthlyData.fromJson(v));
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

class BusinessExpenseMonthlyData {
  int? _busiexpid;
  int? _customerId;
  int? _rent;
  int? _rentPreviousLoan;
  int? _electricity;
  int? _electricityPreviousLoan;
  int? _staffSalary;
  int? _staffSalaryPreviousLoan;
  int? _telephoneMobileInternet;
  int? _telMobileInterPrevLoan;
  int? _transport;
  int? _transportPreviousLoan;
  int? _gasAndWater;
  int? _gasAndWaterPreviousLoan;
  int? _maintenance;
  int? _maintenancePreviousLoan;
  int? _dieselForGenerator;
  int? _dieselForGeneratorPrevLoan;
  int? _marketing;
  int? _marketingPreviousLoan;
  int? _labourExpense;
  int? _labourExpensePreviousLoan;
  int? _societyBillSecurity;
  int? _societyBillSecurityPrevLoan;
  int? _tax;
  int? _taxPrevLoan;
  int? _entertainment;
  int? _entertainmentPreviousLoan;
  int? _otherBusinessExpense;
  dynamic? _otherBusinessExpensePrevLoan;

  BusinessExpenseMonthlyData(
      {int? busiexpid,
        int? customerId,
        int? rent,
        int? rentPreviousLoan,
        int? electricity,
        int? electricityPreviousLoan,
        int? staffSalary,
        int? staffSalaryPreviousLoan,
        int? telephoneMobileInternet,
        int? telMobileInterPrevLoan,
        int? transport,
        int? transportPreviousLoan,
        int? gasAndWater,
        int? gasAndWaterPreviousLoan,
        int? maintenance,
        int? maintenancePreviousLoan,
        int? dieselForGenerator,
        int? dieselForGeneratorPrevLoan,
        int? marketing,
        int? marketingPreviousLoan,
        int? labourExpense,
        int? labourExpensePreviousLoan,
        int? societyBillSecurity,
        int? societyBillSecurityPrevLoan,
        int? tax,
        int? taxPrevLoan,
        int? entertainment,
        int? entertainmentPreviousLoan,
        int? otherBusinessExpense,
        dynamic? otherBusinessExpensePrevLoan}) {
    if (busiexpid != null) {
      this._busiexpid = busiexpid;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (rent != null) {
      this._rent = rent;
    }
    if (rentPreviousLoan != null) {
      this._rentPreviousLoan = rentPreviousLoan;
    }
    if (electricity != null) {
      this._electricity = electricity;
    }
    if (electricityPreviousLoan != null) {
      this._electricityPreviousLoan = electricityPreviousLoan;
    }
    if (staffSalary != null) {
      this._staffSalary = staffSalary;
    }
    if (staffSalaryPreviousLoan != null) {
      this._staffSalaryPreviousLoan = staffSalaryPreviousLoan;
    }
    if (telephoneMobileInternet != null) {
      this._telephoneMobileInternet = telephoneMobileInternet;
    }
    if (telMobileInterPrevLoan != null) {
      this._telMobileInterPrevLoan = telMobileInterPrevLoan;
    }
    if (transport != null) {
      this._transport = transport;
    }
    if (transportPreviousLoan != null) {
      this._transportPreviousLoan = transportPreviousLoan;
    }
    if (gasAndWater != null) {
      this._gasAndWater = gasAndWater;
    }
    if (gasAndWaterPreviousLoan != null) {
      this._gasAndWaterPreviousLoan = gasAndWaterPreviousLoan;
    }
    if (maintenance != null) {
      this._maintenance = maintenance;
    }
    if (maintenancePreviousLoan != null) {
      this._maintenancePreviousLoan = maintenancePreviousLoan;
    }
    if (dieselForGenerator != null) {
      this._dieselForGenerator = dieselForGenerator;
    }
    if (dieselForGeneratorPrevLoan != null) {
      this._dieselForGeneratorPrevLoan = dieselForGeneratorPrevLoan;
    }
    if (marketing != null) {
      this._marketing = marketing;
    }
    if (marketingPreviousLoan != null) {
      this._marketingPreviousLoan = marketingPreviousLoan;
    }
    if (labourExpense != null) {
      this._labourExpense = labourExpense;
    }
    if (labourExpensePreviousLoan != null) {
      this._labourExpensePreviousLoan = labourExpensePreviousLoan;
    }
    if (societyBillSecurity != null) {
      this._societyBillSecurity = societyBillSecurity;
    }
    if (societyBillSecurityPrevLoan != null) {
      this._societyBillSecurityPrevLoan = societyBillSecurityPrevLoan;
    }
    if (tax != null) {
      this._tax = tax;
    }
    if (taxPrevLoan != null) {
      this._taxPrevLoan = taxPrevLoan;
    }
    if (entertainment != null) {
      this._entertainment = entertainment;
    }
    if (entertainmentPreviousLoan != null) {
      this._entertainmentPreviousLoan = entertainmentPreviousLoan;
    }
    if (otherBusinessExpense != null) {
      this._otherBusinessExpense = otherBusinessExpense;
    }
    if (otherBusinessExpensePrevLoan != null) {
      this._otherBusinessExpensePrevLoan = otherBusinessExpensePrevLoan;
    }
  }

  int? get busiexpid => _busiexpid;
  set busiexpid(int? busiexpid) => _busiexpid = busiexpid;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  int? get rent => _rent;
  set rent(int? rent) => _rent = rent;
  int? get rentPreviousLoan => _rentPreviousLoan;
  set rentPreviousLoan(int? rentPreviousLoan) =>
      _rentPreviousLoan = rentPreviousLoan;
  int? get electricity => _electricity;
  set electricity(int? electricity) => _electricity = electricity;
  int? get electricityPreviousLoan => _electricityPreviousLoan;
  set electricityPreviousLoan(int? electricityPreviousLoan) =>
      _electricityPreviousLoan = electricityPreviousLoan;
  int? get staffSalary => _staffSalary;
  set staffSalary(int? staffSalary) => _staffSalary = staffSalary;
  int? get staffSalaryPreviousLoan => _staffSalaryPreviousLoan;
  set staffSalaryPreviousLoan(int? staffSalaryPreviousLoan) =>
      _staffSalaryPreviousLoan = staffSalaryPreviousLoan;
  int? get telephoneMobileInternet => _telephoneMobileInternet;
  set telephoneMobileInternet(int? telephoneMobileInternet) =>
      _telephoneMobileInternet = telephoneMobileInternet;
  int? get telMobileInterPrevLoan => _telMobileInterPrevLoan;
  set telMobileInterPrevLoan(int? telMobileInterPrevLoan) =>
      _telMobileInterPrevLoan = telMobileInterPrevLoan;
  int? get transport => _transport;
  set transport(int? transport) => _transport = transport;
  int? get transportPreviousLoan => _transportPreviousLoan;
  set transportPreviousLoan(int? transportPreviousLoan) =>
      _transportPreviousLoan = transportPreviousLoan;
  int? get gasAndWater => _gasAndWater;
  set gasAndWater(int? gasAndWater) => _gasAndWater = gasAndWater;
  int? get gasAndWaterPreviousLoan => _gasAndWaterPreviousLoan;
  set gasAndWaterPreviousLoan(int? gasAndWaterPreviousLoan) =>
      _gasAndWaterPreviousLoan = gasAndWaterPreviousLoan;
  int? get maintenance => _maintenance;
  set maintenance(int? maintenance) => _maintenance = maintenance;
  int? get maintenancePreviousLoan => _maintenancePreviousLoan;
  set maintenancePreviousLoan(int? maintenancePreviousLoan) =>
      _maintenancePreviousLoan = maintenancePreviousLoan;
  int? get dieselForGenerator => _dieselForGenerator;
  set dieselForGenerator(int? dieselForGenerator) =>
      _dieselForGenerator = dieselForGenerator;
  int? get dieselForGeneratorPrevLoan => _dieselForGeneratorPrevLoan;
  set dieselForGeneratorPrevLoan(int? dieselForGeneratorPrevLoan) =>
      _dieselForGeneratorPrevLoan = dieselForGeneratorPrevLoan;
  int? get marketing => _marketing;
  set marketing(int? marketing) => _marketing = marketing;
  int? get marketingPreviousLoan => _marketingPreviousLoan;
  set marketingPreviousLoan(int? marketingPreviousLoan) =>
      _marketingPreviousLoan = marketingPreviousLoan;
  int? get labourExpense => _labourExpense;
  set labourExpense(int? labourExpense) => _labourExpense = labourExpense;
  int? get labourExpensePreviousLoan => _labourExpensePreviousLoan;
  set labourExpensePreviousLoan(int? labourExpensePreviousLoan) =>
      _labourExpensePreviousLoan = labourExpensePreviousLoan;
  int? get societyBillSecurity => _societyBillSecurity;
  set societyBillSecurity(int? societyBillSecurity) =>
      _societyBillSecurity = societyBillSecurity;
  int? get societyBillSecurityPrevLoan => _societyBillSecurityPrevLoan;
  set societyBillSecurityPrevLoan(int? societyBillSecurityPrevLoan) =>
      _societyBillSecurityPrevLoan = societyBillSecurityPrevLoan;
  int? get tax => _tax;
  set tax(int? tax) => _tax = tax;
  int? get taxPrevLoan => _taxPrevLoan;
  set taxPrevLoan(int? taxPrevLoan) => _taxPrevLoan = taxPrevLoan;
  int? get entertainment => _entertainment;
  set entertainment(int? entertainment) => _entertainment = entertainment;
  int? get entertainmentPreviousLoan => _entertainmentPreviousLoan;
  set entertainmentPreviousLoan(int? entertainmentPreviousLoan) =>
      _entertainmentPreviousLoan = entertainmentPreviousLoan;
  int? get otherBusinessExpense => _otherBusinessExpense;
  set otherBusinessExpense(int? otherBusinessExpense) =>
      _otherBusinessExpense = otherBusinessExpense;
  dynamic? get otherBusinessExpensePrevLoan => _otherBusinessExpensePrevLoan;
  set otherBusinessExpensePrevLoan(dynamic? otherBusinessExpensePrevLoan) =>
      _otherBusinessExpensePrevLoan = otherBusinessExpensePrevLoan;

  BusinessExpenseMonthlyData.fromJson(Map<String, dynamic> json) {
    _busiexpid = json['busiexpid'];
    _customerId = json['customerId'];
    _rent = json['rent'];
    _rentPreviousLoan = json['rentPreviousLoan'];
    _electricity = json['electricity'];
    _electricityPreviousLoan = json['electricityPreviousLoan'];
    _staffSalary = json['staffSalary'];
    _staffSalaryPreviousLoan = json['staffSalaryPreviousLoan'];
    _telephoneMobileInternet = json['telephoneMobileInternet'];
    _telMobileInterPrevLoan = json['telMobileInterPrevLoan'];
    _transport = json['transport'];
    _transportPreviousLoan = json['transportPreviousLoan'];
    _gasAndWater = json['gasAndWater'];
    _gasAndWaterPreviousLoan = json['gasAndWaterPreviousLoan'];
    _maintenance = json['maintenance'];
    _maintenancePreviousLoan = json['maintenancePreviousLoan'];
    _dieselForGenerator = json['dieselForGenerator'];
    _dieselForGeneratorPrevLoan = json['dieselForGeneratorPrevLoan'];
    _marketing = json['marketing'];
    _marketingPreviousLoan = json['marketingPreviousLoan'];
    _labourExpense = json['labourExpense'];
    _labourExpensePreviousLoan = json['labourExpensePreviousLoan'];
    _societyBillSecurity = json['societyBillSecurity'];
    _societyBillSecurityPrevLoan = json['societyBillSecurityPrevLoan'];
    _tax = json['tax'];
    _taxPrevLoan = json['taxPrevLoan'];
    _entertainment = json['entertainment'];
    _entertainmentPreviousLoan = json['entertainmentPreviousLoan'];
    _otherBusinessExpense = json['otherBusinessExpense'];
    _otherBusinessExpensePrevLoan = json['otherBusinessExpensePrevLoan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['busiexpid'] = this._busiexpid;
    data['customerId'] = this._customerId;
    data['rent'] = this._rent;
    data['rentPreviousLoan'] = this._rentPreviousLoan;
    data['electricity'] = this._electricity;
    data['electricityPreviousLoan'] = this._electricityPreviousLoan;
    data['staffSalary'] = this._staffSalary;
    data['staffSalaryPreviousLoan'] = this._staffSalaryPreviousLoan;
    data['telephoneMobileInternet'] = this._telephoneMobileInternet;
    data['telMobileInterPrevLoan'] = this._telMobileInterPrevLoan;
    data['transport'] = this._transport;
    data['transportPreviousLoan'] = this._transportPreviousLoan;
    data['gasAndWater'] = this._gasAndWater;
    data['gasAndWaterPreviousLoan'] = this._gasAndWaterPreviousLoan;
    data['maintenance'] = this._maintenance;
    data['maintenancePreviousLoan'] = this._maintenancePreviousLoan;
    data['dieselForGenerator'] = this._dieselForGenerator;
    data['dieselForGeneratorPrevLoan'] = this._dieselForGeneratorPrevLoan;
    data['marketing'] = this._marketing;
    data['marketingPreviousLoan'] = this._marketingPreviousLoan;
    data['labourExpense'] = this._labourExpense;
    data['labourExpensePreviousLoan'] = this._labourExpensePreviousLoan;
    data['societyBillSecurity'] = this._societyBillSecurity;
    data['societyBillSecurityPrevLoan'] = this._societyBillSecurityPrevLoan;
    data['tax'] = this._tax;
    data['taxPrevLoan'] = this._taxPrevLoan;
    data['entertainment'] = this._entertainment;
    data['entertainmentPreviousLoan'] = this._entertainmentPreviousLoan;
    data['otherBusinessExpense'] = this._otherBusinessExpense;
    data['otherBusinessExpensePrevLoan'] = this._otherBusinessExpensePrevLoan;
    return data;
  }
}

class OtherExpenseMonthlyEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<OtherExpenseMonthlyEditData> _data = [];

  OtherExpenseMonthlyEdit(
      {bool? success, String? messageEn, String? messageBn, List<OtherExpenseMonthlyEditData>? data}) {
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
  List<OtherExpenseMonthlyEditData> get data => _data;
  set data(List<OtherExpenseMonthlyEditData> data) => _data = data;

  OtherExpenseMonthlyEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <OtherExpenseMonthlyEditData>[];
      json['data'].forEach((v) {
        _data!.add(new OtherExpenseMonthlyEditData.fromJson(v));
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

class OtherExpenseMonthlyEditData {
  int? _incomeId;
  int? _customerId;
  int? _agricultureIncome;
  int? _agricultureIncomePreviousLoan;
  int? _rentalIncome;
  int? _rentalIncomePreviousLoan;
  int? _salaryIncomeFM;
  int? _salaryIncomeFMPreviousLoan;
  int? _alliedAgriIncome;
  int? _alliedAgriIncomePreviousLoan;
  int? _otherIncome;
  int? _otherIncomePreviousLoan;

  OtherExpenseMonthlyEditData(
      {int? incomeId,
        int? customerId,
        int? agricultureIncome,
        int? agricultureIncomePreviousLoan,
        int? rentalIncome,
        int? rentalIncomePreviousLoan,
        int? salaryIncomeFM,
        int? salaryIncomeFMPreviousLoan,
        int? alliedAgriIncome,
        int? alliedAgriIncomePreviousLoan,
        int? otherIncome,
        int? otherIncomePreviousLoan}) {
    if (incomeId != null) {
      this._incomeId = incomeId;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (agricultureIncome != null) {
      this._agricultureIncome = agricultureIncome;
    }
    if (agricultureIncomePreviousLoan != null) {
      this._agricultureIncomePreviousLoan = agricultureIncomePreviousLoan;
    }
    if (rentalIncome != null) {
      this._rentalIncome = rentalIncome;
    }
    if (rentalIncomePreviousLoan != null) {
      this._rentalIncomePreviousLoan = rentalIncomePreviousLoan;
    }
    if (salaryIncomeFM != null) {
      this._salaryIncomeFM = salaryIncomeFM;
    }
    if (salaryIncomeFMPreviousLoan != null) {
      this._salaryIncomeFMPreviousLoan = salaryIncomeFMPreviousLoan;
    }
    if (alliedAgriIncome != null) {
      this._alliedAgriIncome = alliedAgriIncome;
    }
    if (alliedAgriIncomePreviousLoan != null) {
      this._alliedAgriIncomePreviousLoan = alliedAgriIncomePreviousLoan;
    }
    if (otherIncome != null) {
      this._otherIncome = otherIncome;
    }
    if (otherIncomePreviousLoan != null) {
      this._otherIncomePreviousLoan = otherIncomePreviousLoan;
    }
  }

  int? get incomeId => _incomeId;
  set incomeId(int? incomeId) => _incomeId = incomeId;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  int? get agricultureIncome => _agricultureIncome;
  set agricultureIncome(int? agricultureIncome) =>
      _agricultureIncome = agricultureIncome;
  int? get agricultureIncomePreviousLoan => _agricultureIncomePreviousLoan;
  set agricultureIncomePreviousLoan(int? agricultureIncomePreviousLoan) =>
      _agricultureIncomePreviousLoan = agricultureIncomePreviousLoan;
  int? get rentalIncome => _rentalIncome;
  set rentalIncome(int? rentalIncome) => _rentalIncome = rentalIncome;
  int? get rentalIncomePreviousLoan => _rentalIncomePreviousLoan;
  set rentalIncomePreviousLoan(int? rentalIncomePreviousLoan) =>
      _rentalIncomePreviousLoan = rentalIncomePreviousLoan;
  int? get salaryIncomeFM => _salaryIncomeFM;
  set salaryIncomeFM(int? salaryIncomeFM) => _salaryIncomeFM = salaryIncomeFM;
  int? get salaryIncomeFMPreviousLoan => _salaryIncomeFMPreviousLoan;
  set salaryIncomeFMPreviousLoan(int? salaryIncomeFMPreviousLoan) =>
      _salaryIncomeFMPreviousLoan = salaryIncomeFMPreviousLoan;
  int? get alliedAgriIncome => _alliedAgriIncome;
  set alliedAgriIncome(int? alliedAgriIncome) =>
      _alliedAgriIncome = alliedAgriIncome;
  int? get alliedAgriIncomePreviousLoan => _alliedAgriIncomePreviousLoan;
  set alliedAgriIncomePreviousLoan(int? alliedAgriIncomePreviousLoan) =>
      _alliedAgriIncomePreviousLoan = alliedAgriIncomePreviousLoan;
  int? get otherIncome => _otherIncome;
  set otherIncome(int? otherIncome) => _otherIncome = otherIncome;
  int? get otherIncomePreviousLoan => _otherIncomePreviousLoan;
  set otherIncomePreviousLoan(int? otherIncomePreviousLoan) =>
      _otherIncomePreviousLoan = otherIncomePreviousLoan;

  OtherExpenseMonthlyEditData.fromJson(Map<String, dynamic> json) {
    _incomeId = json['incomeId'];
    _customerId = json['customerId'];
    _agricultureIncome = json['agricultureIncome'];
    _agricultureIncomePreviousLoan = json['agricultureIncomePreviousLoan'];
    _rentalIncome = json['rentalIncome'];
    _rentalIncomePreviousLoan = json['rentalIncomePreviousLoan'];
    _salaryIncomeFM = json['salaryIncomeFM'];
    _salaryIncomeFMPreviousLoan = json['salaryIncomeFMPreviousLoan'];
    _alliedAgriIncome = json['alliedAgriIncome'];
    _alliedAgriIncomePreviousLoan = json['alliedAgriIncomePreviousLoan'];
    _otherIncome = json['otherIncome'];
    _otherIncomePreviousLoan = json['otherIncomePreviousLoan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['incomeId'] = this._incomeId;
    data['customerId'] = this._customerId;
    data['agricultureIncome'] = this._agricultureIncome;
    data['agricultureIncomePreviousLoan'] = this._agricultureIncomePreviousLoan;
    data['rentalIncome'] = this._rentalIncome;
    data['rentalIncomePreviousLoan'] = this._rentalIncomePreviousLoan;
    data['salaryIncomeFM'] = this._salaryIncomeFM;
    data['salaryIncomeFMPreviousLoan'] = this._salaryIncomeFMPreviousLoan;
    data['alliedAgriIncome'] = this._alliedAgriIncome;
    data['alliedAgriIncomePreviousLoan'] = this._alliedAgriIncomePreviousLoan;
    data['otherIncome'] = this._otherIncome;
    data['otherIncomePreviousLoan'] = this._otherIncomePreviousLoan;
    return data;
  }
}


class StockEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<StockEditData> _data = [];

  StockEdit(
      {bool? success, String? messageEn, String? messageBn, List<StockEditData>? data}) {
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
  List<StockEditData> get data => _data;
  set data(List<StockEditData> data) => _data = data;

  StockEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <StockEditData>[];
      json['data'].forEach((v) {
        _data!.add(new StockEditData.fromJson(v));
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

class StockEditData {
  int? _stockId;
  int? _customerId;
  int? _finishedGoods;
  int? _rawMaterial;
  int? _finishedGoodsPreviousLoan;
  int? _rawMaterialPreviousLoan;

  StockEditData(
      {int? stockId,
        int? customerId,
        int? finishedGoods,
        int? rawMaterial,
        int? finishedGoodsPreviousLoan,
        int? rawMaterialPreviousLoan}) {
    if (stockId != null) {
      this._stockId = stockId;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (finishedGoods != null) {
      this._finishedGoods = finishedGoods;
    }
    if (rawMaterial != null) {
      this._rawMaterial = rawMaterial;
    }
    if (finishedGoodsPreviousLoan != null) {
      this._finishedGoodsPreviousLoan = finishedGoodsPreviousLoan;
    }
    if (rawMaterialPreviousLoan != null) {
      this._rawMaterialPreviousLoan = rawMaterialPreviousLoan;
    }
  }

  int? get stockId => _stockId;
  set stockId(int? stockId) => _stockId = stockId;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  int? get finishedGoods => _finishedGoods;
  set finishedGoods(int? finishedGoods) => _finishedGoods = finishedGoods;
  int? get rawMaterial => _rawMaterial;
  set rawMaterial(int? rawMaterial) => _rawMaterial = rawMaterial;
  int? get finishedGoodsPreviousLoan => _finishedGoodsPreviousLoan;
  set finishedGoodsPreviousLoan(int? finishedGoodsPreviousLoan) =>
      _finishedGoodsPreviousLoan = finishedGoodsPreviousLoan;
  int? get rawMaterialPreviousLoan => _rawMaterialPreviousLoan;
  set rawMaterialPreviousLoan(int? rawMaterialPreviousLoan) =>
      _rawMaterialPreviousLoan = rawMaterialPreviousLoan;

  StockEditData.fromJson(Map<String, dynamic> json) {
    _stockId = json['stockId'];
    _customerId = json['customerId'];
    _finishedGoods = json['finishedGoods'];
    _rawMaterial = json['rawMaterial'];
    _finishedGoodsPreviousLoan = json['finishedGoodsPreviousLoan'];
    _rawMaterialPreviousLoan = json['rawMaterialPreviousLoan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stockId'] = this._stockId;
    data['customerId'] = this._customerId;
    data['finishedGoods'] = this._finishedGoods;
    data['rawMaterial'] = this._rawMaterial;
    data['finishedGoodsPreviousLoan'] = this._finishedGoodsPreviousLoan;
    data['rawMaterialPreviousLoan'] = this._rawMaterialPreviousLoan;
    return data;
  }
}


class PurchaseEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<PurchaseEditData> _data = [];

  PurchaseEdit(
      {bool? success, String? messageEn, String? messageBn, List<PurchaseEditData>? data}) {
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
  List<PurchaseEditData> get data => _data;
  set data(List<PurchaseEditData> data) => _data = data;

  PurchaseEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <PurchaseEditData>[];
      json['data'].forEach((v) {
        _data!.add(new PurchaseEditData.fromJson(v));
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

class PurchaseEditData {
  int? _purchaseId;
  int? _customerId;
  int? _daily;
  int? _weekly;
  int? _monthly;
  int? _monthlyPreviousLoan;
  int? _creditors;
  int? _creditorsPreviousLoan;

  PurchaseEditData(
      {int? purchaseId,
        int? customerId,
        int? daily,
        int? weekly,
        int? monthly,
        int? monthlyPreviousLoan,
        int? creditors,
        int? creditorsPreviousLoan}) {
    if (purchaseId != null) {
      this._purchaseId = purchaseId;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (daily != null) {
      this._daily = daily;
    }
    if (weekly != null) {
      this._weekly = weekly;
    }
    if (monthly != null) {
      this._monthly = monthly;
    }
    if (monthlyPreviousLoan != null) {
      this._monthlyPreviousLoan = monthlyPreviousLoan;
    }
    if (creditors != null) {
      this._creditors = creditors;
    }
    if (creditorsPreviousLoan != null) {
      this._creditorsPreviousLoan = creditorsPreviousLoan;
    }
  }

  int? get purchaseId => _purchaseId;
  set purchaseId(int? purchaseId) => _purchaseId = purchaseId;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  int? get daily => _daily;
  set daily(int? daily) => _daily = daily;
  int? get weekly => _weekly;
  set weekly(int? weekly) => _weekly = weekly;
  int? get monthly => _monthly;
  set monthly(int? monthly) => _monthly = monthly;
  int? get monthlyPreviousLoan => _monthlyPreviousLoan;
  set monthlyPreviousLoan(int? monthlyPreviousLoan) =>
      _monthlyPreviousLoan = monthlyPreviousLoan;
  int? get creditors => _creditors;
  set creditors(int? creditors) => _creditors = creditors;
  int? get creditorsPreviousLoan => _creditorsPreviousLoan;
  set creditorsPreviousLoan(int? creditorsPreviousLoan) =>
      _creditorsPreviousLoan = creditorsPreviousLoan;

  PurchaseEditData.fromJson(Map<String, dynamic> json) {
    _purchaseId = json['purchaseId'];
    _customerId = json['customerId'];
    _daily = json['daily'];
    _weekly = json['weekly'];
    _monthly = json['monthly'];
    _monthlyPreviousLoan = json['monthlyPreviousLoan'];
    _creditors = json['creditors'];
    _creditorsPreviousLoan = json['creditorsPreviousLoan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['purchaseId'] = this._purchaseId;
    data['customerId'] = this._customerId;
    data['daily'] = this._daily;
    data['weekly'] = this._weekly;
    data['monthly'] = this._monthly;
    data['monthlyPreviousLoan'] = this._monthlyPreviousLoan;
    data['creditors'] = this._creditors;
    data['creditorsPreviousLoan'] = this._creditorsPreviousLoan;
    return data;
  }
}


class SalesEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<SalesEditData> _data = [];

  SalesEdit(
      {bool? success, String? messageEn, String? messageBn, List<SalesEditData>? data}) {
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
  List<SalesEditData> get data => _data;
  set data(List<SalesEditData> data) => _data = data;

  SalesEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <SalesEditData>[];
      json['data'].forEach((v) {
        _data!.add(new SalesEditData.fromJson(v));
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

class SalesEditData {
  int? _salesid;
  int? _customerid;
  dynamic? _closingdayinweek;
  int? _workingdaysinmonth;
  int? _salesdaily;
  int? _salesweekly;
  int? _salesmonthly;
  int? _monthpreviousloan;
  int? _month;
  int? _weeks;
  int? _low;
  int? _high;
  int? _normal;
  int? _lowmonth;
  int? _highmonth;
  int? _normalmonth;
  int? _debtors;
  int? _debtorspreviousloan;
  int? _monthlysalesgrowthpostfunding;

  SalesEditData(
      {int? salesid,
        int? customerid,
        int? closingdayinweek,
        int? workingdaysinmonth,
        int? salesdaily,
        int? salesweekly,
        int? salesmonthly,
        int? monthpreviousloan,
        int? month,
        int? weeks,
        int? low,
        int? high,
        int? normal,
        int? lowmonth,
        int? highmonth,
        int? normalmonth,
        int? debtors,
        int? debtorspreviousloan,
        int? monthlysalesgrowthpostfunding}) {
    if (salesid != null) {
      this._salesid = salesid;
    }
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (closingdayinweek != null) {
      this._closingdayinweek = closingdayinweek;
    }
    if (workingdaysinmonth != null) {
      this._workingdaysinmonth = workingdaysinmonth;
    }
    if (salesdaily != null) {
      this._salesdaily = salesdaily;
    }
    if (salesweekly != null) {
      this._salesweekly = salesweekly;
    }
    if (salesmonthly != null) {
      this._salesmonthly = salesmonthly;
    }
    if (monthpreviousloan != null) {
      this._monthpreviousloan = monthpreviousloan;
    }
    if (month != null) {
      this._month = month;
    }
    if (weeks != null) {
      this._weeks = weeks;
    }
    if (low != null) {
      this._low = low;
    }
    if (high != null) {
      this._high = high;
    }
    if (normal != null) {
      this._normal = normal;
    }
    if (lowmonth != null) {
      this._lowmonth = lowmonth;
    }
    if (highmonth != null) {
      this._highmonth = highmonth;
    }
    if (normalmonth != null) {
      this._normalmonth = normalmonth;
    }
    if (debtors != null) {
      this._debtors = debtors;
    }
    if (debtorspreviousloan != null) {
      this._debtorspreviousloan = debtorspreviousloan;
    }
    if (monthlysalesgrowthpostfunding != null) {
      this._monthlysalesgrowthpostfunding = monthlysalesgrowthpostfunding;
    }
  }

  int? get salesid => _salesid;
  set salesid(int? salesid) => _salesid = salesid;
  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  dynamic? get closingdayinweek => _closingdayinweek;
  set closingdayinweek(dynamic? closingdayinweek) =>
      _closingdayinweek = closingdayinweek;
  int? get workingdaysinmonth => _workingdaysinmonth;
  set workingdaysinmonth(int? workingdaysinmonth) =>
      _workingdaysinmonth = workingdaysinmonth;
  int? get salesdaily => _salesdaily;
  set salesdaily(int? salesdaily) => _salesdaily = salesdaily;
  int? get salesweekly => _salesweekly;
  set salesweekly(int? salesweekly) => _salesweekly = salesweekly;
  int? get salesmonthly => _salesmonthly;
  set salesmonthly(int? salesmonthly) => _salesmonthly = salesmonthly;
  int? get monthpreviousloan => _monthpreviousloan;
  set monthpreviousloan(int? monthpreviousloan) =>
      _monthpreviousloan = monthpreviousloan;
  int? get month => _month;
  set month(int? month) => _month = month;
  int? get weeks => _weeks;
  set weeks(int? weeks) => _weeks = weeks;
  int? get low => _low;
  set low(int? low) => _low = low;
  int? get high => _high;
  set high(int? high) => _high = high;
  int? get normal => _normal;
  set normal(int? normal) => _normal = normal;
  int? get lowmonth => _lowmonth;
  set lowmonth(int? lowmonth) => _lowmonth = lowmonth;
  int? get highmonth => _highmonth;
  set highmonth(int? highmonth) => _highmonth = highmonth;
  int? get normalmonth => _normalmonth;
  set normalmonth(int? normalmonth) => _normalmonth = normalmonth;
  int? get debtors => _debtors;
  set debtors(int? debtors) => _debtors = debtors;
  int? get debtorspreviousloan => _debtorspreviousloan;
  set debtorspreviousloan(int? debtorspreviousloan) =>
      _debtorspreviousloan = debtorspreviousloan;
  int? get monthlysalesgrowthpostfunding => _monthlysalesgrowthpostfunding;
  set monthlysalesgrowthpostfunding(int? monthlysalesgrowthpostfunding) =>
      _monthlysalesgrowthpostfunding = monthlysalesgrowthpostfunding;

  SalesEditData.fromJson(Map<String, dynamic> json) {
    _salesid = json['salesid'];
    _customerid = json['customerid'];
    _closingdayinweek = json['closingdayinweek'];
    _workingdaysinmonth = json['workingdaysinmonth'];
    _salesdaily = json['salesdaily'];
    _salesweekly = json['salesweekly'];
    _salesmonthly = json['salesmonthly'];
    _monthpreviousloan = json['monthpreviousloan'];
    _month = json['month'];
    _weeks = json['weeks'];
    _low = json['low'];
    _high = json['high'];
    _normal = json['normal'];
    _lowmonth = json['lowmonth'];
    _highmonth = json['highmonth'];
    _normalmonth = json['normalmonth'];
    _debtors = json['debtors'];
    _debtorspreviousloan = json['debtorspreviousloan'];
    _monthlysalesgrowthpostfunding = json['monthlysalesgrowthpostfunding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['salesid'] = this._salesid;
    data['customerid'] = this._customerid;
    data['closingdayinweek'] = this._closingdayinweek;
    data['workingdaysinmonth'] = this._workingdaysinmonth;
    data['salesdaily'] = this._salesdaily;
    data['salesweekly'] = this._salesweekly;
    data['salesmonthly'] = this._salesmonthly;
    data['monthpreviousloan'] = this._monthpreviousloan;
    data['month'] = this._month;
    data['weeks'] = this._weeks;
    data['low'] = this._low;
    data['high'] = this._high;
    data['normal'] = this._normal;
    data['lowmonth'] = this._lowmonth;
    data['highmonth'] = this._highmonth;
    data['normalmonth'] = this._normalmonth;
    data['debtors'] = this._debtors;
    data['debtorspreviousloan'] = this._debtorspreviousloan;
    data['monthlysalesgrowthpostfunding'] = this._monthlysalesgrowthpostfunding;
    return data;
  }
}



class BankBalanceEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<BankBalanceEditData> _data = [];

  BankBalanceEdit(
      {bool? success, String? messageEn, String? messageBn, List<BankBalanceEditData>? data}) {
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
  List<BankBalanceEditData> get data => _data;
  set data(List<BankBalanceEditData> data) => _data = data;

  BankBalanceEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <BankBalanceEditData>[];
      json['data'].forEach((v) {
        _data!.add(new BankBalanceEditData.fromJson(v));
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

class BankBalanceEditData {
  int? _balanceid;
  int? _customerid;
  int? _firstmontH5TH;
  int? _firstmontH15TH;
  int? _firstmontH25TH;
  int? _firstmontHPREVIOUSLOAN;
  int? _twomontH5TH;
  int? _twomontH15TH;
  int? _twomontH25TH;
  int? _twomontHPREVIOUSLOAN;
  int? _threemontH5TH;
  int? _threemontH15TH;
  int? _threemontH25TH;
  int? _threemontHPREVIOUSLOAN;
  int? _fourtmontH5TH;
  int? _fourtmontH15TH;
  int? _fourtmontH25TH;
  int? _fourtmontHPREVIOUSLOAN;
  int? _fivemontH5TH;
  int? _fivemontH15TH;
  int? _fivemontH25TH;
  int? _fivemontHPREVIOUSLOAN;
  int? _sixmontH5TH;
  int? _sixmontH15TH;
  int? _sixmontH25TH;
  int? _sixmontHPREVIOUSLOAN;
  int? _averagebankbalancepreviousloan;



  BankBalanceEditData(
      {int? balanceid,
        int? customerid,
        int? firstmontH5TH,
        int? firstmontH15TH,
        int? firstmontH25TH,
        int? firstmontHPREVIOUSLOAN,
        int? twomontH5TH,
        int? twomontH15TH,
        int? twomontH25TH,
        int? twomontHPREVIOUSLOAN,
        int? threemontH5TH,
        int? threemontH15TH,
        int? threemontH25TH,
        int? threemontHPREVIOUSLOAN,
        int? fourtmontH5TH,
        int? fourtmontH15TH,
        int? fourtmontH25TH,
        int? fourtmontHPREVIOUSLOAN,
        int? fivemontH5TH,
        int? fivemontH15TH,
        int? fivemontH25TH,
        int? fivemontHPREVIOUSLOAN,
        int? sixmontH5TH,
        int? sixmontH15TH,
        int? sixmontH25TH,
        int? sixmontHPREVIOUSLOAN,
        int? averagebankbalancepreviousloan

      }) {
    if (balanceid != null) {
      this._balanceid = balanceid;
    }
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (firstmontH5TH != null) {
      this._firstmontH5TH = firstmontH5TH;
    }
    if (firstmontH15TH != null) {
      this._firstmontH15TH = firstmontH15TH;
    }
    if (firstmontH25TH != null) {
      this._firstmontH25TH = firstmontH25TH;
    }
    if (firstmontHPREVIOUSLOAN != null) {
      this._firstmontHPREVIOUSLOAN = firstmontHPREVIOUSLOAN;
    }
    if (twomontH5TH != null) {
      this._twomontH5TH = twomontH5TH;
    }
    if (twomontH15TH != null) {
      this._twomontH15TH = twomontH15TH;
    }
    if (twomontH25TH != null) {
      this._twomontH25TH = twomontH25TH;
    }
    if (twomontHPREVIOUSLOAN != null) {
      this._twomontHPREVIOUSLOAN = twomontHPREVIOUSLOAN;
    }
    if (threemontH5TH != null) {
      this._threemontH5TH = threemontH5TH;
    }
    if (threemontH15TH != null) {
      this._threemontH15TH = threemontH15TH;
    }
    if (threemontH25TH != null) {
      this._threemontH25TH = threemontH25TH;
    }
    if (threemontHPREVIOUSLOAN != null) {
      this._threemontHPREVIOUSLOAN = threemontHPREVIOUSLOAN;
    }
    if (fourtmontH5TH != null) {
      this._fourtmontH5TH = fourtmontH5TH;
    }
    if (fourtmontH15TH != null) {
      this._fourtmontH15TH = fourtmontH15TH;
    }
    if (fourtmontH25TH != null) {
      this._fourtmontH25TH = fourtmontH25TH;
    }
    if (fourtmontHPREVIOUSLOAN != null) {
      this._fourtmontHPREVIOUSLOAN = fourtmontHPREVIOUSLOAN;
    }
    if (fivemontH5TH != null) {
      this._fivemontH5TH = fivemontH5TH;
    }
    if (fivemontH15TH != null) {
      this._fivemontH15TH = fivemontH15TH;
    }
    if (fivemontH25TH != null) {
      this._fivemontH25TH = fivemontH25TH;
    }
    if (fivemontHPREVIOUSLOAN != null) {
      this._fivemontHPREVIOUSLOAN = fivemontHPREVIOUSLOAN;
    }
    if (sixmontH5TH != null) {
      this._sixmontH5TH = sixmontH5TH;
    }
    if (sixmontH15TH != null) {
      this._sixmontH15TH = sixmontH15TH;
    }
    if (sixmontH25TH != null) {
      this._sixmontH25TH = sixmontH25TH;
    }
    if (sixmontHPREVIOUSLOAN != null) {
      this._sixmontHPREVIOUSLOAN = sixmontHPREVIOUSLOAN;
    }
    if (sixmontHPREVIOUSLOAN != null) {
      this._averagebankbalancepreviousloan = averagebankbalancepreviousloan;
    }

    if (averagebankbalancepreviousloan != null) {
      this._averagebankbalancepreviousloan = averagebankbalancepreviousloan;
    }
  }

  int? get balanceid => _balanceid;
  set balanceid(int? balanceid) => _balanceid = balanceid;
  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get firstmontH5TH => _firstmontH5TH;
  set firstmontH5TH(int? firstmontH5TH) => _firstmontH5TH = firstmontH5TH;
  int? get firstmontH15TH => _firstmontH15TH;
  set firstmontH15TH(int? firstmontH15TH) => _firstmontH15TH = firstmontH15TH;
  int? get firstmontH25TH => _firstmontH25TH;
  set firstmontH25TH(int? firstmontH25TH) => _firstmontH25TH = firstmontH25TH;
  int? get firstmontHPREVIOUSLOAN => _firstmontHPREVIOUSLOAN;
  set firstmontHPREVIOUSLOAN(int? firstmontHPREVIOUSLOAN) =>
      _firstmontHPREVIOUSLOAN = firstmontHPREVIOUSLOAN;
  int? get twomontH5TH => _twomontH5TH;
  set twomontH5TH(int? twomontH5TH) => _twomontH5TH = twomontH5TH;
  int? get twomontH15TH => _twomontH15TH;
  set twomontH15TH(int? twomontH15TH) => _twomontH15TH = twomontH15TH;
  int? get twomontH25TH => _twomontH25TH;
  set twomontH25TH(int? twomontH25TH) => _twomontH25TH = twomontH25TH;
  int? get twomontHPREVIOUSLOAN => _twomontHPREVIOUSLOAN;
  set twomontHPREVIOUSLOAN(int? twomontHPREVIOUSLOAN) =>
      _twomontHPREVIOUSLOAN = twomontHPREVIOUSLOAN;
  int? get threemontH5TH => _threemontH5TH;
  set threemontH5TH(int? threemontH5TH) => _threemontH5TH = threemontH5TH;
  int? get threemontH15TH => _threemontH15TH;
  set threemontH15TH(int? threemontH15TH) => _threemontH15TH = threemontH15TH;
  int? get threemontH25TH => _threemontH25TH;
  set threemontH25TH(int? threemontH25TH) => _threemontH25TH = threemontH25TH;
  int? get threemontHPREVIOUSLOAN => _threemontHPREVIOUSLOAN;
  set threemontHPREVIOUSLOAN(int? threemontHPREVIOUSLOAN) =>
      _threemontHPREVIOUSLOAN = threemontHPREVIOUSLOAN;
  int? get fourtmontH5TH => _fourtmontH5TH;
  set fourtmontH5TH(int? fourtmontH5TH) => _fourtmontH5TH = fourtmontH5TH;
  int? get fourtmontH15TH => _fourtmontH15TH;
  set fourtmontH15TH(int? fourtmontH15TH) => _fourtmontH15TH = fourtmontH15TH;
  int? get fourtmontH25TH => _fourtmontH25TH;
  set fourtmontH25TH(int? fourtmontH25TH) => _fourtmontH25TH = fourtmontH25TH;
  int? get fourtmontHPREVIOUSLOAN => _fourtmontHPREVIOUSLOAN;
  set fourtmontHPREVIOUSLOAN(int? fourtmontHPREVIOUSLOAN) =>
      _fourtmontHPREVIOUSLOAN = fourtmontHPREVIOUSLOAN;
  int? get fivemontH5TH => _fivemontH5TH;
  set fivemontH5TH(int? fivemontH5TH) => _fivemontH5TH = fivemontH5TH;
  int? get fivemontH15TH => _fivemontH15TH;
  set fivemontH15TH(int? fivemontH15TH) => _fivemontH15TH = fivemontH15TH;
  int? get fivemontH25TH => _fivemontH25TH;
  set fivemontH25TH(int? fivemontH25TH) => _fivemontH25TH = fivemontH25TH;
  int? get fivemontHPREVIOUSLOAN => _fivemontHPREVIOUSLOAN;
  set fivemontHPREVIOUSLOAN(int? fivemontHPREVIOUSLOAN) =>
      _fivemontHPREVIOUSLOAN = fivemontHPREVIOUSLOAN;
  int? get sixmontH5TH => _sixmontH5TH;
  set sixmontH5TH(int? sixmontH5TH) => _sixmontH5TH = sixmontH5TH;
  int? get sixmontH15TH => _sixmontH15TH;
  set sixmontH15TH(int? sixmontH15TH) => _sixmontH15TH = sixmontH15TH;
  int? get sixmontH25TH => _sixmontH25TH;
  set sixmontH25TH(int? sixmontH25TH) => _sixmontH25TH = sixmontH25TH;
  int? get sixmontHPREVIOUSLOAN => _sixmontHPREVIOUSLOAN;
  set sixmontHPREVIOUSLOAN(int? sixmontHPREVIOUSLOAN) =>
      _sixmontHPREVIOUSLOAN = sixmontHPREVIOUSLOAN;

  int? get averagebankbalancepreviousloan => _averagebankbalancepreviousloan;

  set averagebankbalancepreviousloan(int? value) {
    _averagebankbalancepreviousloan = value;
  }

  BankBalanceEditData.fromJson(Map<String, dynamic> json) {
    _balanceid = json['balanceid'];
    _customerid = json['customerid'];
    _firstmontH5TH = json['firstmontH_5TH'];
    _firstmontH15TH = json['firstmontH_15TH'];
    _firstmontH25TH = json['firstmontH_25TH'];
    _firstmontHPREVIOUSLOAN = json['firstmontH_PREVIOUSLOAN'];
    _twomontH5TH = json['twomontH_5TH'];
    _twomontH15TH = json['twomontH_15TH'];
    _twomontH25TH = json['twomontH_25TH'];
    _twomontHPREVIOUSLOAN = json['twomontH_PREVIOUSLOAN'];
    _threemontH5TH = json['threemontH_5TH'];
    _threemontH15TH = json['threemontH_15TH'];
    _threemontH25TH = json['threemontH_25TH'];
    _threemontHPREVIOUSLOAN = json['threemontH_PREVIOUSLOAN'];
    _fourtmontH5TH = json['fourtmontH_5TH'];
    _fourtmontH15TH = json['fourtmontH_15TH'];
    _fourtmontH25TH = json['fourtmontH_25TH'];
    _fourtmontHPREVIOUSLOAN = json['fourtmontH_PREVIOUSLOAN'];
    _fivemontH5TH = json['fivemontH_5TH'];
    _fivemontH15TH = json['fivemontH_15TH'];
    _fivemontH25TH = json['fivemontH_25TH'];
    _fivemontHPREVIOUSLOAN = json['fivemontH_PREVIOUSLOAN'];
    _sixmontH5TH = json['sixmontH_5TH'];
    _sixmontH15TH = json['sixmontH_15TH'];
    _sixmontH25TH = json['sixmontH_25TH'];
    _sixmontHPREVIOUSLOAN = json['sixmontH_PREVIOUSLOAN'];
    _averagebankbalancepreviousloan = json['averagebankbalancepreviousloan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balanceid'] = this._balanceid;
    data['customerid'] = this._customerid;
    data['firstmontH_5TH'] = this._firstmontH5TH;
    data['firstmontH_15TH'] = this._firstmontH15TH;
    data['firstmontH_25TH'] = this._firstmontH25TH;
    data['firstmontH_PREVIOUSLOAN'] = this._firstmontHPREVIOUSLOAN;
    data['twomontH_5TH'] = this._twomontH5TH;
    data['twomontH_15TH'] = this._twomontH15TH;
    data['twomontH_25TH'] = this._twomontH25TH;
    data['twomontH_PREVIOUSLOAN'] = this._twomontHPREVIOUSLOAN;
    data['threemontH_5TH'] = this._threemontH5TH;
    data['threemontH_15TH'] = this._threemontH15TH;
    data['threemontH_25TH'] = this._threemontH25TH;
    data['threemontH_PREVIOUSLOAN'] = this._threemontHPREVIOUSLOAN;
    data['fourtmontH_5TH'] = this._fourtmontH5TH;
    data['fourtmontH_15TH'] = this._fourtmontH15TH;
    data['fourtmontH_25TH'] = this._fourtmontH25TH;
    data['fourtmontH_PREVIOUSLOAN'] = this._fourtmontHPREVIOUSLOAN;
    data['fivemontH_5TH'] = this._fivemontH5TH;
    data['fivemontH_15TH'] = this._fivemontH15TH;
    data['fivemontH_25TH'] = this._fivemontH25TH;
    data['fivemontH_PREVIOUSLOAN'] = this._fivemontHPREVIOUSLOAN;
    data['sixmontH_5TH'] = this._sixmontH5TH;
    data['sixmontH_15TH'] = this._sixmontH15TH;
    data['sixmontH_25TH'] = this._sixmontH25TH;
    data['sixmontH_PREVIOUSLOAN'] = this._sixmontHPREVIOUSLOAN;
    data['averagebankbalancepreviousloan'] = this._averagebankbalancepreviousloan;
    return data;
  }
}

class PurchaseCashbookEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<PurchaseCashbookData> _data = [];

  PurchaseCashbookEdit(
      {bool? success, String? messageEn, String? messageBn, List<PurchaseCashbookData>? data}) {
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
  List<PurchaseCashbookData> get data => _data;
  set data(List<PurchaseCashbookData> data) => _data = data;

  PurchaseCashbookEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <PurchaseCashbookData>[];
      json['data'].forEach((v) {
        _data!.add(new PurchaseCashbookData.fromJson(v));
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

class PurchaseCashbookData {
  int? _purchasecashid;
  int? _customerid;
  int? _firstmontH5TH;
  int? _firstmontH15TH;
  int? _firstmontH25TH;
  int? _firstmontHPREVIOUSLOAN;
  int? _twomontH5TH;
  int? _twomontH15TH;
  int? _twomontH25TH;
  int? _twomontHPREVIOUSLOAN;
  int? _threemontH5TH;
  int? _threemontH15TH;
  int? _threemontH25TH;
  int? _threemontHPREVIOUSLOAN;

  PurchaseCashbookData(
      {int? purchasecashid,
        int? customerid,
        int? firstmontH5TH,
        int? firstmontH15TH,
        int? firstmontH25TH,
        int? firstmontHPREVIOUSLOAN,
        int? twomontH5TH,
        int? twomontH15TH,
        int? twomontH25TH,
        int? twomontHPREVIOUSLOAN,
        int? threemontH5TH,
        int? threemontH15TH,
        int? threemontH25TH,
        int? threemontHPREVIOUSLOAN}) {
    if (purchasecashid != null) {
      this._purchasecashid = purchasecashid;
    }
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (firstmontH5TH != null) {
      this._firstmontH5TH = firstmontH5TH;
    }
    if (firstmontH15TH != null) {
      this._firstmontH15TH = firstmontH15TH;
    }
    if (firstmontH25TH != null) {
      this._firstmontH25TH = firstmontH25TH;
    }
    if (firstmontHPREVIOUSLOAN != null) {
      this._firstmontHPREVIOUSLOAN = firstmontHPREVIOUSLOAN;
    }
    if (twomontH5TH != null) {
      this._twomontH5TH = twomontH5TH;
    }
    if (twomontH15TH != null) {
      this._twomontH15TH = twomontH15TH;
    }
    if (twomontH25TH != null) {
      this._twomontH25TH = twomontH25TH;
    }
    if (twomontHPREVIOUSLOAN != null) {
      this._twomontHPREVIOUSLOAN = twomontHPREVIOUSLOAN;
    }
    if (threemontH5TH != null) {
      this._threemontH5TH = threemontH5TH;
    }
    if (threemontH15TH != null) {
      this._threemontH15TH = threemontH15TH;
    }
    if (threemontH25TH != null) {
      this._threemontH25TH = threemontH25TH;
    }
    if (threemontHPREVIOUSLOAN != null) {
      this._threemontHPREVIOUSLOAN = threemontHPREVIOUSLOAN;
    }
  }

  int? get purchasecashid => _purchasecashid;
  set purchasecashid(int? purchasecashid) => _purchasecashid = purchasecashid;
  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get firstmontH5TH => _firstmontH5TH;
  set firstmontH5TH(int? firstmontH5TH) => _firstmontH5TH = firstmontH5TH;
  int? get firstmontH15TH => _firstmontH15TH;
  set firstmontH15TH(int? firstmontH15TH) => _firstmontH15TH = firstmontH15TH;
  int? get firstmontH25TH => _firstmontH25TH;
  set firstmontH25TH(int? firstmontH25TH) => _firstmontH25TH = firstmontH25TH;
  int? get firstmontHPREVIOUSLOAN => _firstmontHPREVIOUSLOAN;
  set firstmontHPREVIOUSLOAN(int? firstmontHPREVIOUSLOAN) =>
      _firstmontHPREVIOUSLOAN = firstmontHPREVIOUSLOAN;
  int? get twomontH5TH => _twomontH5TH;
  set twomontH5TH(int? twomontH5TH) => _twomontH5TH = twomontH5TH;
  int? get twomontH15TH => _twomontH15TH;
  set twomontH15TH(int? twomontH15TH) => _twomontH15TH = twomontH15TH;
  int? get twomontH25TH => _twomontH25TH;
  set twomontH25TH(int? twomontH25TH) => _twomontH25TH = twomontH25TH;
  int? get twomontHPREVIOUSLOAN => _twomontHPREVIOUSLOAN;
  set twomontHPREVIOUSLOAN(int? twomontHPREVIOUSLOAN) =>
      _twomontHPREVIOUSLOAN = twomontHPREVIOUSLOAN;
  int? get threemontH5TH => _threemontH5TH;
  set threemontH5TH(int? threemontH5TH) => _threemontH5TH = threemontH5TH;
  int? get threemontH15TH => _threemontH15TH;
  set threemontH15TH(int? threemontH15TH) => _threemontH15TH = threemontH15TH;
  int? get threemontH25TH => _threemontH25TH;
  set threemontH25TH(int? threemontH25TH) => _threemontH25TH = threemontH25TH;
  int? get threemontHPREVIOUSLOAN => _threemontHPREVIOUSLOAN;
  set threemontHPREVIOUSLOAN(int? threemontHPREVIOUSLOAN) =>
      _threemontHPREVIOUSLOAN = threemontHPREVIOUSLOAN;

  PurchaseCashbookData.fromJson(Map<String, dynamic> json) {
    _purchasecashid = json['purchasecashid'];
    _customerid = json['customerid'];
    _firstmontH5TH = json['firstmontH_5TH'];
    _firstmontH15TH = json['firstmontH_15TH'];
    _firstmontH25TH = json['firstmontH_25TH'];
    _firstmontHPREVIOUSLOAN = json['firstmontH_PREVIOUSLOAN'];
    _twomontH5TH = json['twomontH_5TH'];
    _twomontH15TH = json['twomontH_15TH'];
    _twomontH25TH = json['twomontH_25TH'];
    _twomontHPREVIOUSLOAN = json['twomontH_PREVIOUSLOAN'];
    _threemontH5TH = json['threemontH_5TH'];
    _threemontH15TH = json['threemontH_15TH'];
    _threemontH25TH = json['threemontH_25TH'];
    _threemontHPREVIOUSLOAN = json['threemontH_PREVIOUSLOAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['purchasecashid'] = this._purchasecashid;
    data['customerid'] = this._customerid;
    data['firstmontH_5TH'] = this._firstmontH5TH;
    data['firstmontH_15TH'] = this._firstmontH15TH;
    data['firstmontH_25TH'] = this._firstmontH25TH;
    data['firstmontH_PREVIOUSLOAN'] = this._firstmontHPREVIOUSLOAN;
    data['twomontH_5TH'] = this._twomontH5TH;
    data['twomontH_15TH'] = this._twomontH15TH;
    data['twomontH_25TH'] = this._twomontH25TH;
    data['twomontH_PREVIOUSLOAN'] = this._twomontHPREVIOUSLOAN;
    data['threemontH_5TH'] = this._threemontH5TH;
    data['threemontH_15TH'] = this._threemontH15TH;
    data['threemontH_25TH'] = this._threemontH25TH;
    data['threemontH_PREVIOUSLOAN'] = this._threemontHPREVIOUSLOAN;
    return data;
  }
}


class SalesCashbookEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<SalesCashBookEditData> _data = [];

  SalesCashbookEdit(
      {bool? success, String? messageEn, String? messageBn, List<SalesCashBookEditData>? data}) {
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
  List<SalesCashBookEditData> get data => _data;
  set data(List<SalesCashBookEditData> data) => _data = data;

  SalesCashbookEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <SalesCashBookEditData>[];
      json['data'].forEach((v) {
        _data.add(new SalesCashBookEditData.fromJson(v));
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

class SalesCashBookEditData {
  int? _saleid;
  int? _customerid;
  int? _firstmontH5TH;
  int? _firstmontH10TH;
  int? _firstmontH15TH;
  int? _firstmontH20TH;
  int? _firstmontH25TH;
  int? _firstmontH30TH;
  int? _firstmontHPREVIOUSLOAN;
  int? _twomontH5TH;
  int? _twomontH10TH;
  int? _twomontH15TH;
  int? _twomontH20TH;
  int? _twomontH25TH;
  int? _twomontHPREVIOUSLOAN;
  int? _twomontH30TH;
  int? _threemontH5TH;
  int? _threemontH10TH;
  int? _threemontH15TH;
  int? _threemontH20TH;
  int? _threemontH25TH;
  int? _threemontH30TH;
  int? _threemontHPREVIOUSLOAN;

  SalesCashBookEditData(
      {int? saleid,
        int? customerid,
        int? firstmontH5TH,
        int? firstmontH10TH,
        int? firstmontH15TH,
        int? firstmontH20TH,
        int? firstmontH25TH,
        int? firstmontH30TH,
        int? firstmontHPREVIOUSLOAN,
        int? twomontH5TH,
        int? twomontH10TH,
        int? twomontH15TH,
        int? twomontH20TH,
        int? twomontH25TH,
        int? twomontHPREVIOUSLOAN,
        int? twomontH30TH,
        int? threemontH5TH,
        int? threemontH10TH,
        int? threemontH15TH,
        int? threemontH20TH,
        int? threemontH25TH,
        int? threemontH30TH,
        int? threemontHPREVIOUSLOAN}) {
    if (saleid != null) {
      this._saleid = saleid;
    }
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (firstmontH5TH != null) {
      this._firstmontH5TH = firstmontH5TH;
    }
    if (firstmontH10TH != null) {
      this._firstmontH10TH = firstmontH10TH;
    }
    if (firstmontH15TH != null) {
      this._firstmontH15TH = firstmontH15TH;
    }
    if (firstmontH20TH != null) {
      this._firstmontH20TH = firstmontH20TH;
    }
    if (firstmontH25TH != null) {
      this._firstmontH25TH = firstmontH25TH;
    }
    if (firstmontH30TH != null) {
      this._firstmontH30TH = firstmontH30TH;
    }
    if (firstmontHPREVIOUSLOAN != null) {
      this._firstmontHPREVIOUSLOAN = firstmontHPREVIOUSLOAN;
    }
    if (twomontH5TH != null) {
      this._twomontH5TH = twomontH5TH;
    }
    if (twomontH10TH != null) {
      this._twomontH10TH = twomontH10TH;
    }
    if (twomontH15TH != null) {
      this._twomontH15TH = twomontH15TH;
    }
    if (twomontH20TH != null) {
      this._twomontH20TH = twomontH20TH;
    }
    if (twomontH25TH != null) {
      this._twomontH25TH = twomontH25TH;
    }
    if (twomontHPREVIOUSLOAN != null) {
      this._twomontHPREVIOUSLOAN = twomontHPREVIOUSLOAN;
    }
    if (twomontH30TH != null) {
      this._twomontH30TH = twomontH30TH;
    }
    if (threemontH5TH != null) {
      this._threemontH5TH = threemontH5TH;
    }
    if (threemontH10TH != null) {
      this._threemontH10TH = threemontH10TH;
    }
    if (threemontH15TH != null) {
      this._threemontH15TH = threemontH15TH;
    }
    if (threemontH20TH != null) {
      this._threemontH20TH = threemontH20TH;
    }
    if (threemontH25TH != null) {
      this._threemontH25TH = threemontH25TH;
    }
    if (threemontH30TH != null) {
      this._threemontH30TH = threemontH30TH;
    }
    if (threemontHPREVIOUSLOAN != null) {
      this._threemontHPREVIOUSLOAN = threemontHPREVIOUSLOAN;
    }
  }

  int? get saleid => _saleid;
  set saleid(int? saleid) => _saleid = saleid;
  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  int? get firstmontH5TH => _firstmontH5TH;
  set firstmontH5TH(int? firstmontH5TH) => _firstmontH5TH = firstmontH5TH;
  int? get firstmontH10TH => _firstmontH10TH;
  set firstmontH10TH(int? firstmontH10TH) => _firstmontH10TH = firstmontH10TH;
  int? get firstmontH15TH => _firstmontH15TH;
  set firstmontH15TH(int? firstmontH15TH) => _firstmontH15TH = firstmontH15TH;
  int? get firstmontH20TH => _firstmontH20TH;
  set firstmontH20TH(int? firstmontH20TH) => _firstmontH20TH = firstmontH20TH;
  int? get firstmontH25TH => _firstmontH25TH;
  set firstmontH25TH(int? firstmontH25TH) => _firstmontH25TH = firstmontH25TH;
  int? get firstmontH30TH => _firstmontH30TH;
  set firstmontH30TH(int? firstmontH30TH) => _firstmontH30TH = firstmontH30TH;
  int? get firstmontHPREVIOUSLOAN => _firstmontHPREVIOUSLOAN;
  set firstmontHPREVIOUSLOAN(int? firstmontHPREVIOUSLOAN) =>
      _firstmontHPREVIOUSLOAN = firstmontHPREVIOUSLOAN;
  int? get twomontH5TH => _twomontH5TH;
  set twomontH5TH(int? twomontH5TH) => _twomontH5TH = twomontH5TH;
  int? get twomontH10TH => _twomontH10TH;
  set twomontH10TH(int? twomontH10TH) => _twomontH10TH = twomontH10TH;
  int? get twomontH15TH => _twomontH15TH;
  set twomontH15TH(int? twomontH15TH) => _twomontH15TH = twomontH15TH;
  int? get twomontH20TH => _twomontH20TH;
  set twomontH20TH(int? twomontH20TH) => _twomontH20TH = twomontH20TH;
  int? get twomontH25TH => _twomontH25TH;
  set twomontH25TH(int? twomontH25TH) => _twomontH25TH = twomontH25TH;
  int? get twomontHPREVIOUSLOAN => _twomontHPREVIOUSLOAN;
  set twomontHPREVIOUSLOAN(int? twomontHPREVIOUSLOAN) =>
      _twomontHPREVIOUSLOAN = twomontHPREVIOUSLOAN;
  int? get twomontH30TH => _twomontH30TH;
  set twomontH30TH(int? twomontH30TH) => _twomontH30TH = twomontH30TH;
  int? get threemontH5TH => _threemontH5TH;
  set threemontH5TH(int? threemontH5TH) => _threemontH5TH = threemontH5TH;
  int? get threemontH10TH => _threemontH10TH;
  set threemontH10TH(int? threemontH10TH) => _threemontH10TH = threemontH10TH;
  int? get threemontH15TH => _threemontH15TH;
  set threemontH15TH(int? threemontH15TH) => _threemontH15TH = threemontH15TH;
  int? get threemontH20TH => _threemontH20TH;
  set threemontH20TH(int? threemontH20TH) => _threemontH20TH = threemontH20TH;
  int? get threemontH25TH => _threemontH25TH;
  set threemontH25TH(int? threemontH25TH) => _threemontH25TH = threemontH25TH;
  int? get threemontH30TH => _threemontH30TH;
  set threemontH30TH(int? threemontH30TH) => _threemontH30TH = threemontH30TH;
  int? get threemontHPREVIOUSLOAN => _threemontHPREVIOUSLOAN;
  set threemontHPREVIOUSLOAN(int? threemontHPREVIOUSLOAN) =>
      _threemontHPREVIOUSLOAN = threemontHPREVIOUSLOAN;

  SalesCashBookEditData.fromJson(Map<String, dynamic> json) {
    _saleid = json['saleid'];
    _customerid = json['customerid'];
    _firstmontH5TH = json['firstmontH_5TH'];
    _firstmontH10TH = json['firstmontH_10TH'];
    _firstmontH15TH = json['firstmontH_15TH'];
    _firstmontH20TH = json['firstmontH_20TH'];
    _firstmontH25TH = json['firstmontH_25TH'];
    _firstmontH30TH = json['firstmontH_30TH'];
    _firstmontHPREVIOUSLOAN = json['firstmontH_PREVIOUSLOAN'];
    _twomontH5TH = json['twomontH_5TH'];
    _twomontH10TH = json['twomontH_10TH'];
    _twomontH15TH = json['twomontH_15TH'];
    _twomontH20TH = json['twomontH_20TH'];
    _twomontH25TH = json['twomontH_25TH'];
    _twomontHPREVIOUSLOAN = json['twomontH_PREVIOUSLOAN'];
    _twomontH30TH = json['twomontH_30TH'];
    _threemontH5TH = json['threemontH_5TH'];
    _threemontH10TH = json['threemontH_10TH'];
    _threemontH15TH = json['threemontH_15TH'];
    _threemontH20TH = json['threemontH_20TH'];
    _threemontH25TH = json['threemontH_25TH'];
    _threemontH30TH = json['threemontH_30TH'];
    _threemontHPREVIOUSLOAN = json['threemontH_PREVIOUSLOAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['saleid'] = this._saleid;
    data['customerid'] = this._customerid;
    data['firstmontH_5TH'] = this._firstmontH5TH;
    data['firstmontH_10TH'] = this._firstmontH10TH;
    data['firstmontH_15TH'] = this._firstmontH15TH;
    data['firstmontH_20TH'] = this._firstmontH20TH;
    data['firstmontH_25TH'] = this._firstmontH25TH;
    data['firstmontH_30TH'] = this._firstmontH30TH;
    data['firstmontH_PREVIOUSLOAN'] = this._firstmontHPREVIOUSLOAN;
    data['twomontH_5TH'] = this._twomontH5TH;
    data['twomontH_10TH'] = this._twomontH10TH;
    data['twomontH_15TH'] = this._twomontH15TH;
    data['twomontH_20TH'] = this._twomontH20TH;
    data['twomontH_25TH'] = this._twomontH25TH;
    data['twomontH_PREVIOUSLOAN'] = this._twomontHPREVIOUSLOAN;
    data['twomontH_30TH'] = this._twomontH30TH;
    data['threemontH_5TH'] = this._threemontH5TH;
    data['threemontH_10TH'] = this._threemontH10TH;
    data['threemontH_15TH'] = this._threemontH15TH;
    data['threemontH_20TH'] = this._threemontH20TH;
    data['threemontH_25TH'] = this._threemontH25TH;
    data['threemontH_30TH'] = this._threemontH30TH;
    data['threemontH_PREVIOUSLOAN'] = this._threemontHPREVIOUSLOAN;
    return data;
  }
}

class PersonalReferenceEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<PersonalReferenceEditData> _data = [];

  PersonalReferenceEdit(
      {bool? success, String? messageEn, String? messageBn, List<PersonalReferenceEditData>? data}) {
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
  List<PersonalReferenceEditData> get data => _data;
  set data(List<PersonalReferenceEditData> data) => _data = data;

  PersonalReferenceEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <PersonalReferenceEditData>[];
      json['data'].forEach((v) {
        _data!.add(new PersonalReferenceEditData.fromJson(v));
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

class PersonalReferenceEditData {
  int? _customeRID;
  String? _personname;
  String? _mobilenumber;
  String? _referencelocation;
  int? _relationwithcustomer;
  int? _yearsknowingcustomer;
  int? _levelofinteraction;
  int? _feedbackoncustomer;
  int? _personalreferenceid;

  PersonalReferenceEditData(
      {int? customeRID,
        String? personname,
        String? mobilenumber,
        String? referencelocation,
        int? relationwithcustomer,
        int? yearsknowingcustomer,
        int? levelofinteraction,
        int? feedbackoncustomer,
        int? personalreferenceid}) {
    if (customeRID != null) {
      this._customeRID = customeRID;
    }
    if (personname != null) {
      this._personname = personname;
    }
    if (mobilenumber != null) {
      this._mobilenumber = mobilenumber;
    }
    if (referencelocation != null) {
      this._referencelocation = referencelocation;
    }
    if (relationwithcustomer != null) {
      this._relationwithcustomer = relationwithcustomer;
    }
    if (yearsknowingcustomer != null) {
      this._yearsknowingcustomer = yearsknowingcustomer;
    }
    if (levelofinteraction != null) {
      this._levelofinteraction = levelofinteraction;
    }
    if (feedbackoncustomer != null) {
      this._feedbackoncustomer = feedbackoncustomer;
    }
    if (personalreferenceid != null) {
      this._personalreferenceid = personalreferenceid;
    }
  }

  int? get customeRID => _customeRID;
  set customeRID(int? customeRID) => _customeRID = customeRID;
  String? get personname => _personname;
  set personname(String? personname) => _personname = personname;
  String? get mobilenumber => _mobilenumber;
  set mobilenumber(String? mobilenumber) => _mobilenumber = mobilenumber;
  String? get referencelocation => _referencelocation;
  set referencelocation(String? referencelocation) =>
      _referencelocation = referencelocation;
  int? get relationwithcustomer => _relationwithcustomer;
  set relationwithcustomer(int? relationwithcustomer) =>
      _relationwithcustomer = relationwithcustomer;
  int? get yearsknowingcustomer => _yearsknowingcustomer;
  set yearsknowingcustomer(int? yearsknowingcustomer) =>
      _yearsknowingcustomer = yearsknowingcustomer;
  int? get levelofinteraction => _levelofinteraction;
  set levelofinteraction(int? levelofinteraction) =>
      _levelofinteraction = levelofinteraction;
  int? get feedbackoncustomer => _feedbackoncustomer;
  set feedbackoncustomer(int? feedbackoncustomer) =>
      _feedbackoncustomer = feedbackoncustomer;
  int? get personalreferenceid => _personalreferenceid;
  set personalreferenceid(int? personalreferenceid) =>
      _personalreferenceid = personalreferenceid;

  PersonalReferenceEditData.fromJson(Map<String, dynamic> json) {
    _customeRID = json['customeR_ID'];
    _personname = json['personname'];
    _mobilenumber = json['mobilenumber'];
    _referencelocation = json['referencelocation'];
    _relationwithcustomer = json['relationwithcustomer'];
    _yearsknowingcustomer = json['yearsknowingcustomer'];
    _levelofinteraction = json['levelofinteraction'];
    _feedbackoncustomer = json['feedbackoncustomer'];
    _personalreferenceid = json['personalreferenceid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customeR_ID'] = this._customeRID;
    data['personname'] = this._personname;
    data['mobilenumber'] = this._mobilenumber;
    data['referencelocation'] = this._referencelocation;
    data['relationwithcustomer'] = this._relationwithcustomer;
    data['yearsknowingcustomer'] = this._yearsknowingcustomer;
    data['levelofinteraction'] = this._levelofinteraction;
    data['feedbackoncustomer'] = this._feedbackoncustomer;
    data['personalreferenceid'] = this._personalreferenceid;
    return data;
  }
}


class BuyerInformationEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<BuyerInformationEditData> _data = [];

  BuyerInformationEdit(
      {bool? success, String? messageEn, String? messageBn, List<BuyerInformationEditData>? data}) {
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
  List<BuyerInformationEditData> get data => _data;
  set data(List<BuyerInformationEditData> data) => _data = data;

  BuyerInformationEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <BuyerInformationEditData>[];
      json['data'].forEach((v) {
        _data!.add(new BuyerInformationEditData.fromJson(v));
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

class BuyerInformationEditData {
  int? _customerid;
  String? _buyername;
  String? _mobilenumber;
  String? _buyerlocation;
  int? _yearspurchasingfromcustomer;
  int? _purchasefrequency;
  int? _averagemonthlypurchaseamount;
  int? _paymentterms;
  int? _productservicequality;
  int? _buyerfeedbackoncustomer;
  int? _buyerverifyid;

  BuyerInformationEditData(
      {int? customerid,
        String? buyername,
        String? mobilenumber,
        String? buyerlocation,
        int? yearspurchasingfromcustomer,
        int? purchasefrequency,
        int? averagemonthlypurchaseamount,
        int? paymentterms,
        int? productservicequality,
        int? buyerfeedbackoncustomer,
        int? buyerverifyid}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (buyername != null) {
      this._buyername = buyername;
    }
    if (mobilenumber != null) {
      this._mobilenumber = mobilenumber;
    }
    if (buyerlocation != null) {
      this._buyerlocation = buyerlocation;
    }
    if (yearspurchasingfromcustomer != null) {
      this._yearspurchasingfromcustomer = yearspurchasingfromcustomer;
    }
    if (purchasefrequency != null) {
      this._purchasefrequency = purchasefrequency;
    }
    if (averagemonthlypurchaseamount != null) {
      this._averagemonthlypurchaseamount = averagemonthlypurchaseamount;
    }
    if (paymentterms != null) {
      this._paymentterms = paymentterms;
    }
    if (productservicequality != null) {
      this._productservicequality = productservicequality;
    }
    if (buyerfeedbackoncustomer != null) {
      this._buyerfeedbackoncustomer = buyerfeedbackoncustomer;
    }
    if (buyerverifyid != null) {
      this._buyerverifyid = buyerverifyid;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  String? get buyername => _buyername;
  set buyername(String? buyername) => _buyername = buyername;
  String? get mobilenumber => _mobilenumber;
  set mobilenumber(String? mobilenumber) => _mobilenumber = mobilenumber;
  String? get buyerlocation => _buyerlocation;
  set buyerlocation(String? buyerlocation) => _buyerlocation = buyerlocation;
  int? get yearspurchasingfromcustomer => _yearspurchasingfromcustomer;
  set yearspurchasingfromcustomer(int? yearspurchasingfromcustomer) =>
      _yearspurchasingfromcustomer = yearspurchasingfromcustomer;
  int? get purchasefrequency => _purchasefrequency;
  set purchasefrequency(int? purchasefrequency) =>
      _purchasefrequency = purchasefrequency;
  int? get averagemonthlypurchaseamount => _averagemonthlypurchaseamount;
  set averagemonthlypurchaseamount(int? averagemonthlypurchaseamount) =>
      _averagemonthlypurchaseamount = averagemonthlypurchaseamount;
  int? get paymentterms => _paymentterms;
  set paymentterms(int? paymentterms) => _paymentterms = paymentterms;
  int? get productservicequality => _productservicequality;
  set productservicequality(int? productservicequality) =>
      _productservicequality = productservicequality;
  int? get buyerfeedbackoncustomer => _buyerfeedbackoncustomer;
  set buyerfeedbackoncustomer(int? buyerfeedbackoncustomer) =>
      _buyerfeedbackoncustomer = buyerfeedbackoncustomer;
  int? get buyerverifyid => _buyerverifyid;
  set buyerverifyid(int? buyerverifyid) => _buyerverifyid = buyerverifyid;

  BuyerInformationEditData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _buyername = json['buyername'];
    _mobilenumber = json['mobilenumber'];
    _buyerlocation = json['buyerlocation'];
    _yearspurchasingfromcustomer = json['yearspurchasingfromcustomer'];
    _purchasefrequency = json['purchasefrequency'];
    _averagemonthlypurchaseamount = json['averagemonthlypurchaseamount'];
    _paymentterms = json['paymentterms'];
    _productservicequality = json['productservicequality'];
    _buyerfeedbackoncustomer = json['buyerfeedbackoncustomer'];
    _buyerverifyid = json['buyerverifyid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['buyername'] = this._buyername;
    data['mobilenumber'] = this._mobilenumber;
    data['buyerlocation'] = this._buyerlocation;
    data['yearspurchasingfromcustomer'] = this._yearspurchasingfromcustomer;
    data['purchasefrequency'] = this._purchasefrequency;
    data['averagemonthlypurchaseamount'] = this._averagemonthlypurchaseamount;
    data['paymentterms'] = this._paymentterms;
    data['productservicequality'] = this._productservicequality;
    data['buyerfeedbackoncustomer'] = this._buyerfeedbackoncustomer;
    data['buyerverifyid'] = this._buyerverifyid;
    return data;
  }
}

class SupplierInformationEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<SupplierInformationEditData> _data = [];

  SupplierInformationEdit(
      {bool? success, String? messageEn, String? messageBn, List<SupplierInformationEditData>? data}) {
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
  List<SupplierInformationEditData> get data => _data;
  set data(List<SupplierInformationEditData> data) => _data = data;

  SupplierInformationEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <SupplierInformationEditData>[];
      json['data'].forEach((v) {
        _data!.add(new SupplierInformationEditData.fromJson(v));
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

class SupplierInformationEditData {
  int? _customeRID;
  String? _suppliername;
  String? _mobilenumber;
  String? _supplierlocation;
  int? _yearssupplyingtocustomer;
  int? _supplyfrequency;
  String? _productservicesupplied;
  int? _averagemonthlysupplyamount;
  int? _paymentterms;
  int? _paymenttimeliness;
  int? _supplierfeedback;
  int? _supplYVERIFICATIONID;

  SupplierInformationEditData(
      {int? customeRID,
        String? suppliername,
        String? mobilenumber,
        String? supplierlocation,
        int? yearssupplyingtocustomer,
        int? supplyfrequency,
        String? productservicesupplied,
        int? averagemonthlysupplyamount,
        int? paymentterms,
        int? paymenttimeliness,
        int? supplierfeedback,
        int? supplYVERIFICATIONID}) {
    if (customeRID != null) {
      this._customeRID = customeRID;
    }
    if (suppliername != null) {
      this._suppliername = suppliername;
    }
    if (mobilenumber != null) {
      this._mobilenumber = mobilenumber;
    }
    if (supplierlocation != null) {
      this._supplierlocation = supplierlocation;
    }
    if (yearssupplyingtocustomer != null) {
      this._yearssupplyingtocustomer = yearssupplyingtocustomer;
    }
    if (supplyfrequency != null) {
      this._supplyfrequency = supplyfrequency;
    }
    if (productservicesupplied != null) {
      this._productservicesupplied = productservicesupplied;
    }
    if (averagemonthlysupplyamount != null) {
      this._averagemonthlysupplyamount = averagemonthlysupplyamount;
    }
    if (paymentterms != null) {
      this._paymentterms = paymentterms;
    }
    if (paymenttimeliness != null) {
      this._paymenttimeliness = paymenttimeliness;
    }
    if (supplierfeedback != null) {
      this._supplierfeedback = supplierfeedback;
    }
    if (supplYVERIFICATIONID != null) {
      this._supplYVERIFICATIONID = supplYVERIFICATIONID;
    }
  }

  int? get customeRID => _customeRID;
  set customeRID(int? customeRID) => _customeRID = customeRID;
  String? get suppliername => _suppliername;
  set suppliername(String? suppliername) => _suppliername = suppliername;
  String? get mobilenumber => _mobilenumber;
  set mobilenumber(String? mobilenumber) => _mobilenumber = mobilenumber;
  String? get supplierlocation => _supplierlocation;
  set supplierlocation(String? supplierlocation) =>
      _supplierlocation = supplierlocation;
  int? get yearssupplyingtocustomer => _yearssupplyingtocustomer;
  set yearssupplyingtocustomer(int? yearssupplyingtocustomer) =>
      _yearssupplyingtocustomer = yearssupplyingtocustomer;
  int? get supplyfrequency => _supplyfrequency;
  set supplyfrequency(int? supplyfrequency) =>
      _supplyfrequency = supplyfrequency;
  String? get productservicesupplied => _productservicesupplied;
  set productservicesupplied(String? productservicesupplied) =>
      _productservicesupplied = productservicesupplied;
  int? get averagemonthlysupplyamount => _averagemonthlysupplyamount;
  set averagemonthlysupplyamount(int? averagemonthlysupplyamount) =>
      _averagemonthlysupplyamount = averagemonthlysupplyamount;
  int? get paymentterms => _paymentterms;
  set paymentterms(int? paymentterms) => _paymentterms = paymentterms;
  int? get paymenttimeliness => _paymenttimeliness;
  set paymenttimeliness(int? paymenttimeliness) =>
      _paymenttimeliness = paymenttimeliness;
  int? get supplierfeedback => _supplierfeedback;
  set supplierfeedback(int? supplierfeedback) =>
      _supplierfeedback = supplierfeedback;
  int? get supplYVERIFICATIONID => _supplYVERIFICATIONID;
  set supplYVERIFICATIONID(int ? supplYVERIFICATIONID) =>
      _supplYVERIFICATIONID = supplYVERIFICATIONID;

  SupplierInformationEditData.fromJson(Map<String, dynamic> json) {
    _customeRID = json['customeR_ID'];
    _suppliername = json['suppliername'];
    _mobilenumber = json['mobilenumber'];
    _supplierlocation = json['supplierlocation'];
    _yearssupplyingtocustomer = json['yearssupplyingtocustomer'];
    _supplyfrequency = json['supplyfrequency'];
    _productservicesupplied = json['productservicesupplied'];
    _averagemonthlysupplyamount = json['averagemonthlysupplyamount'];
    _paymentterms = json['paymentterms'];
    _paymenttimeliness = json['paymenttimeliness'];
    _supplierfeedback = json['supplierfeedback'];
    _supplYVERIFICATIONID = json['supplY_VERIFICATION_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customeR_ID'] = this._customeRID;
    data['suppliername'] = this._suppliername;
    data['mobilenumber'] = this._mobilenumber;
    data['supplierlocation'] = this._supplierlocation;
    data['yearssupplyingtocustomer'] = this._yearssupplyingtocustomer;
    data['supplyfrequency'] = this._supplyfrequency;
    data['productservicesupplied'] = this._productservicesupplied;
    data['averagemonthlysupplyamount'] = this._averagemonthlysupplyamount;
    data['paymentterms'] = this._paymentterms;
    data['paymenttimeliness'] = this._paymenttimeliness;
    data['supplierfeedback'] = this._supplierfeedback;
    data['supplY_VERIFICATION_ID'] = this._supplYVERIFICATIONID;
    return data;
  }
}

class ProposedLoanEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<ProposedLoanEditData> _data = [];

  ProposedLoanEdit(
      {bool? success, String? messageEn, String? messageBn, List<ProposedLoanEditData>? data}) {
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
  List<ProposedLoanEditData> get data => _data;
  set data(List<ProposedLoanEditData> data) => _data = data;

  ProposedLoanEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <ProposedLoanEditData>[];
      json['data'].forEach((v) {
        _data!.add(new ProposedLoanEditData.fromJson(v));
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

class ProposedLoanEditData {
  int? _customerId;
  int? _loanAppliedAmount;
  int? _tenureAppliedMonths;
  int? _roiProposedPercentage;
  int? _endUse;
  int? _facilityApplied;
  int? _repaymentFrequency;
  int? _customerAffordableEMI;
  int? _loanEligibilityPolicy;
  int? _loanAmountApproved;
  int? _previousLoanAmount;
  int? _previousLoanTenureApplied;
  int? _previousLoanROIProposed;
  int? _previousLoanCapital;
  int? _previousLoanFacilityApplied;
  int? _previousLoanRepaymentFrequency;
  int? _previousLoanAffordableEMI;
  int? _previousLoanEligibility;
  int? _previousLoanApprovedAmount;
  int? _proposeLoanID;

  ProposedLoanEditData(
      {int? customerId,
        int? loanAppliedAmount,
        int? tenureAppliedMonths,
        int? roiProposedPercentage,
        int? endUse,
        int? facilityApplied,
        int? repaymentFrequency,
        int? customerAffordableEMI,
        int? loanEligibilityPolicy,
        int? loanAmountApproved,
        int? previousLoanAmount,
        int? previousLoanTenureApplied,
        int? previousLoanROIProposed,
        int? previousLoanCapital,
        int? previousLoanFacilityApplied,
        int? previousLoanRepaymentFrequency,
        int? previousLoanAffordableEMI,
        int? previousLoanEligibility,
        int? previousLoanApprovedAmount,
        int? proposeLoanID}) {
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (loanAppliedAmount != null) {
      this._loanAppliedAmount = loanAppliedAmount;
    }
    if (tenureAppliedMonths != null) {
      this._tenureAppliedMonths = tenureAppliedMonths;
    }
    if (roiProposedPercentage != null) {
      this._roiProposedPercentage = roiProposedPercentage;
    }
    if (endUse != null) {
      this._endUse = endUse;
    }
    if (facilityApplied != null) {
      this._facilityApplied = facilityApplied;
    }
    if (repaymentFrequency != null) {
      this._repaymentFrequency = repaymentFrequency;
    }
    if (customerAffordableEMI != null) {
      this._customerAffordableEMI = customerAffordableEMI;
    }
    if (loanEligibilityPolicy != null) {
      this._loanEligibilityPolicy = loanEligibilityPolicy;
    }
    if (loanAmountApproved != null) {
      this._loanAmountApproved = loanAmountApproved;
    }
    if (previousLoanAmount != null) {
      this._previousLoanAmount = previousLoanAmount;
    }
    if (previousLoanTenureApplied != null) {
      this._previousLoanTenureApplied = previousLoanTenureApplied;
    }
    if (previousLoanROIProposed != null) {
      this._previousLoanROIProposed = previousLoanROIProposed;
    }
    if (previousLoanCapital != null) {
      this._previousLoanCapital = previousLoanCapital;
    }
    if (previousLoanFacilityApplied != null) {
      this._previousLoanFacilityApplied = previousLoanFacilityApplied;
    }
    if (previousLoanRepaymentFrequency != null) {
      this._previousLoanRepaymentFrequency = previousLoanRepaymentFrequency;
    }
    if (previousLoanAffordableEMI != null) {
      this._previousLoanAffordableEMI = previousLoanAffordableEMI;
    }
    if (previousLoanEligibility != null) {
      this._previousLoanEligibility = previousLoanEligibility;
    }
    if (previousLoanApprovedAmount != null) {
      this._previousLoanApprovedAmount = previousLoanApprovedAmount;
    }
    if (proposeLoanID != null) {
      this._proposeLoanID = proposeLoanID;
    }
  }

  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  int? get loanAppliedAmount => _loanAppliedAmount;
  set loanAppliedAmount(int? loanAppliedAmount) =>
      _loanAppliedAmount = loanAppliedAmount;
  int? get tenureAppliedMonths => _tenureAppliedMonths;
  set tenureAppliedMonths(int? tenureAppliedMonths) =>
      _tenureAppliedMonths = tenureAppliedMonths;
  int? get roiProposedPercentage => _roiProposedPercentage;
  set roiProposedPercentage(int? roiProposedPercentage) =>
      _roiProposedPercentage = roiProposedPercentage;
  int? get endUse => _endUse;
  set endUse(int? endUse) => _endUse = endUse;
  int? get facilityApplied => _facilityApplied;
  set facilityApplied(int? facilityApplied) =>
      _facilityApplied = facilityApplied;
  int? get repaymentFrequency => _repaymentFrequency;
  set repaymentFrequency(int? repaymentFrequency) =>
      _repaymentFrequency = repaymentFrequency;
  int? get customerAffordableEMI => _customerAffordableEMI;
  set customerAffordableEMI(int? customerAffordableEMI) =>
      _customerAffordableEMI = customerAffordableEMI;
  int? get loanEligibilityPolicy => _loanEligibilityPolicy;
  set loanEligibilityPolicy(int? loanEligibilityPolicy) =>
      _loanEligibilityPolicy = loanEligibilityPolicy;
  int? get loanAmountApproved => _loanAmountApproved;
  set loanAmountApproved(int? loanAmountApproved) =>
      _loanAmountApproved = loanAmountApproved;
  int? get previousLoanAmount => _previousLoanAmount;
  set previousLoanAmount(int? previousLoanAmount) =>
      _previousLoanAmount = previousLoanAmount;
  int? get previousLoanTenureApplied => _previousLoanTenureApplied;
  set previousLoanTenureApplied(int? previousLoanTenureApplied) =>
      _previousLoanTenureApplied = previousLoanTenureApplied;
  int? get previousLoanROIProposed => _previousLoanROIProposed;
  set previousLoanROIProposed(int? previousLoanROIProposed) =>
      _previousLoanROIProposed = previousLoanROIProposed;
  int? get previousLoanCapital => _previousLoanCapital;
  set previousLoanCapital(int? previousLoanCapital) =>
      _previousLoanCapital = previousLoanCapital;
  int? get previousLoanFacilityApplied => _previousLoanFacilityApplied;
  set previousLoanFacilityApplied(int? previousLoanFacilityApplied) =>
      _previousLoanFacilityApplied = previousLoanFacilityApplied;
  int? get previousLoanRepaymentFrequency => _previousLoanRepaymentFrequency;
  set previousLoanRepaymentFrequency(int? previousLoanRepaymentFrequency) =>
      _previousLoanRepaymentFrequency = previousLoanRepaymentFrequency;
  int? get previousLoanAffordableEMI => _previousLoanAffordableEMI;
  set previousLoanAffordableEMI(int? previousLoanAffordableEMI) =>
      _previousLoanAffordableEMI = previousLoanAffordableEMI;
  int? get previousLoanEligibility => _previousLoanEligibility;
  set previousLoanEligibility(int? previousLoanEligibility) =>
      _previousLoanEligibility = previousLoanEligibility;
  int? get previousLoanApprovedAmount => _previousLoanApprovedAmount;
  set previousLoanApprovedAmount(int? previousLoanApprovedAmount) =>
      _previousLoanApprovedAmount = previousLoanApprovedAmount;
  int? get proposeLoanID => _proposeLoanID;
  set proposeLoanID(int? proposeLoanID) => _proposeLoanID = proposeLoanID;

  ProposedLoanEditData.fromJson(Map<String, dynamic> json) {
    _customerId = json['customerId'];
    _loanAppliedAmount = json['loanAppliedAmount'];
    _tenureAppliedMonths = json['tenureAppliedMonths'];
    _roiProposedPercentage = json['roiProposedPercentage'];
    _endUse = json['endUse'];
    _facilityApplied = json['facilityApplied'];
    _repaymentFrequency = json['repaymentFrequency'];
    _customerAffordableEMI = json['customerAffordableEMI'];
    _loanEligibilityPolicy = json['loanEligibilityPolicy'];
    _loanAmountApproved = json['loanAmountApproved'];
    _previousLoanAmount = json['previousLoanAmount'];
    _previousLoanTenureApplied = json['previousLoanTenureApplied'];
    _previousLoanROIProposed = json['previousLoanROIProposed'];
    _previousLoanCapital = json['previousLoanCapital'];
    _previousLoanFacilityApplied = json['previousLoanFacilityApplied'];
    _previousLoanRepaymentFrequency = json['previousLoanRepaymentFrequency'];
    _previousLoanAffordableEMI = json['previousLoanAffordableEMI'];
    _previousLoanEligibility = json['previousLoanEligibility'];
    _previousLoanApprovedAmount = json['previousLoanApprovedAmount'];
    _proposeLoanID = json['proposeLoanID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this._customerId;
    data['loanAppliedAmount'] = this._loanAppliedAmount;
    data['tenureAppliedMonths'] = this._tenureAppliedMonths;
    data['roiProposedPercentage'] = this._roiProposedPercentage;
    data['endUse'] = this._endUse;
    data['facilityApplied'] = this._facilityApplied;
    data['repaymentFrequency'] = this._repaymentFrequency;
    data['customerAffordableEMI'] = this._customerAffordableEMI;
    data['loanEligibilityPolicy'] = this._loanEligibilityPolicy;
    data['loanAmountApproved'] = this._loanAmountApproved;
    data['previousLoanAmount'] = this._previousLoanAmount;
    data['previousLoanTenureApplied'] = this._previousLoanTenureApplied;
    data['previousLoanROIProposed'] = this._previousLoanROIProposed;
    data['previousLoanCapital'] = this._previousLoanCapital;
    data['previousLoanFacilityApplied'] = this._previousLoanFacilityApplied;
    data['previousLoanRepaymentFrequency'] =
        this._previousLoanRepaymentFrequency;
    data['previousLoanAffordableEMI'] = this._previousLoanAffordableEMI;
    data['previousLoanEligibility'] = this._previousLoanEligibility;
    data['previousLoanApprovedAmount'] = this._previousLoanApprovedAmount;
    data['proposeLoanID'] = this._proposeLoanID;
    return data;
  }
}

class EnterpriseListEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<EnterpriseDetailsEditData> _data = [];

  EnterpriseListEdit(
      {bool? success, String? messageEn, String? messageBn, List<EnterpriseDetailsEditData>? data}) {
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
  List<EnterpriseDetailsEditData> get data => _data;
  set data(List<EnterpriseDetailsEditData> data) => _data = data;

  EnterpriseListEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <EnterpriseDetailsEditData>[];
      json['data'].forEach((v) {
        _data!.add(new EnterpriseDetailsEditData.fromJson(v));
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

class EnterpriseDetailsEditData {
  int? _customerid;
  String? _enterprisename;
  int? _constitutionofenterprise;
  String? _workplacepincode;
  int? _businesssegment;
  String? _businesssubsegment;
  int? _currenttradelicenseavailable;
  int? _tinavailable;
  int? _workplaceownership;
  int? _workplacevintage;
  int? _grossmargin;
  int? _numberofpaidregularemployees;
  int? _previousloangrossmargin;
  int? _previousloannoofemployees;
  int? _enterpriseid;

  EnterpriseDetailsEditData(
      {int? customerid,
        String? enterprisename,
        int? constitutionofenterprise,
        String? workplacepincode,
        int? businesssegment,
        String? businesssubsegment,
        int? currenttradelicenseavailable,
        int? tinavailable,
        int? workplaceownership,
        int? workplacevintage,
        int? grossmargin,
        int? numberofpaidregularemployees,
        int? previousloangrossmargin,
        int? previousloannoofemployees,
        int? enterpriseid}) {
    if (customerid != null) {
      this._customerid = customerid;
    }
    if (enterprisename != null) {
      this._enterprisename = enterprisename;
    }
    if (constitutionofenterprise != null) {
      this._constitutionofenterprise = constitutionofenterprise;
    }
    if (workplacepincode != null) {
      this._workplacepincode = workplacepincode;
    }
    if (businesssegment != null) {
      this._businesssegment = businesssegment;
    }
    if (businesssubsegment != null) {
      this._businesssubsegment = businesssubsegment;
    }
    if (currenttradelicenseavailable != null) {
      this._currenttradelicenseavailable = currenttradelicenseavailable;
    }
    if (tinavailable != null) {
      this._tinavailable = tinavailable;
    }
    if (workplaceownership != null) {
      this._workplaceownership = workplaceownership;
    }
    if (workplacevintage != null) {
      this._workplacevintage = workplacevintage;
    }
    if (grossmargin != null) {
      this._grossmargin = grossmargin;
    }
    if (numberofpaidregularemployees != null) {
      this._numberofpaidregularemployees = numberofpaidregularemployees;
    }
    if (previousloangrossmargin != null) {
      this._previousloangrossmargin = previousloangrossmargin;
    }
    if (previousloannoofemployees != null) {
      this._previousloannoofemployees = previousloannoofemployees;
    }
    if (enterpriseid != null) {
      this._enterpriseid = enterpriseid;
    }
  }

  int? get customerid => _customerid;
  set customerid(int? customerid) => _customerid = customerid;
  String? get enterprisename => _enterprisename;
  set enterprisename(String? enterprisename) =>
      _enterprisename = enterprisename;
  int? get constitutionofenterprise => _constitutionofenterprise;
  set constitutionofenterprise(int? constitutionofenterprise) =>
      _constitutionofenterprise = constitutionofenterprise;
  String? get workplacepincode => _workplacepincode;
  set workplacepincode(String? workplacepincode) =>
      _workplacepincode = workplacepincode;
  int? get businesssegment => _businesssegment;
  set businesssegment(int? businesssegment) =>
      _businesssegment = businesssegment;
  String? get businesssubsegment => _businesssubsegment;
  set businesssubsegment(String? businesssubsegment) =>
      _businesssubsegment = businesssubsegment;
  int? get currenttradelicenseavailable => _currenttradelicenseavailable;
  set currenttradelicenseavailable(int? currenttradelicenseavailable) =>
      _currenttradelicenseavailable = currenttradelicenseavailable;
  int? get tinavailable => _tinavailable;
  set tinavailable(int? tinavailable) => _tinavailable = tinavailable;
  int? get workplaceownership => _workplaceownership;
  set workplaceownership(int? workplaceownership) =>
      _workplaceownership = workplaceownership;
  int? get workplacevintage => _workplacevintage;
  set workplacevintage(int? workplacevintage) =>
      _workplacevintage = workplacevintage;
  int? get grossmargin => _grossmargin;
  set grossmargin(int? grossmargin) => _grossmargin = grossmargin;
  int? get numberofpaidregularemployees => _numberofpaidregularemployees;
  set numberofpaidregularemployees(int? numberofpaidregularemployees) =>
      _numberofpaidregularemployees = numberofpaidregularemployees;
  int? get previousloangrossmargin => _previousloangrossmargin;
  set previousloangrossmargin(int? previousloangrossmargin) =>
      _previousloangrossmargin = previousloangrossmargin;
  int? get previousloannoofemployees => _previousloannoofemployees;
  set previousloannoofemployees(int? previousloannoofemployees) =>
      _previousloannoofemployees = previousloannoofemployees;
  int? get enterpriseid => _enterpriseid;
  set enterpriseid(int? enterpriseid) => _enterpriseid = enterpriseid;

  EnterpriseDetailsEditData.fromJson(Map<String, dynamic> json) {
    _customerid = json['customerid'];
    _enterprisename = json['enterprisename'];
    _constitutionofenterprise = json['constitutionofenterprise'];
    _workplacepincode = json['workplacepincode'];
    _businesssegment = json['businesssegment'];
    _businesssubsegment = json['businesssubsegment'];
    _currenttradelicenseavailable = json['currenttradelicenseavailable'];
    _tinavailable = json['tinavailable'];
    _workplaceownership = json['workplaceownership'];
    _workplacevintage = json['workplacevintage'];
    _grossmargin = json['grossmargin'];
    _numberofpaidregularemployees = json['numberofpaidregularemployees'];
    _previousloangrossmargin = json['previousloangrossmargin'];
    _previousloannoofemployees = json['previousloannoofemployees'];
    _enterpriseid = json['enterpriseid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerid'] = this._customerid;
    data['enterprisename'] = this._enterprisename;
    data['constitutionofenterprise'] = this._constitutionofenterprise;
    data['workplacepincode'] = this._workplacepincode;
    data['businesssegment'] = this._businesssegment;
    data['businesssubsegment'] = this._businesssubsegment;
    data['currenttradelicenseavailable'] = this._currenttradelicenseavailable;
    data['tinavailable'] = this._tinavailable;
    data['workplaceownership'] = this._workplaceownership;
    data['workplacevintage'] = this._workplacevintage;
    data['grossmargin'] = this._grossmargin;
    data['numberofpaidregularemployees'] = this._numberofpaidregularemployees;
    data['previousloangrossmargin'] = this._previousloangrossmargin;
    data['previousloannoofemployees'] = this._previousloannoofemployees;
    data['enterpriseid'] = this._enterpriseid;
    return data;
  }
}

class OtherIncomeMonthlyEdit {
  bool? _success;
  String? _messageEn;
  String? _messageBn;
  List<OtherIncomeMonthlyEditData> _data = [];

  OtherIncomeMonthlyEdit(
      {bool? success, String? messageEn, String? messageBn, List<OtherIncomeMonthlyEditData>? data}) {
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
  List<OtherIncomeMonthlyEditData> get data => _data;
  set data(List<OtherIncomeMonthlyEditData> data) => _data = data;

  OtherIncomeMonthlyEdit.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _messageEn = json['messageEn'];
    _messageBn = json['messageBn'];
    if (json['data'] != null) {
      _data = <OtherIncomeMonthlyEditData>[];
      json['data'].forEach((v) {
        _data!.add(new OtherIncomeMonthlyEditData.fromJson(v));
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

class OtherIncomeMonthlyEditData {
  int? _incomeId;
  int? _customerId;
  int? _agricultureIncome;
  int? _agricultureIncomePreviousLoan;
  int? _rentalIncome;
  int? _rentalIncomePreviousLoan;
  int? _salaryIncomeFM;
  int? _salaryIncomeFMPreviousLoan;
  int? _alliedAgriIncome;
  int? _alliedAgriIncomePreviousLoan;
  int? _otherIncome;
  int? _otherIncomePreviousLoan;

  OtherIncomeMonthlyEditData(
      {int? incomeId,
        int? customerId,
        int? agricultureIncome,
        int? agricultureIncomePreviousLoan,
        int? rentalIncome,
        int? rentalIncomePreviousLoan,
        int? salaryIncomeFM,
        int? salaryIncomeFMPreviousLoan,
        int? alliedAgriIncome,
        int? alliedAgriIncomePreviousLoan,
        int? otherIncome,
        int? otherIncomePreviousLoan}) {
    if (incomeId != null) {
      this._incomeId = incomeId;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (agricultureIncome != null) {
      this._agricultureIncome = agricultureIncome;
    }
    if (agricultureIncomePreviousLoan != null) {
      this._agricultureIncomePreviousLoan = agricultureIncomePreviousLoan;
    }
    if (rentalIncome != null) {
      this._rentalIncome = rentalIncome;
    }
    if (rentalIncomePreviousLoan != null) {
      this._rentalIncomePreviousLoan = rentalIncomePreviousLoan;
    }
    if (salaryIncomeFM != null) {
      this._salaryIncomeFM = salaryIncomeFM;
    }
    if (salaryIncomeFMPreviousLoan != null) {
      this._salaryIncomeFMPreviousLoan = salaryIncomeFMPreviousLoan;
    }
    if (alliedAgriIncome != null) {
      this._alliedAgriIncome = alliedAgriIncome;
    }
    if (alliedAgriIncomePreviousLoan != null) {
      this._alliedAgriIncomePreviousLoan = alliedAgriIncomePreviousLoan;
    }
    if (otherIncome != null) {
      this._otherIncome = otherIncome;
    }
    if (otherIncomePreviousLoan != null) {
      this._otherIncomePreviousLoan = otherIncomePreviousLoan;
    }
  }

  int? get incomeId => _incomeId;
  set incomeId(int? incomeId) => _incomeId = incomeId;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  int? get agricultureIncome => _agricultureIncome;
  set agricultureIncome(int? agricultureIncome) =>
      _agricultureIncome = agricultureIncome;
  int? get agricultureIncomePreviousLoan => _agricultureIncomePreviousLoan;
  set agricultureIncomePreviousLoan(int? agricultureIncomePreviousLoan) =>
      _agricultureIncomePreviousLoan = agricultureIncomePreviousLoan;
  int? get rentalIncome => _rentalIncome;
  set rentalIncome(int? rentalIncome) => _rentalIncome = rentalIncome;
  int? get rentalIncomePreviousLoan => _rentalIncomePreviousLoan;
  set rentalIncomePreviousLoan(int? rentalIncomePreviousLoan) =>
      _rentalIncomePreviousLoan = rentalIncomePreviousLoan;
  int? get salaryIncomeFM => _salaryIncomeFM;
  set salaryIncomeFM(int? salaryIncomeFM) => _salaryIncomeFM = salaryIncomeFM;
  int? get salaryIncomeFMPreviousLoan => _salaryIncomeFMPreviousLoan;
  set salaryIncomeFMPreviousLoan(int? salaryIncomeFMPreviousLoan) =>
      _salaryIncomeFMPreviousLoan = salaryIncomeFMPreviousLoan;
  int? get alliedAgriIncome => _alliedAgriIncome;
  set alliedAgriIncome(int? alliedAgriIncome) =>
      _alliedAgriIncome = alliedAgriIncome;
  int? get alliedAgriIncomePreviousLoan => _alliedAgriIncomePreviousLoan;
  set alliedAgriIncomePreviousLoan(int? alliedAgriIncomePreviousLoan) =>
      _alliedAgriIncomePreviousLoan = alliedAgriIncomePreviousLoan;
  int? get otherIncome => _otherIncome;
  set otherIncome(int? otherIncome) => _otherIncome = otherIncome;
  int? get otherIncomePreviousLoan => _otherIncomePreviousLoan;
  set otherIncomePreviousLoan(int? otherIncomePreviousLoan) =>
      _otherIncomePreviousLoan = otherIncomePreviousLoan;

  OtherIncomeMonthlyEditData.fromJson(Map<String, dynamic> json) {
    _incomeId = json['incomeId'];
    _customerId = json['customerId'];
    _agricultureIncome = json['agricultureIncome'];
    _agricultureIncomePreviousLoan = json['agricultureIncomePreviousLoan'];
    _rentalIncome = json['rentalIncome'];
    _rentalIncomePreviousLoan = json['rentalIncomePreviousLoan'];
    _salaryIncomeFM = json['salaryIncomeFM'];
    _salaryIncomeFMPreviousLoan = json['salaryIncomeFMPreviousLoan'];
    _alliedAgriIncome = json['alliedAgriIncome'];
    _alliedAgriIncomePreviousLoan = json['alliedAgriIncomePreviousLoan'];
    _otherIncome = json['otherIncome'];
    _otherIncomePreviousLoan = json['otherIncomePreviousLoan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['incomeId'] = this._incomeId;
    data['customerId'] = this._customerId;
    data['agricultureIncome'] = this._agricultureIncome;
    data['agricultureIncomePreviousLoan'] = this._agricultureIncomePreviousLoan;
    data['rentalIncome'] = this._rentalIncome;
    data['rentalIncomePreviousLoan'] = this._rentalIncomePreviousLoan;
    data['salaryIncomeFM'] = this._salaryIncomeFM;
    data['salaryIncomeFMPreviousLoan'] = this._salaryIncomeFMPreviousLoan;
    data['alliedAgriIncome'] = this._alliedAgriIncome;
    data['alliedAgriIncomePreviousLoan'] = this._alliedAgriIncomePreviousLoan;
    data['otherIncome'] = this._otherIncome;
    data['otherIncomePreviousLoan'] = this._otherIncomePreviousLoan;
    return data;
  }
}














