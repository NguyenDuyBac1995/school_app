import 'assets.dart';

class Student {
  String name;
  String date;
  String school;
  String class_studen;
  String teacher;
  String parent;
  String avata;

  Student(
      {required this.name,
        required this.date,
        required this.school,
        required this.class_studen,
        required this.parent,
        required this.teacher,
        required this.avata,
      });
}

List<Student> dummyData=[
  Student(name: 'Nguyễn Anh Khôi', date: '01/01/2019', school: 'Mầm non Tứ Hiệp', class_studen: 'Lớp Lá', parent: 'Nguyễn Khôi Anh', teacher: 'Lê Minh Hằng', avata: Images.homeItemLeft),
Student(name: 'Nguyễn Bá Đạo', date: '01/01/2019', school: 'Mầm non Tứ Hiệp', class_studen: 'Lớp Mầm', parent: 'Nguyễn Khôi Anh', teacher: 'Lê Thị Thảo', avata: Images.homeItemLeft),
Student(name: 'Trần Văn Long', date: '01/01/2019', school: 'Mầm non Tứ Hiệp', class_studen: 'Lớp Trồi', parent: 'Nguyễn Khôi Anh', teacher: 'Quách Thành Danh', avata: Images.homeItemLeft),
Student(name: 'Lê Bá Minh', date: '01/01/2019', school: 'Mầm non Tứ Hiệp', class_studen: 'Lớp Lá', parent: 'Nguyễn Khôi Anh', teacher: 'Lê Minh Trang', avata: Images.homeItemLeft),
];
