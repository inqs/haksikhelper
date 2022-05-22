import 'package:flutter/material.dart';
import 'package:haksikhelper/cushome.dart';
import 'package:haksikhelper/sellhome.dart';
import 'package:haksikhelper/signup.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/haksik.png',
                fit: BoxFit.cover,
              ),
            )),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 350,
                      height: 120,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/INUsym.jpeg'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.all(Radius.circular(60.0))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '인천대 학식 도우미',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.grey,
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(15),
                            shape: StadiumBorder()),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>customerHome())
                          );
                        },
                        child: Text(
                          '학생용 페이지 접속',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.grey,
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(15),
                            shape: StadiumBorder()),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>LoginSignupScreen())
                          );
                        },
                        child: Text(
                          '영양사용 페이지 접속',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
