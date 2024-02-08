import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/constant.dart';
import 'profile_edit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: GoogleFonts.inter(),
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          Offstage(
            offstage: false,
            child: Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.deepPurpleAccent,
                surfaceTintColor: Colors.deepPurpleAccent,
                elevation: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(
                        "your Account isn't verified",
                        style: GoogleFonts.inter(
                            fontSize: 20, color: Colors.white),
                      ),
                      s5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          s25,
                          RichText(
                            text: TextSpan(
                                text:
                                    "if you won't verify your account ,you can't use \nsome features  ",
                                style: GoogleFonts.inter(
                                    color: Colors.white, fontSize: 14),
                                children: [
                                  TextSpan(
                                      text: ' verify now',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ]),
                            softWrap: true,
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                      s5,
                    ],
                  ),
                )),
          ),
          ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfileSettings())),
              title: Text(
                "Account",
                style: GoogleFonts.inter(fontSize: 19),
              ),
              subtitle: const Text("Manage your account informations, change password, logout, etc"),
              leading: const Icon(
                Icons.key_sharp,
                size: 22,
              )),
          ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              title: Text(
                "Prenium",
                style: GoogleFonts.inter(fontSize: 19),
              ),
              subtitle: const Text("Manage your prenium features"),
              leading: const Icon(
                Icons.lock,
                size: 22,
              )),
          ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              title: Text(
                "Privacy",
                style: GoogleFonts.inter(fontSize: 19),
              ),
              subtitle: const Text("Manage your privacy settings"),
              leading: const Icon(
                Icons.privacy_tip_sharp,
                size: 22,
              )),
          ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              title: Text(
                "Help",
                style: GoogleFonts.inter(fontSize: 19),
              ),
              subtitle: const Text("Help center, contact us, privacy policy"),
              leading: const Icon(
                Icons.help_center_sharp,
                size: 22,
              ))
        ],
      ),
    );
  }
}
