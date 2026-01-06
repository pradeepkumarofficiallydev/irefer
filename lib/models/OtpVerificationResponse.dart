class OtpVerificationResponse {
  String? message;
  Data? data;
  String? token;
  bool? error;
  bool? success;

  OtpVerificationResponse(
      {this.message, this.data, this.token, this.error, this.success});

  OtpVerificationResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
    error = json['error'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    data['error'] = this.error;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? sId;
  String? organisationtype;
  String? partnercode;
  String? partnerempcode;
  String? name;
  String? email;
  bool? verifyEmail;
  String? mobile;
  String? panno;
  String? address;
  int? pinno;
  String? city;
  String? district;
  String? state;
  String? profession;
  String? referralcode;
  String? gstin;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.organisationtype,
        this.partnercode,
        this.partnerempcode,
        this.name,
        this.email,
        this.verifyEmail,
        this.mobile,
        this.panno,
        this.address,
        this.pinno,
        this.city,
        this.district,
        this.state,
        this.profession,
        this.referralcode,
        this.gstin,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    organisationtype = json['organisationtype'];
    partnercode = json['partnercode'];
    partnerempcode = json['partnerempcode'];
    name = json['name'];
    email = json['email'];
    verifyEmail = json['verify_email'];
    mobile = json['mobile'];
    panno = json['panno'];
    address = json['address'];
    pinno = json['pinno'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    profession = json['profession'];
    referralcode = json['referralcode'];
    gstin = json['gstin'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['organisationtype'] = this.organisationtype;
    data['partnercode'] = this.partnercode;
    data['partnerempcode'] = this.partnerempcode;
    data['name'] = this.name;
    data['email'] = this.email;
    data['verify_email'] = this.verifyEmail;
    data['mobile'] = this.mobile;
    data['panno'] = this.panno;
    data['address'] = this.address;
    data['pinno'] = this.pinno;
    data['city'] = this.city;
    data['district'] = this.district;
    data['state'] = this.state;
    data['profession'] = this.profession;
    data['referralcode'] = this.referralcode;
    data['gstin'] = this.gstin;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
