class GetAllLeadsCountResponse {
  bool? success;
  Data? data;
  String? message;

  GetAllLeadsCountResponse({this.success, this.data, this.message});

  GetAllLeadsCountResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? followUps;
  int? confirmationPending;
  int? newLeads;
  int? loggedIn;
  int? sanctioned;
  int? disbursed;
  int? lost;

  Data(
      {this.followUps,
        this.confirmationPending,
        this.newLeads,
        this.loggedIn,
        this.sanctioned,
        this.disbursed,
        this.lost});

  Data.fromJson(Map<String, dynamic> json) {
    followUps = json['Follow Ups'];
    confirmationPending = json['Confirmation Pending'];
    newLeads = json['New Leads'];
    loggedIn = json['Logged In'];
    sanctioned = json['Sanctioned'];
    disbursed = json['Disbursed'];
    lost = json['Lost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Follow Ups'] = this.followUps;
    data['Confirmation Pending'] = this.confirmationPending;
    data['New Leads'] = this.newLeads;
    data['Logged In'] = this.loggedIn;
    data['Sanctioned'] = this.sanctioned;
    data['Disbursed'] = this.disbursed;
    data['Lost'] = this.lost;
    return data;
  }
}
