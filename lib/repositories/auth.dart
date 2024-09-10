import 'package:flutter/foundation.dart';

import '../constants.dart';
import '../models/network_response.dart';
import '../services/network.dart';

class AuthRepository {
  final NetworkService _networkService = NetworkService();

  Future<NetworkResponseModel> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      NetworkResponseModel res = await _networkService.post(
        "${Constants.baseUrl}/auth/register",
        {
          "name": name,
          "email": email,
          "password": password,
        },
      );
      return res;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<NetworkResponseModel> login(
    String email,
    String password,
  ) async {
    try {
      NetworkResponseModel res = await _networkService.post(
        "${Constants.baseUrl}/auth/login",
        {
          "email": email,
          "password": password,
        },
      );
      return res;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<NetworkResponseModel> getUser(String token) async {
    try {
      NetworkResponseModel res = await _networkService.get(
        "${Constants.baseUrl}/auth/user",
        token: token,
      );
      return res;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
