
class UserByEmailRespon {
    final int? status;
    final String? message;
    final UserData? data;

    UserByEmailRespon({
        this.status,
        this.message,
        this.data,
    });

    factory UserByEmailRespon.fromJson(Map<String, dynamic> json) => UserByEmailRespon(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class UserData {
    final String? iduser;
    final String? userName;
    final String? userEmail;
    final String? userWhatsapp;
    final String? userFoto;
    final String? userPropinsi;
    final String? userKabupaten;
    final String? sosmed;
    final String? userPropSekolah;
    final String? userKabSekolah;
    final String? userAsalSekolah;
    final String? kelas;
    final String? uniqcode;
    final String? referral;
    final DateTime? dateCreate;
    final String? jenjang;
    final String? userGender;
    final String? userPropinsiId;
    final String? userPropSekolahId;
    final String? userKabSekolahId;
    final String? userToken;
    final String? verifiedPhone;
    final String? userStatus;
    final String? appleId;
    final String? classFk;

    UserData({
        this.iduser,
        this.userName,
        this.userEmail,
        this.userWhatsapp,
        this.userFoto,
        this.userPropinsi,
        this.userKabupaten,
        this.sosmed,
        this.userPropSekolah,
        this.userKabSekolah,
        this.userAsalSekolah,
        this.kelas,
        this.uniqcode,
        this.referral,
        this.dateCreate,
        this.jenjang,
        this.userGender,
        this.userPropinsiId,
        this.userPropSekolahId,
        this.userKabSekolahId,
        this.userToken,
        this.verifiedPhone,
        this.userStatus,
        this.appleId,
        this.classFk,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        iduser: json["iduser"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userWhatsapp: json["user_whatsapp"],
        userFoto: json["user_foto"],
        userPropinsi: json["user_propinsi"],
        userKabupaten: json["user_kabupaten"],
        sosmed: json["sosmed"],
        userPropSekolah: json["user_prop_sekolah"],
        userKabSekolah: json["user_kab_sekolah"],
        userAsalSekolah: json["user_asal_sekolah"],
        kelas: json["kelas"],
        uniqcode: json["uniqcode"],
        referral: json["referral"],
        dateCreate: json["date_create"] == null ? null : DateTime.parse(json["date_create"]),
        jenjang: json["jenjang"],
        userGender: json["user_gender"],
        userPropinsiId: json["user_propinsi_id"],
        userPropSekolahId: json["user_prop_sekolah_id"],
        userKabSekolahId: json["user_kab_sekolah_id"],
        userToken: json["user_token"],
        verifiedPhone: json["verified_phone"],
        userStatus: json["user_status"],
        appleId: json["apple_id"],
        classFk: json["class_fk"],
    );

    Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "user_name": userName,
        "user_email": userEmail,
        "user_whatsapp": userWhatsapp,
        "user_foto": userFoto,
        "user_propinsi": userPropinsi,
        "user_kabupaten": userKabupaten,
        "sosmed": sosmed,
        "user_prop_sekolah": userPropSekolah,
        "user_kab_sekolah": userKabSekolah,
        "user_asal_sekolah": userAsalSekolah,
        "kelas": kelas,
        "uniqcode": uniqcode,
        "referral": referral,
        "date_create": dateCreate?.toIso8601String(),
        "jenjang": jenjang,
        "user_gender": userGender,
        "user_propinsi_id": userPropinsiId,
        "user_prop_sekolah_id": userPropSekolahId,
        "user_kab_sekolah_id": userKabSekolahId,
        "user_token": userToken,
        "verified_phone": verifiedPhone,
        "user_status": userStatus,
        "apple_id": appleId,
        "class_fk": classFk,
    };
}