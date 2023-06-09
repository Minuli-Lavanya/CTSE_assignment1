class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? phoneNum;

  UserModel({this.uid, this.email, this.firstName, this.secondName, this.phoneNum});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      phoneNum: map['phoneNum'],
    );
  }

  // sending data to our servers
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'phoneNum': phoneNum,
    };
  }
}