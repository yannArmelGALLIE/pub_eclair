import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pub_eclair/common/widgets/appBar/appBar.dart';
import 'package:pub_eclair/common/widgets/images/t_circular_image.dart';
import 'package:pub_eclair/common/widgets/texts/section_heading.dart';
import 'package:pub_eclair/features/authentication/config.dart';
import 'package:pub_eclair/features/personalization/models/advertiser_model.dart';
import 'package:pub_eclair/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileAdvertiserScreen extends StatefulWidget {
  const ProfileAdvertiserScreen({super.key});

  @override
  State<ProfileAdvertiserScreen> createState() =>
      _ProfileAdvertiserScreenState();
}

class _ProfileAdvertiserScreenState extends State<ProfileAdvertiserScreen> {
  AdvertiserModel? advertiser;
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
      final url = Uri.http(Config.apiUrl, Config.advertiserProfilAPI(userId));

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          advertiser = AdvertiserModel.fromJson(jsonData);
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
      appBar: const TAppBar(showBackArrow: false, title: Text(TTexts.profile)),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : advertiser == null
              ? const Center(child: Text("Erreur de chargement."))
              : SingleChildScrollView(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.sweat,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        TTexts.changeProfilePicture,
                        style: TextStyle(color: TColors.textPrimary),
                      ),
                    ),
                    const Divider(),
                    const TSectionHeading(
                      title: "Informations sur l'établissement",
                      showActionButton: false,
                    ),
                    TProfileMenu(
                      title: TTexts.store,
                      value: advertiser!.nameShop,
                      onPressed: () {},
                    ),
                    TProfileMenu(
                      title: TTexts.geolocation,
                      value: advertiser!.location,
                      onPressed: () {},
                    ),
                    const Divider(),
                    const TSectionHeading(
                      title: "Informations sur le propiétaire",
                      showActionButton: false,
                    ),
                    TProfileMenu(
                      title: TTexts.advertiserLastName,
                      value: advertiser!.advertiserLastName,
                      onPressed: () {},
                    ),
                    TProfileMenu(
                      title: TTexts.advertiserFirstName,
                      value: advertiser!.advertiserFirstName,
                      onPressed: () {},
                    ),
                    TProfileMenu(
                      title: TTexts.email,
                      value: advertiser!.email,
                      onPressed: () {},
                    ),
                    TProfileMenu(
                      title: TTexts.phoneNumber,
                      value: advertiser!.phoneNumber,
                      onPressed: () {},
                    ),
                    TProfileMenu(
                      title: "ID du compte",
                      value: advertiser!.id,
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
                    ),
                  ],
                ),
              ),
    );
  }
}
