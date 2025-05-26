import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/delayed_animation.dart';
import 'package:pub_eclair/features/authentication/models/sign_up_client_request_model.dart';
import 'package:pub_eclair/features/authentication/models/sign_up_client_response_model.dart';
import 'package:pub_eclair/features/authentication/screens/signin_page.dart';
import 'package:pub_eclair/features/authentication/services/api_service.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class SignUpToClientForm extends StatefulWidget {
  @override
  _SignUpToClientFormState createState() => _SignUpToClientFormState();
}

class _SignUpToClientFormState extends State<SignUpToClientForm> {
  final _formKey = GlobalKey<FormState>(); 
  final _lastNameController = TextEditingController();// clé du formulaire
  final _firstNameController = TextEditingController();// clé du formulaire
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureText = true;
  bool _termsOfUse = false;
  bool _termsOfUseError = false;
  bool _privacyPolicy = false;
  bool _privacyPolicyError = false;
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
              delay: 1000,
              child: TextFormField(
                controller:_lastNameController,
                style: GoogleFonts.poppins(color: TColors.primary),
                obscureText: false,
                decoration: InputDecoration(
                  focusColor: TColors.primary,
                  labelStyle: GoogleFonts.poppins(color: TColors.black),
                  labelText: TTexts.lastName,
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Veuillez entrez votre nom";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimationClassName(
              delay: 1000,
              child: TextFormField(
                controller:_firstNameController,
                style: GoogleFonts.poppins(color: TColors.primary),
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: TColors.black),
                  labelText: TTexts.firstName,
                ),
                                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Veuillez entrez votre nom";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimationClassName(
              delay: 1000,
              child: TextFormField(
                controller:_emailController,
                style: GoogleFonts.poppins(color: TColors.primary),
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: TColors.black),
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
              delay: 1000,
              child: TextFormField(
                controller:_phoneNumberController,
                style: GoogleFonts.poppins(color: TColors.primary),
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: TColors.black),
                  labelText: TTexts.phoneNumber,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrez votre numéro de téléphone";
                  }
                  if (value.length < 10 || value.length > 10 || !RegExp(r"^\d+$").hasMatch(value)) {
                    return "Veuillez entrez un numéro de téléphone valide";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimationClassName(
              delay: 1000,
              child: TextFormField(
                controller:_passwordController,
                style: GoogleFonts.poppins(color: TColors.primary),
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: TColors.black),
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
                    return "Veuillez entrez créer un mot de passe";
                  }
                  if (value.length < 8) {
                    return "Le mot de passe est trop court";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimationClassName(
              delay: 1000,
              child: TextFormField(
                controller:_confirmPasswordController,
                style: GoogleFonts.poppins(color: TColors.primary),
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: TColors.black),
                  labelText: TTexts.confirmPassword,
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
                    return "Veuillez entrez le même mot de passe";
                  }
                  if (value != _passwordController.text) {
                    return "Le mot de passe de confirmation doit être identiques au mot de passe";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimationClassName(
              delay: 1000,
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _termsOfUse, 
                        onChanged: (value) {
                          setState(() {
                             _termsOfUse = value ?? false;
                          if(_termsOfUse) _termsOfUseError = false;
                          });
                        }
                        ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          TTexts.termsOfUse,
                          style: GoogleFonts.poppins(color: TColors.primary),
                        ),
                      ),
                    ],
                  ),
                  if (_termsOfUseError)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Vous devez cocher cette case pour continuer.",
                        style: TextStyle(color: TColors.error),
                      ),
                    ),
                ],
              )
            ),
            SizedBox(height: 30),
            DelayedAnimationClassName(
              delay: 1000,
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _privacyPolicy, 
                        onChanged: (value) {
                          setState(() {
                            _privacyPolicy = value ?? false;
                            if(_privacyPolicy) _privacyPolicyError = false;
                          });
                        }
                        ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          TTexts.privacyPolicy,
                          style: GoogleFonts.poppins(color: TColors.primary),
                        ),
                      ),
                    ],
                  ),
                                    if (_privacyPolicyError)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Vous devez cocher cette case pour continuer.",
                        style: TextStyle(color: TColors.error),
                      ),
                    ),
                ],
              )
            ),
             SizedBox(height: 50),
            DelayedAnimationClassName(
              delay: 1500,
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
                    _termsOfUseError = !_termsOfUse;
                    _privacyPolicyError = !_privacyPolicy;
                    if (_formKey.currentState!.validate() && validateAndSave()) {
                      SignUpClientRequestModel model = SignUpClientRequestModel(
                        lastName: _lastNameController.text,
                        firstname: _firstNameController.text,
                        email: _emailController.text,
                        phoneNumber: "+255-${_phoneNumberController.text}",
                        password: _passwordController.text
                      );
                      APIService.register(model);
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Inscription réussie")),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SigninPage(),
                        ),
                      );
                    }
                  }
                  ,
                  child: Text(
                    TTexts.signup,
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
