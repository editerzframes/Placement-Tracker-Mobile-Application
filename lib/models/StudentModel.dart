class StudentModel {
  final dynamic name;
  final dynamic rollNumber;
  final dynamic tenth;
  final dynamic twelfth;
  final dynamic cgpa;
  final dynamic course;
  final dynamic email;
  final dynamic password;
  StudentModel(
      {this.name,
      this.rollNumber,
      this.tenth,
      this.twelfth,
      this.cgpa,
      this.course,
      this.email,
      this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "name":name,
      "rollNumber":rollNumber,
      "tenth":tenth,
      "twelfth":twelfth,
      "cgpa":cgpa,
      "course":course,
      "email":email,
      "password":password,
    };
  }
}
