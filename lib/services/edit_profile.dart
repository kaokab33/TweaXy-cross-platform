import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tweaxy/constants.dart';
import 'package:tweaxy/helpers/api.dart';
import 'package:tweaxy/models/user.dart';

class EditProfile {
  final String _editProfileEndpoint = 'users/';
  final String _removeProfilePictureEndpoint = 'profilePicture';
  final String _removeProfileBannerEndpoint = 'profileBanner';
  EditProfile._();
  static final instance = EditProfile._();
  Future<User>? future;
  // Future<void> excute(String id) async {
  //   future = getUserById(id);
  // }

  Future<void> editProfile({
    required User user,
    required Uint8List? newAvatar,
    required Uint8List? newBanner,
    required bool removedAvatar,
    required bool removedBanner,
    @required String? token,
  }) async {
    FormData formData;
    Map<String, dynamic> data = {
      'name': user.name,
      'birthdayDate': user.birthdayDate,
      'bio': user.bio ?? '',
      'website': user.website ?? '',
      'location': user.location ?? '',
    };
    print(newAvatar);
    if (removedAvatar) {
      await Api.delete(
          url: baseURL + _editProfileEndpoint + _removeProfilePictureEndpoint,
          body: {},
          token: token);
    } else {
      if (newAvatar != null) {
        data['avatar'] = MultipartFile.fromBytes(newAvatar);
      }
    }

    if (removedBanner) {
      await Api.delete(
          url: baseURL + _editProfileEndpoint + _removeProfileBannerEndpoint,
          body: {},
          token: token);
    } else {
      if (newBanner != null) data['cover'] = MultipartFile.fromBytes(newBanner);
    }
    formData = FormData.fromMap(data);
    await Api.patch(
      url: baseURL + _editProfileEndpoint,
      body: formData,
      token: token,
    );
  }
}
