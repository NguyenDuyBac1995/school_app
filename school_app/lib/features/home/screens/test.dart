import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/models/student_model.dart';
import 'package:school_app/core/models/teacher_model.dart';
import 'package:school_app/core/services/student_service.dart';
import 'package:school_app/core/services/teacher_service.dart';
import 'package:school_app/features/home/blocs/home_bloc.dart';

class MyTest extends StatefulWidget {
  const MyTest({Key? key}) : super(key: key);

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  final student = StudentServices();
  final teacher = TeacherServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<TeacherModel>>(
        future: teacher.getTeacherData(),
          builder: (context,AsyncSnapshot<List<TeacherModel>> snapshot){
           if(snapshot.hasData){
             return _loadData(snapshot.data!);
           }else if(snapshot.hasError){
             return Center(child: Text(snapshot.error.toString()));
           }
           return Center(child: CircularProgressIndicator(),);
          })
    );
  }
  _loadData(List<TeacherModel> data){
    return ListView.builder(
      itemCount:  data.length,
        itemBuilder:(context, index){
          return Container(
            child: Column(
              children: [
                Text('${data[index].name}'),
              ],
            ),
          );
        },
    );
  }
}
