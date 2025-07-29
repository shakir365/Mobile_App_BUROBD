

class ProductSale {
  late String typeOfProduct;
  late double numberOfUnits;
  late double pricePerService;

  ProductSale(this.typeOfProduct, this.numberOfUnits, this.pricePerService);
}


class ProductPurchase {
  late String typeOfProduct;
  late double numberOfUnits;
  late double pricePerService;

  ProductPurchase(this.typeOfProduct, this.numberOfUnits, this.pricePerService);
}


class ManufacturingOptionOne {
  late String typeOfProduct;
  late double numberOfUnits;
  late double averageSalePrize;
  late double costPerUnit;

  ManufacturingOptionOne(this.typeOfProduct, this.numberOfUnits,
      this.averageSalePrize, this.costPerUnit);
}

class ManufacturingOptionTwo {
  late double materialCost;
  late double otherCashCost;
  late double averageSalePerMonth;
  late double debtBurden;
  late double debtBurdenPreviousLoan;

  ManufacturingOptionTwo(this.materialCost, this.otherCashCost,
      this.averageSalePerMonth, this.debtBurden, this.debtBurdenPreviousLoan);
}


class CustomerDetailsArguments{
  late String memberID;
  late int customerID;
  late bool isEditable;
  late String name;


  CustomerDetailsArguments(
      this.memberID, this.customerID, this.isEditable, this.name,);
}

class ExistingLoan {
  double _exloanid = 0.0;
  int _customerid = 0;
  String _nameofinstitution = "";
  double _loanamount = 0.0;
  double _emi = 0.0;
  double _loanoutstanding = 0.0;
  double _tenor = 0.0;
  double _paidtenor = 0.0;
  double _balancetenor = 0.0;
  String _loantobeclosed = "";

  set exloanid(double value) {
    _exloanid = value;
  }

  double _obligate = 0.0;
  double _previousloanobligation = 0.0;

  ExistingLoan();

  double get exloanid => _exloanid;
  int get customerid => _customerid;
  String get nameofinstitution => _nameofinstitution;
  double get loanamount => _loanamount;
  double get emi => _emi;
  double get loanoutstanding => _loanoutstanding;
  double get tenor => _tenor;
  double get paidtenor => _paidtenor;
  double get balancetenor => _balancetenor;
  String get loantobeclosed => _loantobeclosed;
  double get obligate => _obligate;
  double get previousloanobligation => _previousloanobligation;

  set customerid(int value) {
    _customerid = value;
  }

  set nameofinstitution(String value) {
    _nameofinstitution = value;
  }

  set loanamount(double value) {
    _loanamount = value;
  }

  set emi(double value) {
    _emi = value;
  }

  set loanoutstanding(double value) {
    _loanoutstanding = value;
  }

  set tenor(double value) {
    _tenor = value;
  }

  set paidtenor(double value) {
    _paidtenor = value;
  }

  set balancetenor(double value) {
    _balancetenor = value;
  }

  set loantobeclosed(String value) {
    _loantobeclosed = value;
  }

  set obligate(double value) {
    _obligate = value;
  }

  set previousloanobligation(double value) {
    _previousloanobligation = value;
  }
}
