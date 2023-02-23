class BaseResponseModel {
  int? statusCode;
  String? message;
  String? type;
  late bool isSuccess = statusCode == 201 || statusCode == 200 ? true : false;

  BaseResponseModel({this.statusCode, this.message, this.type});

  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    message = json['Message'];
    type = json['Type'];
  }
}
