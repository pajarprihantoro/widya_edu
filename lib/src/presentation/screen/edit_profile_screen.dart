import 'dart:io';
import 'package:app_widya_edu/src/data/data_source/user_email.dart';
import 'package:app_widya_edu/src/presentation/manager/profile/bloc/profile_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_string.dart';
import '../../data/models/user_data.dart';
import '../widgets/button_logout_profile.dart';
import 'login.dart';
import 'register.dart';

class EditProfileScreen extends StatefulWidget {
  final String? email;
  EditProfileScreen({super.key, this.email});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final emailUserAktif = FirebaseAuth.instance.currentUser?.email;
  final iconUserAktif = FirebaseAuth.instance.currentUser?.photoURL;
  final nameUserAktif = FirebaseAuth.instance.currentUser?.displayName;

  Future<UserDataEmail?>? _user;

  @override
  void initState() {
    super.initState();
    _user = GetUserEmail.connectApi(widget.email ?? 'no email');
  }

  UserDataEmail? _userData;

  void _updateUser() async {
    UserDataEmail updatedUserData = UserDataEmail(
        // Masukkan data pengguna yang diperbarui di sini
        );

    UserDataEmail? userData = await UpdateUser.updateUser(updatedUserData);

    if (userData != null) {
      setState(() {
        _userData = userData;
      });
      Alert(context: context, title: "berhasil", desc: "Flutter is awesome.")
          .show();
    } else {
      Alert(context: context, title: "gagal", desc: "Flutter is awesome.")
          .show();
    }
  }

  @override
  Widget build(BuildContext context) {
    XFile? pickedImage;
    Size sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.lightgrey,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Edit Akun"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<UserDataEmail?>(
          future: _user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No user found'));
            } else {
              UserDataEmail? user = snapshot.data;
              TextEditingController emailController =
                  TextEditingController(text: user?.email);
              TextEditingController nameController =
                  TextEditingController(text: user?.user_name);
              TextEditingController genderController =
                  TextEditingController(text: user?.gender);
              TextEditingController kelasController =
                  TextEditingController(text: user?.kelas);
              TextEditingController sekolahController =
                  TextEditingController(text: user?.asal_sekolah);
              TextEditingController sosmedController =
                  TextEditingController(text: user?.sosmed);
              TextEditingController waController =
                  TextEditingController(text: user?.userWhatsapp);
              TextEditingController fotoController =
                  TextEditingController(text: user?.foto);
              TextEditingController tahunLulusController =
                  TextEditingController(text: user?.tahun_lulus);

              TextEditingController propinsiIdController =
                  TextEditingController(text: user?.userPropinsiId);
              TextEditingController propinsiController =
                  TextEditingController(text: user?.userPropinsi);

              TextEditingController kabupatenController =
                  TextEditingController(text: user?.userKabupaten);

              TextEditingController propSekolahIdController =
                  TextEditingController(text: user?.userPropSekolahId);
              TextEditingController propSekolahController =
                  TextEditingController(text: user?.userPropSekolah);

              TextEditingController kabSekolahIdController =
                  TextEditingController(text: user?.userKabSekolahId);
              TextEditingController kabSekolahController =
                  TextEditingController(text: user?.userKabSekolah);
              TextEditingController jenjangController =
                  TextEditingController(text: user?.jenjang);
              TextEditingController classFkController =
                  TextEditingController(text: user?.classFk);

              return user == null
                  ? const Center(child: Text('No user found'))
                  : Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          (pickedImage == null)
                              ? InkWell(
                                  onTap: () async {
                                    pickedImage = await ImagePicker()
                                        .pickImage(source: ImageSource.camera);
                                    setState(() {});
                                  },
                                  child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(iconUserAktif!),
                                      radius: 50),
                                )
                              : InkWell(
                                  onTap: () async {
                                    pickedImage = await ImagePicker().pickImage(
                                        source: ImageSource.camera,
                                        imageQuality: 40);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.file(
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        File(pickedImage!.path)),
                                  ),
                                ),
                          Center(
                              child: BlocConsumer<ProfileBloc, ProfileState>(
                            listener: (context, state) {
                              if (state is UploadImageSuccess) {
                                print('Dowload Url : ${state.dowloadUrl}');
                              }
                            },
                            builder: (context, state) {
                              if (state is UploadImageLoading) {
                                return const CircularProgressIndicator();
                              }
                              return TextButton(
                                  onPressed: () {
                                    if (pickedImage == null) {
                                      print('image must be selected!');
                                      return;
                                    }

                                    context
                                        .read<ProfileBloc>()
                                        .add(UploadImageEvent(pickedImage!));
                                  },
                                  child: const Text('Update Foto'));
                            },
                          )),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 30, bottom: 30, left: 20, right: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 4,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              width: sizeScreen.width * 0.9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Identitas Diri",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    AppString.email,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                  Text(
                                    emailUserAktif!,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  // TextField(
                                  //   controller: emailController,
                                  //   decoration: const InputDecoration(
                                  //       labelText: 'Email'),
                                  // ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                        labelText: 'Name'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: genderController,
                                    decoration: const InputDecoration(
                                        labelText: 'Gender'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: kelasController,
                                    decoration: const InputDecoration(
                                        labelText: 'Kelas'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: sekolahController,
                                    decoration: const InputDecoration(
                                        labelText: 'Sekolah'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: classFkController,
                                    decoration: const InputDecoration(
                                        labelText: 'Class Fk'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: jenjangController,
                                    decoration: const InputDecoration(
                                        labelText: 'Jenjang'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: tahunLulusController,
                                    decoration: const InputDecoration(
                                        labelText: 'Tahun Lulus'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: waController,
                                    decoration: const InputDecoration(
                                        labelText: 'No Whatsapp'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: fotoController,
                                    decoration: const InputDecoration(
                                        labelText: 'Foto'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: sosmedController,
                                    decoration: const InputDecoration(
                                        labelText: 'Sosmed'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: kabupatenController,
                                    decoration: const InputDecoration(
                                        labelText: 'Kabupaten'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: propinsiIdController,
                                    decoration: const InputDecoration(
                                        labelText: 'Propinsi Id'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: propinsiController,
                                    decoration: const InputDecoration(
                                        labelText: 'Propinsi'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: propSekolahIdController,
                                    decoration: const InputDecoration(
                                        labelText: 'Propinsi Id Sekolah'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: propSekolahController,
                                    decoration: const InputDecoration(
                                        labelText: 'Propinsi Sekolah'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: kabSekolahIdController,
                                    decoration: const InputDecoration(
                                        labelText: 'Kabupaten Sekolah Id'),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: kabSekolahController,
                                    decoration: const InputDecoration(
                                        labelText: 'Kabupaten Sekolah'),
                                  ),
                                  const SizedBox(height: 40),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          user!.user_name = nameController.text;
                                          user.gender = genderController.text;
                                          user.kelas = kelasController.text;
                                          user.asal_sekolah =
                                              sekolahController.text;
                                          user.jenjang = jenjangController.text;
                                          user.tahun_lulus =
                                              tahunLulusController.text;
                                          user.classFk = classFkController.text;
                                          user.userWhatsapp = waController.text;
                                          user.email = emailController.text;
                                          user.foto = fotoController.text;
                                          user.sosmed = sosmedController.text;
                                          user.userKabupaten =
                                              kabupatenController.text;
                                          user.userPropinsiId =
                                              propinsiIdController.text;
                                          user.userPropinsi =
                                              propinsiController.text;
                                          user.userPropSekolahId =
                                              propSekolahIdController.text;
                                          user.userPropSekolah =
                                              propSekolahController.text;
                                          user.userKabSekolahId =
                                              kabSekolahIdController.text;
                                          user.userKabSekolah =
                                              kabSekolahController.text;
                                        });
                                        _updateUser();
                                      },
                                      child: Text('Update Data')),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            }
          },
        ),
      ),
    );
  }
}
