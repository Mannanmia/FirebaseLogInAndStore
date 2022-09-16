import 'package:flutter/material.dart';
class UserModel{
  String ? userId;
  String ? name;
  String ? phone;
  String ? email;

  UserModel({
      this.userId,
      this.name,
      this.phone,
      this.email});
  // get method
  factory UserModel.fromMap(map){
    return UserModel(
      userId: map["userId"],
      name: map["name"],
      phone: map["phone"],
      email: map["email"]
    );
  }
  //post method
  Map<String ,dynamic> toMap(){
    return{
      'userId':userId,
      'name':name,
      'phone':phone,
      'email':email,

    };
  }
}