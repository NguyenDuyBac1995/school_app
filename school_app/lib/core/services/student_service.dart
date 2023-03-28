import 'package:school_app/core/api/api_uri.dart';
import 'package:school_app/core/services/base_service.dart';
import '../models/student_model.dart';

class StudentServices extends BaseServices{
  Future<List<StudentModel>> getStudentData() async{
    final reps = await  request( ApiUri.instance.getStudentDetail, RequestType.get);
    List<StudentModel> result = reps.map<StudentModel>((element)=> StudentModel.fromJson(element)).toList();
    return result;
  }
}