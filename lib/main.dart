import 'package:flutter/material.dart';
import 'package:haksikhelper/cushome.dart' as cus;
import 'package:haksikhelper/style.dart' as style;
import 'package:haksikhelper/sellhome.dart' as cct;
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MaterialApp(
      theme: style.theme,
      home:MyApp()
  ));
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
      body:[cus.customerHome(),cct.MyHomePage()][tab],
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
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_rounded),label: '학생식당')
        ],),
    );
  }
}

class Seller extends StatelessWidget {
  const Seller({Key? key,this.inst}) : super(key: key);
  final inst;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class Customer extends StatelessWidget {
  const Customer({Key? key,this.inst}) : super(key: key);
  final inst;
  isNotEmpty(){
    if (inst==null){return 0;}
    else {return 1;}
  }
  @override
  Widget build(BuildContext context) {
    print(inst);
    if (inst.isNotEmpty) {
      return ListView.builder(itemCount: 3, itemBuilder: (c, i){
        return Column(
          children: [
            Image.network(inst[i]['image']),
            Container(
              constraints: BoxConstraints(maxWidth: 600),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('좋아요 '),
                      Text(inst[i]['likes'].toString()),
                    ],
                  ),
                  Text(inst[i]['user']),
                  Text(inst[i]['content']),
                ],
              ),
            )
          ],
        );
      });
    }
    else {return Text('로딩중');}

  }
}



