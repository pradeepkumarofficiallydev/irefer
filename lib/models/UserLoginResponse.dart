class UserLoginResponse {
  String? message;
  String? data;

  UserLoginResponse({this.message, this.data});

  UserLoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
