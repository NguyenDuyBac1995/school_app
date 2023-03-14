class ApiUri {
  static ApiUri instance = ApiUri();

  //* Base API URL
  static const baseUrl = 'localhost:3000';
  static const scheme = 'https';
  String loginUri = 'login';

  String getStudentDetail = 'https://64098afed16b1f3ed6d5a4d4.mockapi.io/student';
}