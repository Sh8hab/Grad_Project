import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/view/pages/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
          (context)=>LoginScreen(),
      ), (route) => true);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffcf7fe),
        body: ElasticInUp(
          duration: Duration(seconds: 3),
          // delay: Duration(seconds: 2),
          child: Image(
            image: AssetImage("assets/images/splash.JPG"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        )
    );
  }
}
