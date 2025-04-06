import '../common_model/metadata.dart';

class ReferTrackModel {
  String? message;
  String? status;
  ReferTrackResult? result;

  ReferTrackModel({this.message, this.status, this.result});

  ReferTrackModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    result =
        json['result'] != null
            ? new ReferTrackResult.fromJson(json['result'])
            : null;
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

class ReferTrackResult {
  List<ReferTrackData>? data;
  List<Metadata>? metadata;

  ReferTrackResult({this.data, this.metadata});

  ReferTrackResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ReferTrackData>[];
      json['data'].forEach((v) {
        data!.add(new ReferTrackData.fromJson(v));
      });
    }
    if (json['metadata'] != null) {
      metadata = <Metadata>[];
      json['metadata'].forEach((v) {
        metadata!.add(new Metadata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReferTrackData {
  String? sId;
  String? referBy;
  ReferTo? referTo;
  int? referByReward;
  int? referToReward;
  String? status;
  Expiry? expiry;
  String? createdAt;

  ReferTrackData({
    this.sId,
    this.referBy,
    this.referTo,
    this.referByReward,
    this.referToReward,
    this.status,
    this.expiry,
    this.createdAt,
  });

  ReferTrackData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    referBy = json['referrBy'];
    referTo =
        json['referTo'] != null ? new ReferTo.fromJson(json['referTo']) : null;
    referByReward = json['referByReward'];
    referToReward = json['referToReward'];
    status = json['status'];
    expiry =
        json['expiry'] != null ? new Expiry.fromJson(json['expiry']) : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['referrBy'] = this.referBy;
    if (this.referTo != null) {
      data['referTo'] = this.referTo!.toJson();
    }
    data['referByReward'] = this.referByReward;
    data['referToReward'] = this.referToReward;
    data['status'] = this.status;
    if (this.expiry != null) {
      data['expiry'] = this.expiry!.toJson();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class ReferTo {
  String? id;
  String? name;
  String? phone;

  ReferTo({this.id, this.name, this.phone});

  ReferTo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}

class Expiry {
  bool? isExpirable;
  String? expiresAt;

  Expiry({this.isExpirable, this.expiresAt});

  Expiry.fromJson(Map<String, dynamic> json) {
    isExpirable = json['isExpirable'];
    expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isExpirable'] = this.isExpirable;
    data['expiresAt'] = this.expiresAt;
    return data;
  }
}
