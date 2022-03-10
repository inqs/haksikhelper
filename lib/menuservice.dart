import 'package:cloud_firestore/cloud_firestore.dart';

class MenuService{
  FirebaseFirestore? _instance;
  List<Map> _menuList = [];
  List<Map> getMenu(){
    return _menuList;
  }
  Future<void> getMenuFromFirestore() async{
    _instance = FirebaseFirestore.instance;

    CollectionReference menuList = _instance!.collection('Mon');

    DocumentSnapshot snapshot = await menuList.doc('sikdan').get();
    var data = snapshot.data() as Map;
    var sikdanData = data['sikdan'] as List<Map>;

  }
}