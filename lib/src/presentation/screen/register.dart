import 'package:app_widya_edu/src/data/data_source/auth_data_source.dart';
import 'package:app_widya_edu/src/presentation/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_string.dart';
import '../widgets/buttonRegister.dart';
import '../widgets/textFieldRegister.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

AuthDataSource? register;

final emailUserAktif = FirebaseAuth.instance.currentUser?.email;
final iconUserAktif = FirebaseAuth.instance.currentUser?.photoURL;
final nameUserAktif = FirebaseAuth.instance.currentUser?.displayName;

String? namaLengkap;
String? asaLSekolah;
String? jenjang;
String? gender;
String? kelas;
TextEditingController textEditingControllerEmail =
    TextEditingController(text: emailUserAktif);
TextEditingController textEditingControllerNamaLengkap =
    TextEditingController(text: namaLengkap);
TextEditingController textEditingControllerAsalSekolah =
    TextEditingController(text: asaLSekolah);
TextEditingController textEditingControllerJenjang =
    TextEditingController(text: jenjang);
TextEditingController textEditingControllerGender =
    TextEditingController(text: gender);
TextEditingController textEditingControllerKelas =
    TextEditingController(text: kelas);

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.sizeOf(context);

    List<bool> isSelected = [false, false];

    String dropdownValue = 'IPA';
    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          AppString.yuk,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Column(
              children: [
                // Text(emailUserAktif!),
                SizedBox(height: 20),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        enabled: false,
                        label: Text(emailUserAktif!),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(214, 214, 214, 1),
                          ),
                        )),
                  ),
                ]),
                // textFieldRegister(emailUserAktif!, AppString.masukanEmail),
                SizedBox(height: 20),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Lengkap',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: textEditingControllerNamaLengkap,
                    decoration: InputDecoration(
                        hintText: 'Masukan Nama Lengkap',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(214, 214, 214, 1),
                          ),
                        )),
                  ),
                ]),
                SizedBox(height: 20),
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Jenis Kelamin",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: textEditingControllerGender,
                      decoration: InputDecoration(
                          hintText: 'Laki-laki atau Perempuan',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(214, 214, 214, 1),
                            ),
                          )),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Kelas",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: textEditingControllerKelas,
                          decoration: InputDecoration(
                              hintText: 'IPA, IPS, BAHASA INDONESIA',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(214, 214, 214, 1),
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Asal Sekolah',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: textEditingControllerAsalSekolah,
                        decoration: InputDecoration(
                            hintText: 'Masukan Nama Asal Sekolah',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(214, 214, 214, 1),
                              ),
                            )),
                      ),
                    ]),
                    SizedBox(height: 60),
                    InkWell(
                      onTap: () async {
                        // if (emailUserAktif !=
                        //     FirebaseAuth.instance.currentUser) {
                        //   await AuthDataSource().register(
                        //       textEditingControllerEmail.text,
                        //       textEditingControllerNamaLengkap.text,
                        //       textEditingControllerAsalSekolah.text,
                        //       textEditingControllerJenjang.text,
                        //       textEditingControllerGender.text,
                        //       textEditingControllerKelas.text);
                        // }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        width: sizeScreen.width * 0.8,
                        height: sizeScreen.height * 0.08,
                        child: Center(
                            child: Text(
                          "DAFTAR",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
