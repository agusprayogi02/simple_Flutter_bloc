import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  UserModel({
    this.id,
    this.nama,
    this.jk,
    this.lahir,
    this.wali,
    this.nisn,
    this.kelas,
    this.jurusan,
    this.role,
  });

  final String id;
  final String nama;
  final String jk;
  final String lahir;
  final String wali;
  final String nisn;
  final String kelas;
  final String jurusan;
  final String role;

  @override
  List<Object> get props =>
      [id, nama, jk, lahir, wali, nisn, kelas, jurusan, role];

  static UserModel fromJson(dynamic json) {
    return UserModel(
        id: json['_id'],
        nama: json['nama'],
        jk: json['jk'],
        lahir: json['tgl_lahir'],
        wali: json['wali'],
        nisn: json['nisn'],
        kelas: json['kelas'],
        jurusan: json['jurusan'],
        role: json['role']);
  }

  @override
  bool get stringify => true;
}
