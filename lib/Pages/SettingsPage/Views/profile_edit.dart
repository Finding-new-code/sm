import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/src/cache.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';
import '../../AuthPage/View/authpage.dart';
import '../../AuthPage/bloc/auth_bloc.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Account'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              s10,
              ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileEdit())),
                  title: Text(
                    "Edit Account information",
                    style: GoogleFonts.inter(fontSize: 19),
                  ),
                  subtitle: const Text("Edit your account, change number"),
                  leading: const Icon(
                    Icons.key_sharp,
                    size: 22,
                  )),

              /// here the button for logout
              ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileEdit())),
                  title: Text(
                    "Account",
                    style: GoogleFonts.inter(fontSize: 19),
                  ),
                  subtitle: const Text("Edit your account, change number"),
                  leading: const Icon(
                    Icons.key_sharp,
                    size: 22,
                  )),

              /// here the button for logout
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLogoutSuccess) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthPage()));
                  }
                },
                builder: (context, state) {
                  return ListTile(
                      dense: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30),
                      onTap: () {
                        context.read<AuthBloc>().add(Logout());
                        Caches().clear('userId');
                      },
                      title: Text(
                        "Logout",
                        style: GoogleFonts.inter(
                            fontSize: 19, color: Colors.redAccent.shade700),
                      ),
                      subtitle: Text("Edit your account, change number",
                          style: GoogleFonts.inter(
                              fontSize: 14, color: Colors.redAccent.shade700)),
                      leading: Icon(
                        Icons.logout_sharp,
                        size: 22,
                        color: Colors.redAccent.shade700,
                      ));
                },
              ),
            ],
          ),
        ));
  }
}

class ProfileEdit extends StatelessWidget {
  ProfileEdit({super.key});
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _biocontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Account'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: GoogleFonts.inter(fontSize: 20),
              ),
              s5,

              /// textfield for name
              TextFormField(
                controller: _namecontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.deepPurpleAccent),
                  ),
                  hintText: 'name',
                  counterStyle: GoogleFonts.inter(color: Colors.transparent),
                  hintStyle: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
                maxLines: 1,
                maxLength: 40,
                style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
              ),

              Text(
                'Email',
                style: GoogleFonts.inter(fontSize: 20),
              ),
              s5,

              /// textfield for email
              TextFormField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.deepPurpleAccent),
                  ),
                  hintText: 'email',
                  counterStyle: GoogleFonts.inter(color: Colors.transparent),
                  hintStyle: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
                maxLines: 1,
                maxLength: 50,
                style:
                    GoogleFonts.inter(fontSize: 18, color: Colors.transparent),
              ),

              Text(
                'Bio',
                style: GoogleFonts.inter(fontSize: 20),
              ),
              s5,

              /// textfield for bio
              TextFormField(
                controller: _biocontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.deepPurpleAccent),
                  ),
                  hintText: 'bio',
                  counterStyle: GoogleFonts.inter(color: Colors.white),
                  hintStyle: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
                maxLines: 4,
                maxLength: 70,
                style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
              ),

              Text(
                'Phone',
                style: GoogleFonts.inter(fontSize: 20),
              ),
              s5,

              /// textfield for phone
              TextFormField(
                controller: _phonecontroller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.deepPurpleAccent),
                  ),
                  hintText: 'Phone',
                  counterStyle: GoogleFonts.inter(color: Colors.transparent),
                  hintStyle: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
                maxLines: 1,
                maxLength: 10,
                style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
