import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/delayed_animation.dart';
import 'package:pub_eclair/features/authentication/models/sign_in_advertiser_request_model.dart';
import 'package:pub_eclair/features/authentication/models/sign_in_request_model.dart';
import 'package:pub_eclair/features/authentication/services/api_advertiser_service.dart';
import 'package:pub_eclair/features/authentication/services/api_service.dart';
import 'package:pub_eclair/navigation_advertiser_menu.dart';
import 'package:pub_eclair/navigation_menu.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class SignInAdvertiserForm extends StatefulWidget {
  @override
  _SignInAdvertiserFormState createState() => _SignInAdvertiserFormState();
}

class _SignInAdvertiserFormState extends State<SignInAdvertiserForm> {
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
                        _rememberMe = value ?? false;
                        ;
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
              child: Builder(
                builder: (BuildContext scaffoldContext) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: TColors.primary,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            validateAndSave()) {
                          SignInAdvertiserRequestModel model = SignInAdvertiserRequestModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                  
                          bool isLoggedIn = await APIAdvertiserService.loginAdvertiser(model);
                  
                          if (isLoggedIn) {
                            ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                              const SnackBar(content: Text("Connexion réussie")),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationAdvertiserMenu(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                              const SnackBar(
                                content: Text("Email ou mot de passe incorrect"),
                              ),
                            );
                          }
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
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
