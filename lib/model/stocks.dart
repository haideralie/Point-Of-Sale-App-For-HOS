class Stocks {
  List<Stock> stock;

  Stocks({this.stock});

  Stocks.fromJson(Map<String, dynamic> json) {
    if (json['stock'] != null) {
      stock = new List<Stock>();
      json['stock'].forEach((v) {
        stock.add(new Stock.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stock != null) {
      data['stock'] = this.stock.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stock {
  String itemCode;
  String itemName;
  String opNQTY;
  String closingQTY;
  String iteMBASEUNIT;
  String loCID;
  String loCNAME;

  Stock(
      {this.itemCode,
      this.itemName,
      this.opNQTY,
      this.closingQTY,
      this.iteMBASEUNIT,
      this.loCID,
      this.loCNAME});

  Stock.fromJson(Map<String, dynamic> json) {
    itemCode = json['item_Code'];
    itemName = json['item_Name'];
    opNQTY = json['opN_QTY'];
    closingQTY = json['closing_QTY'];
    iteMBASEUNIT = json['iteM_BASE_UNIT'];
    loCID = json['loC_ID'];
    loCNAME = json['loC_NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_Code'] = this.itemCode;
    data['item_Name'] = this.itemName;
    data['opN_QTY'] = this.opNQTY;
    data['closing_QTY'] = this.closingQTY;
    data['iteM_BASE_UNIT'] = this.iteMBASEUNIT;
    data['loC_ID'] = this.loCID;
    data['loC_NAME'] = this.loCNAME;
    return data;
  }
}
