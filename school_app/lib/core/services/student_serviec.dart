//
// import 'dart:js';
//
// import 'package:flutter/material.dart';
// import 'package:school_app/core/api/api_uri.dart';
// import 'package:school_app/core/services/base_service.dart';
//
// import '../models/student_model.dart';
//
// class StudentServices extends BaseService{
//   Future<StudentModel> getStudentData(BuildContext context) async{
//     var resp = await requestAsync( context, ApiUri.instance.getStudentDetail, RequestType.get );
//
//     return StudentModel();
//   }
// }