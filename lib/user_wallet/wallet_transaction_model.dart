import 'package:ui_designs/common_model/metadata.dart';

class WalletTransactionModel {
  String? message;
  String? status;
  Result? result;

  WalletTransactionModel({this.message, this.status, this.result});

  WalletTransactionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Metadata>? metadata;
  List<TransactionWalletData>? data;

  Result({this.metadata, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['metadata'] != null) {
      metadata = <Metadata>[];
      json['metadata'].forEach((v) {
        metadata!.add(new Metadata.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = <TransactionWalletData>[];
      json['data'].forEach((v) {
        data!.add(new TransactionWalletData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class TransactionWalletData {
  String? sId;
  String? transactionId;
  String? type;
  num? amount;
  String? status;
  String? createdAt;

  TransactionWalletData(
      {this.sId,
        this.transactionId,
        this.type,
        this.amount,
        this.status,
        this.createdAt});

  TransactionWalletData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    transactionId = json['transactionId'];
    type = json['type'];
    amount = json['amount'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['transactionId'] = this.transactionId;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    return data;
  }
}



/// wallet amount model


class WalletModel {
  String? status;
  String? message;
  num? amount;

  WalletModel({this.status, this.message, this.amount});

  WalletModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['amount'] = this.amount;
    return data;
  }
}
