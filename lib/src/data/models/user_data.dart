class UserDataEmail {
  final String? id;
  String? user_name;
  String? email;
  String? userWhatsapp;
  String? foto;
  String? userPropinsi;
  String? userKabupaten;
  String? sosmed;
  String? userPropSekolah;
  String? userKabSekolah;
  String? asal_sekolah;
  String? kelas;
  String? jenjang;
  String? gender;
  String? userPropinsiId;
  String? userPropSekolahId;
  String? userKabSekolahId;
  String? classFk;
  String? tahun_lulus;

  UserDataEmail(
      {this.asal_sekolah,
      this.email,
      this.id,
      this.foto,
      this.gender,
      this.jenjang,
      this.kelas,
      this.user_name,
      this.userWhatsapp,
      this.classFk,
      this.sosmed,
      this.userKabSekolah,
      this.userKabSekolahId,
      this.userKabupaten,
      this.userPropSekolah,
      this.userPropSekolahId,
      this.userPropinsi,
      this.userPropinsiId,
      this.tahun_lulus});

  factory UserDataEmail.fromJson(Map<String, dynamic> json) => UserDataEmail(
        id: json["iduser"],
        user_name: json["user_name"],
        email: json["user_email"],
        foto: json["user_foto"],
        kelas: json["kelas"],
        jenjang: json["jenjang"],
        gender: json["user_gender"],
        asal_sekolah: json["user_asal_sekolah"],
        userWhatsapp: json["user_whaysapp"],
        userPropinsi: json["user_propinsi"],
        userKabupaten: json["user_kabupaten"],
        sosmed: json["sosmed"],
        userPropSekolah: json["user_prop_sekolah"],
        userKabSekolah: json["user_kab_sekolah"],
        userPropinsiId: json["user_propinsi_id"],
        userPropSekolahId: json["user_prop_sekolah_id"],
        userKabSekolahId: json["user_kab_sekolah_id"],
        classFk: json["class_fk"],
        tahun_lulus: json["tahun_lulus"],
      );

  // Map<String, dynamic> toJson() => {
  //       "iduser": iduser,
  //       "user_name": userName,
  //       "user_email": userEmail,
  //       "user_whatsapp": userWhatsapp,
  //       "user_foto": userFoto,
  //       "user_propinsi": userPropinsi,
  //       "user_kabupaten": userKabupaten,
  //       "sosmed": sosmed,
  //       "user_prop_sekolah": userPropSekolah,
  //       "user_kab_sekolah": userKabSekolah,
  //       "user_asal_sekolah": userAsalSekolah,
  //       "kelas": kelas,
  //       "uniqcode": uniqcode,
  //       "referral": referral,
  //       "date_create": dateCreate?.toIso8601String(),
  //       "jenjang": jenjang,
  //       "user_gender": userGender,
  //       "user_propinsi_id": userPropinsiId,
  //       "user_prop_sekolah_id": userPropSekolahId,
  //       "user_kab_sekolah_id": userKabSekolahId,
  //       "user_token": userToken,
  //       "verified_phone": verifiedPhone,
  //       "user_status": userStatus,
  //       "apple_id": appleId,
  //       "class_fk": classFk,
  //     };
}
