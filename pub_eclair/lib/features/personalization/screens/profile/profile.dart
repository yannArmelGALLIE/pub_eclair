import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pub_eclair/common/widgets/appBar/appBar.dart';
import 'package:pub_eclair/common/widgets/images/t_circular_image.dart';
import 'package:pub_eclair/common/widgets/texts/section_heading.dart';
import 'package:pub_eclair/features/authentication/config.dart';
import 'package:pub_eclair/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';
import 'package:pub_eclair/features/personalization/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? user;
  bool isLoading = true;

  @override
void initState() {
  super.initState();
  _loadUserIdAndFetchProfile();
}

Future<void> _loadUserIdAndFetchProfile() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getString('user_id');

  if (userId != null) {
    fetchUser(userId);
  } else {
    print("Aucun ID utilisateur trouvé.");
    setState(() {
      isLoading = false;
    });
  }
}

Future<void> fetchUser(String userId) async {
  try {
    final url = Uri.http(
      Config.apiUrl,
      Config.clientProfilAPI(userId),
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        user = UserModel.fromJson(jsonData);
        isLoading = false;
      });
    } else {
      print("Erreur backend: ${response.statusCode} - ${response.body}");
      setState(() {
        isLoading = false;
      });
    }
  } catch (e) {
    print("Erreur réseau : $e");
    setState(() {
      isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text(TTexts.profile),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : user == null
              ? const Center(child: Text("Erreur de chargement."))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      const TCircularImage(
                        image: TImages.logoUser,
                        width: 80,
                        height: 80,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          TTexts.changeProfilePicture,
                          style: TextStyle(
                            color: TColors.textPrimary,
                          ),
                        ),
                      ),
                      const Divider(),
                      const TSectionHeading(
                          title: TTexts.profileInformations,
                          showActionButton: false),
                      TProfileMenu(
                        title: TTexts.lastName,
                        value: user!.lastName,
                        onPressed: () {},
                      ),
                      TProfileMenu(
                        title: TTexts.firstName,
                        value: user!.firstName,
                        onPressed: () {},
                      ),
                      const Divider(),
                      const TSectionHeading(
                          title: TTexts.personalInformations,
                          showActionButton: false),
                      TProfileMenu(
                        title: TTexts.email,
                        value: user!.email,
                        onPressed: () {},
                      ),
                      TProfileMenu(
                        title: TTexts.phoneNumber,
                        value: user!.phoneNumber,
                        onPressed: () {},
                      ),
                      TProfileMenu(
                        title: TTexts.userID,
                        value: user!.id,
                        icon: Icons.copy,
                        onPressed: () {},
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          TTexts.closeAccount,
                          style: TextStyle(color: TColors.error),
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
