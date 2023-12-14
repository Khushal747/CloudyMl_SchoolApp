class TeaAttModel {
  String password;
  String phoneNumber;
  String address;
  String gender;
  String school;
  int rollNumber;
  String name;
  String batch;
  String parentsId;
  String section;
  int classNumber;
  String email;
  String UID;

  TeaAttModel({
    required this.password,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.school,
    required this.rollNumber,
    required this.name,
    required this.batch,
    required this.parentsId,
    required this.section,
    required this.classNumber,
    required this.email,
    required this.UID,
  });

  factory TeaAttModel.fromJson(Map<String, dynamic> json) {
    return TeaAttModel(
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      gender: json['gender'],
      school: json['school'],
      rollNumber: json['rollNumber'],
      name: json['name'],
      batch: json['batch'],
      parentsId: json['parents_id'],
      section: json['section'],
      classNumber: json['class'],
      email: json['email'],
      UID: json['UID'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['school'] = this.school;
    data['rollNumber'] = this.rollNumber;
    data['name'] = this.name;
    data['batch'] = this.batch;
    data['parents_id'] = this.parentsId;
    data['section'] = this.section;
    data['class'] = this.classNumber;
    data['email'] = this.email;
    data['UID'] = this.UID;
    return data;
  }
}
