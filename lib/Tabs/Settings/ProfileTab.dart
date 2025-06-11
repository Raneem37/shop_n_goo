import 'package:flutter/material.dart';
import 'package:shop_n_goo/AppTheme.dart';
import 'Edit_Profile.dart';
import 'About_us.dart';
import 'Privacy_policy.dart';
import 'package:provider/provider.dart';
import 'SettingsProvider.dart';

class Profiletab extends StatefulWidget {
  static const String routeName = "Profiletab";

  @override
  State<Profiletab> createState() => _ProfiletabState();
}

class _ProfiletabState extends State<Profiletab> {
  List<Language> languages = [
    Language(name: "English", code: "En"),
    Language(name: "العربيه", code: "Er"),
  ];

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppTheme.Bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.06),
          // child: Icon(Icons.settings, color: AppTheme.darkGreen),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: AppTheme.darkGreen,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.07,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: ListView(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.08,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: screenWidth * 0.1, color: AppTheme.white),
                ),
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: Text(
                    "Raneem Anwar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.055,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.08),

            // Account Settings
            Text(
              "Account Settings",
              style: TextStyle(
                color: Color(0xFF808080),
                fontSize: screenWidth * 0.035,
              ),
            ),
            SizedBox(height: screenWidth * 0.025),

            buildListTile(
              "Edit Profile",
              AppTheme.darkGreen,
              onTap: () {
                Navigator.pushNamed(context, EditProfile.routeName);
              },
              fontSize: screenWidth * 0.04,
            ),

            SizedBox(height: screenWidth * 0.02),

            // Language Dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language ',
                  style: TextStyle(color: AppTheme.darkGreen, fontSize: screenWidth * 0.04),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<Language>(
                    value: languages.first,
                    items: languages
                        .map((language) => DropdownMenuItem<Language>(
                      value: language,
                      child: Text(language.name),
                    ))
                        .toList(),
                    onChanged: (selectedLanguage) {},
                  ),
                ),
              ],
            ),

            SizedBox(height: screenWidth * 0.02),

            // Allow Notification Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Allow Notification',
                  style: TextStyle(color: AppTheme.darkGreen, fontSize: screenWidth * 0.04),
                ),
                Switch(
                  value: settingProvider.allowNotification,
                  onChanged: (value) {
                    settingProvider.toggleNotification(value);
                  },
                ),
              ],
            ),

            SizedBox(height: screenWidth * 0.02),

            // Dark Mode Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode', style: TextStyle(color: AppTheme.darkGreen, fontSize: screenWidth * 0.04)),
                Switch(
                  value: settingProvider.themeMode == ThemeMode.dark,
                  onChanged: (isDark) {
                    settingProvider.ChangeTheme(isDark ? ThemeMode.dark : ThemeMode.light);
                  },
                ),
              ],
            ),

            SizedBox(height: screenWidth * 0.08),

            // More
            Text(
              "More",
              style: TextStyle(
                color: Color(0xFF808080),
                fontSize: screenWidth * 0.035,
              ),
            ),
            SizedBox(height: screenWidth * 0.025),

            buildListTile(
              "About us",
              AppTheme.darkGreen,
              fontSize: screenWidth * 0.04,
              onTap: () {
                Navigator.pushNamed(context, AboutUs.routeName);
              },
            ),
            buildListTile(
              "Privacy Policy",
              AppTheme.darkGreen,
              fontSize: screenWidth * 0.04,
              onTap: () {
                Navigator.pushNamed(context, PrivacyPolicy.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String title, Color color,
      {IconData icon = Icons.chevron_right, VoidCallback? onTap, double fontSize = 16}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        title,
        style: TextStyle(color: color, fontSize: fontSize),
      ),
      trailing: Icon(icon, color: color),
      onTap: onTap,
    );
  }
}

class Language {
  String name;
  String code;

  Language({required this.name, required this.code});
}
