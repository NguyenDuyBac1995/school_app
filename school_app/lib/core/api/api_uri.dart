class ApiUri {
  static ApiUri instance = ApiUri();

  //* Base API URL
  static const baseUrl = 'localhost:3000';
  static const scheme = 'https';
  String loginUri = 'login';
  String getTeacherDetail = 'http://localhost:3000/teacher';
  String getStudentDetail = 'http://localhost:3000/student';
}