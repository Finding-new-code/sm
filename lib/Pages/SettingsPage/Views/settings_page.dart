import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/SettingsPage/Views/profile_edit.dart';
import 'package:myapp658d7b3746ed317621f8/constants/tools.dart';

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
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 30),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileEdit())),
              title: Text(
                "Account",
                style: GoogleFonts.inter(
                  fontSize: 19
                ),
              ),
              subtitle: const Text("Edit your account, change number"),
              leading: const Icon(
                Icons.key_sharp,
                size: 22,
              )),
               ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              title: Text(
                "Prenium",
                style: GoogleFonts.inter(
                  fontSize: 19
                ),
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
                style: GoogleFonts.inter(
                  fontSize: 19
                ),
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
                style: GoogleFonts.inter(
                  fontSize: 19
                ),
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
