class GetProfilesResponse {
  bool? success;
  Data? data;

  GetProfilesResponse({this.success, this.data});

  GetProfilesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
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
  Profession? profession;
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
    profession = json['profession'] != null
        ? new Profession.fromJson(json['profession'])
        : null;
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
    if (this.profession != null) {
      data['profession'] = this.profession!.toJson();
    }
    data['referralcode'] = this.referralcode;
    data['gstin'] = this.gstin;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Profession {
  String? sId;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Profession(
      {this.sId,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Profession.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
