import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

String teamSelectValue = '';
TextEditingController shortBioController = new TextEditingController();
TextEditingController userNameController = new TextEditingController();
String userSelectValue1 = '';
String userSelectValue2 = '';
final formKey = GlobalKey<FormState>();
final scaffoldKey = GlobalKey<ScaffoldState>();

List<File> listFile = [];
