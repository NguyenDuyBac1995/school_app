import 'package:school_app/core/models/base_model.dart';

class TeacherModel extends BaseModel {
  int? id;
  String? userName;
  String? password;
  String? name;
  String? date;
  String? avata;
  String? numberPhone;
  bool? gender;

  TeacherModel(
      {this.id,
        this.userName,
        this.password,
        this.name,
        this.date,
        this.avata,
        this.numberPhone,
        this.gender});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    password = json['password'];
    name = json['name'];
    date = json['date'];
    avata = json['avata'];
    numberPhone = json['number_phone'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['name'] = this.name;
    data['date'] = this.date;
    data['avata'] = this.avata;
    data['number_phone'] = this.numberPhone;
    data['gender'] = this.gender;
    return data;
  }
}
