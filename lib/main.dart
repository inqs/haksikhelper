import 'package:flutter/material.dart';
import 'package:haksikhelper/cushome.dart' as cus;
import 'package:haksikhelper/realtimeChart.dart';
import 'package:haksikhelper/style.dart' as style;
import 'package:haksikhelper/sellhome.dart' as cct;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haksikhelper/splash.dart';
import 'package:haksikhelper/welcomPage.dart' as wel;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
        theme: style.theme,
        debugShowCheckedModeBanner: false,
        home: SplashPage(duration: 3, goToPage: wel.WelcomePage(),),
    ),
  );
}