import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);
enum UserType { user, bussiness }
const Map<UserType, String> UserMap = {
  UserType.user: 'USER',
  UserType.bussiness: 'BUSSINESS'
};
const baseUrl = 'http://pt.frantic.in';
final logo = Image.asset('images/logo.png');
const kColor = Color(0xff800080);
const kPadding = EdgeInsets.only(left: 10, top: 10);
