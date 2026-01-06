class UserLoginResponse {
  String? message;
  String? data;
  bool? error;
  bool? success;

  UserLoginResponse({this.message, this.data, this.error, this.success});

  UserLoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    error = json['error'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] = this.data;
    data['error'] = this.error;
    data['success'] = this.success;
    return data;
  }
}
