import 'package:flutter/material.dart';
import 'package:haksikhelper/cushome.dart' as cus;
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
        home:SplashPage(duration: 3, goToPage: wel.WelcomePage(),),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var data = 0;

  //getData() async{
  //  var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
  //  var result2 = jsonDecode(result.body);
  //  setState(() {
  //    data = result2;
  //  });
  //}


  @override
  void initState() {
    super.initState();
    //getData();
    print(data);
  }
  @override

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text('학식 도우미',textAlign: TextAlign.left, style: TextStyle(color: Colors.black26),),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add_box_outlined),iconSize: 40,)],),
      body:[cus.customerHome(),wel.WelcomePage()][tab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i){
          setState(() {
            tab = i;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people),label: '학생'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_rounded),label: '학생식당'),
        ],),
    );
  }
}









