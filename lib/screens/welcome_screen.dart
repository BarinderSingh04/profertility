import 'package:flutter/material.dart';
import 'package:profertility/screens/theme/colors.dart';
class WelcomeScreen extends StatelessWidget {
const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(ThemeColor.primaryColor),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(image: DecorationImage(image: 
        AssetImage("assets/images/welcomebg.png"),fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("assets/images/welcomecenterbg.png")),
              const SizedBox(height: 37,),
          const Text("Welcome to Profertility",style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white          ),),  
                          const SizedBox(height: 16,),

            const Text("Lorem Ipsum is simply dummy text of \n the printing and typesetting industry.", textAlign: TextAlign.center, style: TextStyle(
            fontSize: 14,
            color: Colors.white          ),),
          ],
        ),
      )
    );
  }
}