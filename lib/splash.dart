import 'package:flutter/material.dart';

class homeImage extends StatelessWidget {
  const homeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
          image:DecorationImage(image: AssetImage('assets/inu.png'),fit: BoxFit.cover)),

    );
  }
}


class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds:  this.duration), (){
        Navigator.push(
          context, MaterialPageRoute(builder: (context)=>this.goToPage)
        );
    });
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: homeImage(),
      ),
    );
  }
}
