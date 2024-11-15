import 'package:flutter/material.dart';
import 'package:genshin_character/navigation_bar/bottom_navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDB010),
      body: SafeArea(
        child: Stack(
          children: [
            // Align the first image to the top center
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'images/icon_genshin.png',
                  width: 300,
                ),
              ),
            
            Positioned(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(
                  top: 140
                ),
                child: Image.asset(
                  'images/bg.png',
                  height: 500,
                  width: 360,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              bottom: 50,
              left: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    Size(300, 50)
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFFFDBB54)
                  )
                ),
                onPressed:(){
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context){
                      return BottomNavBar();
                    }),
                    );
                }, 
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
