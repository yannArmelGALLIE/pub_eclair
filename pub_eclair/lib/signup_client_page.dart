import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/delayed_animation.dart';
import 'package:pub_eclair/navigation_menu.dart';
import 'package:pub_eclair/utils/constants/colors.dart';

class SignupClientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnimationClassName(
                    delay: 1500, 
                    child: Text(
                      "Inscrivez vous en tant que client",
                      style: GoogleFonts.poppins(
                        color: TColors.primary,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            SignUpForm(),
            SizedBox(height: 50),
            DelayedAnimationClassName(
              delay: 3500, 
              child : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 125,
                          vertical: 13,
                        ),
                      backgroundColor: TColors.primary,
                      foregroundColor: Colors.white,
                    ),
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => NavigationMenu()),
                  );
                }, 
                child: Text(
                  'CONFIRMER',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var _obscureText = true;
  @override 
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          DelayedAnimationClassName(
            delay: 2500, 
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Nom',
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimationClassName(
            delay: 2500, 
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Prenoms',
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimationClassName(
            delay: 2500, 
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Email',
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimationClassName(
            delay: 2500, 
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Mot de passe',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                 icon: Icon(
                  Icons.visibility,
                  color: Colors.black,
                 ),
                )
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimationClassName(
            delay: 2500, 
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Confirmez votre mot de passe',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                 icon: Icon(
                  Icons.visibility,
                  color: Colors.black,
                 ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}