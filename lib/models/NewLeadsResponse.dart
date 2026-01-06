class NewLeadsResponse {
  bool? success;
  List<Data>? data;
  Pagination? pagination;
  String? message;

  NewLeadsResponse({this.success, this.data, this.pagination, this.message});

  NewLeadsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
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
  bool? documentsUploaded;

  String? commissionStatus;
  dynamic? commissionAmount;

  String? createdAt;
  String? updatedAt;

  int? iV;
  String? comments;


  String? followUpDate;

  Data(
      {this.sId,
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
        this.documentsUploaded,

        this.commissionStatus,
        this.commissionAmount,



        this.createdAt,
        this.updatedAt,
        this.iV,
        this.comments,
        this.followUpDate});

  Data.fromJson(Map<String, dynamic> json) {
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
    documentsUploaded = json['documents_uploaded'];

    commissionStatus = json['commission_status'];

    commissionAmount = json['commission_amount'];





    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
    comments = json['comments'];
    followUpDate = json['follow_up_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['documents_uploaded'] = this.documentsUploaded;


    data['commission_status'] = this.commissionStatus;

    data['commission_amount'] = this.commissionAmount;



    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    data['comments'] = this.comments;
    data['follow_up_date'] = this.followUpDate;
    return data;
  }
}

class Pagination {
  int? totalLeads;
  int? totalPages;
  int? currentPage;
  int? perPage;

  Pagination(
      {this.totalLeads, this.totalPages, this.currentPage, this.perPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalLeads = json['totalLeads'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalLeads'] = this.totalLeads;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    data['perPage'] = this.perPage;
    return data;
  }
}
