import 'dart:convert';

import 'package:fruits_app/core/services/shared_prefs_services.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/domain/entites/user_entity.dart';

UserEntity getCachedUserData() {
  String userEntityEncoded = Prefs.getString(kUserData)!;
  var userModel = jsonDecode(userEntityEncoded);
  UserEntity userEntity = UserModel.fromFireStore(userModel);
  return userEntity;
}
