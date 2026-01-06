class CreateLeadsResponse {
  Data? data;
  bool? success;
  bool? error;
  String? message;

  CreateLeadsResponse({this.data, this.success, this.error, this.message});

  CreateLeadsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  Lead? lead;

  Data({this.lead});

  Data.fromJson(Map<String, dynamic> json) {
    lead = json['lead'] != null ? new Lead.fromJson(json['lead']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lead != null) {
      data['lead'] = this.lead!.toJson();
    }
    return data;
  }
}

class Lead {
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? email;
  String? loanType;
  String? loanPurpose;
  bool? referToAmbak;
  String? propertyState;
  String? propertyCity;
  int? requiredAmount;
  String? status;
  String? source;
  bool? documentsUploaded;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Lead(
      {this.firstName,
        this.lastName,
        this.mobileNo,
        this.email,
        this.loanType,
        this.loanPurpose,
        this.referToAmbak,
        this.propertyState,
        this.propertyCity,
        this.requiredAmount,
        this.status,
        this.source,
        this.documentsUploaded,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Lead.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    loanType = json['loan_type'];
    loanPurpose = json['loan_purpose'];
    referToAmbak = json['refer_to_ambak'];
    propertyState = json['property_state'];
    propertyCity = json['property_city'];
    requiredAmount = json['required_amount'];
    status = json['status'];
    source = json['source'];
    documentsUploaded = json['documents_uploaded'];
    sId = json['_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['loan_type'] = this.loanType;
    data['loan_purpose'] = this.loanPurpose;
    data['refer_to_ambak'] = this.referToAmbak;
    data['property_state'] = this.propertyState;
    data['property_city'] = this.propertyCity;
    data['required_amount'] = this.requiredAmount;
    data['status'] = this.status;
    data['source'] = this.source;
    data['documents_uploaded'] = this.documentsUploaded;
    data['_id'] = this.sId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
