import 'package:equatable/equatable.dart';

class AppUserModel extends Equatable {
  String? uid;
  String? name;
  String? email;
  String? sex;
  String? birthDate;
  List<String>? fTellId;
  List<dynamic>? availableCredit;

  AppUserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.sex,
    required this.birthDate,
    required this.fTellId,
    required this.availableCredit,
  });

  factory AppUserModel.empty() {
    return AppUserModel(
      uid: '',
      name: '',
      email: '',
      sex: '',
      birthDate: "01/01/1980",
      fTellId: const [''],
      availableCredit: const [
        {'credit_count': 0, 'credit_id': '0'}
      ],
    );
  }

  AppUserModel.fromJson(Map<String, dynamic> json) {
    uid = json['user_id'] as String;
    name = json['user_name'] as String;
    email = json['user_email'] as String;
    sex = json['user_sex'] as String;
    birthDate = json['user_birth_date'] as String;
    availableCredit = json['available_credit'] as List<dynamic>;
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
    data['available_credit'] = availableCredit;
    return data;
  }

  @override
  List<Object> get props => [uid!, name!, birthDate!, fTellId!, availableCredit!];
}
