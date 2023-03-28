import 'package:school_app/core/api/api_uri.dart';
import 'package:school_app/core/models/teacher_model.dart';
import 'package:school_app/core/services/base_service.dart';

class TeacherServices extends BaseServices{

  Future<List<TeacherModel>> getTeacherData()async{
    var reps = await request(ApiUri.instance.getTeacherDetail, RequestType.get);
    List<TeacherModel> result = reps.map<TeacherModel>((element)=>TeacherModel.fromJson(element)).toList();
    return result;
  }
}