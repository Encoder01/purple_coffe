import 'package:equatable/equatable.dart';

class AppUserModel extends Equatable {
  String? uid;
  String? name;
  String? email;
  String? sex;
  String? birthDate;
  List<String>? fTellId;

  AppUserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.sex,
    required this.birthDate,
    required this.fTellId,
  });

  factory AppUserModel.empty() {
    return AppUserModel(
      uid: '',
      name: '',
      email: '',
      sex: '',
      birthDate: "01/01/1980",
      fTellId: const [''],
    );
  }

  AppUserModel.fromJson(Map<String, dynamic> json) {
    uid = json['user_id'] as String;
    name = json['user_name'] as String;
    email = json['user_email'] as String;
    sex = json['user_sex'] as String;
    birthDate = json['user_birth_date'] as String;
    fTellId = json['user_fortune_id'].cast<String>() as List<String>;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = uid;
    data['user_name'] = name;
    data['user_email'] = email;
    data['user_sex'] = sex;
    data['user_birth_date'] = birthDate;
    data['user_fortune_id'] = fTellId;
    return data;
  }

  @override
  List<Object> get props => [uid!, name!, birthDate!, fTellId!, ];
}
