class GetEarningResponse {
  bool? success;
  bool? error;
  String? message;
  Data? data;

  GetEarningResponse({this.success, this.error, this.message, this.data});

  GetEarningResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {

  dynamic? totalPendingAmount;
  int? pendingCount;
  dynamic? totalApprovedAmount;
  int? approvedCount;
  int? grandTotal;
  int? grandCount;

  Data(
      {this.totalPendingAmount,
        this.pendingCount,
        this.totalApprovedAmount,
        this.approvedCount,
        this.grandTotal,
        this.grandCount});


  Data.fromJson(Map<String, dynamic> json) {
    totalPendingAmount = json['total_pending_amount'];
    pendingCount = json['pending_count'];
    totalApprovedAmount = json['total_approved_amount'];
    approvedCount = json['approved_count'];
    grandTotal = json['grand_total'];
    grandCount = json['grand_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_pending_amount'] = this.totalPendingAmount;
    data['pending_count'] = this.pendingCount;
    data['total_approved_amount'] = this.totalApprovedAmount;
    data['approved_count'] = this.approvedCount;
    data['grand_total'] = this.grandTotal;
    data['grand_count'] = this.grandCount;
    return data;
  }
}
