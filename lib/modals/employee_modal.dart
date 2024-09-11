class EmployeeModel {
  String? createdAt;
  String? name;
  String? avatar;
  String? emailId;
  String? mobile;
  String? country;
  String? state;
  String? district;
  String? id;
  String? email;

  EmployeeModel(
      {this.createdAt,
      this.name,
      this.avatar,
      this.emailId,
      this.mobile,
      this.country,
      this.state,
      this.district,
      this.id,
      this.email});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      createdAt: json['createdAt'],
      name: json['name'],
      avatar: json['avatar'],
      emailId: json['emailId'],
      mobile: json['mobile'],
      country: json['country'],
      state: json['state'],
      district: json['district'],
      id: json['id'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'name': name,
      'avatar': avatar,
      'emailId': emailId,
      'mobile': mobile,
      'country': country,
      'state': state,
      'district': district,
      'id': id,
      'email': email,
    };
  }
}
