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
