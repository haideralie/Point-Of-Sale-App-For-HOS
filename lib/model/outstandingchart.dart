class Outstandingchart {
  List<PayableTotal> payableTotal;
  List<ReceivableTotal> receivableTotal;

  Outstandingchart({this.payableTotal, this.receivableTotal});

  Outstandingchart.fromJson(Map<String, dynamic> json) {
    if (json['payableTotal'] != null) {
      payableTotal = new List<PayableTotal>();
      json['payableTotal'].forEach((v) {
        payableTotal.add(new PayableTotal.fromJson(v));
      });
    }
    if (json['receivableTotal'] != null) {
      receivableTotal = new List<ReceivableTotal>();
      json['receivableTotal'].forEach((v) {
        receivableTotal.add(new ReceivableTotal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payableTotal != null) {
      data['payableTotal'] = this.payableTotal.map((v) => v.toJson()).toList();
    }
    if (this.receivableTotal != null) {
      data['receivableTotal'] =
          this.receivableTotal.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PayableTotal {
  String totalBalance;

  PayableTotal({this.totalBalance});

  PayableTotal.fromJson(Map<String, dynamic> json) {
    totalBalance = json['totalBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalBalance'] = this.totalBalance;
    return data;
  }
}

class ReceivableTotal {
  String totalBalance;

  ReceivableTotal({this.totalBalance});

  ReceivableTotal.fromJson(Map<String, dynamic> json) {
    totalBalance = json['totalBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalBalance'] = this.totalBalance;
    return data;
  }
}
