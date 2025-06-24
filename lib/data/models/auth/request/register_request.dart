class RegisterRequest {
  RegisterRequest(
      this.firstName,
      this.lastName, 
      this.email, 
      this.password, 
      this.gender,);

  String firstName;
  String lastName;
  String email;
  String password;
  String gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['password'] = password;
    map['gender'] = gender;
    return map;
  }

}