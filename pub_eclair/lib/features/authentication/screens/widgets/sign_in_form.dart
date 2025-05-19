import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/delayed_animation.dart';
import 'package:pub_eclair/navigation_menu.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>(); // clé du formulaire
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 30),
            DelayedAnimationClassName(
              delay: 1500,
              child: TextFormField(
                controller: _emailController,
                style: GoogleFonts.poppins(color: TColors.primary),
                obscureText: false,
                decoration: InputDecoration(
                  focusColor: TColors.primary,
                  labelStyle: GoogleFonts.poppins(color: TColors.black),
                  labelText: TTexts.email,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrez votre email";
                  }
                  if (!RegExp(r"^\S+@\S+\.\S+$").hasMatch(value)) {
                    return "Veuillez entrez un email valide";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimationClassName(
              delay: 1500,
              child: TextFormField(
                controller: _passwordController,
                style: GoogleFonts.poppins(color: TColors.primary),
                obscureText: _obscureText,
                decoration: InputDecoration(
                  focusColor: TColors.primary,
                  labelStyle: GoogleFonts.poppins(color: TColors.black),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(Icons.visibility, color: Colors.black),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrez votre mot de passe";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimationClassName(
              delay: 1500,
              child: Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;;
                      });
                    },
                  ),
                  Text(
                    TTexts.rememberMe,
                    style: GoogleFonts.poppins(
                      color: TColors.textPrimary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimationClassName(
              delay: 1500,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  TTexts.forgetPassword,
                  style: GoogleFonts.poppins(
                    color: TColors.textSecondary,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            DelayedAnimationClassName(
              delay: 2000,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: TColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Connexion réussie")),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavigationMenu(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    TTexts.signIn,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
