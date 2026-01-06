// class GetSingleLeadsResponse {
//   bool? success;
//   LeadData? data;
//   String? message;
//
//   GetSingleLeadsResponse({this.success, this.data, this.message});
//
//   GetSingleLeadsResponse.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? LeadData.fromJson(json['data']) : null;
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = {};
//     json['success'] = success;
//     if (data != null) {
//       json['data'] = data!.toJson();
//     }
//     json['message'] = message;
//     return json;
//   }
// }
//
// class LeadData {
//   Section? login;
//   Section? sanction;
//   Section? disbursed;
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? mobileNo;
//   String? email;
//   String? loanType;
//   String? loanPurpose;
//   bool? referToAmbak;
//   String? propertyState;
//   String? propertyCity;
//   int? requiredAmount;
//   String? status;
//   String? source;
//   String? commissionStatus;
//   int? commissionAmount;
//   bool? documentsUploaded;
//   String? createdAt;
//   String? updatedAt;
//   int? v;
//   String? comments;
//   String? followUpDate;
//
//   LeadData({
//     this.login,
//     this.sanction,
//     this.disbursed,
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.mobileNo,
//     this.email,
//     this.loanType,
//     this.loanPurpose,
//     this.referToAmbak,
//     this.propertyState,
//     this.propertyCity,
//     this.requiredAmount,
//     this.status,
//     this.source,
//     this.commissionStatus,
//     this.commissionAmount,
//     this.documentsUploaded,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.comments,
//     this.followUpDate,
//   });
//
//   LeadData.fromJson(Map<String, dynamic> json) {
//     login = json['login'] != null ? Section.fromJson(json['login']) : null;
//     sanction = json['sanction'] != null ? Section.fromJson(json['sanction']) : null;
//     disbursed = json['disbursed'] != null ? Section.fromJson(json['disbursed']) : null;
//     id = json['_id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     mobileNo = json['mobile_no'];
//     email = json['email'];
//     loanType = json['loan_type'];
//     loanPurpose = json['loan_purpose'];
//     referToAmbak = json['refer_to_ambak'];
//     propertyState = json['property_state'];
//     propertyCity = json['property_city'];
//     requiredAmount = json['required_amount'];
//     status = json['status'];
//     source = json['source'];
//     commissionStatus = json['commission_status'];
//     commissionAmount = json['commission_amount'];
//     documentsUploaded = json['documents_uploaded'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     v = json['__v'];
//     comments = json['comments'];
//     followUpDate = json['follow_up_date'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = {};
//     if (login != null) json['login'] = login!.toJson();
//     if (sanction != null) json['sanction'] = sanction!.toJson();
//     if (disbursed != null) json['disbursed'] = disbursed!.toJson();
//     json['_id'] = id;
//     json['first_name'] = firstName;
//     json['last_name'] = lastName;
//     json['mobile_no'] = mobileNo;
//     json['email'] = email;
//     json['loan_type'] = loanType;
//     json['loan_purpose'] = loanPurpose;
//     json['refer_to_ambak'] = referToAmbak;
//     json['property_state'] = propertyState;
//     json['property_city'] = propertyCity;
//     json['required_amount'] = requiredAmount;
//     json['status'] = status;
//     json['source'] = source;
//     json['commission_status'] = commissionStatus;
//     json['commission_amount'] = commissionAmount;
//     json['documents_uploaded'] = documentsUploaded;
//     json['created_at'] = createdAt;
//     json['updated_at'] = updatedAt;
//     json['__v'] = v;
//     json['comments'] = comments;
//     json['follow_up_date'] = followUpDate;
//     return json;
//   }
// }
//
// class Section {
//   List<dynamic>? supportingDocs;
//
//   Section({this.supportingDocs});
//
//   Section.fromJson(Map<String, dynamic> json) {
//     supportingDocs = json['supportingDocs'] ?? [];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = {};
//     json['supportingDocs'] = supportingDocs ?? [];
//     return json;
//   }
// }
//
//

/////////////





class GetSingleLeadsResponse {
  bool? success;
  Data? data;
  String? message;

  GetSingleLeadsResponse({this.success, this.data, this.message});

  GetSingleLeadsResponse.fromJson(Map<String, dynamic> json) {
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
  Login? login;
  Sanction? sanction;
  Disbursed? disbursed;
  String? sId;
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
  int? iV;

  Data(
      {this.login,
        this.sanction,
        this.disbursed,
        this.sId,
        this.firstName,
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
        this.commissionStatus,
        this.commissionAmount,
        this.documentsUploaded,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    login = json['login'] != null ? new Login.fromJson(json['login']) : null;
    sanction = json['sanction'] != null
        ? new Sanction.fromJson(json['sanction'])
        : null;
    disbursed = json['disbursed'] != null
        ? new Disbursed.fromJson(json['disbursed'])
        : null;
    sId = json['_id'];
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
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.login != null) {
      data['login'] = this.login!.toJson();
    }
    if (this.sanction != null) {
      data['sanction'] = this.sanction!.toJson();
    }
    if (this.disbursed != null) {
      data['disbursed'] = this.disbursed!.toJson();
    }
    data['_id'] = this.sId;
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
    data['commission_status'] = this.commissionStatus;
    data['commission_amount'] = this.commissionAmount;
    data['documents_uploaded'] = this.documentsUploaded;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Login {
  String? aadhaar;
  String? bankName;
  String? comment;
  int? loginAmount;
  String? loginDate;
  String? loginNumber;
  String? pan;
  List<String>? supportingDocs;

  Login(
      {this.aadhaar,
        this.bankName,
        this.comment,
        this.loginAmount,
        this.loginDate,
        this.loginNumber,
        this.pan,
        this.supportingDocs});

  Login.fromJson(Map<String, dynamic> json) {
    aadhaar = json['aadhaar'];
    bankName = json['bankName'];
    comment = json['comment'];
    loginAmount = json['loginAmount'];
    loginDate = json['loginDate'];
    loginNumber = json['loginNumber'];
    pan = json['pan'];
    supportingDocs = json['supportingDocs'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aadhaar'] = this.aadhaar;
    data['bankName'] = this.bankName;
    data['comment'] = this.comment;
    data['loginAmount'] = this.loginAmount;
    data['loginDate'] = this.loginDate;
    data['loginNumber'] = this.loginNumber;
    data['pan'] = this.pan;
    data['supportingDocs'] = this.supportingDocs;
    return data;
  }
}

class Sanction {
  String? aadhaar;
  int? amount;
  String? approvalDate;
  int? approvedEMI;
  String? comment;
  String? pan;
  String? sanctionNumber;
  List<String>? supportingDocs;

  Sanction(
      {this.aadhaar,
        this.amount,
        this.approvalDate,
        this.approvedEMI,
        this.comment,
        this.pan,
        this.sanctionNumber,
        this.supportingDocs});

  Sanction.fromJson(Map<String, dynamic> json) {
    aadhaar = json['aadhaar'];
    amount = json['amount'];
    approvalDate = json['approvalDate'];
    approvedEMI = json['approvedEMI'];
    comment = json['comment'];
    pan = json['pan'];
    sanctionNumber = json['sanctionNumber'];
    supportingDocs = json['supportingDocs'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aadhaar'] = this.aadhaar;
    data['amount'] = this.amount;
    data['approvalDate'] = this.approvalDate;
    data['approvedEMI'] = this.approvedEMI;
    data['comment'] = this.comment;
    data['pan'] = this.pan;
    data['sanctionNumber'] = this.sanctionNumber;
    data['supportingDocs'] = this.supportingDocs;
    return data;
  }
}

class Disbursed {
  String? aadhaar;
  String? comment;
  int? disbursedAmount;
  String? disbursedDate;
  String? pan;
  List<String>? supportingDocs;
  String? utrNumber;

  Disbursed(
      {this.aadhaar,
        this.comment,
        this.disbursedAmount,
        this.disbursedDate,
        this.pan,
        this.supportingDocs,
        this.utrNumber});

  Disbursed.fromJson(Map<String, dynamic> json) {
    aadhaar = json['aadhaar'];
    comment = json['comment'];
    disbursedAmount = json['disbursedAmount'];
    disbursedDate = json['disbursedDate'];
    pan = json['pan'];
    supportingDocs = json['supportingDocs'].cast<String>();
    utrNumber = json['utrNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aadhaar'] = this.aadhaar;
    data['comment'] = this.comment;
    data['disbursedAmount'] = this.disbursedAmount;
    data['disbursedDate'] = this.disbursedDate;
    data['pan'] = this.pan;
    data['supportingDocs'] = this.supportingDocs;
    data['utrNumber'] = this.utrNumber;
    return data;
  }
}






