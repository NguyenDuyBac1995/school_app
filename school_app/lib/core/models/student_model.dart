// abstract class BaseModel{}
//
// class StudentModel extends BaseModel{
//   List<Student>? data;
//   StudentModel({this.data});
//
//   StudentModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Student>[];
//       json['data'].forEach((v) {
//         data!.add(new Student.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
//
// class Student {
//   String? name;
//   String? date;
//   String? schoolName;
//   String? className;
//   String? teacherName;
//   String? parentName;
//   String? numberPhone;
//   String? avata;
//   bool? gender;
//   String? id;
//
//   Student(
//       {this.name,
//         this.date,
//         this.schoolName,
//         this.className,
//         this.teacherName,
//         this.parentName,
//         this.numberPhone,
//         this.avata,
//         this.gender,
//         this.id});
//
//   Student.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     date = json['date'];
//     schoolName = json['school_name'];
//     className = json['class_name'];
//     teacherName = json['teacher_name'];
//     parentName = json['parent_name'];
//     numberPhone = json['number_phone'];
//     avata = json['avata'];
//     gender = json['gender'];
//     id = json['id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['date'] = this.date;
//     data['school_name'] = this.schoolName;
//     data['class_name'] = this.className;
//     data['teacher_name'] = this.teacherName;
//     data['parent_name'] = this.parentName;
//     data['number_phone'] = this.numberPhone;
//     data['avata'] = this.avata;
//     data['gender'] = this.gender;
//     data['id'] = this.id;
//     return data;
//   }
// }
