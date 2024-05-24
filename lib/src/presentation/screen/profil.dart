import 'package:app_widya_edu/src/data/data_source/user_email.dart';
import 'package:app_widya_edu/src/presentation/screen/edit_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_string.dart';
import '../../data/models/user_data.dart';
import '../widgets/button_logout_profile.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  final String? email;
  Profile({super.key, this.email});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final emailUserAktif = FirebaseAuth.instance.currentUser?.email;
  final iconUserAktif = FirebaseAuth.instance.currentUser?.photoURL;
  final nameUserAktif = FirebaseAuth.instance.currentUser?.displayName;

  Future<UserDataEmail?>? _user;

  @override
  void initState() {
    super.initState();
    _user = GetUserEmail.connectApi(widget.email ?? 'no email');
  }

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to log out: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Akun Saya"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditProfileScreen(email: AppString.constEmail),
                ),
              );
            },
            child: Text(
              "Edit",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<UserDataEmail?>(
          future: _user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No user found'));
            } else {
              UserDataEmail? user = snapshot.data;
              return user == null
                  ? Center(child: Text('No user found'))
                  : Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.only(
                              left: 40, right: 40, top: 10, bottom: 30),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nameUserAktif!,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    emailUserAktif!,
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(iconUserAktif!),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(
                              top: 30, bottom: 30, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 4,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          width: sizeScreen.width * 0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Identitas Diri",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 30),
                              Text(
                                AppString.nama,
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${user.user_name}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 15),
                              Text(
                                AppString.email,
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                emailUserAktif!,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Jenis Kelamin",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${user.gender}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Kelas",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${user.kelas}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Sekolah",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${user.asal_sekolah}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Propinsi",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${user.userPropinsi}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Kabupaten Sekolah",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${user.userKabSekolah}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Propinsi Sekolah",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${user.userPropSekolah}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Kabupaten Sekolah",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${user.userKabSekolah}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Sosmed",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${user.sosmed}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Jenjang",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '${user.jenjang}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                        InkWell(
                          onTap: _logout,
                          child: buttonLogoutProfile(sizeScreen: sizeScreen),
                        ),
                      ],
                    );
            }
          },
        ),
      ),
    );
  }
}
