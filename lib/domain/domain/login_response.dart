class LoginResponse {
  bool? success;
  String? message;
  Data? data;

  LoginResponse({this.success, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? uuid;
  String? fullName;
  Null? userName;
  String? email;
  String? type;
  String? token;
  bool? activeNotification;

  Data(
      {this.uuid,
        this.fullName,
        this.userName,
        this.email,
        this.type,
        this.token,
        this.activeNotification});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    type = json['type'];
    token = json['token'];
    activeNotification = json['activeNotification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['type'] = this.type;
    data['token'] = this.token;
    data['activeNotification'] = this.activeNotification;
    return data;
  }
}
