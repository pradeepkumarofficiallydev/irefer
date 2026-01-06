class LeadUpdateResponse {
  bool? success;
  String? message;
  LeadData? data;

  LeadUpdateResponse();

  LeadUpdateResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? LeadData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['success'] = success;
    json['message'] = message;
    if (data != null) {
      json['data'] = data!.toJson();
    }
    return json;
  }
}

class LeadData {
  Login? login;
  Sanction? sanction;
  Disbursed? disbursed;
  String? id;
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
  String? commissionStatus;
  int? commissionAmount;
  bool? documentsUploaded;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? comments;
  String? followType;
  String? followUpDate;

  LeadData();

  LeadData.fromJson(Map<String, dynamic> json) {
    login = json['login'] != null ? Login.fromJson(json['login']) : null;
    sanction =
    json['sanction'] != null ? Sanction.fromJson(json['sanction']) : null;
    disbursed =
    json['disbursed'] != null ? Disbursed.fromJson(json['disbursed']) : null;
    id = json['_id'];
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
    commissionStatus = json['commission_status'];
    commissionAmount = json['commission_amount'];
    documentsUploaded = json['documents_uploaded'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    v = json['__v'];
    comments = json['comments'];
    followType = json['follow_type'];
    followUpDate = json['follow_up_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (login != null) {
      json['login'] = login!.toJson();
    }
    if (sanction != null) {
      json['sanction'] = sanction!.toJson();
    }
    if (disbursed != null) {
      json['disbursed'] = disbursed!.toJson();
    }
    json['_id'] = id;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['mobile_no'] = mobileNo;
    json['email'] = email;
    json['loan_type'] = loanType;
    json['loan_purpose'] = loanPurpose;
    json['refer_to_ambak'] = referToAmbak;
    json['property_state'] = propertyState;
    json['property_city'] = propertyCity;
    json['required_amount'] = requiredAmount;
    json['status'] = status;
    json['source'] = source;
    json['commission_status'] = commissionStatus;
    json['commission_amount'] = commissionAmount;
    json['documents_uploaded'] = documentsUploaded;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['__v'] = v;
    json['comments'] = comments;
    json['follow_type'] = followType;
    json['follow_up_date'] = followUpDate;
    return json;
  }
}

class Login {
  List<String>? supportingDocs;
  String? aadhaar;
  String? bankName;
  String? comment;
  int? loginAmount;
  String? loginDate;
  String? loginNumber;
  String? pan;

  Login();

  Login.fromJson(Map<String, dynamic> json) {
    supportingDocs = json['supportingDocs']?.cast<String>();
    aadhaar = json['aadhaar'];
    bankName = json['bankName'];
    comment = json['comment'];
    loginAmount = json['loginAmount'];
    loginDate = json['loginDate'];
    loginNumber = json['loginNumber'];
    pan = json['pan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['supportingDocs'] = supportingDocs;
    json['aadhaar'] = aadhaar;
    json['bankName'] = bankName;
    json['comment'] = comment;
    json['loginAmount'] = loginAmount;
    json['loginDate'] = loginDate;
    json['loginNumber'] = loginNumber;
    json['pan'] = pan;
    return json;
  }
}

class Sanction {
  List<String>? supportingDocs;

  Sanction();

  Sanction.fromJson(Map<String, dynamic> json) {
    supportingDocs = json['supportingDocs']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['supportingDocs'] = supportingDocs;
    return json;
  }
}

class Disbursed {
  List<String>? supportingDocs;

  Disbursed();

  Disbursed.fromJson(Map<String, dynamic> json) {
    supportingDocs = json['supportingDocs']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['supportingDocs'] = supportingDocs;
    return json;
  }
}
